const std = @import("std");
const model = @import("model.zig");
const planner = @import("planner.zig");
const runtime = @import("runtime.zig");
const current = @import("generated/current.zig");
const schema = @import("schema.zig");
pub const Report = struct {
    operation: []const u8,
    route: []const u8,
    path: []const u8,
    selections: []const []const u8,
    api_version: u8,
    fallback: bool,
};
pub const Failure = struct {
    kind: enum { network, timeout, canceled, http, api, decode, planning },
    cause: ?anyerror = null,
    http_status: ?u16 = null,
    api_code: ?u32 = null,
    /// Diagnostic paths are owned inline and never contain response/account data.
    diagnostic: model.Diagnostic = .{},
};
pub const Options = struct {
    request: runtime.Options = .{},
    split_recovery: bool = true,
    legacy_fallback: bool = false,
};
pub const Execution = struct {
    arena: *std.heap.ArenaAllocator,
    allocator: std.mem.Allocator,
    raw: model.RawValue,
    reports: []const Report,
    failure: ?Failure = null,
    pub fn deinit(self: *Execution) void {
        self.arena.deinit();
        self.allocator.destroy(self.arena);
        self.* = undefined;
    }
    pub fn decode(self: *Execution, comptime T: type) !T {
        if (comptime current.schemaName(T)) |name| {
            var scratch = std.heap.ArenaAllocator.init(self.allocator);
            defer scratch.deinit();
            const doc = try std.json.parseFromSliceLeaky(model.RawValue, scratch.allocator(), current.source_json, .{ .parse_numbers = false });
            schema.validate(doc, doc.object.get("components").?.object.get("schemas").?.object.get(name).?, self.raw) catch |err| {
                self.failure = .{ .kind = .decode, .cause = err };
                return err;
            };
        }
        var d: model.Diagnostic = .{};
        return model.convert(T, self.arena.allocator(), self.raw, &d) catch |err| {
            self.failure = .{ .kind = .decode, .cause = err, .diagnostic = d };
            return err;
        };
    }
};
pub fn BatchType(comptime tokens: anytype) type {
    if (tokens.len == 0) @compileError("A batch requires at least one selection");
    var types: [tokens.len]type = undefined;
    for (tokens, 0..) |Token, i| {
        if (Token.resource != tokens[0].resource) @compileError("Cannot batch selections from different resources");
        types[i] = Token.Response;
    }
    return @Tuple(&types);
}
pub fn BatchResult(comptime tokens: anytype) type {
    return struct {
        execution: Execution,
        value: ?BatchType(tokens),
        pub fn deinit(self: *@This()) void {
            self.execution.deinit();
            self.* = undefined;
        }
    };
}

/// Client borrows the runtime at a stable address; it does not own or shut it down.
pub const Client = struct {
    engine: *runtime.Client,
    pub fn execute(self: Client, input: planner.Input, options: Options) !Execution {
        try self.engine.check(options.request);
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
        var execution: Execution = .{ .arena = arena, .allocator = a, .raw = .{ .object = .{} }, .reports = &.{} };
        var reports: std.ArrayList(Report) = .empty;
        for (plan.calls) |call| {
            self.engine.check(options.request) catch |err| {
                execution.failure = .{ .kind = if (err == error.Canceled) .canceled else .timeout, .cause = err };
                break;
            };
            self.contribute(&execution, &reports, call, options, false) catch |err| {
                execution.failure = .{ .kind = .network, .cause = err };
                break;
            };
            if (execution.failure != null) break;
        }
        execution.reports = reports.items;
        return execution;
    }
    fn contribute(self: Client, execution: *Execution, reports: *std.ArrayList(Report), call: planner.Call, options: Options, fallback: bool) anyerror!void {
        const a = execution.arena.allocator();
        const base = if (call.version == 1) self.engine.config.base_url_v1 else self.engine.config.base_url_v2;
        const url = try std.fmt.allocPrint(a, "{s}{s}{s}{s}", .{ std.mem.trimEnd(u8, base, "/"), call.path, if (call.query.len > 0) "?" else "", call.query });
        var response = self.engine.execute(url, options.request) catch |err| {
            if (err == error.OutOfMemory) return err;
            execution.failure = .{ .kind = switch (err) {
                error.Timeout => .timeout,
                error.Canceled => .canceled,
                else => .network,
            }, .cause = err };
            return;
        };
        defer response.deinit();
        const payload = if (call.media == .csv) model.RawValue{ .string = try a.dupe(u8, response.body) } else std.json.parseFromSliceLeaky(model.RawValue, a, response.body, .{ .allocate = .alloc_always, .parse_numbers = false }) catch |err| blk: {
            if (err == error.OutOfMemory) return err;
            if (response.status >= 200 and response.status < 300) {
                execution.failure = .{ .kind = .decode, .cause = err, .http_status = response.status };
                return;
            }
            // Error bodies need not be JSON; HTTP recovery still applies.
            break :blk .null;
        };
        var api_code: ?u32 = null;
        if (payload == .object) if (payload.object.get("error")) |failure| {
            if (failure == .object) if (failure.object.get("code")) |code| {
                api_code = switch (code) {
                    .number_string => |n| model.integer(u32, n) catch null,
                    .integer => |n| std.math.cast(u32, n),
                    else => null,
                };
            };
        };
        if (response.status >= 300 or response.status < 200 or api_code != null) {
            const unsupported = api_code == 4 or response.status == 400 or response.status == 404 or response.status == 501;
            if (unsupported and options.split_recovery and call.version == 2 and call.selections.len > 1) {
                const resource = resourceFromPath(call.path) orelse return error.InvalidPlan;
                for (call.selections) |selection| {
                    // Reuse all encoded filters and target IDs from the rejected combined call.
                    const singleton_query = try replaceSelections(a, call.query, selection);
                    var split_call = call;
                    split_call.query = singleton_query;
                    split_call.selections = &.{selection};
                    _ = resource;
                    var no_split = options;
                    no_split.split_recovery = false;
                    try self.contribute(execution, reports, split_call, no_split, fallback);
                    if (execution.failure != null) return;
                }
                return;
            }
            if (unsupported and options.legacy_fallback and call.version == 2 and call.fallback_supported) {
                const resource = resourceFromPath(call.path) orelse return error.InvalidPlan;
                for (call.selections) |selection| if (!planner.v1Contains(resource, selection)) return error.UnsupportedFallback;
                var plan = planner.build(a, .{ .resource = resource, .selections = call.selections, .target = call.target, .filters = call.filters, .mode = .v1 }) catch |err| {
                    execution.failure = .{ .kind = .planning, .cause = err, .http_status = response.status, .api_code = api_code };
                    return;
                };
                defer plan.deinit();
                var no_legacy = options;
                no_legacy.legacy_fallback = false;
                for (plan.calls) |legacy| {
                    try self.contribute(execution, reports, legacy, no_legacy, true);
                    if (execution.failure != null) break;
                }
                return;
            }
            execution.failure = .{ .kind = if (api_code != null) .api else .http, .http_status = response.status, .api_code = api_code };
            return;
        }
        const names = try a.alloc([]const u8, call.selections.len);
        for (call.selections, names) |s, *out| out.* = try a.dupe(u8, s);
        const report: Report = .{ .operation = try a.dupe(u8, call.operation), .route = try a.dupe(u8, response.route_name), .path = try a.dupe(u8, call.path), .selections = names, .api_version = call.version, .fallback = fallback };
        try reports.ensureUnusedCapacity(a, 1);
        var merged = try cloneObjects(a, execution.raw);
        try merge(a, &merged, payload);
        execution.raw = merged;
        reports.appendAssumeCapacity(report);
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
        var value: ?BatchType(tokens) = null;
        if (execution.failure == null) {
            var values: BatchType(tokens) = undefined;
            inline for (tokens, 0..) |Token, i| {
                self.engine.check(options.request) catch |err| {
                    execution.failure = .{ .kind = if (err == error.Canceled) .canceled else .timeout, .cause = err };
                };
                if (execution.failure == null) values[i] = execution.decode(Token.Response) catch undefined;
            }
            if (execution.failure == null) value = values;
        }
        return .{ .execution = execution, .value = value };
    }
    pub fn select(self: Client, comptime Token: type, target: []const planner.Argument, filters: []const planner.Argument, options: Options) !SelectionResult(Token) {
        const result = try self.batch(.{Token}, target, filters, options);
        return .{ .execution = result.execution, .value = if (result.value) |value| value[0] else null };
    }
    pub fn raw(self: Client, comptime Token: type, target: []const planner.Argument, filters: []const planner.Argument, options: Options) !Execution {
        return self.execute(.{ .resource = Token.resource, .selections = &.{Token.name}, .target = target, .filters = filters }, options);
    }
    /// Exact operation parameters and response types are compile-time generated.
    pub fn exact(self: Client, comptime Op: type, params: Op.Params, options: Options) !ExactResult(Op) {
        var arena = std.heap.ArenaAllocator.init(self.engine.allocator);
        defer arena.deinit();
        const a = arena.allocator();
        try self.engine.check(options.request);
        try validateParameters(Op, a, params);
        var path: []const u8 = Op.path;
        var query: std.ArrayList(u8) = .empty;
        inline for (@typeInfo(Op.Params).@"struct".field_names) |name| {
            try self.engine.check(options.request);
            if (comptime std.mem.eql(u8, name, "key")) {
                if (@field(params, name) != .absent) return error.UseClientAuthentication;
            } else if (try parameter(a, @field(params, name))) |text| {
                const placeholder = "{" ++ name ++ "}";
                const encoded = try planner.percentEncode(a, text);
                if (std.mem.indexOf(u8, path, placeholder)) |at| path = try std.fmt.allocPrint(a, "{s}{s}{s}", .{ path[0..at], encoded, path[at + placeholder.len ..] }) else {
                    if (query.items.len > 0) try query.append(a, '&');
                    try query.appendSlice(a, name);
                    try query.append(a, '=');
                    try query.appendSlice(a, encoded);
                }
            }
        }
        if (std.mem.indexOfScalar(u8, path, '{') != null) return error.MissingPathArgument;
        var plan: planner.Plan = .{ .arena = std.heap.ArenaAllocator.init(a), .calls = &.{.{ .path = path, .query = query.items, .selections = &.{}, .operation = Op.operation_id, .version = 2, .media = if (std.mem.eql(u8, Op.media_type, "text/csv")) .csv else .json, .fallback_supported = false }} };
        defer plan.deinit();
        var execution = try self.executePlan(&plan, options);
        errdefer execution.deinit();
        const value: ?Op.Response = if (execution.failure == null) execution.decode(Op.Response) catch null else null;
        return .{ .execution = execution, .value = value };
    }
};
const CheckContext = struct {
    engine: *runtime.Client,
    options: runtime.Options,
    fn check(ctx: ?*anyopaque) !void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        try self.engine.check(self.options);
    }
};
pub fn SelectionResult(comptime Token: type) type {
    return struct {
        execution: Execution,
        value: ?Token.Response,
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
fn validateParameters(comptime Op: type, a: std.mem.Allocator, params: Op.Params) !void {
    const doc = try std.json.parseFromSliceLeaky(model.RawValue, a, current.source_json, .{ .parse_numbers = false });
    const contract = try std.json.parseFromSliceLeaky(model.RawValue, a, Op.contract_json, .{ .parse_numbers = false });
    const bytes = try model.stringify(a, params);
    const values = try std.json.parseFromSliceLeaky(model.RawValue, a, bytes, .{ .parse_numbers = false });
    for (contract.object.get("parameters").?.array.items) |parameter_contract| {
        var p = parameter_contract;
        if (p.object.get("$ref")) |reference| {
            const at = std.mem.lastIndexOfScalar(u8, reference.string, '/') orelse return error.InvalidContract;
            p = doc.object.get("components").?.object.get("parameters").?.object.get(reference.string[at + 1 ..]) orelse return error.InvalidContract;
        }
        const name = p.object.get("name").?.string;
        if (std.mem.eql(u8, name, "key")) continue;
        if (values.object.get(name)) |v| try schema.validate(doc, p.object.get("schema").?, v) else if (p.object.get("required")) |required| {
            if (required.bool) return error.MissingPathArgument;
        }
    }
}
fn cloneObjects(a: std.mem.Allocator, value: model.RawValue) anyerror!model.RawValue {
    if (value != .object) return value;
    var out: std.json.ObjectMap = .{};
    var it = value.object.iterator();
    while (it.next()) |entry| try out.put(a, entry.key_ptr.*, try cloneObjects(a, entry.value_ptr.*));
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
fn parameter(a: std.mem.Allocator, value: anytype) anyerror!?[]const u8 {
    const T = @TypeOf(value);
    switch (@typeInfo(T)) {
        .optional => return if (value) |v| parameter(a, v) else null,
        .@"union" => {
            if (@hasDecl(T, "presence_child")) return switch (value) {
                .absent => null,
                .null => error.NullParameter,
                .value => |v| parameter(a, v),
            };
            return switch (value) {
                inline else => |v| parameter(a, v),
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
                try out.appendSlice(a, (try parameter(a, v)) orelse return error.NullParameter);
            }
            return try out.toOwnedSlice(a);
        },
        else => @compileError("Unsupported parameter type"),
    }
}
pub fn merge(a: std.mem.Allocator, into: *model.RawValue, later: model.RawValue) !void {
    if (into.* == .object and later == .object) {
        var it = later.object.iterator();
        while (it.next()) |entry| {
            if (into.object.getPtr(entry.key_ptr.*)) |prior| try merge(a, prior, entry.value_ptr.*) else try into.object.put(a, entry.key_ptr.*, entry.value_ptr.*);
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
