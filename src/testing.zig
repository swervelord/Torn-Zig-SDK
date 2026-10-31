//! Consumer test kit (P8.5): a scripted mock transport that records requests, a
//! virtual clock for deterministic rate-limit and retry tests, and fixture helpers.
//! Nothing here performs network I/O.
const std = @import("std");
const wire = @import("transport.zig");
const runtime = @import("runtime.zig");

/// One scripted reply. `network_error` makes the send fail with ConnectionResetByPeer.
pub const Reply = struct {
    status: u16 = 200,
    body: []const u8 = "{}",
    retry_after_ms: u64 = 0,
    network_error: bool = false,
};
/// A recorded request. `api_key` (sent as the Authorization header) is kept so tests
/// can assert which key was used; formatting redacts it.
pub const Recorded = struct {
    url: []const u8,
    api_key: []const u8,
    /// Virtual (or real) time of the send in milliseconds, when a clock is attached.
    at_ms: ?i64,
    pub fn format(self: Recorded, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.print("Recorded{{ url={s}, key={f} }}", .{ self.url, wire.KeyHint.of(self.api_key) });
    }
    /// Path component of the URL (after scheme and host).
    pub fn path(self: Recorded) []const u8 {
        const after_scheme = if (std.mem.indexOf(u8, self.url, "://")) |at| self.url[at + 3 ..] else self.url;
        const start = std.mem.indexOfScalar(u8, after_scheme, '/') orelse return "/";
        const rest = after_scheme[start..];
        return rest[0 .. std.mem.indexOfScalar(u8, rest, '?') orelse rest.len];
    }
    /// Raw (percent-encoded) value of a query parameter, or null.
    pub fn query(self: Recorded, name: []const u8) ?[]const u8 {
        const at = std.mem.indexOfScalar(u8, self.url, '?') orelse return null;
        var it = std.mem.splitScalar(u8, self.url[at + 1 ..], '&');
        while (it.next()) |part| {
            const eq = std.mem.indexOfScalar(u8, part, '=') orelse part.len;
            if (std.mem.eql(u8, part[0..eq], name)) return if (eq < part.len) part[eq + 1 ..] else "";
        }
        return null;
    }
};

pub const MockTransport = struct {
    allocator: std.mem.Allocator,
    replies: std.ArrayList(Reply) = .empty,
    requests: std.ArrayList(Recorded) = .empty,
    next_reply: usize = 0,
    clock: ?*VirtualClock = null,
    mutex: std.Io.Mutex = .init,

    pub fn init(allocator: std.mem.Allocator) MockTransport {
        return .{ .allocator = allocator };
    }
    pub fn deinit(self: *MockTransport) void {
        for (self.replies.items) |reply| self.allocator.free(reply.body);
        self.replies.deinit(self.allocator);
        for (self.requests.items) |entry| {
            self.allocator.free(entry.url);
            self.allocator.free(entry.api_key);
        }
        self.requests.deinit(self.allocator);
        self.* = undefined;
    }
    /// Appends a reply; the body is copied.
    pub fn push(self: *MockTransport, reply: Reply) !void {
        var owned = reply;
        owned.body = try self.allocator.dupe(u8, reply.body);
        errdefer self.allocator.free(owned.body);
        try self.replies.append(self.allocator, owned);
    }
    pub fn pushJson(self: *MockTransport, body: []const u8) !void {
        try self.push(.{ .body = body });
    }
    pub fn transport(self: *MockTransport) wire.Transport {
        return .{ .context = self, .send_fn = send };
    }
    pub fn sends(self: *const MockTransport) usize {
        return self.requests.items.len;
    }
    pub fn request(self: *const MockTransport, index: usize) Recorded {
        return self.requests.items[index];
    }
    /// Fails when scripted replies were not all consumed.
    pub fn expectDrained(self: *const MockTransport) !void {
        if (self.next_reply != self.replies.items.len) return error.UnusedReplies;
    }
    fn send(context: ?*anyopaque, allocator: std.mem.Allocator, io: std.Io, request_value: wire.Request) !wire.Response {
        const self: *MockTransport = @ptrCast(@alignCast(context.?));
        self.mutex.lockUncancelable(io);
        defer self.mutex.unlock(io);
        try self.requests.ensureUnusedCapacity(self.allocator, 1);
        const url = try self.allocator.dupe(u8, request_value.url);
        const key = self.allocator.dupe(u8, request_value.api_key) catch |err| {
            self.allocator.free(url);
            return err;
        };
        self.requests.appendAssumeCapacity(.{ .url = url, .api_key = key, .at_ms = if (self.clock) |c| c.now_ms else null });
        if (self.next_reply >= self.replies.items.len) return error.UnexpectedRequest;
        const reply = self.replies.items[self.next_reply];
        self.next_reply += 1;
        if (reply.network_error) return error.ConnectionResetByPeer;
        return .{ .allocator = allocator, .status = reply.status, .body = try allocator.dupe(u8, reply.body), .retry_after_ms = reply.retry_after_ms };
    }
};

/// Deterministic clock: waits advance time instantly.
pub const VirtualClock = struct {
    now_ms: i64 = 0,
    start_ms: i64 = 0,
    waits: usize = 0,
    pub fn init(start_ms: i64) VirtualClock {
        return .{ .now_ms = start_ms, .start_ms = start_ms };
    }
    pub fn elapsed(self: *const VirtualClock) i64 {
        return self.now_ms - self.start_ms;
    }
    pub fn scheduler(self: *VirtualClock) runtime.Scheduler {
        return .{ .context = self, .now_fn = nowFn, .wait_fn = waitFn };
    }
    /// Installs this clock (and, optionally, request timestamps on a mock).
    pub fn attach(self: *VirtualClock, engine: *runtime.Client, mock: ?*MockTransport) void {
        engine.scheduler = self.scheduler();
        if (mock) |m| m.clock = self;
    }
    fn nowFn(context: ?*anyopaque, _: std.Io) i64 {
        const self: *VirtualClock = @ptrCast(@alignCast(context.?));
        return self.now_ms;
    }
    fn waitFn(context: ?*anyopaque, io: std.Io, ms: u64) !void {
        const self: *VirtualClock = @ptrCast(@alignCast(context.?));
        try io.checkCancel();
        self.now_ms += @intCast(@min(ms, std.math.maxInt(i64)));
        self.waits += 1;
    }
};

/// Reads a JSON fixture file relative to `dir`.
pub fn loadFixture(allocator: std.mem.Allocator, io: std.Io, dir: std.Io.Dir, path: []const u8) ![]u8 {
    return dir.readFileAlloc(io, path, allocator, .limited(64 * 1024 * 1024));
}
/// Replaces every occurrence of `secret` in `bytes` with `*` (in place), for
/// scrubbing recorded fixtures of keys before they are written anywhere.
pub fn scrubSecret(bytes: []u8, secret: []const u8) usize {
    if (secret.len == 0) return 0;
    var count: usize = 0;
    var at: usize = 0;
    while (std.mem.indexOfPos(u8, bytes, at, secret)) |found| {
        @memset(bytes[found..][0..secret.len], '*');
        at = found + secret.len;
        count += 1;
    }
    return count;
}

test "mock transport scripts replies, records requests and drives the runtime (P8.5)" {
    const a = std.testing.allocator;
    var mock = MockTransport.init(a);
    defer mock.deinit();
    try mock.push(.{ .status = 503, .body = "busy" });
    try mock.pushJson("{\"ok\":true}");
    var clock = VirtualClock.init(1000);
    var engine = try runtime.Client.init(a, std.testing.io, .{ .keys = &.{"TESTKEY000000001"}, .jitter = .none }, mock.transport());
    defer engine.deinit();
    clock.attach(&engine, &mock);
    var response = try engine.execute("https://api.torn.com/v2/user?selections=basic", .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("{\"ok\":true}", response.body);
    try std.testing.expectEqual(@as(usize, 2), mock.sends());
    try std.testing.expectEqual(@as(i64, 500), clock.elapsed());
    try std.testing.expectEqualStrings("/v2/user", mock.request(1).path());
    try std.testing.expectEqualStrings("basic", mock.request(1).query("selections").?);
    try std.testing.expectEqual(@as(?i64, 1500), mock.request(1).at_ms);
    try mock.expectDrained();
    const text = try std.fmt.allocPrint(a, "{f}", .{mock.request(0)});
    defer a.free(text);
    try std.testing.expect(std.mem.indexOf(u8, text, "TESTKEY000000001") == null);
    var fixture = "{\"key\":\"TESTKEY000000001\"}".*;
    try std.testing.expectEqual(@as(usize, 1), scrubSecret(&fixture, "TESTKEY000000001"));
    try std.testing.expect(std.mem.indexOf(u8, &fixture, "TESTKEY") == null);
}
