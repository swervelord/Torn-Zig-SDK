const std = @import("std");
const model = @import("model.zig");
const planner = @import("planner.zig");
const runtime = @import("runtime.zig");
const transport = @import("transport.zig");
const errors = @import("errors.zig");
const contracts = @import("contracts.zig");
const current = @import("generated/current.zig");
const operations = @import("generated/operations.zig");
const schema = @import("schema.zig");

pub const AccessLevel = planner.AccessLevel;
pub const KeyHint = transport.KeyHint;
pub const Report = struct {
    operation: []const u8,
    route: []const u8,
    path: []const u8,
    selections: []const []const u8,
    api_version: u8,
    fallback: bool,
    /// Redacted key that served this contribution.
    key: KeyHint = .{},
    /// HTTP sends made for this contribution, retries and failovers included.
    sends: u32 = 0,
    from_cache: bool = false,
};
/// Failure taxonomy (P5.2). `network` is the shared taxonomy's `transport`, and
/// `planning` failures are client-side `validation` failures (see `kindName`).
pub const Kind = enum { network, timeout, canceled, http, api, decode, planning, validation, no_usable_keys };
pub const Failure = struct {
    kind: Kind,
    cause: ?anyerror = null,
    http_status: ?u16 = null,
    /// Torn error code (also for `no_usable_keys`: the last key error).
    api_code: ?u32 = null,
    /// Server message of the Torn error envelope, owned by the execution arena.
    api_message: []const u8 = "",
    /// Redacted key (P2.2) that received the error.
    key: KeyHint = .{},
    operation: []const u8 = "",
    selection: []const u8 = "",
    /// Access level a `check_access` refusal or an access error requires (P6.2).
    required_access: ?AccessLevel = null,
    /// Raw body of the failing response (P1.4), owned by the execution arena.
    body: ?[]const u8 = null,
    /// Decode location, expected type and value excerpt (P1.4). Paths are owned
    /// inline and excerpts are truncated and redacted.
    diagnostic: model.Diagnostic = .{},

    pub fn code(self: Failure) ?errors.TornErrorCode {
        return if (self.api_code) |value| errors.fromInt(value) else null;
    }
    /// Shared taxonomy name: api|http|transport|decode|validation|no_usable_keys|cancelled|timeout.
    pub fn kindName(self: Failure) []const u8 {
        return switch (self.kind) {
            .network => "transport",
            .timeout => "timeout",
            .canceled => "cancelled",
            .http => "http",
            .api => "api",
            .decode => "decode",
            .planning, .validation => "validation",
            .no_usable_keys => "no_usable_keys",
        };
    }
    /// A later identical request may succeed (P5.3).
    pub fn isRetryable(self: Failure) bool {
        if (self.code()) |c| return errors.isRetryable(c);
        return switch (self.kind) {
            .network, .timeout => true,
            .http => if (self.http_status) |status| errors.isHttpRetryStatus(status) else false,
            else => false,
        };
    }
    pub fn isKeyError(self: Failure) bool {
        return self.kind == .no_usable_keys or (if (self.code()) |c| errors.isKeyError(c) else false);
    }
    pub fn isRateLimit(self: Failure) bool {
        return if (self.code()) |c| errors.isRateLimit(c) else self.http_status == 429;
    }
    pub fn isAccessError(self: Failure) bool {
        return self.required_access != null or (if (self.code()) |c| errors.isAccessError(c) else false);
    }
    pub fn isTransient(self: Failure) bool {
        if (self.code()) |c| return errors.isTransient(c);
        return self.kind == .network or self.kind == .timeout or (self.kind == .http and self.isRetryable());
    }
    /// Redacted one-line summary; never includes a key or response body.
    pub fn format(self: Failure, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.print("{s}", .{self.kindName()});
        if (self.api_code) |value| try writer.print(" code={d} ({s})", .{ value, errors.name(errors.fromInt(value)) });
        if (self.http_status) |status| try writer.print(" status={d}", .{status});
        if (self.api_message.len > 0) try writer.print(" message=\"{s}\"", .{self.api_message});
        if (self.operation.len > 0) try writer.print(" operation={s}", .{self.operation});
        if (self.selection.len > 0) try writer.print(" selection={s}", .{self.selection});
        if (self.required_access) |level| try writer.print(" required_access={s}", .{@tagName(level)});
        if (self.diagnostic.path_len > 0 or self.diagnostic.expected != null) try writer.print(" path={s}", .{self.diagnostic.jsonPath()});
        if (self.diagnostic.expected) |expected| try writer.print(" expected={s}", .{expected});
        if (self.diagnostic.excerpt_len > 0) try writer.print(" value={s}", .{self.diagnostic.excerpt()});
        if (self.cause) |cause| try writer.print(" cause={s}", .{@errorName(cause)});
        try writer.print(" key={f}", .{self.key});
    }
    pub fn jsonStringify(self: Failure, writer: anytype) !void {
        try writer.write(.{ .kind = self.kindName(), .api_code = self.api_code, .http_status = self.http_status, .message = self.api_message, .operation = self.operation, .selection = self.selection, .path = self.diagnostic.jsonPath(), .key = self.key.text() });
    }
};
pub const Options = struct {
    request: runtime.Options = .{},
    split_recovery: bool = true,
    legacy_fallback: bool = false,
    /// Re-plan once on the other API version for Torn codes 22/23 (P4.3).
    reroute_version: bool = true,
    /// Tolerant by default (P1.3); `.strict` also validates against the official
    /// contract and rejects unknown enum values, properties and relaxed fields.
    mode: model.Mode = .tolerant,
    validation: ?Validation = null,
};
pub const Validation = struct {
    context: ?*anyopaque = null,
    validate_fn: *const fn (?*anyopaque, std.mem.Allocator, planner.Call, model.RawValue, *model.Diagnostic) anyerror!void,
};
pub const Csv = struct { selections: []const []const u8, path: []const u8, text: []const u8 };
pub const Execution = struct {
    arena: *std.heap.ArenaAllocator,
    allocator: std.mem.Allocator,
    /// Merged JSON of every successful contribution. Retained even when typed
    /// decoding fails (P1.4).
    raw: model.RawValue,
    reports: []const Report,
    csv: []const Csv = &.{},
    failure: ?Failure = null,
    mode: model.Mode = .tolerant,
    pub fn csvText(self: *const Execution, selection: []const u8) ?[]const u8 {
        for (self.csv) |channel| for (channel.selections) |name| {
            if (std.mem.eql(u8, name, selection)) return channel.text;
        };
        return null;
    }
    /// True when a report includes `selection`.
    pub fn contributed(self: *const Execution, selection: []const u8) bool {
        for (self.reports) |report| for (report.selections) |name| {
            if (std.mem.eql(u8, name, selection)) return true;
        };
        return false;
    }
    /// The projection and any allocated backing slices live until this execution is released.
    pub fn project(self: *Execution, comptime T: type, context: ?*anyopaque, decoder: *const fn (?*anyopaque, std.mem.Allocator, model.RawValue) anyerror!T) !T {
        return decoder(context, self.arena.allocator(), self.raw) catch |err| {
            self.failure = .{ .kind = failureKind(err), .cause = err };
            return err;
        };
    }
    pub fn deinit(self: *Execution) void {
        self.arena.deinit();
        self.allocator.destroy(self.arena);
        self.* = undefined;
    }
    /// Typed decode of the merged raw JSON into any model (P8.2), in this execution's mode.
    pub fn decode(self: *Execution, comptime T: type) !T {
        return self.decodeChecked(T, null);
    }
    pub fn decodeChecked(self: *Execution, comptime T: type, checkpoint: ?model.Checkpoint) !T {
        if (checkpoint) |c| try c.check();
        var d: model.Diagnostic = .{ .checkpoint = checkpoint, .mode = self.mode };
        return decodeInto(T, self.arena.allocator(), self.allocator, self.raw, &d) catch |err| {
            d.checkpoint = null;
            if (self.failure == null) self.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = d };
            return err;
        };
    }
};
/// Decodes `raw` into T; strict mode also validates against the official contract.
fn decodeInto(comptime T: type, arena: std.mem.Allocator, scratch: std.mem.Allocator, raw: model.RawValue, d: *model.Diagnostic) !T {
    const value = try model.convert(T, arena, raw, d);
    if (d.mode == .strict) try validatePublicModel(T, scratch, raw, d);
    return value;
}
/// Per-selection outcome of a batch (P1.4): one selection's decode failure never
/// discards its siblings.
pub fn Outcome(comptime T: type) type {
    return union(enum) {
        ok: T,
        failed: Failure,
        pub fn get(self: @This()) ?T {
            return if (self == .ok) self.ok else null;
        }
    };
}
pub fn BatchType(comptime tokens: anytype) type {
    if (tokens.len == 0) @compileError("A batch requires at least one selection");
    var types: [tokens.len]type = undefined;
    for (tokens, 0..) |Token, i| {
        if (Token.resource != tokens[0].resource) @compileError("Cannot batch selections from different resources");
        types[i] = Token.Response;
    }
    return @Tuple(&types);
}
pub fn BatchOutcomes(comptime tokens: anytype) type {
    var types: [tokens.len]type = undefined;
    for (tokens, 0..) |Token, i| types[i] = Outcome(Token.Response);
    return @Tuple(&types);
}
pub fn BatchResult(comptime tokens: anytype) type {
    return struct {
        execution: Execution,
        /// Every selection decoded and no call failed.
        value: ?BatchType(tokens),
        /// Per-selection results, also when other selections or calls failed.
        results: BatchOutcomes(tokens),
        pub fn deinit(self: *@This()) void {
            self.execution.deinit();
            self.* = undefined;
        }
    };
}

/// Client borrows the runtime at a stable address; it does not own or shut it down.
pub const Client = struct {
    engine: *runtime.Client,
    fn prepare(self: Client, options: Options) !void {
        try self.engine.check(options.request);
        if (self.engine.config.detect_key_owners) try self.engine.detectKeys(options.request);
    }
    pub fn execute(self: Client, input: planner.Input, options: Options) !Execution {
        try self.prepare(options);
        var context = CheckContext{ .engine = self.engine, .options = options.request };
        var checked = input;
        checked.check_context = &context;
        checked.check_fn = CheckContext.check;
        var plan = try planner.build(self.engine.allocator, checked);
        defer plan.deinit();
        try self.engine.check(options.request);
        return self.executePlan(&plan, options);
    }
    pub fn executePlan(self: Client, plan: *const planner.Plan, options: Options) !Execution {
        const a = self.engine.allocator;
        const arena = try a.create(std.heap.ArenaAllocator);
        errdefer a.destroy(arena);
        arena.* = std.heap.ArenaAllocator.init(a);
        errdefer arena.deinit();
        var execution: Execution = .{ .arena = arena, .allocator = a, .raw = .{ .object = .{} }, .reports = &.{}, .mode = options.mode };
        var reports: std.ArrayList(Report) = .empty;
        var csv: std.ArrayList(Csv) = .empty;
        for (plan.calls) |call| {
            self.engine.check(options.request) catch |err| {
                execution.failure = .{ .kind = if (err == error.Canceled) .canceled else .timeout, .cause = err };
                break;
            };
            self.contribute(&execution, &reports, &csv, call, options, false, false) catch |err| {
                execution.failure = .{ .kind = switch (err) {
                    error.Canceled => .canceled,
                    error.Timeout => .timeout,
                    else => .network,
                }, .cause = err, .operation = call.operation };
                break;
            };
            if (execution.failure != null) break;
        }
        execution.reports = reports.items;
        execution.csv = csv.items;
        return execution;
    }
    fn contribute(self: Client, execution: *Execution, reports: *std.ArrayList(Report), csv: *std.ArrayList(Csv), call: planner.Call, options: Options, fallback: bool, rerouted: bool) anyerror!void {
        const a = execution.arena.allocator();
        const base = if (call.version == 1) self.engine.config.base_url_v1 else self.engine.config.base_url_v2;
        const url = try std.fmt.allocPrint(a, "{s}{s}{s}{s}", .{ std.mem.trimEnd(u8, base, "/"), call.path, if (call.query.len > 0) "?" else "", call.query });
        var request = options.request;
        request.api_version = call.version;
        if (request.operation.len == 0) request.operation = call.operation;
        if (self.engine.config.check_access) request.min_access = call.access_level;
        const selection = if (call.selections.len == 1) call.selections[0] else "";
        var response = self.engine.execute(url, request) catch |err| {
            if (err == error.OutOfMemory) return err;
            execution.failure = switch (err) {
                error.Timeout => .{ .kind = .timeout, .cause = err },
                error.Canceled => .{ .kind = .canceled, .cause = err },
                error.NoUsableKeys => .{ .kind = .no_usable_keys, .cause = err, .api_code = self.engine.last_disable_code },
                error.AccessLevelInsufficient => .{ .kind = .validation, .cause = err, .required_access = call.access_level },
                else => .{ .kind = .network, .cause = err },
            };
            execution.failure.?.operation = call.operation;
            execution.failure.?.selection = selection;
            return;
        };
        defer response.deinit();
        const payload = if (call.media == .csv) model.RawValue{ .string = try a.dupe(u8, response.body) } else std.json.parseFromSliceLeaky(model.RawValue, a, response.body, .{ .allocate = .alloc_always, .parse_numbers = false }) catch |err| blk: {
            if (err == error.OutOfMemory) return err;
            if (response.status >= 200 and response.status < 300 and response.api_code == null) {
                execution.failure = .{ .kind = .decode, .cause = err, .http_status = response.status, .operation = call.operation, .selection = selection, .key = response.key_hint, .body = try a.dupe(u8, response.body) };
                return;
            }
            // Error bodies need not be JSON; HTTP recovery still applies.
            break :blk .null;
        };
        const envelope = if (call.media == .csv) std.json.parseFromSliceLeaky(model.RawValue, a, response.body, .{ .parse_numbers = false }) catch |err| blk: {
            if (err == error.OutOfMemory) return err;
            break :blk .null;
        } else payload;
        const api_code: ?u32 = response.api_code;
        var api_message: []const u8 = "";
        if (envelope == .object) if (envelope.object.get("error")) |failure| {
            if (failure == .object) if (failure.object.get("error")) |message| if (message == .string) {
                api_message = message.string;
            };
        };
        if (response.status >= 300 or response.status < 200 or api_code != null) {
            const failed: Failure = .{
                .kind = if (response.no_usable_keys) .no_usable_keys else if (api_code != null) .api else .http,
                .http_status = response.status,
                .api_code = api_code,
                .api_message = api_message,
                .key = response.key_hint,
                .operation = call.operation,
                .selection = selection,
                .required_access = if (api_code == 16) call.access_level else null,
                .body = try a.dupe(u8, response.body),
            };
            if (response.no_usable_keys) {
                execution.failure = failed;
                return;
            }
            // Torn names the version that serves the selection (P4.3); classification
            // is by code only (P4.1).
            if (options.reroute_version and !rerouted and ((api_code == 22 and call.version == 2) or (api_code == 23 and call.version == 1))) {
                const resource = resourceFromPath(call.path) orelse return error.InvalidPlan;
                var plan = planner.build(a, .{ .resource = resource, .selections = call.selections, .target = call.target, .filters = call.filters, .mode = if (api_code == 22) .v1 else .automatic, .allow_unlisted_v1 = true }) catch |err| {
                    var planning = failed;
                    planning.kind = .planning;
                    planning.cause = err;
                    execution.failure = planning;
                    return;
                };
                defer plan.deinit();
                for (plan.calls) |next| {
                    try self.contribute(execution, reports, csv, next, options, true, true);
                    if (execution.failure != null) break;
                }
                return;
            }
            const unsupported = api_code == 4 or response.status == 400 or response.status == 404 or response.status == 501;
            if (unsupported and options.split_recovery and call.version == 2 and call.selections.len > 1) {
                for (call.selections) |name| {
                    // Reuse all encoded filters and target IDs from the rejected combined call.
                    var split_call = call;
                    split_call.query = try replaceSelections(a, call.query, name);
                    split_call.selections = try a.dupe([]const u8, &.{name});
                    split_call.access_level = planner.selectionAccess(resourceFromPath(call.path) orelse return error.InvalidPlan, name);
                    var no_split = options;
                    no_split.split_recovery = false;
                    try self.contribute(execution, reports, csv, split_call, no_split, fallback, rerouted);
                    if (execution.failure != null) return;
                }
                return;
            }
            if (unsupported and options.legacy_fallback and call.version == 2 and call.fallback_supported) {
                const resource = resourceFromPath(call.path) orelse return error.InvalidPlan;
                for (call.selections) |name| if (!planner.v1Contains(resource, name)) return error.UnsupportedFallback;
                var plan = planner.build(a, .{ .resource = resource, .selections = call.selections, .target = call.target, .filters = call.filters, .mode = .v1 }) catch |err| {
                    var planning = failed;
                    planning.kind = .planning;
                    planning.cause = err;
                    execution.failure = planning;
                    return;
                };
                defer plan.deinit();
                var no_legacy = options;
                no_legacy.legacy_fallback = false;
                for (plan.calls) |legacy| {
                    try self.contribute(execution, reports, csv, legacy, no_legacy, true, rerouted);
                    if (execution.failure != null) break;
                }
                return;
            }
            execution.failure = failed;
            return;
        }
        var validation_context = CheckContext{ .engine = self.engine, .options = options.request };
        var diagnostic: model.Diagnostic = .{ .checkpoint = .{ .context = &validation_context, .check_fn = CheckContext.checkTyped }, .mode = options.mode };
        if (options.validation) |validation| validation.validate_fn(validation.context, a, call, payload, &diagnostic) catch |err| {
            if (err == error.OutOfMemory) return err;
            diagnostic.checkpoint = null;
            // The payload is still merged below: a failed check never loses data (P1.4).
            execution.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = diagnostic, .operation = call.operation, .selection = selection, .key = response.key_hint };
        };
        const names = try a.alloc([]const u8, call.selections.len);
        for (call.selections, names) |s, *out| out.* = try a.dupe(u8, s);
        const report: Report = .{ .operation = try a.dupe(u8, call.operation), .route = try a.dupe(u8, response.route_name), .path = try a.dupe(u8, call.path), .selections = names, .api_version = call.version, .fallback = fallback, .key = response.key_hint, .sends = response.sends, .from_cache = response.from_cache };
        try reports.ensureUnusedCapacity(a, 1);
        var context = CheckContext{ .engine = self.engine, .options = options.request };
        const checkpoint: model.Checkpoint = .{ .context = &context, .check_fn = CheckContext.checkTyped };
        if (call.media == .csv) {
            try csv.ensureUnusedCapacity(a, 1);
            try checkpoint.check();
            csv.appendAssumeCapacity(.{ .selections = names, .path = report.path, .text = payload.string });
            if (reports.items.len == 0) execution.raw = payload;
        } else {
            var merged = try cloneObjects(a, execution.raw, checkpoint);
            try mergeChecked(a, &merged, payload, checkpoint);
            execution.raw = merged;
        }
        reports.appendAssumeCapacity(report);
    }
    fn decodeToken(self: Client, comptime Token: type, execution: *Execution, options: Options) Outcome(Token.Response) {
        const failure_base: Failure = .{ .kind = .decode, .selection = Token.name, .operation = operationOf(execution, Token.name) };
        if (!execution.contributed(Token.name)) {
            var missing = execution.failure orelse failure_base;
            if (execution.failure == null) missing.cause = error.SelectionNotReturned;
            missing.selection = Token.name;
            return .{ .failed = missing };
        }
        if (comptime Token.Response == []const u8) {
            if (execution.csvText(Token.name)) |text| return .{ .ok = text };
            var missing = failure_base;
            missing.cause = error.MissingCsvChannel;
            return .{ .failed = missing };
        }
        var context = CheckContext{ .engine = self.engine, .options = options.request };
        var d: model.Diagnostic = .{ .checkpoint = .{ .context = &context, .check_fn = CheckContext.checkTyped }, .mode = options.mode };
        const a = execution.arena.allocator();
        const source = if (options.mode == .strict) projectFields(Token.Response, a, execution.raw) catch |err| {
            var failed = failure_base;
            failed.cause = err;
            return .{ .failed = failed };
        } else execution.raw;
        const value = decodeInto(Token.Response, a, self.engine.allocator, source, &d) catch |err| {
            d.checkpoint = null;
            for (self.engine.keys) |key| d.redact(key);
            var failed = failure_base;
            failed.kind = failureKind(err);
            failed.cause = err;
            failed.diagnostic = d;
            return .{ .failed = failed };
        };
        return .{ .ok = value };
    }
    pub fn batch(self: Client, comptime tokens: anytype, target: []const planner.Argument, filters: []const planner.Argument, options: Options) !BatchResult(tokens) {
        var names: [tokens.len][]const u8 = undefined;
        var force_direct = false;
        inline for (tokens, 0..) |Token, i| {
            try self.engine.check(options.request);
            names[i] = Token.name;
            if (comptime @hasDecl(Token, "force_direct")) force_direct = force_direct or Token.force_direct;
            if (comptime @hasDecl(Token, "required_target")) {
                var found = false;
                for (target) |arg| if (std.mem.eql(u8, arg.name, Token.required_target) or std.mem.eql(u8, arg.name, "id")) {
                    found = true;
                };
                if (!found) return error.MissingAliasTarget;
            }
        }
        var execution = try self.execute(.{ .resource = tokens[0].resource, .selections = &names, .target = target, .filters = filters, .force_direct = force_direct }, options);
        errdefer execution.deinit();
        var results: BatchOutcomes(tokens) = undefined;
        var values: BatchType(tokens) = undefined;
        var complete = true;
        inline for (tokens, 0..) |Token, i| {
            self.engine.check(options.request) catch |err| {
                if (execution.failure == null) execution.failure = .{ .kind = if (err == error.Canceled) .canceled else .timeout, .cause = err };
            };
            results[i] = self.decodeToken(Token, &execution, options);
            switch (results[i]) {
                .ok => |v| values[i] = v,
                .failed => complete = false,
            }
        }
        if (options.mode == .strict and execution.failure == null) strictLeftovers(tokens, &execution);
        if (complete and execution.failure == null) {} else if (execution.failure == null) {
            inline for (0..tokens.len) |i| if (results[i] == .failed and execution.failure == null) {
                execution.failure = results[i].failed;
            };
        }
        return .{ .execution = execution, .value = if (complete and execution.failure == null) values else null, .results = results };
    }
    pub fn select(self: Client, comptime Token: type, target: []const planner.Argument, filters: []const planner.Argument, options: Options) !SelectionResult(Token) {
        const result = try self.batch(.{Token}, target, filters, options);
        return .{ .execution = result.execution, .value = if (result.value) |value| value[0] else null, .result = result.results[0] };
    }
    pub fn raw(self: Client, comptime Token: type, target: []const planner.Argument, filters: []const planner.Argument, options: Options) !Execution {
        if (comptime @hasDecl(Token, "required_target")) {
            var found = false;
            for (target) |arg| if (std.mem.eql(u8, arg.name, Token.required_target) or std.mem.eql(u8, arg.name, "id")) {
                found = true;
            };
            if (!found) return error.MissingAliasTarget;
        }
        return self.execute(.{ .resource = Token.resource, .selections = &.{Token.name}, .target = target, .filters = filters, .force_direct = if (@hasDecl(Token, "force_direct")) Token.force_direct else false }, options);
    }
    /// Raw escape hatch (P8.2): any path and query relative to the v2 base URL (or v1
    /// with `options.request.api_version = 1`), e.g. "/user/travelinventory?comment=x".
    /// The key is always attached by the runtime, never taken from `path_query`.
    pub fn rawPath(self: Client, path_query: []const u8, options: Options) !Execution {
        try self.prepare(options);
        if (path_query.len == 0 or path_query[0] != '/') return error.InvalidPath;
        const split = std.mem.indexOfScalar(u8, path_query, '?') orelse path_query.len;
        var it = std.mem.splitScalar(u8, if (split < path_query.len) path_query[split + 1 ..] else "", '&');
        while (it.next()) |part| {
            const name = part[0 .. std.mem.indexOfScalar(u8, part, '=') orelse part.len];
            if (std.ascii.eqlIgnoreCase(name, "key")) return error.UseClientAuthentication;
        }
        var plan: planner.Plan = .{ .arena = std.heap.ArenaAllocator.init(self.engine.allocator), .calls = &.{} };
        defer plan.deinit();
        const call: planner.Call = .{
            .path = path_query[0..split],
            .query = if (split < path_query.len) path_query[split + 1 ..] else "",
            .selections = &.{},
            .operation = "raw",
            .version = if (options.request.api_version == 1) 1 else 2,
            .media = .json,
            .fallback_supported = false,
        };
        plan.calls = &.{call};
        return self.executePlan(&plan, options);
    }
    /// Typed `key/info` (P6.2).
    pub fn keyInfo(self: Client, options: Options) !ExactResult(operations.getKeyInfo) {
        return self.exact(operations.getKeyInfo, .{}, options);
    }
    /// Learns every key's access level and owner from key/info (P3.2, P6.2).
    pub fn detectKeys(self: Client, options: Options) !void {
        try self.engine.detectKeys(options.request);
    }
    /// Exact operation parameters and response types are compile-time generated.
    pub fn exact(self: Client, comptime Op: type, params: Op.Params, options: Options) !ExactResult(Op) {
        try self.prepare(options);
        var arena = std.heap.ArenaAllocator.init(self.engine.allocator);
        defer arena.deinit();
        const a = arena.allocator();
        var context = CheckContext{ .engine = self.engine, .options = options.request };
        const checkpoint: model.Checkpoint = .{ .context = &context, .check_fn = CheckContext.checkTyped };
        const target = try exactTarget(Op, a, params, checkpoint);
        var plan: planner.Plan = .{ .arena = std.heap.ArenaAllocator.init(a), .calls = &.{.{ .path = target.path, .query = target.query, .selections = &.{}, .operation = Op.operation_id, .version = 2, .media = if (std.mem.eql(u8, Op.media_type, "text/csv")) .csv else .json, .fallback_supported = false, .access_level = Op.access_level }} };
        defer plan.deinit();
        var tuned = options;
        if (tuned.request.cache_ttl_ms == null) if (Op.upstream_cache_ttl_seconds) |ttl| {
            if (self.engine.cache != null) tuned.request.cache_ttl_ms = ttl * 1000;
        };
        var execution = try self.executePlan(&plan, tuned);
        errdefer execution.deinit();
        var value: ?Op.Response = null;
        if (execution.failure == null) {
            if (comptime Op.Response == []const u8) {
                value = if (execution.csv.len > 0) execution.csv[0].text else null;
            } else {
                var d: model.Diagnostic = .{ .checkpoint = checkpoint, .mode = options.mode };
                value = decodeExact(Op, execution.arena.allocator(), self.engine.allocator, execution.raw, &d) catch |err| blk: {
                    d.checkpoint = null;
                    for (self.engine.keys) |key| d.redact(key);
                    execution.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = d, .operation = Op.operation_id };
                    break :blk null;
                };
            }
        }
        return .{ .execution = execution, .value = value };
    }
    /// Pager over `_metadata.links` for a raw path (P7.1).
    pub fn paginate(self: Client, path_query: []const u8, page_options: PageOptions) !Pager {
        return Pager.init(self, path_query, page_options);
    }
    /// Typed pager for a paginated exact operation (P7.1).
    pub fn pages(self: Client, comptime Op: type, params: Op.Params, page_options: PageOptions) !TypedPager(Op) {
        if (comptime !Op.paginated) @compileError(Op.operation_id ++ " has no _metadata.links pagination");
        var arena = std.heap.ArenaAllocator.init(self.engine.allocator);
        defer arena.deinit();
        var context = CheckContext{ .engine = self.engine, .options = page_options.options.request };
        const target = try exactTarget(Op, arena.allocator(), params, .{ .context = &context, .check_fn = CheckContext.checkTyped });
        const start = try std.fmt.allocPrint(arena.allocator(), "{s}{s}{s}", .{ target.path, if (target.query.len > 0) "?" else "", target.query });
        return .{ .pager = try Pager.init(self, start, page_options) };
    }
};

pub const PageOptions = struct {
    /// Stop after this many pages (null: until the last link).
    max_pages: ?usize = null,
    /// Follow `links.next` (default) or `links.prev` backwards.
    direction: enum { next, prev } = .next,
    options: Options = .{},
};
/// Follows `_metadata.links` (P7.1). Each `next()` returns one owned page execution.
/// Links are parsed and validated against the configured v2 host; any `key` in a
/// link is dropped and the runtime re-attaches the key as a header. Rate limits,
/// retries, deadlines and cancellation apply to every page.
pub const Pager = struct {
    client: Client,
    pending: ?[]u8,
    options: PageOptions,
    pages: usize = 0,
    pub fn init(client: Client, path_query: []const u8, options: PageOptions) !Pager {
        return .{ .client = client, .pending = try client.engine.allocator.dupe(u8, path_query), .options = options };
    }
    pub fn deinit(self: *Pager) void {
        if (self.pending) |path| self.client.engine.allocator.free(path);
        self.* = undefined;
    }
    /// The next page, or null after the last one. A rejected link fails the page it
    /// came from with a `validation` failure; that page's data is kept.
    pub fn next(self: *Pager) !?Execution {
        const path = self.pending orelse return null;
        if (self.options.max_pages) |limit| if (self.pages >= limit) return null;
        self.pending = null;
        defer self.client.engine.allocator.free(path);
        var execution = try self.client.rawPath(path, self.options.options);
        errdefer execution.deinit();
        self.pages += 1;
        if (execution.failure != null) return execution;
        const link = pageLink(execution.raw, if (self.options.direction == .next) "next" else "prev") orelse return execution;
        self.pending = relativeLink(self.client.engine.allocator, self.client.engine.config.base_url_v2, link) catch |err| {
            if (err == error.OutOfMemory) return err;
            execution.failure = .{ .kind = .validation, .cause = err, .operation = "paginate" };
            return execution;
        };
        return execution;
    }
};
pub fn TypedPager(comptime Op: type) type {
    return struct {
        pager: Pager,
        pub fn deinit(self: *@This()) void {
            self.pager.deinit();
        }
        pub fn next(self: *@This()) !?ExactResult(Op) {
            var execution = (try self.pager.next()) orelse return null;
            errdefer execution.deinit();
            var value: ?Op.Response = null;
            if (execution.failure == null) {
                var d: model.Diagnostic = .{ .mode = self.pager.options.options.mode };
                value = decodeExact(Op, execution.arena.allocator(), self.pager.client.engine.allocator, execution.raw, &d) catch |err| blk: {
                    execution.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = d, .operation = Op.operation_id };
                    break :blk null;
                };
            }
            return .{ .execution = execution, .value = value };
        }
    };
}
fn pageLink(raw_value: model.RawValue, direction: []const u8) ?[]const u8 {
    if (raw_value != .object) return null;
    const metadata = raw_value.object.get("_metadata") orelse return null;
    if (metadata != .object) return null;
    const links = metadata.object.get("links") orelse return null;
    if (links != .object) return null;
    const link = links.object.get(direction) orelse return null;
    return if (link == .string and link.string.len > 0) link.string else null;
}
/// Validates a `links` URL against the v2 base (scheme, host, port, path prefix) and
/// returns its path and query relative to that base, without any `key` parameter.
pub fn relativeLink(allocator: std.mem.Allocator, base_url: []const u8, link: []const u8) ![]u8 {
    const base = std.Uri.parse(base_url) catch return error.InvalidBaseUrl;
    const uri = std.Uri.parse(link) catch return error.InvalidPageLink;
    var scratch = std.heap.ArenaAllocator.init(allocator);
    defer scratch.deinit();
    const s = scratch.allocator();
    const host = try (uri.host orelse return error.ForeignPageLink).toRawMaybeAlloc(s);
    const base_host = try (base.host orelse return error.InvalidBaseUrl).toRawMaybeAlloc(s);
    if (!std.ascii.eqlIgnoreCase(uri.scheme, base.scheme) or !std.ascii.eqlIgnoreCase(host, base_host) or uri.port != base.port or uri.user != null or uri.password != null) return error.ForeignPageLink;
    const path = try uri.path.toRawMaybeAlloc(s);
    const base_path = std.mem.trimEnd(u8, try base.path.toRawMaybeAlloc(s), "/");
    if (!std.mem.startsWith(u8, path, base_path) or (path.len > base_path.len and path[base_path.len] != '/')) return error.ForeignPageLink;
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(allocator);
    try out.appendSlice(allocator, path[base_path.len..]);
    if (out.items.len == 0) try out.append(allocator, '/');
    if (uri.query) |query| {
        var first = true;
        var it = std.mem.splitScalar(u8, try query.toRawMaybeAlloc(s), '&');
        while (it.next()) |part| {
            if (part.len == 0) continue;
            const name = part[0 .. std.mem.indexOfScalar(u8, part, '=') orelse part.len];
            if (std.ascii.eqlIgnoreCase(name, "key")) continue;
            try out.append(allocator, if (first) '?' else '&');
            try out.appendSlice(allocator, part);
            first = false;
        }
    }
    return out.toOwnedSlice(allocator);
}
fn decodeExact(comptime Op: type, arena: std.mem.Allocator, scratch: std.mem.Allocator, payload: model.RawValue, d: *model.Diagnostic) !Op.Response {
    const value = try model.convert(Op.Response, arena, payload, d);
    if (d.mode == .strict) {
        var temporary = std.heap.ArenaAllocator.init(scratch);
        defer temporary.deinit();
        const allocator = temporary.allocator();
        const doc = try contracts.currentDocument();
        const operation = try std.json.parseFromSliceLeaky(model.RawValue, allocator, Op.contract_json, .{ .parse_numbers = false });
        const contract = operation.object.get("responses").?.object.get("200").?.object.get("content").?.object.get(Op.media_type).?.object.get("schema").?;
        try schema.validateDetailed(doc, contract, payload, d);
        if (comptime schemaMetadata(Op.Response)) |json| {
            const composite = try std.json.parseFromSliceLeaky(model.RawValue, allocator, json, .{ .parse_numbers = false });
            try schema.validateDetailed(doc, composite, payload, d);
        }
    }
    return value;
}
const ExactTarget = struct { path: []const u8, query: []const u8 };
fn exactTarget(comptime Op: type, a: std.mem.Allocator, params: Op.Params, checkpoint: model.Checkpoint) !ExactTarget {
    try validateParameters(Op, a, params, checkpoint);
    var path: []const u8 = Op.path;
    var query: std.ArrayList(u8) = .empty;
    inline for (@typeInfo(Op.Params).@"struct".field_names) |name| {
        try checkpoint.check();
        if (try parameter(a, @field(params, name), checkpoint)) |text| {
            const placeholder = "{" ++ name ++ "}";
            const encoded = try encodeChecked(a, text, checkpoint);
            if (std.mem.indexOf(u8, path, placeholder)) |at| path = try std.fmt.allocPrint(a, "{s}{s}{s}", .{ path[0..at], encoded, path[at + placeholder.len ..] }) else {
                if (query.items.len > 0) try query.append(a, '&');
                try query.appendSlice(a, name);
                try query.append(a, '=');
                try query.appendSlice(a, encoded);
            }
        }
    }
    if (std.mem.indexOfScalar(u8, path, '{') != null) return error.MissingPathArgument;
    return .{ .path = path, .query = query.items };
}
fn operationOf(execution: *const Execution, selection: []const u8) []const u8 {
    for (execution.reports) |report| for (report.selections) |name| {
        if (std.mem.eql(u8, name, selection)) return report.operation;
    };
    return "";
}
/// Strict batches decode each selection from the response keys its model declares.
fn projectFields(comptime T: type, a: std.mem.Allocator, value: model.RawValue) !model.RawValue {
    if (comptime @typeInfo(T) != .@"struct" or @hasDecl(T, "compatibility_fields") or @hasDecl(T, "map_child")) return value;
    if (value != .object) return value;
    var out: std.json.ObjectMap = .{};
    inline for (@typeInfo(T).@"struct".field_names) |name| if (value.object.get(name)) |field| try out.put(a, name, field);
    return .{ .object = out };
}
fn claims(comptime T: type, key: []const u8) bool {
    if (comptime @typeInfo(T) != .@"struct" or @hasDecl(T, "compatibility_fields") or @hasDecl(T, "map_child")) return true;
    inline for (@typeInfo(T).@"struct".field_names) |name| if (std.mem.eql(u8, name, key)) return true;
    return false;
}
/// Strict mode: a top-level response key no selection model declares is an error.
fn strictLeftovers(comptime tokens: anytype, execution: *Execution) void {
    if (execution.raw != .object) return;
    var it = execution.raw.object.iterator();
    while (it.next()) |entry| {
        var claimed = false;
        inline for (tokens) |Token| {
            if (comptime Token.Response == []const u8 or Token.Response == model.RawValue) {
                claimed = true;
            } else if (claims(Token.Response, entry.key_ptr.*)) claimed = true;
        }
        if (!claimed) {
            var d: model.Diagnostic = .{ .mode = .strict, .reason = error.UnknownField };
            const n = @min(entry.key_ptr.len, d.path.len - 1);
            d.path[0] = '/';
            @memcpy(d.path[1..][0..n], entry.key_ptr.*[0..n]);
            d.path_len = n + 1;
            execution.failure = .{ .kind = .decode, .cause = error.UnknownField, .diagnostic = d };
            return;
        }
    }
}
const CheckContext = struct {
    engine: *runtime.Client,
    options: runtime.Options,
    fn check(ctx: ?*anyopaque) !void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        try self.engine.check(self.options);
    }
    fn checkTyped(ctx: ?*anyopaque) error{ Canceled, Timeout }!void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        try self.engine.check(self.options);
    }
};
fn failureKind(err: anyerror) Kind {
    return switch (err) {
        error.Canceled => .canceled,
        error.Timeout => .timeout,
        else => .decode,
    };
}
fn schemaMetadata(comptime T: type) ?[]const u8 {
    return switch (@typeInfo(T)) {
        .@"struct", .@"union", .@"enum" => if (@hasDecl(T, "json_schema")) T.json_schema else null,
        else => null,
    };
}
/// Strict-mode contract validation against the process-wide parsed contract.
fn validatePublicModel(comptime T: type, allocator: std.mem.Allocator, raw_value: model.RawValue, d: *model.Diagnostic) !void {
    if (comptime current.schemaName(T) != null or schemaMetadata(T) != null) {
        var scratch = std.heap.ArenaAllocator.init(allocator);
        defer scratch.deinit();
        const a = scratch.allocator();
        if (d.checkpoint) |c| try c.check();
        const doc = try contracts.currentDocument();
        const contract = if (comptime current.schemaName(T)) |name| doc.object.get("components").?.object.get("schemas").?.object.get(name).? else try std.json.parseFromSliceLeaky(model.RawValue, a, schemaMetadata(T).?, .{ .parse_numbers = false });
        try schema.validateDetailed(doc, contract, raw_value, d);
    }
}
pub fn SelectionResult(comptime Token: type) type {
    return struct {
        execution: Execution,
        value: ?Token.Response,
        result: Outcome(Token.Response),
        pub fn deinit(self: *@This()) void {
            self.execution.deinit();
            self.* = undefined;
        }
    };
}
pub fn ExactResult(comptime Op: type) type {
    return struct {
        execution: Execution,
        value: ?Op.Response,
        pub fn deinit(self: *@This()) void {
            self.execution.deinit();
            self.* = undefined;
        }
    };
}

fn resourceFromPath(path: []const u8) ?planner.Resource {
    var parts = std.mem.tokenizeScalar(u8, path, '/');
    return std.meta.stringToEnum(planner.Resource, parts.next() orelse return null);
}
fn encodeChecked(a: std.mem.Allocator, text: []const u8, checkpoint: model.Checkpoint) ![]const u8 {
    var output: std.ArrayList(u8) = .empty;
    errdefer output.deinit(a);
    var offset: usize = 0;
    while (offset < text.len) {
        try checkpoint.check();
        const end = @min(text.len, offset + @min(text.len - offset, 1024));
        const encoded = try planner.percentEncode(a, text[offset..end]);
        defer a.free(encoded);
        try output.appendSlice(a, encoded);
        offset = end;
    }
    try checkpoint.check();
    return output.toOwnedSlice(a);
}
/// Validates parameters against the generator's resolved parameter contracts
/// (`Op.parameters_json`, a few kilobytes), never the full document. Unknown enum
/// text passes (tolerant), so values Torn adds later can be sent.
fn validateParameters(comptime Op: type, a: std.mem.Allocator, params: Op.Params, checkpoint: model.Checkpoint) !void {
    try checkpoint.check();
    const contract = try std.json.parseFromSliceLeaky(model.RawValue, a, Op.parameters_json, .{ .parse_numbers = false });
    const bytes = try model.stringifyChecked(a, params, checkpoint);
    const values = try std.json.parseFromSliceLeaky(model.RawValue, a, bytes, .{ .parse_numbers = false });
    for (contract.array.items) |p| {
        try checkpoint.check();
        const name = p.object.get("name").?.string;
        if (values.object.get(name)) |v| {
            if (v == .null) {
                if (p.object.get("required").?.bool) return error.MissingPathArgument;
                continue;
            }
            var d: model.Diagnostic = .{ .checkpoint = checkpoint, .mode = .tolerant };
            try schema.validateDetailed(.null, p.object.get("schema").?, v, &d);
        } else if (p.object.get("required").?.bool) return error.MissingPathArgument;
    }
}
fn cloneObjects(a: std.mem.Allocator, value: model.RawValue, checkpoint: model.Checkpoint) anyerror!model.RawValue {
    try checkpoint.check();
    if (value != .object) return value;
    var out: std.json.ObjectMap = .{};
    var it = value.object.iterator();
    while (it.next()) |entry| try out.put(a, entry.key_ptr.*, try cloneObjects(a, entry.value_ptr.*, checkpoint));
    return .{ .object = out };
}
fn replaceSelections(a: std.mem.Allocator, query: []const u8, selection: []const u8) ![]const u8 {
    var parts = std.mem.splitScalar(u8, query, '&');
    var out: std.ArrayList(u8) = .empty;
    while (parts.next()) |part| {
        if (out.items.len > 0) try out.append(a, '&');
        if (std.mem.startsWith(u8, part, "selections=")) {
            try out.appendSlice(a, "selections=");
            try out.appendSlice(a, try planner.percentEncode(a, selection));
        } else try out.appendSlice(a, part);
    }
    return out.toOwnedSlice(a);
}
fn parameter(a: std.mem.Allocator, value: anytype, checkpoint: model.Checkpoint) anyerror!?[]const u8 {
    try checkpoint.check();
    const T = @TypeOf(value);
    switch (@typeInfo(T)) {
        .optional => return if (value) |v| parameter(a, v, checkpoint) else null,
        .@"union" => {
            if (@hasDecl(T, "presence_child")) return switch (value) {
                .absent => null,
                .null => error.NullParameter,
                .value => |v| parameter(a, v, checkpoint),
            };
            return switch (value) {
                inline else => |v| parameter(a, v, checkpoint),
            };
        },
        .int, .float => return try std.fmt.allocPrint(a, "{d}", .{value}),
        .bool => return if (value) "true" else "false",
        .@"enum" => return @tagName(value),
        .pointer => |p| {
            if (p.child == u8) return value;
            var out: std.ArrayList(u8) = .empty;
            for (value, 0..) |v, i| {
                if (i > 0) try out.append(a, ',');
                try out.appendSlice(a, (try parameter(a, v, checkpoint)) orelse return error.NullParameter);
            }
            return try out.toOwnedSlice(a);
        },
        else => @compileError("Unsupported parameter type"),
    }
}
pub fn merge(a: std.mem.Allocator, into: *model.RawValue, later: model.RawValue) !void {
    return mergeChecked(a, into, later, null);
}
pub fn mergeChecked(a: std.mem.Allocator, into: *model.RawValue, later: model.RawValue, checkpoint: ?model.Checkpoint) !void {
    if (checkpoint) |c| try c.check();
    if (into.* == .object and later == .object) {
        var it = later.object.iterator();
        while (it.next()) |entry| {
            if (into.object.getPtr(entry.key_ptr.*)) |prior| try mergeChecked(a, prior, entry.value_ptr.*, checkpoint) else try into.object.put(a, entry.key_ptr.*, entry.value_ptr.*);
        }
    } else into.* = later;
}
test "recursive merge preserves exact numbers and replacement rules" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    var first = try std.json.parseFromSliceLeaky(model.RawValue, a, "{\"a\":{\"x\":9007199254740993,\"y\":[1]},\"z\":true}", .{ .parse_numbers = false });
    const next = try std.json.parseFromSliceLeaky(model.RawValue, a, "{\"a\":{\"y\":null},\"z\":false}", .{ .parse_numbers = false });
    try merge(a, &first, next);
    try std.testing.expectEqualStrings("9007199254740993", first.object.get("a").?.object.get("x").?.number_string);
    try std.testing.expect(first.object.get("a").?.object.get("y").? == .null);
    try std.testing.expect(!first.object.get("z").?.bool);
}
test "page links are validated against the API host and lose any key (P7.1)" {
    const a = std.testing.allocator;
    const base = "https://api.torn.com/v2";
    const relative = try relativeLink(a, base, "https://api.torn.com/v2/user/attacks?limit=2&to=200&key=LEAKEDKEY0000000");
    defer a.free(relative);
    try std.testing.expectEqualStrings("/user/attacks?limit=2&to=200", relative);
    try std.testing.expectError(error.ForeignPageLink, relativeLink(a, base, "https://evil.example/v2/user/attacks?to=200"));
    try std.testing.expectError(error.ForeignPageLink, relativeLink(a, base, "http://api.torn.com/v2/user/attacks"));
    try std.testing.expectError(error.ForeignPageLink, relativeLink(a, base, "https://api.torn.com/v2x/user"));
    try std.testing.expectError(error.ForeignPageLink, relativeLink(a, base, "https://user:pw@api.torn.com/v2/user"));
}
test "failure helpers and formatting are code based and redacted (P5.2, P5.3)" {
    const failure: Failure = .{ .kind = .no_usable_keys, .api_code = 2, .api_message = "Incorrect key", .key = KeyHint.of("SECRETKEY1234567") };
    try std.testing.expect(failure.isKeyError() and !failure.isTransient());
    try std.testing.expectEqualStrings("no_usable_keys", failure.kindName());
    const text = try std.fmt.allocPrint(std.testing.allocator, "{f}", .{failure});
    defer std.testing.allocator.free(text);
    try std.testing.expect(std.mem.indexOf(u8, text, "SECRETKEY1234567") == null);
    try std.testing.expect(std.mem.indexOf(u8, text, "IncorrectKey") != null);
    const json = try std.json.Stringify.valueAlloc(std.testing.allocator, failure, .{});
    defer std.testing.allocator.free(json);
    try std.testing.expect(std.mem.indexOf(u8, json, "SECRETKEY1234567") == null);
    const backend: Failure = .{ .kind = .api, .api_code = 17 };
    try std.testing.expect(backend.isRetryable() and backend.isTransient() and !backend.isRateLimit());
    try std.testing.expectEqual(errors.TornErrorCode.backend_error, backend.code().?);
    const http: Failure = .{ .kind = .http, .http_status = 429 };
    try std.testing.expect(http.isRetryable() and http.isRateLimit());
}
