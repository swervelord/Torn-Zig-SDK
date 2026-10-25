//! Explicit opt-in public-contract network verification. No private API key.
const std = @import("std");
const torn = @import("torn");

fn relay(io: std.Io, source: std.Io.net.Stream, destination: std.Io.net.Stream) !void {
    var input: [32768]u8 = undefined;
    var output: [32768]u8 = undefined;
    var data: [16384]u8 = undefined;
    var reader = source.reader(io, &input);
    var writer = destination.writer(io, &output);
    while (true) {
        var vectors = [_][]u8{&data};
        const length = reader.interface.readVec(&vectors) catch |err| switch (err) {
            error.EndOfStream => return,
            else => return err,
        };
        if (length == 0) return;
        try writer.interface.writeAll(data[0..length]);
        try writer.interface.flush();
    }
}

fn proxy(listener: *std.Io.net.Server, io: std.Io) !void {
    const incoming = try listener.accept(io);
    defer incoming.close(io);
    var input: [8192]u8 = undefined;
    var reader = incoming.reader(io, &input);
    const request = (try reader.interface.takeDelimiter('\n')) orelse return error.MissingConnect;
    if (!std.mem.eql(u8, request, "CONNECT www.torn.com:443 HTTP/1.1\r")) return error.UnexpectedConnectTarget;
    while (try reader.interface.takeDelimiter('\n')) |line| {
        if (std.mem.eql(u8, line, "\r")) break;
        if (std.mem.indexOf(u8, line, "public-contract-verification") != null) return error.OriginCredentialInConnect;
    }
    const host: std.Io.net.HostName = .{ .bytes = "www.torn.com" };
    const remote = try host.connect(io, 443, .{ .mode = .stream });
    defer remote.close(io);
    var output: [1024]u8 = undefined;
    var writer = incoming.writer(io, &output);
    try writer.interface.writeAll("HTTP/1.1 200 Connection Established\r\n\r\n");
    try writer.interface.flush();
    const Race = union(enum) { upload: anyerror!void, download: anyerror!void };
    var buffer: [2]Race = undefined;
    var select: std.Io.Select(Race) = .init(io, &buffer);
    defer select.cancelDiscard();
    try select.concurrent(.upload, relay, .{ io, incoming, remote });
    try select.concurrent(.download, relay, .{ io, remote, incoming });
    switch (try select.await()) {
        inline else => |result| try result,
    }
}

pub fn main(init: std.process.Init) !void {
    const io = init.io;
    const allocator = init.gpa;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
    var listener = try address.listen(io, .{});
    defer listener.deinit(io);
    var server = try io.concurrent(proxy, .{ &listener, io });
    defer server.cancel(io) catch {};
    const proxy_url = try std.fmt.allocPrint(allocator, "http://127.0.0.1:{d}", .{listener.socket.address.getPort()});
    defer allocator.free(proxy_url);
    var engine = try torn.runtime.Client.init(allocator, io, .{
        .keys = &.{"public-contract-verification"},
        .max_attempts = 1,
        .routes = &.{.{ .name = "local-tunnel", .proxy_url = proxy_url }},
    }, .{});
    defer engine.deinit();
    var response = try engine.execute("https://www.torn.com/swagger/openapi.json", .{});
    defer response.deinit();
    if (response.status != 200) return error.UnexpectedHttpStatus;
    const parsed = try std.json.parseFromSlice(struct { info: struct { version: []const u8 } }, allocator, response.body, .{ .ignore_unknown_fields = true });
    defer parsed.deinit();
    if (parsed.value.info.version.len == 0) return error.MissingContractVersion;
    try server.await(io);
    const evidence = try std.fmt.allocPrint(allocator, "{{\"verification\":\"http-connect-target-tls\",\"target\":\"https://www.torn.com/swagger/openapi.json\",\"http_status\":200,\"contract_version\":\"{s}\",\"body_bytes\":{d},\"private_key_used\":false,\"zig\":\"0.17.0\"}}\n", .{ parsed.value.info.version, response.body.len });
    defer allocator.free(evidence);
    try std.Io.Dir.cwd().writeFile(io, .{ .sub_path = "docs/proxy-verification.json", .data = evidence });
}
