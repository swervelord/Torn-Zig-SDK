const std = @import("std");
pub const transport = @import("transport.zig");
const errors = @import("errors.zig");
const version = @import("version.zig");
const shared = @import("generated/shared.zig");

pub const AccessLevel = shared.AccessLevel;
pub const KeyHint = transport.KeyHint;
pub const Jitter = enum { full, none };
/// Known access level of a configured key (P6.2), e.g. from a stored `key/info` result.
pub const KeyAccess = struct { key: []const u8, level: AccessLevel };

pub const Config = struct {
    keys: []const []const u8,
    user_agent: []const u8 = version.user_agent,
    base_url_v2: []const u8 = "https://api.torn.com/v2",
    base_url_v1: []const u8 = "https://api.torn.com",
    attempt_timeout_ms: u32 = 30_000,
    /// Total HTTP sends per logical request, retries included (P4.2). Key rotations
    /// (`rotate_key` codes, and code 5 moving to another key) do not count (P2.4a).
    max_attempts: u32 = errors.retry.max_attempts,
    /// Exponential backoff base: delay(n) = backoff_ms * 2^(n-1), capped (P4.2).
    backoff_ms: u32 = errors.retry.base_delay_ms,
    max_backoff_ms: u32 = errors.retry.max_delay_ms,
    retry_after_cap_ms: u32 = errors.retry.retry_after_cap_ms,
    jitter: Jitter = if (errors.retry.jitter_full) .full else .none,
    max_in_flight: u32 = 8,
    /// Sliding-window budget per key group (one Torn user) over `rate_window_ms` (P3.1).
    per_key_per_minute: u32 = 100,
    /// Sliding-window budget per egress route (IP).
    per_route_per_minute: u32 = 1000,
    rate_window_ms: u32 = 60_000,
    /// How long a route stays blocked after Torn code 8 (IP block, P3.4).
    ip_block_ms: u32 = 60_000,
    max_body_bytes: usize = 64 * 1024 * 1024,
    routes: []const Route = &.{.{ .name = "direct" }},
    /// Keys of one Torn user share one budget (P3.2). Unlisted keys form their own group.
    key_groups: []const []const []const u8 = &.{},
    /// Known key access levels (P6.2). `Client.detectKeys` fills the rest from key/info.
    key_access: []const KeyAccess = &.{},
    /// Refuse, before sending, calls whose required level no usable key has (P6.2).
    check_access: bool = false,
    /// Run `key/info` for every key once, before the first typed call, to learn access
    /// levels and group keys of the same owner (P3.2, P6.2).
    detect_key_owners: bool = false,

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
    /// API version of the URL (both authenticate with the header, P2.1).
    api_version: u8 = 2,
    /// Operation id or label reported to hooks.
    operation: []const u8 = "",
    /// Skip keys whose known access level is below this (P6.2).
    min_access: ?AccessLevel = null,
    /// Pin one key index (used by key/info detection).
    key: ?usize = null,
    /// Cache a successful response for this long when a cache is attached (P8.4).
    cache_ttl_ms: ?u32 = null,
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
    /// Runs outside the accounting lock; callback must be thread safe. The last
    /// argument is the absolute minute of the send (now / 60 000).
    on_send: *const fn (?*anyopaque, usize, usize, i64) void,
};

/// Redacted request lifecycle data for hooks (P8.3). `url` never contains a key.
pub const Event = struct {
    operation: []const u8,
    url: []const u8,
    /// 1-based send number within the logical request.
    attempt: u32,
    key: KeyHint,
    route: []const u8,
    status: ?u16 = null,
    api_code: ?u32 = null,
    duration_ms: i64 = 0,
    /// Delay before the next send (on_retry).
    delay_ms: u64 = 0,
    err: ?anyerror = null,
};
pub const Hooks = struct {
    context: ?*anyopaque = null,
    /// Hooks run outside every lock and must be thread safe.
    on_request: ?*const fn (?*anyopaque, *const Event) void = null,
    on_response: ?*const fn (?*anyopaque, *const Event) void = null,
    on_retry: ?*const fn (?*anyopaque, *const Event) void = null,
    on_error: ?*const fn (?*anyopaque, *const Event) void = null,
    fn emit(self: Hooks, comptime field: []const u8, event: *const Event) void {
        if (@field(self, field)) |hook| hook(self.context, event);
    }
};

/// Pluggable response cache (P8.4). Keys are request URLs (never containing a key);
/// only successful, non-error bodies are stored.
pub const Cache = struct {
    context: ?*anyopaque = null,
    /// Returns an owned copy of a fresh body, or null.
    get_fn: *const fn (?*anyopaque, std.mem.Allocator, []const u8, i64) ?[]u8,
    put_fn: *const fn (?*anyopaque, []const u8, []const u8, i64) void,
};
/// Thread-safe in-memory TTL cache with a bounded entry count (oldest evicted first).
pub const MemoryCache = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    mutex: std.Io.Mutex = .init,
    entries: std.StringArrayHashMapUnmanaged(Entry) = .empty,
    max_entries: usize = 1024,
    const Entry = struct { body: []u8, expires_ms: i64 };
    pub fn init(allocator: std.mem.Allocator, io: std.Io) MemoryCache {
        return .{ .allocator = allocator, .io = io };
    }
    pub fn deinit(self: *MemoryCache) void {
        var it = self.entries.iterator();
        while (it.next()) |entry| {
            self.allocator.free(entry.key_ptr.*);
            self.allocator.free(entry.value_ptr.body);
        }
        self.entries.deinit(self.allocator);
        self.* = undefined;
    }
    pub fn cache(self: *MemoryCache) Cache {
        return .{ .context = self, .get_fn = get, .put_fn = put };
    }
    fn get(context: ?*anyopaque, allocator: std.mem.Allocator, key: []const u8, now: i64) ?[]u8 {
        const self: *MemoryCache = @ptrCast(@alignCast(context.?));
        self.mutex.lockUncancelable(self.io);
        defer self.mutex.unlock(self.io);
        const entry = self.entries.get(key) orelse return null;
        if (entry.expires_ms <= now) return null;
        return allocator.dupe(u8, entry.body) catch null;
    }
    fn put(context: ?*anyopaque, key: []const u8, body: []const u8, expires_ms: i64) void {
        const self: *MemoryCache = @ptrCast(@alignCast(context.?));
        self.mutex.lockUncancelable(self.io);
        defer self.mutex.unlock(self.io);
        const owned_body = self.allocator.dupe(u8, body) catch return;
        if (self.entries.getPtr(key)) |existing| {
            self.allocator.free(existing.body);
            existing.* = .{ .body = owned_body, .expires_ms = expires_ms };
            return;
        }
        const owned_key = self.allocator.dupe(u8, key) catch {
            self.allocator.free(owned_body);
            return;
        };
        if (self.entries.count() >= self.max_entries) {
            const oldest_key = self.entries.keys()[0];
            const oldest = self.entries.values()[0];
            self.entries.orderedRemoveAt(0);
            self.allocator.free(oldest_key);
            self.allocator.free(oldest.body);
        }
        self.entries.put(self.allocator, owned_key, .{ .body = owned_body, .expires_ms = expires_ms }) catch {
            self.allocator.free(owned_key);
            self.allocator.free(owned_body);
        };
    }
};

pub const KeyStatus = enum { healthy, rate_limited, disabled };
/// Redacted per-key introspection (P2.5).
pub const KeyState = struct {
    key: KeyHint,
    status: KeyStatus,
    /// Rate-limited or temporarily disabled until this time (ms since epoch).
    until_ms: ?i64 = null,
    /// Torn error code that disabled the key.
    reason: ?u32 = null,
    /// Requests left in the key group's current sliding window.
    remaining: u32,
    access: ?AccessLevel = null,
    group: usize,
    pub fn format(self: KeyState, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.print("KeyState{{ key={f}, status={s}, remaining={d}, group={d} }}", .{ self.key, @tagName(self.status), self.remaining, self.group });
    }
};

/// Ordered log of send times; a sliding window (P3.1), not calendar minutes.
const Window = struct {
    times: std.ArrayList(i64) = .empty,
    head: usize = 0,
    fn count(self: *const Window) usize {
        return self.times.items.len - self.head;
    }
    fn prune(self: *Window, now: i64, span: i64) void {
        while (self.head < self.times.items.len and self.times.items[self.head] <= now - span) self.head += 1;
        if (self.head > 64 and self.head * 2 > self.times.items.len) {
            const live = self.times.items[self.head..];
            std.mem.copyForwards(i64, self.times.items[0..live.len], live);
            self.times.shrinkRetainingCapacity(live.len);
            self.head = 0;
        }
    }
    /// Time at which one more send fits, given `limit` sends per `span`.
    fn freeAt(self: *const Window, now: i64, limit: u32, span: i64) i64 {
        if (self.count() < limit) return now;
        return self.times.items[self.times.items.len - limit] + span;
    }
    fn oldest(self: *const Window) ?i64 {
        return if (self.count() > 0) self.times.items[self.head] else null;
    }
    fn record(self: *Window, allocator: std.mem.Allocator, at: i64) !void {
        // Sends arrive in time order; preloaded history may not, so keep it sorted.
        var index = self.times.items.len;
        while (index > self.head and self.times.items[index - 1] > at) index -= 1;
        try self.times.insert(allocator, index, at);
    }
    fn deinit(self: *Window, allocator: std.mem.Allocator) void {
        self.times.deinit(allocator);
    }
};
const KeySlot = struct {
    secret: []const u8,
    group: usize,
    disabled: bool = false,
    /// Null with `disabled` means for the client lifetime.
    disabled_until: ?i64 = null,
    reason: ?u32 = null,
    access: ?AccessLevel = null,
};
const Group = struct { window: Window = .{}, rate_limited_until: i64 = std.math.minInt(i64) };
const RouteSlot = struct { window: Window = .{}, blocked_until: i64 = std.math.minInt(i64) };

pub const Client = struct {
    allocator: std.mem.Allocator,
    io: std.Io,
    config: Config,
    wire: transport.Transport,
    scheduler: Scheduler = .{},
    observer: ?UsageObserver = null,
    hooks: Hooks = .{},
    /// Optional response cache (off by default, P8.4).
    cache: ?Cache = null,
    mutex: std.Io.Mutex = .init,
    permits: std.Io.Semaphore,
    keys: [][]const u8,
    routes: []Route,
    slots: []KeySlot,
    groups: []Group,
    route_slots: []RouteSlot,
    next_key: usize = 0,
    pool: ?*transport.Pool = null,
    prng: std.Random.DefaultPrng,
    /// Code of the most recent key-disabling error (for "no usable keys" reports).
    last_disable_code: ?u32 = null,
    detection: std.atomic.Value(u8) = .init(0),

    pub fn format(_: Client, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.writeAll("Client{redacted}");
    }
    pub fn jsonStringify(_: Client, writer: anytype) !void {
        try writer.write(.{ .client = "redacted" });
    }

    /// Allocator must support concurrent calls. Client must remain at a stable
    /// address and outlive every execute; join/cancel callers before deinit.
    /// With the default transport, one pooled HTTP client is shared by all sends.
    pub fn init(allocator: std.mem.Allocator, io: std.Io, config: Config, wire: transport.Transport) !Client {
        if (config.attempt_timeout_ms == 0 or config.max_attempts == 0 or config.max_in_flight == 0 or config.backoff_ms == 0 or
            config.per_key_per_minute == 0 or config.per_route_per_minute == 0 or config.max_body_bytes == 0 or config.routes.len == 0 or config.rate_window_ms == 0)
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
        const slots = try allocator.alloc(KeySlot, keys.items.len);
        errdefer allocator.free(slots);
        const groups = try allocator.alloc(Group, keys.items.len);
        errdefer allocator.free(groups);
        @memset(groups, .{});
        for (keys.items, slots, 0..) |key, *slot, i| {
            slot.* = .{ .secret = key, .group = i };
            // Declared groups share the window of their first configured member.
            for (config.key_groups) |members| {
                var first: ?usize = null;
                var member = false;
                for (members) |raw_member| {
                    const name = std.mem.trim(u8, raw_member, " \t\r\n");
                    for (keys.items[0..i], 0..) |prior, j| if (first == null and std.mem.eql(u8, prior, name)) {
                        first = j;
                    };
                    if (std.mem.eql(u8, name, key)) member = true;
                }
                if (member) if (first) |j| {
                    slot.group = slots[j].group;
                };
            }
            for (config.key_access) |known| if (std.mem.eql(u8, std.mem.trim(u8, known.key, " \t\r\n"), key)) {
                slot.access = known.level;
            };
        }
        const route_slots = try allocator.alloc(RouteSlot, routes.len);
        errdefer allocator.free(route_slots);
        @memset(route_slots, .{});
        const agent = try allocator.dupe(u8, config.user_agent);
        errdefer allocator.free(agent);
        const base_v2 = try allocator.dupe(u8, config.base_url_v2);
        errdefer allocator.free(base_v2);
        const base_v1 = try allocator.dupe(u8, config.base_url_v1);
        errdefer allocator.free(base_v1);
        var effective_wire = wire;
        var pool: ?*transport.Pool = null;
        if (wire.context == null and wire.send_fn == transport.nativeSend) {
            const created = try allocator.create(transport.Pool);
            created.* = .init(allocator, io);
            pool = created;
            effective_wire = created.transport();
        }
        errdefer if (pool) |p| {
            p.deinit();
            allocator.destroy(p);
        };
        var seed: [8]u8 = undefined;
        io.random(&seed);
        const owned_keys = try keys.toOwnedSlice(allocator);
        var owned_config = config;
        owned_config.user_agent = agent;
        owned_config.base_url_v2 = base_v2;
        owned_config.base_url_v1 = base_v1;
        owned_config.keys = owned_keys;
        owned_config.routes = routes;
        owned_config.key_groups = &.{};
        owned_config.key_access = &.{};
        for (slots, owned_keys) |*slot, key| slot.secret = key;
        return .{
            .allocator = allocator,
            .io = io,
            .config = owned_config,
            .wire = effective_wire,
            .keys = owned_keys,
            .routes = routes,
            .slots = slots,
            .groups = groups,
            .route_slots = route_slots,
            .pool = pool,
            .prng = .init(std.mem.readInt(u64, &seed, .little)),
            .permits = .{ .permits = config.max_in_flight },
        };
    }

    pub fn deinit(self: *Client) void {
        if (self.pool) |p| {
            p.deinit();
            self.allocator.destroy(p);
        }
        for (self.keys) |key| self.allocator.free(key);
        self.allocator.free(self.keys);
        for (self.routes) |route| {
            self.allocator.free(route.name);
            if (route.proxy_url) |url| self.allocator.free(url);
        }
        self.allocator.free(self.routes);
        for (self.groups) |*group| group.window.deinit(self.allocator);
        self.allocator.free(self.groups);
        for (self.route_slots) |*slot| slot.window.deinit(self.allocator);
        self.allocator.free(self.route_slots);
        self.allocator.free(self.slots);
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

    pub fn now(self: *Client) i64 {
        return self.scheduler.now_fn(self.scheduler.context, self.io);
    }

    /// Check this during caller-side planning, serialization and decoding loops.
    pub fn check(self: *Client, options: Options) !void {
        try self.io.checkCancel();
        if (options.deadline_ms) |deadline| if (self.now() >= deadline) return error.Timeout;
    }

    fn wait(self: *Client, options: Options, ms: u64) !void {
        try self.check(options);
        var actual = ms;
        if (options.deadline_ms) |deadline| {
            const remaining = deadline - self.now();
            if (remaining <= 0) return error.Timeout;
            actual = @min(ms, @as(u64, @intCast(remaining)));
        }
        try self.scheduler.wait_fn(self.scheduler.context, self.io, actual);
        try self.check(options);
    }

    /// Redacted per-key state (P2.5). Caller owns the returned slice.
    pub fn keyStates(self: *Client, allocator: std.mem.Allocator) ![]KeyState {
        const out = try allocator.alloc(KeyState, self.slots.len);
        errdefer allocator.free(out);
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        const at = self.now();
        self.refresh(at);
        for (self.slots, out) |slot, *state| {
            const group = &self.groups[slot.group];
            const used = group.window.count();
            state.* = .{
                .key = KeyHint.of(slot.secret),
                .status = if (slot.disabled) .disabled else if (group.rate_limited_until > at) .rate_limited else .healthy,
                .until_ms = if (slot.disabled) slot.disabled_until else if (group.rate_limited_until > at) group.rate_limited_until else null,
                .reason = slot.reason,
                .remaining = if (used >= self.config.per_key_per_minute) 0 else self.config.per_key_per_minute - @as(u32, @intCast(used)),
                .access = slot.access,
                .group = slot.group,
            };
        }
        return out;
    }
    /// Records the access level learned for a key (P6.2).
    pub fn setKeyAccess(self: *Client, key_index: usize, level: ?AccessLevel) !void {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        self.slots[key_index].access = level;
    }
    /// Makes `key_index` share the rate budget of `with_index` (same Torn user, P3.2).
    pub fn joinKeyGroup(self: *Client, key_index: usize, with_index: usize) !void {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        const target = self.slots[with_index].group;
        const source = self.slots[key_index].group;
        if (target == source) return;
        for (self.groups[source].window.times.items[self.groups[source].window.head..]) |at| try self.groups[target].window.record(self.allocator, at);
        self.groups[target].rate_limited_until = @max(self.groups[target].rate_limited_until, self.groups[source].rate_limited_until);
        for (self.slots) |*slot| if (slot.group == source) {
            slot.group = target;
        };
    }
    /// Accounts a send made outside this client (another process, a restored budget or a
    /// test preload) against the key's group window.
    pub fn noteSend(self: *Client, key_index: usize, at_ms: i64) !void {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        try self.groups[self.slots[key_index].group].window.record(self.allocator, at_ms);
    }

    /// Expires temporary key/route states and prunes windows. Caller holds the mutex.
    fn refresh(self: *Client, at: i64) void {
        const span: i64 = self.config.rate_window_ms;
        for (self.slots) |*slot| if (slot.disabled) if (slot.disabled_until) |until| if (until <= at) {
            slot.* = .{ .secret = slot.secret, .group = slot.group, .access = slot.access };
        };
        for (self.groups) |*group| group.window.prune(at, span);
        for (self.route_slots) |*slot| slot.window.prune(at, span);
    }
    fn routeLimit(self: *Client, index: usize) u32 {
        return self.routes[index].per_minute orelse self.config.per_route_per_minute;
    }
    fn keyEligible(self: *Client, index: usize, options: Options, excluded: []const bool) bool {
        const slot = self.slots[index];
        if (slot.disabled or excluded[index]) return false;
        if (options.key) |pinned| if (pinned != index) return false;
        if (options.min_access) |need| if (slot.access) |have| {
            if (have != .custom and need != .custom and @backingInt(have) < @backingInt(need)) return false;
        };
        return true;
    }

    const Reservation = struct { key: usize, route: usize, at: i64 };
    /// Picks a healthy key (round-robin) and route with sliding-window budget, sleeping
    /// only when no eligible key or route has budget (P3.1-P3.3).
    fn reserve(self: *Client, options: Options, excluded: []const bool) !Reservation {
        if (options.route) |route| if (route >= self.routes.len) return error.InvalidRoute;
        if (options.key) |key| if (key >= self.keys.len) return error.InvalidKey;
        const span: i64 = self.config.rate_window_ms;
        while (true) {
            try self.check(options);
            if (options.deadline_ms) |deadline| {
                const remaining = deadline - self.now();
                if (remaining <= 0) return error.Timeout;
                try self.permits.waitTimeout(self.io, .{ .duration = .{ .raw = .fromMilliseconds(remaining), .clock = .awake } });
            } else try self.permits.wait(self.io);
            var held = true;
            errdefer if (held) self.permits.post(self.io);
            try self.mutex.lock(self.io);
            const at = self.now();
            self.refresh(at);
            var chosen: ?Reservation = null;
            var wake: i64 = std.math.maxInt(i64);
            var any_key = false;
            var any_enabled = false;
            var access_blocked = false;
            for (0..self.keys.len) |index| {
                if (!self.slots[index].disabled) any_enabled = true;
                if (!self.slots[index].disabled and !excluded[index] and options.min_access != null and !self.keyEligible(index, options, excluded)) access_blocked = true;
            }
            route_loop: for (0..self.routes.len) |ri| {
                if (options.route) |pinned| if (pinned != ri) continue;
                const route = &self.route_slots[ri];
                const route_free = @max(route.blocked_until, route.window.freeAt(at, self.routeLimit(ri), span));
                for (0..self.keys.len) |offset| {
                    const ki = (self.next_key + offset) % self.keys.len;
                    if (!self.keyEligible(ki, options, excluded)) continue;
                    any_key = true;
                    const group = &self.groups[self.slots[ki].group];
                    const key_free = @max(group.rate_limited_until, group.window.freeAt(at, self.config.per_key_per_minute, span));
                    const ready = @max(key_free, route_free);
                    if (ready <= at) {
                        group.window.record(self.allocator, at) catch |err| {
                            self.mutex.unlock(self.io);
                            return err;
                        };
                        route.window.record(self.allocator, at) catch |err| {
                            self.mutex.unlock(self.io);
                            return err;
                        };
                        self.next_key = (ki + 1) % self.keys.len;
                        chosen = .{ .key = ki, .route = ri, .at = at };
                        break :route_loop;
                    }
                    wake = @min(wake, ready);
                }
            }
            self.mutex.unlock(self.io);
            if (chosen) |selection| {
                if (self.observer) |observer| observer.on_send(observer.context, selection.key, selection.route, @divFloor(at, 60_000));
                return selection;
            }
            self.permits.post(self.io);
            held = false;
            if (!any_key) {
                if (access_blocked) return error.AccessLevelInsufficient;
                return if (any_enabled) error.KeysExhausted else error.NoUsableKeys;
            }
            try self.wait(options, @intCast(@max(1, wake - at)));
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

    /// Exponential backoff with optional full jitter (P4.2); `retry` is 1-based.
    pub fn backoffDelay(self: *Client, retry: u32) u64 {
        const shift: u6 = @intCast(@min(retry -| 1, 32));
        const base: u64 = self.config.backoff_ms;
        const raw = std.math.mul(u64, base, @as(u64, 1) << shift) catch std.math.maxInt(u64);
        const capped = @min(raw, @as(u64, self.config.max_backoff_ms));
        if (self.config.jitter == .none or capped == 0) return capped;
        self.mutex.lockUncancelable(self.io);
        defer self.mutex.unlock(self.io);
        return self.prng.random().uintAtMost(u64, capped);
    }
    fn retryDelay(self: *Client, retry: u32, retry_after_ms: u64) u64 {
        if (retry_after_ms > 0) return @min(retry_after_ms, @as(u64, self.config.retry_after_cap_ms));
        return self.backoffDelay(retry);
    }

    fn markKey(self: *Client, selected: Reservation, code: u32, info: *const errors.CodeInfo, excluded: []bool) !void {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        excluded[selected.key] = true;
        const slot = &self.slots[selected.key];
        switch (info.disable_key) {
            .none => {},
            .client_lifetime => {
                slot.disabled = true;
                slot.disabled_until = null;
                slot.reason = code;
                self.last_disable_code = code;
            },
            .until_utc_midnight => {
                slot.disabled = true;
                slot.disabled_until = (@divFloor(selected.at, std.time.ms_per_day) + 1) * std.time.ms_per_day;
                slot.reason = code;
                self.last_disable_code = code;
            },
        }
    }
    /// Code 5: the key's group is limited until its window frees (P3.3).
    fn markRateLimited(self: *Client, selected: Reservation) !void {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        const at = self.now();
        const span: i64 = self.config.rate_window_ms;
        const group = &self.groups[self.slots[selected.key].group];
        group.window.prune(at, span);
        const until = if (group.window.oldest()) |oldest| oldest + span else at + span;
        group.rate_limited_until = @max(group.rate_limited_until, @max(until, at + 1));
    }
    /// Code 8: the route (egress IP) is blocked; true when another route can be used (P3.4).
    fn blockRoute(self: *Client, selected: Reservation, options: Options) !bool {
        try self.mutex.lock(self.io);
        defer self.mutex.unlock(self.io);
        const at = self.now();
        self.route_slots[selected.route].blocked_until = at + self.config.ip_block_ms;
        if (options.route != null) return false;
        for (self.route_slots) |slot| if (slot.blocked_until <= at) return true;
        return false;
    }

    /// Executes one logical request with key failover, sliding-window rate limits, and
    /// retries classified by Torn error code and HTTP status (P2-P4). Returns the owned
    /// HTTP response, including terminal error envelopes; `no_usable_keys` is set when
    /// every key was disabled while serving it. Errors: transport failures after
    /// retries, Timeout/Canceled, NoUsableKeys (no key enabled before any send),
    /// AccessLevelInsufficient (check_access refused every key).
    pub fn execute(self: *Client, url: []const u8, options: Options) !transport.Response {
        const max_attempts = options.attempts orelse self.config.max_attempts;
        if (max_attempts == 0 or (options.timeout_ms orelse self.config.attempt_timeout_ms) == 0) return error.InvalidConfiguration;
        if (self.cache) |c| if (options.cache_ttl_ms != null) {
            if (c.get_fn(c.context, self.allocator, url, self.now())) |body| return .{ .allocator = self.allocator, .status = 200, .body = body, .from_cache = true };
        };
        const excluded = try self.allocator.alloc(bool, self.keys.len);
        defer self.allocator.free(excluded);
        @memset(excluded, false);
        const rate_limited = try self.allocator.alloc(bool, self.keys.len);
        defer self.allocator.free(rate_limited);
        @memset(rate_limited, false);
        var sends: u32 = 0;
        // Every HTTP send; `sends` excludes key failovers, which do not consume attempts.
        var total: u32 = 0;
        var retries: u32 = 0;
        var last: ?transport.Response = null;
        defer if (last) |*response| response.deinit();
        while (true) {
            const selected = self.reserve(options, excluded) catch |err| switch (err) {
                error.NoUsableKeys, error.KeysExhausted => {
                    if (last) |response| {
                        last = null;
                        var final = response;
                        final.no_usable_keys = err == error.NoUsableKeys;
                        return self.finish(final, null, total);
                    }
                    return error.NoUsableKeys;
                },
                else => return err,
            };
            const key = self.keys[selected.key];
            var event: Event = .{ .operation = options.operation, .url = url, .attempt = sends + 1, .key = KeyHint.of(key), .route = self.routes[selected.route].name };
            self.hooks.emit("on_request", &event);
            const started = self.now();
            // The in-flight permit is held only for the send itself, never while waiting.
            total += 1;
            const result = blk: {
                defer self.permits.post(self.io);
                var timeout = options.timeout_ms orelse self.config.attempt_timeout_ms;
                if (options.deadline_ms) |deadline| {
                    const remaining = deadline - self.now();
                    if (remaining <= 0) return error.Timeout;
                    timeout = @intCast(@min(timeout, @as(u64, @intCast(remaining))));
                }
                break :blk self.send(.{ .url = url, .api_key = key, .user_agent = self.config.user_agent, .max_body_bytes = self.config.max_body_bytes, .proxy_url = self.routes[selected.route].proxy_url }, timeout);
            };
            var response = result catch |err| {
                sends += 1;
                event.err = err;
                event.duration_ms = self.now() - started;
                const fatal = err == error.Canceled or err == error.OutOfMemory or err == error.ResponseTooLarge or err == error.SecureProxyUnsupported or err == error.InvalidHeader;
                if (fatal or !errors.retry.network_errors_retry or sends >= max_attempts) {
                    self.hooks.emit("on_error", &event);
                    return err;
                }
                retries += 1;
                event.delay_ms = self.backoffDelay(retries);
                self.hooks.emit("on_retry", &event);
                try self.wait(options, event.delay_ms);
                continue;
            };
            sends += 1;
            if (response.body.len > self.config.max_body_bytes) {
                response.deinit();
                return error.ResponseTooLarge;
            }
            const code = apiCode(response.body);
            response.api_code = code;
            response.key_index = selected.key;
            response.key_hint = KeyHint.of(key);
            event.status = response.status;
            event.api_code = code;
            event.duration_ms = self.now() - started;
            self.hooks.emit("on_response", &event);
            if (last) |*previous| previous.deinit();
            last = null;
            const action: errors.Action = if (code) |c| errors.action(errors.fromInt(c)) else if (errors.isHttpRetryStatus(response.status)) .retry_backoff else .fail;
            const failed = code != null or response.status < 200 or response.status >= 300;
            if (!failed) {
                if (self.cache) |c| if (options.cache_ttl_ms) |ttl| if (ttl > 0) c.put_fn(c.context, url, response.body, self.now() + ttl);
                return self.finish(response, selected, total);
            }
            switch (action) {
                .rotate_key => {
                    // Failover (P2.4): retry immediately with the next healthy key.
                    self.markKey(selected, code.?, errors.info(errors.fromInt(code.?)).?, excluded) catch |err| {
                        response.deinit();
                        return err;
                    };
                    sends -= 1;
                    last = response;
                    self.hooks.emit("on_retry", &event);
                    continue;
                },
                .wait_rate_window => {
                    self.markRateLimited(selected) catch |err| {
                        response.deinit();
                        return err;
                    };
                    // P2.4a: moving to another key does not consume an attempt; the
                    // same key hitting code 5 again in this request does.
                    if (!rate_limited[selected.key]) {
                        rate_limited[selected.key] = true;
                        sends -= 1;
                    } else if (sends >= max_attempts) return self.finishError(response, selected, total, &event);
                    last = response;
                    self.hooks.emit("on_retry", &event);
                    continue;
                },
                .rotate_route => {
                    const other = self.blockRoute(selected, options) catch |err| {
                        response.deinit();
                        return err;
                    };
                    // Never retry on the same IP (P3.4).
                    if (!other or sends >= max_attempts) return self.finishError(response, selected, total, &event);
                    response.deinit();
                    self.hooks.emit("on_retry", &event);
                    continue;
                },
                .retry_backoff => {
                    if (sends >= max_attempts) return self.finishError(response, selected, total, &event);
                    retries += 1;
                    event.delay_ms = self.retryDelay(retries, response.retry_after_ms);
                    response.deinit();
                    self.hooks.emit("on_retry", &event);
                    try self.wait(options, event.delay_ms);
                    continue;
                },
                .fail, .reroute_version => return self.finishError(response, selected, total, &event),
            }
        }
    }
    fn finishError(self: *Client, response: transport.Response, selected: Reservation, sends: u32, event: *const Event) !transport.Response {
        self.hooks.emit("on_error", event);
        return self.finish(response, selected, sends);
    }
    fn finish(self: *Client, response: transport.Response, selected: ?Reservation, sends: u32) !transport.Response {
        var owned = response;
        errdefer owned.deinit();
        owned.sends = sends;
        if (selected) |s| {
            if (owned.route_name_owned) owned.allocator.free(owned.route_name);
            owned.route_name_owned = false;
            owned.route_name = try owned.allocator.dupe(u8, self.routes[s.route].name);
            owned.route_name_owned = true;
        } else if (owned.key_index) |index| {
            owned.key_hint = KeyHint.of(self.keys[index]);
        }
        return owned;
    }

    /// Learns access level and owner of every key from `key/info` (P3.2, P6.2): keys
    /// of one owner share a rate budget. Runs once per client when called repeatedly.
    pub fn detectKeys(self: *Client, options: Options) !void {
        if (self.detection.cmpxchgStrong(0, 1, .acq_rel, .acquire) != null) {
            while (self.detection.load(.acquire) == 1) try self.wait(options, 10);
            return;
        }
        errdefer self.detection.store(0, .release);
        const owners = try self.allocator.alloc(?i64, self.keys.len);
        defer self.allocator.free(owners);
        @memset(owners, null);
        const url = try std.fmt.allocPrint(self.allocator, "{s}/key/info", .{std.mem.trimEnd(u8, self.config.base_url_v2, "/")});
        defer self.allocator.free(url);
        for (0..self.keys.len) |index| {
            var pinned = options;
            pinned.key = index;
            pinned.operation = "getKeyInfo";
            var response = self.execute(url, pinned) catch |err| switch (err) {
                error.NoUsableKeys, error.AccessLevelInsufficient => continue,
                else => return err,
            };
            defer response.deinit();
            if (response.api_code != null or response.status != 200) continue;
            const Info = struct { info: struct { access: struct { type: []const u8 }, user: struct { id: i64 } } };
            const parsed = std.json.parseFromSlice(Info, self.allocator, response.body, .{ .ignore_unknown_fields = true }) catch continue;
            defer parsed.deinit();
            try self.setKeyAccess(index, accessFromType(parsed.value.info.access.type));
            owners[index] = parsed.value.info.user.id;
            for (owners[0..index], 0..) |owner, prior| if (owner != null and owner.? == parsed.value.info.user.id) {
                try self.joinKeyGroup(index, prior);
                break;
            };
        }
        self.detection.store(2, .release);
    }
};

/// Maps key/info `access.type` ("Public Only", "Limited Access", ...) to a level.
pub fn accessFromType(text: []const u8) ?AccessLevel {
    const pairs = .{ .{ "Public Only", AccessLevel.public }, .{ "Minimal Access", AccessLevel.minimal }, .{ "Limited Access", AccessLevel.limited }, .{ "Full Access", AccessLevel.full }, .{ "Custom", AccessLevel.custom } };
    inline for (pairs) |pair| if (std.ascii.eqlIgnoreCase(text, pair[0])) return pair[1];
    return null;
}

/// Torn error envelope code (`{"error":{"code":N,...}}`) without parsing large bodies.
pub fn apiCode(body: []const u8) ?u32 {
    const start = std.mem.trimStart(u8, body, " \t\r\n");
    if (start.len == 0 or start[0] != '{') return null;
    const after = std.mem.trimStart(u8, start[1..], " \t\r\n");
    if (!std.mem.startsWith(u8, after, "\"error\"")) return null;
    if (body.len > 64 * 1024) return null;
    var buffer: [4096]u8 = undefined;
    var fixed = std.heap.FixedBufferAllocator.init(&buffer);
    const Envelope = struct { @"error": ?struct { code: u32 } = null };
    const parsed = std.json.parseFromSliceLeaky(Envelope, fixed.allocator(), body, .{ .ignore_unknown_fields = true }) catch return null;
    return if (parsed.@"error") |failure| failure.code else null;
}

/// True when a response would be retried under the default policy (P4.1).
pub fn shouldRetry(status: u16, body: []const u8) bool {
    if (apiCode(body)) |code| return switch (errors.action(errors.fromInt(code))) {
        .retry_backoff, .wait_rate_window, .rotate_key => true,
        else => false,
    };
    return errors.isHttpRetryStatus(status);
}

/// Deterministic test harness: virtual clock, scripted responses, recorded sends.
const Scripted = struct {
    now: i64 = 0,
    bodies: []const []const u8 = &.{},
    statuses: []const u16 = &.{},
    sends: usize = 0,
    keys: [16][]const u8 = undefined,
    waits: [16]u64 = undefined,
    wait_count: usize = 0,
    client: ?*Client = null,
    fn nowFn(ctx: ?*anyopaque, _: std.Io) i64 {
        return (@as(*@This(), @ptrCast(@alignCast(ctx.?)))).now;
    }
    fn waitFn(ctx: ?*anyopaque, _: std.Io, ms: u64) !void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        if (self.client) |c| try std.testing.expectEqual(c.config.max_in_flight, @as(u32, @intCast(c.permits.permits)));
        self.waits[self.wait_count] = ms;
        self.wait_count += 1;
        self.now += @intCast(ms);
    }
    fn sendFn(ctx: ?*anyopaque, allocator: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        defer self.sends += 1;
        self.keys[self.sends] = request.api_key;
        const status: u16 = if (self.sends < self.statuses.len) self.statuses[self.sends] else 200;
        return .{ .allocator = allocator, .status = status, .body = try allocator.dupe(u8, self.bodies[self.sends]) };
    }
    fn attach(self: *@This(), client: *Client) void {
        self.client = client;
        client.scheduler = .{ .context = self, .now_fn = nowFn, .wait_fn = waitFn };
    }
};

test "Torn code 5 waits for the sliding window of a single key (P3.1, P3.3)" {
    var state: Scripted = .{ .now = 1000, .bodies = &.{ "{\"error\":{\"code\":5,\"error\":\"Too many requests\"}}", "{}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"}, .jitter = .none }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    try client.noteSend(0, 0);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("{}", response.body);
    try std.testing.expectEqual(@as(usize, 2), state.sends);
    try std.testing.expectEqual(@as(i64, 60_000), state.now);
    try std.testing.expectEqual(@as(u32, 2), response.sends);
}

test "Torn code 5 rotates to a key with budget without waiting (P3.3)" {
    var state: Scripted = .{ .bodies = &.{ "{\"error\":{\"code\":5,\"error\":\"Too many requests\"}}", "{}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b" }, .jitter = .none }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqual(@as(usize, 0), state.wait_count);
    try std.testing.expectEqualStrings("b", state.keys[1]);
    const states = try client.keyStates(std.testing.allocator);
    defer std.testing.allocator.free(states);
    try std.testing.expectEqual(KeyStatus.rate_limited, states[0].status);
    try std.testing.expectEqual(KeyStatus.healthy, states[1].status);
}

test "Torn code 5 cooldown respects operation deadline and cancellation without another attempt" {
    const State = struct {
        now: i64 = 100,
        cancel: bool,
        calls: usize = 0,
        waits: usize = 0,
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
        client.scheduler = .{ .context = &state, .now_fn = State.nowFn, .wait_fn = State.waitFn };
        try std.testing.expectError(if (cancel) error.Canceled else error.Timeout, client.execute("http://mock", .{ .deadline_ms = if (cancel) null else 1000 }));
        try std.testing.expectEqual(@as(usize, 1), state.calls);
        try std.testing.expectEqual(@as(usize, 1), state.waits);
        try std.testing.expectEqual(@as(usize, 1), client.permits.permits);
    }
}

test "retry policy is classified by error code and status, never message text (P4.1)" {
    try std.testing.expect(shouldRetry(503, ""));
    try std.testing.expect(shouldRetry(200, "{\"error\":{\"code\":5}}"));
    try std.testing.expect(shouldRetry(200, "{\"error\":{\"code\":17,\"error\":\"x\"}}"));
    try std.testing.expect(!shouldRetry(400, "{\"error\":{\"code\":4}}"));
    try std.testing.expect(!shouldRetry(200, "{\"error\":{\"code\":6,\"error\":\"Too many requests backend error please try again\"}}"));
    try std.testing.expect(!shouldRetry(408, ""));
    try std.testing.expectEqual(@as(?u32, 2), apiCode(" {\"error\":{\"code\":2,\"error\":\"Incorrect key\"}}"));
    try std.testing.expectEqual(@as(?u32, null), apiCode("{\"profile\":{\"error\":{\"code\":2}}}"));
}

test "backoff is exponential, capped, and fully jittered (P4.2)" {
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"}, .jitter = .none, .max_backoff_ms = 3000 }, .{ .send_fn = Scripted.sendFn });
    defer client.deinit();
    try std.testing.expectEqual(@as(u64, 500), client.backoffDelay(1));
    try std.testing.expectEqual(@as(u64, 1000), client.backoffDelay(2));
    try std.testing.expectEqual(@as(u64, 2000), client.backoffDelay(3));
    try std.testing.expectEqual(@as(u64, 3000), client.backoffDelay(4));
    try std.testing.expectEqual(@as(u64, 3000), client.backoffDelay(60));
    try std.testing.expectEqual(@as(u64, 120_000), client.retryDelay(1, 999_999));
    client.config.retry_after_cap_ms = 120_000;
    try std.testing.expectEqual(@as(u64, 7000), client.retryDelay(1, 7000));
    client.config.jitter = .full;
    for (0..32) |_| try std.testing.expect(client.backoffDelay(3) <= 2000);
}

test "failover disables bad keys and reports when none remain (P2.3, P2.4)" {
    var state: Scripted = .{ .bodies = &.{ "{\"error\":{\"code\":2,\"error\":\"x\"}}", "{\"error\":{\"code\":18,\"error\":\"x\"}}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b" }, .max_attempts = 1 }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expect(response.no_usable_keys);
    try std.testing.expectEqual(@as(?u32, 18), response.api_code);
    try std.testing.expectEqual(@as(u32, 2), response.sends);
    try std.testing.expectError(error.NoUsableKeys, client.execute("http://mock", .{}));
    try std.testing.expectEqual(@as(?u32, 18), client.last_disable_code);
}

test "code 14 disables a key until the next UTC midnight and code 16 rotates without disabling" {
    var state: Scripted = .{ .now = std.time.ms_per_day + 5, .bodies = &.{ "{\"error\":{\"code\":14}}", "{\"error\":{\"code\":16}}", "{}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b", "c" } }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("c", state.keys[2]);
    const states = try client.keyStates(std.testing.allocator);
    defer std.testing.allocator.free(states);
    try std.testing.expectEqual(KeyStatus.disabled, states[0].status);
    try std.testing.expectEqual(@as(?i64, 2 * std.time.ms_per_day), states[0].until_ms);
    try std.testing.expectEqual(KeyStatus.healthy, states[1].status);
    state.now = 2 * std.time.ms_per_day;
    const later = try client.keyStates(std.testing.allocator);
    defer std.testing.allocator.free(later);
    try std.testing.expectEqual(KeyStatus.healthy, later[0].status);
}

test "IP block marks the route and rotates only to another route (P3.4)" {
    var state: Scripted = .{ .bodies = &.{ "{\"error\":{\"code\":8}}", "{}", "{\"error\":{\"code\":8}}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"}, .routes = &.{ .{ .name = "first" }, .{ .name = "second" } } }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("second", response.route_name);
    var pinned = try client.execute("http://mock", .{ .route = 1 });
    defer pinned.deinit();
    try std.testing.expectEqual(@as(?u32, 8), pinned.api_code);
    try std.testing.expectEqual(@as(usize, 3), state.sends);
}

test "key groups share one sliding budget (P3.2)" {
    var state: Scripted = .{ .now = 45_000, .bodies = &.{"{}"} };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b" }, .per_key_per_minute = 2, .key_groups = &.{&.{ "a", "b" }} }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    try client.noteSend(0, 10_000);
    try client.noteSend(1, 30_000);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqual(@as(i64, 70_000), state.now);
    try std.testing.expectEqual(client.slots[0].group, client.slots[1].group);
}

test "check_access skips keys with a known insufficient level (P6.2)" {
    var state: Scripted = .{ .bodies = &.{"{}"} };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b" }, .key_access = &.{ .{ .key = "a", .level = .public }, .{ .key = "b", .level = .full } } }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{ .min_access = .limited });
    defer response.deinit();
    try std.testing.expectEqualStrings("b", state.keys[0]);
    try client.setKeyAccess(1, .minimal);
    try std.testing.expectError(error.AccessLevelInsufficient, client.execute("http://mock", .{ .min_access = .limited }));
    try std.testing.expectEqual(@as(?AccessLevel, .limited), accessFromType("Limited Access"));
}

test "hooks receive redacted lifecycle events and the cache never stores errors (P8.3, P8.4)" {
    const Recorder = struct {
        requests: usize = 0,
        responses: usize = 0,
        retries: usize = 0,
        errors_seen: usize = 0,
        leaked: bool = false,
        fn check(self: *@This(), event: *const Event) void {
            if (std.mem.indexOf(u8, event.url, "SECRETKEY1234567") != null) self.leaked = true;
            if (!std.mem.eql(u8, event.key.text(), "***4567")) self.leaked = true;
        }
        fn onRequest(ctx: ?*anyopaque, event: *const Event) void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.requests += 1;
            self.check(event);
        }
        fn onResponse(ctx: ?*anyopaque, event: *const Event) void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.responses += 1;
            self.check(event);
        }
        fn onRetry(ctx: ?*anyopaque, _: *const Event) void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.retries += 1;
        }
        fn onError(ctx: ?*anyopaque, _: *const Event) void {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            self.errors_seen += 1;
        }
    };
    var state: Scripted = .{ .bodies = &.{ "{\"error\":{\"code\":17}}", "{\"ok\":1}", "{\"error\":{\"code\":6}}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"SECRETKEY1234567"}, .jitter = .none }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var recorder: Recorder = .{};
    client.hooks = .{ .context = &recorder, .on_request = Recorder.onRequest, .on_response = Recorder.onResponse, .on_retry = Recorder.onRetry, .on_error = Recorder.onError };
    var memory = MemoryCache.init(std.testing.allocator, std.testing.io);
    defer memory.deinit();
    client.cache = memory.cache();
    var first = try client.execute("http://mock/a", .{ .cache_ttl_ms = 1000 });
    first.deinit();
    var cached = try client.execute("http://mock/a", .{ .cache_ttl_ms = 1000 });
    defer cached.deinit();
    try std.testing.expect(cached.from_cache);
    try std.testing.expectEqualStrings("{\"ok\":1}", cached.body);
    var failed = try client.execute("http://mock/b", .{ .cache_ttl_ms = 1000 });
    failed.deinit();
    try std.testing.expectEqual(@as(usize, 3), state.sends);
    try std.testing.expect(!recorder.leaked);
    try std.testing.expectEqual(@as(usize, 3), recorder.requests);
    try std.testing.expectEqual(@as(usize, 1), recorder.retries);
    try std.testing.expectEqual(@as(usize, 1), recorder.errors_seen);
    state.now += 1000;
    try std.testing.expect(MemoryCache.get(&memory, std.testing.allocator, "http://mock/a", state.now) == null);
}

test "credentials are trimmed and deduplicated with owned lifetime" {
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ " a ", "a", "b" } }, .{});
    defer client.deinit();
    try std.testing.expectEqual(@as(usize, 2), client.keys.len);
    try std.testing.expectEqualStrings("a", client.keys[0]);
    try std.testing.expect(client.pool != null);
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
                .key_groups = &.{&.{ "one", "two" }},
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

test "credential bearing types redact supported formatting and JSON serialization (P2.2)" {
    const secret = "DO_NOT_DISCLOSE_TEST_SECRET";
    const config: Config = .{ .keys = &.{secret} };
    const formatted = try std.fmt.allocPrint(std.testing.allocator, "{f}", .{config});
    defer std.testing.allocator.free(formatted);
    try std.testing.expect(std.mem.indexOf(u8, formatted, secret) == null);
    const json = try std.json.Stringify.valueAlloc(std.testing.allocator, config, .{});
    defer std.testing.allocator.free(json);
    try std.testing.expect(std.mem.indexOf(u8, json, secret) == null);
    var client = try Client.init(std.testing.allocator, std.testing.io, config, .{ .send_fn = Scripted.sendFn });
    defer client.deinit();
    const states = try client.keyStates(std.testing.allocator);
    defer std.testing.allocator.free(states);
    inline for (.{ "{f}", "{any}" }) |pattern| {
        const text = try std.fmt.allocPrint(std.testing.allocator, pattern, .{states[0]});
        defer std.testing.allocator.free(text);
        try std.testing.expect(std.mem.indexOf(u8, text, secret) == null);
        const engine_text = try std.fmt.allocPrint(std.testing.allocator, "{f}", .{client});
        defer std.testing.allocator.free(engine_text);
        try std.testing.expect(std.mem.indexOf(u8, engine_text, secret) == null);
    }
    const state_json = try std.json.Stringify.valueAlloc(std.testing.allocator, states[0], .{});
    defer std.testing.allocator.free(state_json);
    try std.testing.expect(std.mem.indexOf(u8, state_json, secret) == null);
    const request_text = try std.fmt.allocPrint(std.testing.allocator, "{f}", .{transport.Request{ .url = "u", .api_key = secret }});
    defer std.testing.allocator.free(request_text);
    try std.testing.expect(std.mem.indexOf(u8, request_text, secret) == null);
}

test "sliding-window quotas rotate unique credentials and release permit while waiting" {
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
            // A sliding window frees 60 s after the oldest send, not at the minute boundary.
            try std.testing.expectEqual(@as(u64, 60_000), ms);
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

test "route-specific budgets spill over and inherit defaults over a sliding window" {
    var state: Scripted = .{ .now = 59_900, .bodies = &.{ "{}", "{}", "{}", "{}", "{}", "{}", "{}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{
        .keys = &.{"a"},
        .max_in_flight = 1,
        .per_route_per_minute = 2,
        .routes = &.{ .{ .name = "small", .per_minute = 1 }, .{ .name = "inherited" }, .{ .name = "large", .per_minute = 3 } },
    }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    for ([_][]const u8{ "small", "inherited", "inherited", "large", "large", "large" }) |expected| {
        var response = try client.execute("http://mock", .{});
        defer response.deinit();
        try std.testing.expectEqualStrings(expected, response.route_name);
    }
    try std.testing.expectEqual(@as(usize, 0), state.wait_count);
    var pinned = try client.execute("http://mock", .{ .route = 0 });
    defer pinned.deinit();
    try std.testing.expectEqualStrings("small", pinned.route_name);
    try std.testing.expectEqual(@as(usize, 1), state.wait_count);
    try std.testing.expectEqual(@as(u64, 60_000), state.waits[0]);
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

test "retry honors Retry-After and backoff never owns a permit" {
    var state: Scripted = .{ .bodies = &.{ "{}", "{}" }, .statuses = &.{ 429, 200 } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"a"} }, .{ .context = &state, .send_fn = struct {
        fn send(ctx: ?*anyopaque, allocator: std.mem.Allocator, io: std.Io, request: transport.Request) !transport.Response {
            var response = try Scripted.sendFn(ctx, allocator, io, request);
            response.retry_after_ms = 700;
            return response;
        }
    }.send });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqual(@as(usize, 2), state.sends);
    try std.testing.expectEqual(@as(usize, 1), state.wait_count);
    try std.testing.expectEqual(@as(u64, 700), state.waits[0]);
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

test "pooled native HTTP reuses one client and keep-alive connection across sends" {
    const Server = struct {
        requests: usize = 0,
        fn serve(self: *@This(), listener: *std.Io.net.Server, io: std.Io) !void {
            const stream = try listener.accept(io);
            defer stream.close(io);
            var read_buffer: [8192]u8 = undefined;
            var write_buffer: [1024]u8 = undefined;
            var reader = stream.reader(io, &read_buffer);
            var writer = stream.writer(io, &write_buffer);
            for (0..2) |_| {
                while (try reader.interface.takeDelimiter('\n')) |line| if (std.mem.eql(u8, line, "\r")) break;
                self.requests += 1;
                try writer.interface.writeAll("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}");
                try writer.interface.flush();
            }
        }
    };
    const io = std.testing.io;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
    var listener = try address.listen(io, .{});
    defer listener.deinit(io);
    var state: Server = .{};
    var server = try io.concurrent(Server.serve, .{ &state, &listener, io });
    defer server.cancel(io) catch {};
    var client = try Client.init(std.testing.allocator, io, .{ .keys = &.{"synthetic-key"}, .max_attempts = 1 }, .{});
    defer client.deinit();
    const url = try std.fmt.allocPrint(std.testing.allocator, "http://127.0.0.1:{d}/", .{listener.socket.address.getPort()});
    defer std.testing.allocator.free(url);
    for (0..2) |_| {
        var response = try client.execute(url, .{});
        defer response.deinit();
        try std.testing.expectEqualStrings("{}", response.body);
    }
    // Both requests were served on the single accepted connection.
    try server.await(io);
    try std.testing.expectEqual(@as(usize, 2), state.requests);
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
            try std.testing.expectEqual(@as(u64, 500), ms);
        }
    };
    const io = std.testing.io;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
    var listener = try address.listen(io, .{});
    defer listener.deinit(io);
    var state: Server = .{};
    var server = try io.concurrent(Server.serve, .{ &state, &listener, io });
    defer server.cancel(io) catch {};
    var client = try Client.init(std.testing.allocator, io, .{ .keys = &.{"synthetic-key"}, .max_attempts = 2, .jitter = .none }, .{});
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

test "key rotations on codes 2 and 5 do not consume attempts (P2.4a)" {
    var state: Scripted = .{ .bodies = &.{ "{\"error\":{\"code\":2}}", "{\"error\":{\"code\":5}}", "{}" } };
    var client = try Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{ "a", "b", "c" }, .max_attempts = 1 }, .{ .context = &state, .send_fn = Scripted.sendFn });
    defer client.deinit();
    state.attach(&client);
    var response = try client.execute("http://mock", .{});
    defer response.deinit();
    try std.testing.expectEqualStrings("{}", response.body);
    try std.testing.expectEqualStrings("c", state.keys[2]);
    try std.testing.expectEqual(@as(u32, 3), response.sends);
    try std.testing.expectEqual(@as(usize, 0), state.wait_count);
}
