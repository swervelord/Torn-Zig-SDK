const std = @import("std");

/// Credentials are borrowed only for the duration of send. Never format Request.
pub const Request = struct {
    url: []const u8,
    api_key: []const u8,
    user_agent: []const u8 = "Torn-Zig-SDK/0.1.0",
    max_body_bytes: usize = 64 * 1024 * 1024,
    proxy_url: ?[]const u8 = null,

    pub fn format(_: Request, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.writeAll("Request{redacted}");
    }
    pub fn jsonStringify(_: Request, writer: anytype) !void {
        try writer.write(.{ .request = "redacted" });
    }
};

pub const Response = struct {
    allocator: std.mem.Allocator,
    status: u16,
    body: []u8,
    retry_after_ms: u64 = 0,
    route_name: []const u8 = "direct",
    route_name_owned: bool = false,

    pub fn deinit(self: *Response) void {
        self.allocator.free(self.body);
        if (self.route_name_owned) self.allocator.free(self.route_name);
        self.* = undefined;
    }
};

pub const Transport = struct {
    context: ?*anyopaque = null,
    send_fn: *const fn (?*anyopaque, std.mem.Allocator, std.Io, Request) anyerror!Response = nativeSend,

    pub fn send(self: Transport, allocator: std.mem.Allocator, io: std.Io, request: Request) !Response {
        return self.send_fn(self.context, allocator, io, request);
    }
};

fn validHeader(value: []const u8) bool {
    return std.mem.indexOfAny(u8, value, "\r\n\x00") == null;
}

/// Uses the selected Io backend for cancelable DNS, TCP, TLS and body reads.
/// Every send owns its HTTP client; credentials never cross a redirect.
pub fn nativeSend(_: ?*anyopaque, allocator: std.mem.Allocator, io: std.Io, request: Request) !Response {
    if (!validHeader(request.api_key) or !validHeader(request.user_agent)) return error.InvalidHeader;
    if (request.max_body_bytes == 0) return error.InvalidBodyLimit;
    const uri = try std.Uri.parse(request.url);
    var scratch = std.heap.ArenaAllocator.init(allocator);
    defer scratch.deinit();
    var client: std.http.Client = .{ .allocator = allocator, .io = io };
    defer client.deinit();
    var proxy: std.http.Client.Proxy = undefined;
    var proxy_host: [std.Io.net.HostName.max_len]u8 = undefined;
    if (request.proxy_url) |url| {
        // Zig 0.17.0's CONNECT helper returns the proxy-protocol connection
        // without a target TLS upgrade. Reject before proxy or origin auth.
        if (std.ascii.eqlIgnoreCase(uri.scheme, "https")) return error.SecureProxyUnsupported;
        const proxy_uri = try std.Uri.parse(url);
        const protocol = std.http.Client.Protocol.fromUri(proxy_uri) orelse return error.UnsupportedProxyScheme;
        const proxy_auth: ?[]const u8 = if (proxy_uri.user != null or proxy_uri.password != null) auth: {
            const user_component: std.Uri.Component = proxy_uri.user orelse .empty;
            const password_component: std.Uri.Component = proxy_uri.password orelse .empty;
            const user = try user_component.toRawMaybeAlloc(scratch.allocator());
            const password = try password_component.toRawMaybeAlloc(scratch.allocator());
            if (std.mem.indexOfScalar(u8, user, ':') != null) return error.InvalidProxyUsername;
            const credentials = try std.fmt.allocPrint(scratch.allocator(), "{s}:{s}", .{ user, password });
            break :auth try std.fmt.allocPrint(scratch.allocator(), "Basic {b64}", .{credentials});
        } else null;
        proxy = .{
            .protocol = protocol,
            .host = try .fromUri(proxy_uri, &proxy_host),
            .port = proxy_uri.port orelse if (protocol == .tls) @as(u16, 443) else @as(u16, 80),
            .authorization = proxy_auth,
            .supports_connect = std.ascii.eqlIgnoreCase(uri.scheme, "https"),
        };
        client.http_proxy = &proxy;
        client.https_proxy = &proxy;
    }
    const authorization = try std.fmt.allocPrint(allocator, "ApiKey {s}", .{request.api_key});
    defer allocator.free(authorization);
    var req = try client.request(.GET, uri, .{
        .redirect_behavior = .unhandled,
        .headers = .{
            .authorization = .{ .override = authorization },
            .user_agent = .{ .override = request.user_agent },
            .accept_encoding = .{ .override = "identity" },
        },
    });
    defer req.deinit();
    try req.sendBodiless();
    var response = try req.receiveHead(&.{});
    const status: u16 = @backingInt(response.head.status);
    var retry_after_ms: u64 = 0;
    var headers = response.head.iterateHeaders();
    while (headers.next()) |header| {
        if (std.ascii.eqlIgnoreCase(header.name, "retry-after")) {
            retry_after_ms = parseRetryAfter(header.value, std.Io.Clock.real.now(io).toMilliseconds());
        }
    }
    if (response.head.content_length) |len| if (len > request.max_body_bytes) return error.ResponseTooLarge;
    if (response.head.content_encoding != .identity) return error.UnsupportedResponseCompression;
    var buffer: [8192]u8 = undefined;
    const reader = response.reader(&buffer);
    const body = reader.allocRemaining(allocator, .limited(request.max_body_bytes)) catch |err| switch (err) {
        error.StreamTooLong => return error.ResponseTooLarge,
        error.ReadFailed => return response.bodyErr() orelse error.BodyReadFailed,
        else => return err,
    };
    if (response.head.content_length) |expected| if (body.len != expected) {
        allocator.free(body);
        return error.BodyReadFailed;
    };
    return .{ .allocator = allocator, .status = status, .body = body, .retry_after_ms = retry_after_ms };
}

/// RFC 9110 delta-seconds and preferred IMF-fixdate. Invalid dates are ignored.
pub fn parseRetryAfter(raw: []const u8, now_ms: i64) u64 {
    const value = std.mem.trim(u8, raw, " \t");
    if (std.fmt.parseInt(u64, value, 10)) |seconds| {
        return std.math.mul(u64, seconds, 1000) catch std.math.maxInt(u64);
    } else |_| {}
    if (value.len != 29 or !std.mem.eql(u8, value[25..], " GMT") or value[3] != ',' or value[4] != ' ' or value[7] != ' ' or value[11] != ' ' or value[16] != ' ' or value[19] != ':' or value[22] != ':') return 0;
    const day = std.fmt.parseInt(u8, value[5..7], 10) catch return 0;
    const year = std.fmt.parseInt(u16, value[12..16], 10) catch return 0;
    const hour = std.fmt.parseInt(u8, value[17..19], 10) catch return 0;
    const minute = std.fmt.parseInt(u8, value[20..22], 10) catch return 0;
    const second = std.fmt.parseInt(u8, value[23..25], 10) catch return 0;
    if (year < 1970 or hour > 23 or minute > 59 or second > 59) return 0;
    const months = [_][]const u8{ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
    var month: ?usize = null;
    for (months, 0..) |name, i| if (std.mem.eql(u8, value[8..11], name)) {
        month = i;
        break;
    };
    const m = month orelse return 0;
    const lengths = [_]u16{ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    if (day == 0 or day > lengths[m] + @as(u16, if (m == 1 and leap(year)) 1 else 0)) return 0;
    var days: i64 = 0;
    for (1970..year) |y| days += if (leap(y)) @as(i64, 366) else @as(i64, 365);
    for (lengths[0..m], 0..) |len, i| days += len + @as(u16, if (i == 1 and leap(year)) 1 else 0);
    days += day - 1;
    const timestamp = ((days * 24 + hour) * 3600 + @as(i64, minute) * 60 + second) * 1000;
    if (timestamp <= now_ms) return 0;
    return @intCast(std.math.sub(i64, timestamp, now_ms) catch return std.math.maxInt(u64));
}

fn leap(year: usize) bool {
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0);
}

test "Retry-After handles seconds dates and invalid calendar boundaries" {
    try std.testing.expectEqual(@as(u64, 3000), parseRetryAfter("3", 0));
    try std.testing.expectEqual(@as(u64, 1000), parseRetryAfter("Thu, 01 Jan 1970 00:00:01 GMT", 0));
    try std.testing.expectEqual(@as(u64, 0), parseRetryAfter("Thu, 31 Feb 2026 00:00:01 GMT", 0));
    try std.testing.expectEqual(@as(u64, 0), parseRetryAfter("Thu, 01 Jan 1970 00:00:01 GMT", 2000));
}

test "header validation rejects injection" {
    try std.testing.expect(validHeader("safe"));
    try std.testing.expect(!validHeader("secret\r\nX: y"));
    try std.testing.expectError(error.InvalidHeader, nativeSend(null, std.testing.allocator, std.testing.io, .{ .url = "http://127.0.0.1", .api_key = "x\r\n" }));
}

const LocalServer = struct {
    listener: std.Io.net.Server,
    payload: []const u8,
    expected_start: []const u8,
    expected_proxy_auth: ?[]const u8 = null,

    fn serve(self: *LocalServer, io: std.Io) !void {
        const stream = try self.listener.accept(io);
        defer stream.close(io);
        var read_buffer: [8192]u8 = undefined;
        var reader = stream.reader(io, &read_buffer);
        const line = (try reader.interface.takeDelimiter('\n')) orelse return error.MissingRequest;
        try std.testing.expect(std.mem.startsWith(u8, line, self.expected_start));
        try std.testing.expect(std.mem.indexOf(u8, line, "test-key") == null);
        var authorization_seen = false;
        var proxy_authorization_seen = false;
        while (try reader.interface.takeDelimiter('\n')) |header| {
            if (std.mem.eql(u8, header, "\r")) break;
            if (std.mem.startsWith(u8, header, "authorization: ApiKey test-key")) authorization_seen = true;
            if (self.expected_proxy_auth) |expected| if (std.mem.eql(u8, std.mem.trimEnd(u8, header, "\r"), expected)) {
                proxy_authorization_seen = true;
            };
        }
        try std.testing.expect(authorization_seen);
        if (self.expected_proxy_auth != null) try std.testing.expect(proxy_authorization_seen);
        var write_buffer: [8192]u8 = undefined;
        var writer = stream.writer(io, &write_buffer);
        try writer.interface.writeAll(self.payload);
        try writer.interface.flush();
    }

    fn init(payload: []const u8, expected_start: []const u8) !LocalServer {
        const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
        return .{ .listener = try address.listen(std.testing.io, .{ .reuse_address = true }), .payload = payload, .expected_start = expected_start };
    }
};

test "native HTTP owns response and preserves retry headers" {
    const io = std.testing.io;
    var server = try LocalServer.init("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\nRetry-After: 3\r\n\r\n{}", "GET /user HTTP/1.1");
    defer server.listener.deinit(io);
    var future = try io.concurrent(LocalServer.serve, .{ &server, io });
    defer future.cancel(io) catch {};
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/user", .{server.listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    var response = try nativeSend(null, std.testing.allocator, io, .{ .url = url, .api_key = "test-key" });
    defer response.deinit();
    try std.testing.expectEqual(@as(u16, 200), response.status);
    try std.testing.expectEqualStrings("{}", response.body);
    try std.testing.expectEqual(@as(u64, 3000), response.retry_after_ms);
    try future.await(io);
}

test "native redirect response is returned without forwarding credentials" {
    const io = std.testing.io;
    var server = try LocalServer.init("HTTP/1.1 302 Found\r\nContent-Length: 0\r\nConnection: close\r\nLocation: http://127.0.0.1:1/leak\r\n\r\n", "GET / HTTP/1.1");
    defer server.listener.deinit(io);
    var future = try io.concurrent(LocalServer.serve, .{ &server, io });
    defer future.cancel(io) catch {};
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/", .{server.listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    var response = try nativeSend(null, std.testing.allocator, io, .{ .url = url, .api_key = "test-key" });
    defer response.deinit();
    try std.testing.expectEqual(@as(u16, 302), response.status);
    try future.await(io);
}

test "native HTTP rejects body beyond configured limit" {
    const io = std.testing.io;
    var server = try LocalServer.init("HTTP/1.1 200 OK\r\nContent-Length: 4\r\nConnection: close\r\n\r\nlong", "GET / HTTP/1.1");
    defer server.listener.deinit(io);
    var future = try io.concurrent(LocalServer.serve, .{ &server, io });
    defer future.cancel(io) catch {};
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/", .{server.listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    try std.testing.expectError(error.ResponseTooLarge, nativeSend(null, std.testing.allocator, io, .{ .url = url, .api_key = "test-key", .max_body_bytes = 3 }));
    try future.await(io);
}

test "native HTTP proxy receives absolute target" {
    const io = std.testing.io;
    var server = try LocalServer.init("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\n{}", "GET http://does-not-resolve.invalid/user HTTP/1.1");
    defer server.listener.deinit(io);
    var future = try io.concurrent(LocalServer.serve, .{ &server, io });
    defer future.cancel(io) catch {};
    const proxy = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}", .{server.listener.socket.address.getPort()});
    defer std.testing.allocator.free(proxy);
    var response = try nativeSend(null, std.testing.allocator, io, .{ .url = "http://does-not-resolve.invalid/user", .api_key = "test-key", .proxy_url = proxy });
    defer response.deinit();
    try std.testing.expectEqualStrings("{}", response.body);
    try future.await(io);
}

test "native HTTP proxy basic authentication decodes URL credentials" {
    const io = std.testing.io;
    var server = try LocalServer.init("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\n{}", "GET http://does-not-resolve.invalid/user HTTP/1.1");
    server.expected_proxy_auth = "proxy-authorization: Basic cHJveHktdXNlcjpwcm94eS1wYXNz";
    defer server.listener.deinit(io);
    var future = try io.concurrent(LocalServer.serve, .{ &server, io });
    defer future.cancel(io) catch {};
    const proxy = try std.fmt.allocPrint(std.testing.allocator, "http://proxy%2Duser:proxy%2Dpass@127.0.0.1:{d}", .{server.listener.socket.address.getPort()});
    defer std.testing.allocator.free(proxy);
    var response = try nativeSend(null, std.testing.allocator, io, .{ .url = "http://does-not-resolve.invalid/user", .api_key = "test-key", .proxy_url = proxy });
    defer response.deinit();
    try std.testing.expectEqualStrings("{}", response.body);
    try future.await(io);
}

test "native HTTPS rejects a malformed TLS peer before sending authentication" {
    const Peer = struct {
        fn serve(listener: *std.Io.net.Server, io: std.Io) !void {
            const stream = try listener.accept(io);
            defer stream.close(io);
            var read_buffer: [4096]u8 = undefined;
            var reader = stream.reader(io, &read_buffer);
            // A TLS handshake record precedes application authentication.
            try std.testing.expectEqual(@as(u8, 0x16), try reader.interface.takeByte());
            var write_buffer: [512]u8 = undefined;
            var writer = stream.writer(io, &write_buffer);
            try writer.interface.writeAll("HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n");
            try writer.interface.flush();
        }
    };
    const io = std.testing.io;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
    var listener = try address.listen(io, .{});
    defer listener.deinit(io);
    var peer = try io.concurrent(Peer.serve, .{ &listener, io });
    defer peer.cancel(io) catch {};
    const url = try std.fmt.allocPrint(std.testing.allocator, "https://127.0.0.1:{d}/", .{listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    try std.testing.expectError(error.TlsInitializationFailed, nativeSend(null, std.testing.allocator, io, .{ .url = url, .api_key = "test-key" }));
    try peer.await(io);
}

test "HTTPS proxy rejects unsupported TLS upgrade before any network access" {
    try std.testing.expectError(error.SecureProxyUnsupported, nativeSend(null, std.testing.allocator, std.testing.io, .{
        .url = "https://does-not-resolve.invalid/user", .api_key = "test-key", .proxy_url = "http://127.0.0.1:1",
    }));
}

test "native chunked HTTP body fails explicitly beyond streaming limit" {
    const io = std.testing.io;
    var server = try LocalServer.init("HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\nConnection: close\r\n\r\n4\r\nlong\r\n0\r\n\r\n", "GET / HTTP/1.1");
    defer server.listener.deinit(io);
    var future = try io.concurrent(LocalServer.serve, .{ &server, io });
    defer future.cancel(io) catch {};
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/", .{server.listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    try std.testing.expectError(error.ResponseTooLarge, nativeSend(null, std.testing.allocator, io, .{ .url = url, .api_key = "test-key", .max_body_bytes = 3 }));
    try future.await(io);
}
