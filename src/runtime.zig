const std = @import("std");
pub const transport = @import("transport.zig");

pub const Config = struct {
    keys: []const []const u8,
    user_agent: []const u8 = "Torn-Zig-SDK/0.3.0",
    base_url_v2: []const u8 = "https://api.torn.com/v2",
    base_url_v1: []const u8 = "https://api.torn.com",
    attempt_timeout_ms: u32 = 30_000,
    max_attempts: u32 = 3,
    backoff_ms: u32 = 250,
    max_in_flight: u32 = 8,
    per_key_per_minute: u32 = 100,
    per_route_per_minute: u32 = 1000,
    max_body_bytes: usize = 64 * 1024 * 1024,
    routes: []const Route = &.{.{ .name = "direct" }},

    pub fn format(_: Config, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.writeAll("Config{redacted}");
    }
    pub fn jsonStringify(_: Config, writer: anytype) !void {
        try writer.write(.{ .configuration = "redacted" });
    }
};

pub const Route = struct {
    name: []const u8,
    proxy_url: ?[]const u8 = null,
    /// Optional route-specific budget; null inherits Config.per_route_per_minute.
    per_minute: ?u32 = null,
};
pub const Options = struct {
    attempts: ?u32 = null,
    timeout_ms: ?u32 = null,
    deadline_ms: ?i64 = null,
    /// Index in Config.routes. Unpinned calls spill over in configured order.
    route: ?usize = null,
};

/// Inject both clock and wait to advance deterministic quota/retry tests.
pub const Scheduler = struct {
    context: ?*anyopaque = null,
    now_fn: *const fn (?*anyopaque, std.Io) i64 = realNow,
    wait_fn: *const fn (?*anyopaque, std.Io, u64) anyerror!void = realWait,

    fn realNow(_: ?*anyopaque, io: std.Io) i64 {
        return std.Io.Clock.real.now(io).toMilliseconds();
    }
    fn realWait(_: ?*anyopaque, io: std.Io, ms: u64) !void {
        try std.Io.sleep(io, .fromMilliseconds(@intCast(@min(ms, std.math.maxInt(i64)))), .awake);
    }
};

pub const UsageObserver = struct {
    context: ?*anyopaque = null,
    /// Runs outside the accounting lock; callback must be thread safe.
    on_send: *const fn (?*anyopaque, usize, usize, i64) void,
};

const Counter = struct { minute: i64 = -1, calls: u32 = 0 };
pub const Client = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    config: Config,
    wire: transport.Transport,
    scheduler: Scheduler = .{},
    observer: ?UsageObserver = null,
    mutex: std.Io.Mutex = .init,
    permits: std.Io.Semaphore,
    keys: [][]const u8,
    routes: []Route,
    key_usage: []Counter,
    route_usage: []Counter,
    next_key: usize = 0,

    pub fn format(_: Client, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.writeAll("Client{redacted}");
    }
    pub fn jsonStringify(_: Client, writer: anytype) !void {
        try writer.write(.{ .client = "redacted" });
    }

    /// Allocator must support concurrent calls. Client must remain at a stable
    /// address and outlive every execute; join/cancel callers before deinit.
    pub fn init(allocator: std.mem.Allocator, io: std.Io, config: Config, wire: transport.Transport) !Client {
        if (config.attempt_timeout_ms == 0 or config.max_attempts == 0 or config.max_in_flight == 0 or config.backoff_ms == 0 or
            config.per_key_per_minute == 0 or config.per_route_per_minute == 0 or config.max_body_bytes == 0 or config.routes.len == 0)
            return error.InvalidConfiguration;
        var keys: std.ArrayList([]const u8) = .empty;
        errdefer {
            for (keys.items) |key| allocator.free(key);
            keys.deinit(allocator);
        }
        for (config.keys) |raw| {
            const key = std.mem.trim(u8, raw, " \t\r\n");
            if (key.len == 0) continue;
            var duplicate = false;
            for (keys.items) |existing| if (std.mem.eql(u8, existing, key)) {
                duplicate = true;
                break;
            };
            if (duplicate) continue;
            const owned = try allocator.dupe(u8, key);
            errdefer allocator.free(owned);
            try keys.append(allocator, owned);
        }
        if (keys.items.len == 0) return error.NoApiKeys;
        const routes = try allocator.alloc(Route, config.routes.len);
        var route_count: usize = 0;
        errdefer {
            for (routes[0..route_count]) |r| {
                allocator.free(r.name);
                if (r.proxy_url) |url| allocator.free(url);
            }
            allocator.free(routes);
        }
        for (config.routes, 0..) |route, i| {
            if (route.name.len == 0) return error.InvalidConfiguration;
            if (route.per_minute) |limit| if (limit == 0) return error.InvalidConfiguration;
            for (config.routes[0..i]) |prior| if (std.mem.eql(u8, route.name, prior.name)) return error.DuplicateRoute;
            const name = try allocator.dupe(u8, route.name);
            errdefer allocator.free(name);
            const proxy = if (route.proxy_url) |url| try allocator.dupe(u8, url) else null;
            routes[i] = .{ .name = name, .proxy_url = proxy, .per_minute = route.per_minute };
            route_count += 1;
        }
        const key_usage = try allocator.alloc(Counter, keys.items.len);
        errdefer allocator.free(key_usage);
        @memset(key_usage, .{});
        const route_usage = try allocator.alloc(Counter, routes.len);
        errdefer allocator.free(route_usage);
        @memset(route_usage, .{});
        const agent = try allocator.dupe(u8, config.user_agent);
        errdefer allocator.free(agent);
        const base_v2 = try allocator.dupe(u8, config.base_url_v2);
        errdefer allocator.free(base_v2);
        const base_v1 = try allocator.dupe(u8, config.base_url_v1);
        errdefer allocator.free(base_v1);
        const owned_keys = try keys.toOwnedSlice(allocator);
        var owned_config = config;
        owned_config.user_agent = agent;
        owned_config.base_url_v2 = base_v2;
        owned_config.base_url_v1 = base_v1;
        owned_config.keys = owned_keys;
        owned_config.routes = routes;
        return .{ .allocator = allocator, .io = io, .config = owned_config, .wire = wire, .keys = owned_keys, .routes = routes, .key_usage = key_usage, .route_usage = route_usage, .permits = .{ .permits = config.max_in_flight } };
    }

    pub fn deinit(self: *Client) void {
        for (self.keys) |key| self.allocator.free(key);
        self.allocator.free(self.keys);
        for (self.routes) |route| {
            self.allocator.free(route.name);
            if (route.proxy_url) |url| self.allocator.free(url);
        }
        self.allocator.free(self.routes);
        self.allocator.free(self.key_usage);
        self.allocator.free(self.route_usage);
        self.allocator.free(self.config.user_agent);
        self.allocator.free(self.config.base_url_v2);
        self.allocator.free(self.config.base_url_v1);
        self.* = undefined;
    }

    /// Reads an explicit environment snapshot, avoiding global mutable state.
    /// TORN_API_KEYS takes precedence over TORN_API_KEY when present (even empty).
    pub fn initFromEnvironment(allocator: std.mem.Allocator, io: std.Io, environ: std.process.Environ.Map, wire: transport.Transport) !Client {
        var keys: std.ArrayList([]const u8) = .empty;
        defer keys.deinit(allocator);
        const raw_keys = environ.get("TORN_API_KEYS") orelse environ.get("TORN_API_KEY") orelse "";
        var tokens = std.mem.tokenizeAny(u8, raw_keys, ",;\r\n");
        while (tokens.next()) |key| try keys.append(allocator, key);
        var config: Config = .{ .keys = keys.items };
        if (environ.get("TORN_API_BASE_URL_V2")) |value| config.base_url_v2 = value;
        if (environ.get("TORN_API_BASE_URL_V1")) |value| config.base_url_v1 = value;
        if (environ.get("TORN_USER_AGENT")) |value| config.user_agent = value;
        if (environ.get("TORN_HTTP_TIMEOUT_SECS")) |value| config.attempt_timeout_ms = std.math.mul(u32, try positive(value), 1000) catch return error.InvalidEnvironment;
        if (environ.get("TORN_MAX_ATTEMPTS")) |value| config.max_attempts = try positive(value);
        if (environ.get("TORN_NETWORK_RETRY_BACKOFF_MS")) |value| config.backoff_ms = try positive(value);
        if (environ.get("TORN_RATE_LIMIT_PER_KEY_PER_MIN")) |value| config.per_key_per_minute = try positive(value);
        if (environ.get("TORN_RATE_LIMIT_PER_IP_PER_MIN")) |value| config.per_route_per_minute = try positive(value);
        if (environ.get("TORN_MAX_IN_FLIGHT")) |value| config.max_in_flight = try positive(value);
        for ([_][]const u8{ config.base_url_v2, config.base_url_v1 }) |base| {
            const uri = std.Uri.parse(base) catch return error.InvalidEnvironment;
            if ((!std.mem.eql(u8, uri.scheme, "http") and !std.mem.eql(u8, uri.scheme, "https")) or uri.host == null or uri.user != null or uri.password != null or uri.query != null or uri.fragment != null) return error.InvalidEnvironment;
        }
        return init(allocator, io, config, wire);
    }

    fn positive(text: []const u8) !u32 {
        if (text.len == 0) return error.InvalidEnvironment;
        for (text) |c| if (c < '0' or c > '9') return error.InvalidEnvironment;
        const value = std.fmt.parseInt(u32, text, 10) catch return error.InvalidEnvironment;
        if (value == 0) return error.InvalidEnvironment;
        return value;
    }

    /// Check this during caller-side planning, serialization and decoding loops.
    pub fn check(self: *Client, options: Options) !void {
        try self.io.checkCancel();
        if (options.deadline_ms) |deadline| if (self.scheduler.now_fn(self.scheduler.context, self.io) >= deadline) return error.Timeout;
    }

    fn wait(self: *Client, options: Options, ms: u64) !void {
        try self.check(options);
        var actual = ms;
        if (options.deadline_ms) |deadline| {
            const remaining = deadline - self.scheduler.now_fn(self.scheduler.context, self.io);
            if (remaining <= 0) return error.Timeout;
            actual = @min(ms, @as(u64, @intCast(remaining)));
        }
        try self.scheduler.wait_fn(self.scheduler.context, self.io, actual);
        try self.check(options);
    }

    const Reservation = struct { key: usize, route: usize };
    fn reserve(self: *Client, options: Options) !Reservation {
        if (options.route) |route| if (route >= self.routes.len) return error.InvalidRoute;
        while (true) {
            try self.check(options);
            if (options.deadline_ms) |deadline| {
                const remaining = deadline - self.scheduler.now_fn(self.scheduler.context, self.io);
                if (remaining <= 0) return error.Timeout;
                try self.permits.waitTimeout(self.io, .{ .duration = .{ .raw = .fromMilliseconds(remaining), .clock = .awake } });
            } else try self.permits.wait(self.io);
            var held = true;
            errdefer if (held) self.permits.post(self.io);
            try self.mutex.lock(self.io);
            const now = self.scheduler.now_fn(self.scheduler.context, self.io);
            const minute = @divFloor(now, 60_000);
            for (self.key_usage) |*counter| if (counter.minute != minute) {
                counter.* = .{ .minute = minute };
            };
            for (self.route_usage) |*counter| if (counter.minute != minute) {
                counter.* = .{ .minute = minute };
            };
            var chosen: ?Reservation = null;
            for (0..self.routes.len) |ri| {
                if (options.route) |pinned| if (pinned != ri) continue;
                if (self.route_usage[ri].calls >= (self.routes[ri].per_minute orelse self.config.per_route_per_minute)) continue;
                for (0..self.keys.len) |offset| {
                    const ki = (self.next_key + offset) % self.keys.len;
                    if (self.key_usage[ki].calls >= self.config.per_key_per_minute) continue;
                    self.key_usage[ki].calls += 1;
                    self.route_usage[ri].calls += 1;
                    self.next_key = (ki + 1) % self.keys.len;
                    chosen = .{ .key = ki, .route = ri };
                    break;
                }
                if (chosen != null) break;
            }
            self.mutex.unlock(self.io);
            if (chosen) |selection| {
                if (self.observer) |observer| observer.on_send(observer.context, selection.key, selection.route, minute);
                return selection;
            }
            self.permits.post(self.io);
            held = false;
            try self.wait(options, @intCast(60_000 - @mod(now, 60_000)));
        }
    }

    const Race = union(enum) { response: anyerror!transport.Response, timeout: anyerror!void };
    fn timer(io: std.Io, ms: u32) !void {
        try std.Io.sleep(io, .fromMilliseconds(ms), .awake);
    }
    fn send(self: *Client, request: transport.Request, timeout: u32) !transport.Response {
        var buffer: [2]Race = undefined;
        var select: std.Io.Select(Race) = .init(self.io, &buffer);
        defer while (select.cancel()) |result| switch (result) {
            .response => |value| {
                if (value) |owned| {
                    var response = owned;
                    response.deinit();
                } else |_| {}
            },
            .timeout => {},
        };
        try select.concurrent(.response, transport.Transport.send, .{ self.wire, self.allocator, self.io, request });
        try select.concurrent(.timeout, timer, .{ self.io, timeout });
        return switch (try select.await()) {
            .response => |result| result,
            .timeout => |result| blk: {
                try result;
                break :blk error.Timeout;
            },
        };
    }

    /// Returns owned HTTP response including terminal error envelopes. Reports
    /// and typed decoding are layered on this transport-level primitive.
    pub fn execute(self: *Client, url: []const u8, options: Options) !transport.Response {
        const attempts = options.attempts orelse self.config.max_attempts;
        if (attempts == 0 or (options.timeout_ms orelse self.config.attempt_timeout_ms) == 0) return error.InvalidConfiguration;
        var attempt: u32 = 0;
        while (attempt < attempts) : (attempt += 1) {
            const selected = try self.reserve(options);
            var response: transport.Response = blk: {
                var permit_held = true;
                defer if (permit_held) self.permits.post(self.io);
                var timeout = options.timeout_ms orelse self.config.attempt_timeout_ms;
                if (options.deadline_ms) |deadline| {
                    const remaining = deadline - self.scheduler.now_fn(self.scheduler.context, self.io);
                    if (remaining <= 0) return error.Timeout;
                    timeout = @intCast(@min(timeout, @as(u64, @intCast(remaining))));
                }
                break :blk self.send(.{ .url = url, .api_key = self.keys[selected.key], .user_agent = self.config.user_agent, .max_body_bytes = self.config.max_body_bytes, .proxy_url = self.routes[selected.route].proxy_url }, timeout) catch |err| {
                    if (err == error.Canceled or err == error.OutOfMemory or err == error.ResponseTooLarge or err == error.SecureProxyUnsupported or attempt + 1 == attempts) return err;
                    self.permits.post(self.io);
                    permit_held = false;
                    try self.wait(options, @as(u64, self.config.backoff_ms) * (attempt + 1));
                    continue;
                };
            };
            if (response.body.len > self.config.max_body_bytes) {
                response.deinit();
                return error.ResponseTooLarge;
            }
            const classified = classifyAlloc(self.allocator, response.status, response.body) catch |err| {
                response.deinit();
                return err;
            };
            if (classified.exhausts_key) self.exhaust(selected, classified.exhausts_route) catch |err| {
                response.deinit();
                return err;
            };
            const retry = classified.policy;
            if (attempt + 1 == attempts or retry == .none) {
                errdefer response.deinit();
                if (response.route_name_owned) response.allocator.free(response.route_name);
                response.route_name_owned = false;
                response.route_name = try response.allocator.dupe(u8, self.routes[selected.route].name);
                response.route_name_owned = true;
                return response;
            }
            var delay = @max(response.retry_after_ms, @as(u64, self.config.backoff_ms) * (attempt + 1));
            if (retry == .minute_boundary) {
                // Torn code 5 exhausts a server minute quota. Retrying with only
                // linear backoff can consume every attempt before it resets.
                const now = self.scheduler.now_fn(self.scheduler.context, self.io);
                delay = @max(delay, @as(u64, @intCast(60_000 - @mod(now, 60_000))));
            }
            response.deinit();
            try self.wait(options, delay);
        }
        unreachable;
    }

    /// A server-side rate limit spends the rest of this minute's budget for the
    /// key (and for the route when Torn attributes it to the IP), so concurrent
    /// and later calls rotate to other credentials/routes instead of repeating it.
    fn exhaust(self: *Client, selected: Reservation, route: bool) !void {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        const minute = @divFloor(self.scheduler.now_fn(self.scheduler.context, self.io), 60_000);
        self.key_usage[selected.key] = .{ .minute = minute, .calls = self.config.per_key_per_minute };
        if (route) self.route_usage[selected.route] = .{ .minute = minute, .calls = self.routes[selected.route].per_minute orelse self.config.per_route_per_minute };
    }
};

pub fn shouldRetry(status: u16, body: []const u8) bool {
    return (classifyAlloc(std.heap.page_allocator, status, body) catch return false).policy != .none;
}

const RetryPolicy = enum { none, backoff, minute_boundary };
const Classification = struct { policy: RetryPolicy, exhausts_key: bool = false, exhausts_route: bool = false };
fn classifyAlloc(allocator: std.mem.Allocator, status: u16, body: []const u8) !Classification {
    const http_retry: Classification = switch (status) {
        // HTTP 429 carries its own Retry-After; only Torn code 5 is the documented
        // per-key minute quota, so only that spends the remaining minute.
        408, 429, 500, 502, 503, 504 => .{ .policy = .backoff },
        else => .{ .policy = .none },
    };
    const parsed = std.json.parseFromSlice(struct { @"error": ?struct { code: u32, @"error": ?[]const u8 = null } = null }, allocator, body, .{ .ignore_unknown_fields = true }) catch |err| switch (err) {
        error.OutOfMemory => return err,
        else => return http_retry,
    };
    defer parsed.deinit();
    if (parsed.value.@"error") |failure| {
        const ip = if (failure.@"error") |message| mentionsIp(message) else false;
        return switch (failure.code) {
            5 => .{ .policy = .minute_boundary, .exhausts_key = true, .exhausts_route = ip },
            8, 9 => .{ .policy = .backoff },
            else => http_retry,
        };
    }
    return http_retry;
}

test "Torn code 5 waits until next absolute minute while honoring longer backoff and Retry-After" {
    const State = struct {
        now: i64,
        retry_after: u64 = 0,
        expected: u64,
        calls: usize = 0,
        waits: usize = 0,
        client: ?*Client = null,
        fn nowFn(ctx: ?*anyopaque, _: std.Io) i64 {
            return (@as(*@This(), @ptrCast(@alignCast(ctx.?)))).now;
        }
        fn sendFn(ctx: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.calls += 1;
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, if (self.calls == 1) "{\"error\":{\"code\":5,\"error\":\"Too many requests\"}}" else "{}"), .retry_after_ms = self.retry_after };
        }
        fn waitFn(ctx: ?*anyopaque, _: std.Io, ms: u64) !void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqual(self.expected, ms);
            try std.testing.expectEqual(@as(usize, 1), self.client.?.permits.permits);
            self.now += @intCast(ms);
            self.waits += 1;
        }
    };
    for ([_]State{
        .{ .now = 100, .expected = 59_900 },
        .{ .now = 59_900, .expected = 250 },
        .{ .now = 60_000, .expected = 60_000 },
        .{ .now = -100, .expected = 250 },
        .{ .now = 100, .retry_after = 70_000, .expected = 70_000 },
    }) |initial| {
        var state = initial;
        var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"}, .max_in_flight = 1, .max_attempts = 2 }, .{ .context = &state, .send_fn = State.sendFn });
        defer client.deinit();
        state.client = &client;
        client.scheduler = .{ .context = &state, .now_fn = State.nowFn, .wait_fn = State.waitFn };
        var response = try client.execute("http://mock", .{});
        defer response.deinit();
        try std.testing.expectEqualStrings("{}", response.body);
        try std.testing.expectEqual(@as(usize, 2), state.calls);
        try std.testing.expectEqual(@as(usize, 1), state.waits);
    }
}

test "Torn code 5 cooldown respects operation deadline and cancellation without another attempt" {
    const State = struct {
        now: i64 = 100,
        cancel: bool,
        calls: usize = 0,
        waits: usize = 0,
        client: ?*Client = null,
        fn nowFn(ctx: ?*anyopaque, _: std.Io) i64 {
            return (@as(*@This(), @ptrCast(@alignCast(ctx.?)))).now;
        }
        fn sendFn(ctx: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.calls += 1;
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, "{\"error\":{\"code\":5}}") };
        }
        fn waitFn(ctx: ?*anyopaque, _: std.Io, ms: u64) !void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqual(@as(usize, 1), self.client.?.permits.permits);
            self.waits += 1;
            if (self.cancel) return error.Canceled;
            try std.testing.expectEqual(@as(u64, 900), ms);
            self.now += @intCast(ms);
        }
    };
    for ([_]bool{ false, true }) |cancel| {
        var state: State = .{ .cancel = cancel };
        var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"}, .max_in_flight = 1, .max_attempts = 2 }, .{ .context = &state, .send_fn = State.sendFn });
        defer client.deinit();
        state.client = &client;
        client.scheduler = .{ .context = &state, .now_fn = State.nowFn, .wait_fn = State.waitFn };
        try std.testing.expectError(if (cancel) error.Canceled else error.Timeout, client.execute("http://mock", .{ .deadline_ms = if (cancel) null else 1000 }));
        try std.testing.expectEqual(@as(usize, 1), state.calls);
        try std.testing.expectEqual(@as(usize, 1), state.waits);
        try std.testing.expectEqual(@as(usize, 1), client.permits.permits);
    }
}

test "retry policy includes HTTP and Torn error envelopes" {
    try std.testing.expect(shouldRetry(503, ""));
    try std.testing.expect(shouldRetry(200, "{\"error\":{\"code\":5}}"));
    try std.testing.expect(!shouldRetry(400, "{\"error\":{\"code\":4}}"));
}

/// Whole-word match so messages such as "multiple" do not spend a route.
fn mentionsIp(message: []const u8) bool {
    var words = std.mem.tokenizeAny(u8, message, " \t.,;:!?()[]'\"-/");
    while (words.next()) |word| if (std.ascii.eqlIgnoreCase(word, "ip")) return true;
    return false;
}

test "rate-limited key and IP-attributed route are spent for the rest of the minute" {
    const State = struct {
        calls: usize = 0,
        fn nowFn(_: ?*anyopaque, _: std.Io) i64 {
            return 1_000;
        }
        fn waitFn(_: ?*anyopaque, _: std.Io, _: u64) !void {
            return error.UnexpectedWait;
        }
        fn sendFn(ctx: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            defer self.calls += 1;
            const body = switch (self.calls) {
                0 => blk: {
                    try std.testing.expectEqualStrings("a", request.api_key);
                    break :blk "{\"error\":{\"code\":5,\"error\":\"Too many requests\"}}";
                },
                1 => blk: {
                    // Key "a" stays spent although its counted budget was not used.
                    try std.testing.expectEqualStrings("b", request.api_key);
                    try std.testing.expect(request.proxy_url == null);
                    break :blk "{\"error\":{\"code\":5,\"error\":\"Too many requests from this IP\"}}";
                },
                2 => blk: {
                    // Both spent keys and the IP-limited first route are skipped.
                    try std.testing.expectEqualStrings("c", request.api_key);
                    try std.testing.expectEqualStrings("http://second", request.proxy_url orelse "");
                    break :blk "{}";
                },
                else => unreachable,
            };
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, body) };
        }
    };
    var state: State = .{};
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b", "c" }, .per_key_per_minute = 10, .routes = &.{ .{ .name = "first" }, .{ .name = "second", .proxy_url = "http://second" } } }, .{ .context = &state, .send_fn = State.sendFn });
    defer client.deinit();
    client.scheduler = .{ .context = &state, .now_fn = State.nowFn, .wait_fn = State.waitFn };
    for (0..3) |_| {
        var response = try client.execute("http://mock", .{ .attempts = 1 });
        response.deinit();
    }
    try std.testing.expectEqual(@as(usize, 3), state.calls);
    try std.testing.expectEqual(@as(u32, 10), client.key_usage[0].calls);
    try std.testing.expectEqual(@as(u32, 10), client.key_usage[1].calls);
    try std.testing.expectEqual(@as(u32, 1), client.key_usage[2].calls);
    try std.testing.expectEqual(client.config.per_route_per_minute, client.route_usage[0].calls);
}

test "only Torn code 5 spends the key and IP attribution is a whole word" {
    const a = std.testing.allocator;
    try std.testing.expectEqual(Classification{ .policy = .minute_boundary, .exhausts_key = true, .exhausts_route = true }, try classifyAlloc(a, 200, "{\"error\":{\"code\":5,\"error\":\"Too many requests (IP)\"}}"));
    try std.testing.expectEqual(Classification{ .policy = .backoff }, try classifyAlloc(a, 429, ""));
    try std.testing.expectEqual(Classification{ .policy = .minute_boundary, .exhausts_key = true }, try classifyAlloc(a, 200, "{\"error\":{\"code\":5,\"error\":\"Multiple requests\"}}"));
    try std.testing.expectEqual(Classification{ .policy = .backoff }, try classifyAlloc(a, 503, ""));
    try std.testing.expectEqual(Classification{ .policy = .backoff }, try classifyAlloc(a, 200, "{\"error\":{\"code\":8,\"error\":\"IP block\"}}"));
}

test "credentials are trimmed and deduplicated with owned lifetime" {
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ " a ", "a", "b" } }, .{});
    defer client.deinit();
    try std.testing.expectEqual(@as(usize, 2), client.keys.len);
    try std.testing.expectEqualStrings("a", client.keys[0]);
}

test "injected execution returns owned body and observes actual send" {
    const Mock = struct {
        fn send(_: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
            try std.testing.expectEqualStrings("http://test/user?selections=profile,job", request.url);
            try std.testing.expectEqualStrings("a", request.api_key);
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, "{}") };
        }
    };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"} }, .{ .send_fn = Mock.send });
    defer client.deinit();
    var response = try client.execute("http://test/user?selections=profile,job", .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("{}", response.body);
}

test "configuration construction cleans up every allocation failure" {
    const Scenario = struct {
        fn run(allocator: std.mem.Allocator) !void {
            var client = try Client.init(allocator, std.testing.io, .{
                .keys = &.{ "one", "two", "one" },
                .routes = &.{ .{ .name = "direct" }, .{ .name = "proxy", .proxy_url = "http://localhost:8080" } },
            }, .{});
            defer client.deinit();
        }
    };
    try std.testing.checkAllAllocationFailures(std.testing.allocator, Scenario.run, .{});
}

test "environment limits reject zero signs overflow and malformed values" {
    var env: std.process.Environ.Map = .init(std.testing.allocator);
    defer env.deinit();
    try env.put("TORN_API_KEY", "single");
    try env.put("TORN_API_KEYS", " multi, multi ; second ");
    try env.put("TORN_MAX_IN_FLIGHT", "2");
    var client = try Client.initFromEnvironment(std.testing.allocator, std.testing.io, env, .{});
    defer client.deinit();
    try std.testing.expectEqual(@as(usize, 2), client.keys.len);
    try std.testing.expectEqualStrings("multi", client.keys[0]);
    try std.testing.expectEqual(@as(u32, 2), client.config.max_in_flight);
    for ([_][]const u8{ "0", "-1", "+2", "4294967296", "1s", " 2" }) |bad| {
        try env.put("TORN_MAX_IN_FLIGHT", bad);
        try std.testing.expectError(error.InvalidEnvironment, Client.initFromEnvironment(std.testing.allocator, std.testing.io, env, .{}));
    }
}

test "credential bearing types redact supported formatting and JSON serialization" {
    const config: Config = .{ .keys = &.{"DO_NOT_DISCLOSE_TEST_SECRET"} };
    const formatted = try std.fmt.allocPrint(std.testing.allocator, "{f}", .{config});
    defer std.testing.allocator.free(formatted);
    try std.testing.expect(std.mem.indexOf(u8, formatted, "DO_NOT_DISCLOSE") == null);
    const json = try std.json.Stringify.valueAlloc(std.testing.allocator, config, .{});
    defer std.testing.allocator.free(json);
    try std.testing.expect(std.mem.indexOf(u8, json, "DO_NOT_DISCLOSE") == null);
}

test "absolute-minute quotas rotate unique credentials and release permit while waiting" {
    const Scenario = struct {
        now: i64 = 59_900,
        calls: usize = 0,
        waits: usize = 0,
        client: ?*Client = null,
        fn nowFn(ctx: ?*anyopaque, _: std.Io) i64 {
            return (@as(*@This(), @ptrCast(@alignCast(ctx.?)))).now;
        }
        fn waitFn(ctx: ?*anyopaque, _: std.Io, ms: u64) !void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqual(@as(usize, 1), self.client.?.permits.permits);
            try std.testing.expectEqual(@as(u64, 100), ms);
            self.now += @intCast(ms);
            self.waits += 1;
        }
        fn sendFn(ctx: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqualStrings(if (self.calls == 1) "b" else "a", request.api_key);
            self.calls += 1;
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, "{}") };
        }
    };
    var state: Scenario = .{};
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "a", "b" }, .per_key_per_minute = 1, .max_in_flight = 1 }, .{ .context = &state, .send_fn = Scenario.sendFn });
    defer client.deinit();
    state.client = &client;
    client.scheduler = .{ .context = &state, .now_fn = Scenario.nowFn, .wait_fn = Scenario.waitFn };
    for (0..3) |_| {
        var response = try client.execute("http://mock", .{});
        response.deinit();
    }
    try std.testing.expectEqual(@as(usize, 1), state.waits);
    try std.testing.expectEqual(@as(usize, 3), state.calls);
}

test "route-specific budgets spill over inherit defaults and reset at minute boundary" {
    const State = struct {
        now: i64 = 59_900,
        waits: usize = 0,
        client: ?*Client = null,
        fn nowFn(ctx: ?*anyopaque, _: std.Io) i64 {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            return self.now;
        }
        fn waitFn(ctx: ?*anyopaque, _: std.Io, ms: u64) !void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqual(@as(u64, 100), ms);
            try std.testing.expectEqual(@as(usize, 1), self.client.?.permits.permits);
            self.now += @intCast(ms);
            self.waits += 1;
        }
        fn sendFn(_: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, "{}") };
        }
    };
    var state: State = .{};
    var client = try Client.init(std.testing.allocator, std.testing.io, .{
        .keys = &.{"a"},
        .max_in_flight = 1,
        .per_route_per_minute = 2,
        .routes = &.{ .{ .name = "small", .per_minute = 1 }, .{ .name = "inherited" }, .{ .name = "large", .per_minute = 3 } },
    }, .{ .send_fn = State.sendFn });
    defer client.deinit();
    state.client = &client;
    client.scheduler = .{ .context = &state, .now_fn = State.nowFn, .wait_fn = State.waitFn };
    for ([_][]const u8{ "small", "inherited", "inherited", "large", "large", "large" }) |expected| {
        var response = try client.execute("http://mock", .{});
        defer response.deinit();
        try std.testing.expectEqualStrings(expected, response.route_name);
    }
    try std.testing.expectEqual(@as(usize, 0), state.waits);
    var pinned = try client.execute("http://mock", .{ .route = 0 });
    defer pinned.deinit();
    try std.testing.expectEqualStrings("small", pinned.route_name);
    try std.testing.expectEqual(@as(usize, 1), state.waits);
    try std.testing.expectEqual(@as(u32, 1), client.route_usage[0].calls);
    try std.testing.expectEqual(@as(u32, 0), client.route_usage[1].calls);
    try std.testing.expectEqual(@as(u32, 0), client.route_usage[2].calls);
}

test "zero route-specific quota is rejected without leaking allocations" {
    try std.testing.expectError(error.InvalidConfiguration, Client.init(std.testing.allocator, std.testing.io, .{
        .keys = &.{"a"},
        .routes = &.{ .{ .name = "valid", .per_minute = 1 }, .{ .name = "invalid", .per_minute = 0 } },
    }, .{}));
}

test "timeout cancels and joins transport and restores permits" {
    const State = struct {
        cleaned: bool = false,
        fn sendFn(ctx: ?*anyopaque, _: std.mem.Allocator, io: std.Io, _: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            defer self.cleaned = true;
            try std.Io.sleep(io, .fromSeconds(60), .awake);
            return error.UnexpectedCompletion;
        }
    };
    var state: State = .{};
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"}, .max_attempts = 1 }, .{ .context = &state, .send_fn = State.sendFn });
    defer client.deinit();
    try std.testing.expectError(error.Timeout, client.execute("http://mock", .{ .timeout_ms = 1 }));
    try std.testing.expect(state.cleaned);
    try std.testing.expectEqual(@as(usize, 8), client.permits.permits);
}

test "retry honors longer Retry-After and backoff never owns a permit" {
    const State = struct {
        calls: usize = 0,
        waits: usize = 0,
        client: ?*Client = null,
        fn sendFn(ctx: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.calls += 1;
            return .{ .allocator = allocator, .status = if (self.calls == 1) 429 else 200, .body = try allocator.dupe(u8, "{}"), .retry_after_ms = 700 };
        }
        fn waitFn(ctx: ?*anyopaque, _: std.Io, ms: u64) !void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqual(@as(u64, 700), ms);
            try std.testing.expectEqual(@as(usize, 8), self.client.?.permits.permits);
            self.waits += 1;
        }
    };
    var state: State = .{};
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"} }, .{ .context = &state, .send_fn = State.sendFn });
    defer client.deinit();
    state.client = &client;
    client.scheduler = .{ .context = &state, .wait_fn = State.waitFn };
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqual(@as(usize, 2), state.calls);
    try std.testing.expectEqual(@as(usize, 1), state.waits);
}

test "an exhausted pinned route does not block another route" {
    const State = struct {
        waiting: std.Io.Event = .unset,
        fn nowFn(_: ?*anyopaque, _: std.Io) i64 {
            return 0;
        }
        fn waitFn(ctx: ?*anyopaque, io: std.Io, _: u64) !void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.waiting.set(io);
            try std.Io.sleep(io, .fromSeconds(60), .awake);
        }
        fn sendFn(_: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, "{}") };
        }
    };
    const io = std.testing.io;
    var state: State = .{};
    var client = try Client.init(std.testing.allocator, io, .{ .keys = &.{"a"}, .max_in_flight = 1, .per_route_per_minute = 1, .routes = &.{ .{ .name = "first" }, .{ .name = "second" } } }, .{ .send_fn = State.sendFn });
    defer client.deinit();
    client.scheduler = .{ .context = &state, .now_fn = State.nowFn, .wait_fn = State.waitFn };
    var first = try client.execute("http://mock", .{ .route = 0 });
    defer first.deinit();
    var blocked = try io.concurrent(Client.execute, .{ &client, "http://mock", Options{ .route = 0 } });
    defer if (blocked.cancel(io)) |value| {
        var owned = value;
        owned.deinit();
    } else |_| {};
    try state.waiting.wait(io);
    var available = try client.execute("http://mock", .{ .route = 1, .timeout_ms = 100 });
    defer available.deinit();
    try std.testing.expectEqualStrings("second", available.route_name);
    try std.testing.expectError(error.Canceled, blocked.cancel(io));
    try std.testing.expectEqual(@as(usize, 1), client.permits.permits);
}

test "native stalled HTTP body is canceled by per-attempt deadline" {
    const State = struct {
        fn serve(listener: *std.Io.net.Server, io: std.Io) !void {
            const stream = try listener.accept(io);
            defer stream.close(io);
            var buffer: [8192]u8 = undefined;
            var reader = stream.reader(io, &buffer);
            while (try reader.interface.takeDelimiter('\n')) |line| if (std.mem.eql(u8, line, "\r")) break;
            var writer = stream.writer(io, &buffer);
            try writer.interface.writeAll("HTTP/1.1 200 OK\r\nContent-Length: 20\r\nConnection: close\r\n\r\n");
            try writer.interface.flush();
            try std.Io.sleep(io, .fromSeconds(60), .awake);
        }
    };
    const io = std.testing.io;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
    var listener = try address.listen(io, .{});
    defer listener.deinit(io);
    var server = try io.concurrent(State.serve, .{ &listener, io });
    defer server.cancel(io) catch {};
    var client = try Client.init(std.testing.allocator, io, .{ .keys = &.{"synthetic-test-key"}, .max_attempts = 1 }, .{});
    defer client.deinit();
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/", .{listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    try std.testing.expectError(error.Timeout, client.execute(url, .{ .timeout_ms = 30 }));
    try std.testing.expectEqual(@as(usize, 8), client.permits.permits);
}

test "execution response and retry inspection clean up every allocation failure" {
    const Scenario = struct {
        fn sendFn(_: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            return .{ .allocator = allocator, .status = 200, .body = try allocator.dupe(u8, "{\"value\":1}") };
        }
        fn run(allocator: std.mem.Allocator) !void {
            var client = try Client.init(allocator, std.testing.io, .{ .keys = &.{"a"} }, .{ .send_fn = sendFn });
            defer client.deinit();
            var response = try client.execute("http://mock", .{});
            defer response.deinit();
            try std.testing.expectEqualStrings("{\"value\":1}", response.body);
        }
    };
    try std.testing.checkAllAllocationFailures(std.testing.allocator, Scenario.run, .{});
}

test "native body-read failure retries instead of returning truncated success" {
    const Server = struct {
        calls: usize = 0,
        fn serve(self: *@This(), listener: *std.Io.net.Server, io: std.Io) !void {
            for (0..2) |attempt| {
                const stream = try listener.accept(io);
                defer stream.close(io);
                var buffer: [8192]u8 = undefined;
                var reader = stream.reader(io, &buffer);
                while (try reader.interface.takeDelimiter('\n')) |line| if (std.mem.eql(u8, line, "\r")) break;
                var writer = stream.writer(io, &buffer);
                try writer.interface.writeAll(if (attempt == 0) "HTTP/1.1 200 OK\r\nContent-Length: 20\r\nConnection: close\r\n\r\n{}" else "HTTP/1.1 200 OK\r\nContent-Length: 2\r\nConnection: close\r\n\r\n{}");
                try writer.interface.flush();
                self.calls += 1;
            }
        }
        fn waitFn(_: ?*anyopaque, _: std.Io, ms: u64) !void {
            try std.testing.expectEqual(@as(u64, 250), ms);
        }
    };
    const io = std.testing.io;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
    var listener = try address.listen(io, .{});
    defer listener.deinit(io);
    var state: Server = .{};
    var server = try io.concurrent(Server.serve, .{ &state, &listener, io });
    defer server.cancel(io) catch {};
    var client = try Client.init(std.testing.allocator, io, .{ .keys = &.{"synthetic-key"}, .max_attempts = 2 }, .{});
    defer client.deinit();
    client.scheduler.wait_fn = Server.waitFn;
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/", .{listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    var response = try client.execute(url, .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("{}", response.body);
    try server.await(io);
    try std.testing.expectEqual(@as(usize, 2), state.calls);
}
