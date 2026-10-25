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
    raw: model.RawValue,
    reports: []const Report,
    csv: []const Csv = &.{},
    failure: ?Failure = null,
    pub fn csvText(self: *const Execution, selection: []const u8) ?[]const u8 {
        for (self.csv) |channel| for (channel.selections) |name| {
            if (std.mem.eql(u8, name, selection)) return channel.text;
        };
        return null;
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
    pub fn decode(self: *Execution, comptime T: type) !T {
        return self.decodeChecked(T, null);
    }
    pub fn decodeChecked(self: *Execution, comptime T: type, checkpoint: ?model.Checkpoint) !T {
        return self.decodeInner(T, checkpoint) catch |err| {
            if (self.failure == null) self.failure = .{ .kind = failureKind(err), .cause = err };
            return err;
        };
    }
    fn decodeInner(self: *Execution, comptime T: type, checkpoint: ?model.Checkpoint) !T {
        if (checkpoint) |c| try c.check();
        var d: model.Diagnostic = .{ .checkpoint = checkpoint };
        const value = model.convert(T, self.arena.allocator(), self.raw, &d) catch |err| {
            d.checkpoint = null;
            self.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = d };
            return err;
        };
        validatePublicModel(T, self.allocator, self.raw, &d) catch |err| {
            d.checkpoint = null;
            self.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = d };
            return err;
        };
        return value;
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
        var csv: std.ArrayList(Csv) = .empty;
        for (plan.calls) |call| {
            self.engine.check(options.request) catch |err| {
                execution.failure = .{ .kind = if (err == error.Canceled) .canceled else .timeout, .cause = err };
                break;
            };
            self.contribute(&execution, &reports, &csv, call, options, false) catch |err| {
                execution.failure = .{ .kind = switch (err) {
                    error.Canceled => .canceled,
                    error.Timeout => .timeout,
                    else => .network,
                }, .cause = err };
                break;
            };
            if (execution.failure != null) break;
        }
        execution.reports = reports.items;
        execution.csv = csv.items;
        return execution;
    }
    fn contribute(self: Client, execution: *Execution, reports: *std.ArrayList(Report), csv: *std.ArrayList(Csv), call: planner.Call, options: Options, fallback: bool) anyerror!void {
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
        const envelope = if (call.media == .csv) std.json.parseFromSliceLeaky(model.RawValue, a, response.body, .{ .parse_numbers = false }) catch |err| blk: {
            if (err == error.OutOfMemory) return err;
            break :blk .null;
        } else payload;
        var api_code: ?u32 = null;
        if (envelope == .object) if (envelope.object.get("error")) |failure| {
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
                    try self.contribute(execution, reports, csv, split_call, no_split, fallback);
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
                    try self.contribute(execution, reports, csv, legacy, no_legacy, true);
                    if (execution.failure != null) break;
                }
                return;
            }
            execution.failure = .{ .kind = if (api_code != null) .api else .http, .http_status = response.status, .api_code = api_code };
            return;
        }
        var validation_context = CheckContext{ .engine = self.engine, .options = options.request };
        var diagnostic: model.Diagnostic = .{ .checkpoint = .{ .context = &validation_context, .check_fn = CheckContext.checkTyped } };
        if (options.validation) |validation| validation.validate_fn(validation.context, a, call, payload, &diagnostic) catch |err| {
            if (err == error.OutOfMemory) return err;
            diagnostic.checkpoint = null;
            execution.failure = .{ .kind = failureKind(err), .cause = err, .diagnostic = diagnostic };
            return;
        };
        const names = try a.alloc([]const u8, call.selections.len);
        for (call.selections, names) |s, *out| out.* = try a.dupe(u8, s);
        const report: Report = .{ .operation = try a.dupe(u8, call.operation), .route = try a.dupe(u8, response.route_name), .path = try a.dupe(u8, call.path), .selections = names, .api_version = call.version, .fallback = fallback };
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
        const Gate = struct {
            fn validate(ctx: ?*anyopaque, _: std.mem.Allocator, call: planner.Call, payload: model.RawValue, d: *model.Diagnostic) !void {
                const engine: *runtime.Client = @ptrCast(@alignCast(ctx.?));
                var scratch = std.heap.ArenaAllocator.init(engine.allocator);
                defer scratch.deinit();
                inline for (tokens) |Token| {
                    var selected = false;
                    for (call.selections) |name| if (std.mem.eql(u8, name, Token.name)) {
                        selected = true;
                    };
                    if (selected) {
                        _ = try model.convert(Token.Response, scratch.allocator(), payload, d);
                        try validatePublicModel(Token.Response, engine.allocator, payload, d);
                    }
                }
            }
        };
        var validated = options;
        validated.validation = .{ .context = self.engine, .validate_fn = Gate.validate };
        var execution = try self.execute(.{ .resource = tokens[0].resource, .selections = &names, .target = target, .filters = filters, .force_direct = force_direct }, validated);
        errdefer execution.deinit();
        var value: ?BatchType(tokens) = null;
        if (execution.failure == null) {
            var values: BatchType(tokens) = undefined;
            var context = CheckContext{ .engine = self.engine, .options = options.request };
            inline for (tokens, 0..) |Token, i| {
                self.engine.check(options.request) catch |err| {
                    execution.failure = .{ .kind = if (err == error.Canceled) .canceled else .timeout, .cause = err };
                };
                if (execution.failure == null) {
                    if (comptime Token.Response == []const u8) {
                        values[i] = execution.csvText(Token.name) orelse blk: {
                            execution.failure = .{ .kind = .decode, .cause = error.MissingCsvChannel };
                            break :blk "";
                        };
                    } else values[i] = execution.decodeChecked(Token.Response, .{ .context = &context, .check_fn = CheckContext.checkTyped }) catch undefined;
                }
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
        if (comptime @hasDecl(Token, "required_target")) {
            var found = false;
            for (target) |arg| if (std.mem.eql(u8, arg.name, Token.required_target) or std.mem.eql(u8, arg.name, "id")) {
                found = true;
            };
            if (!found) return error.MissingAliasTarget;
        }
        return self.execute(.{ .resource = Token.resource, .selections = &.{Token.name}, .target = target, .filters = filters, .force_direct = if (@hasDecl(Token, "force_direct")) Token.force_direct else false }, options);
    }
    /// Exact operation parameters and response types are compile-time generated.
    pub fn exact(self: Client, comptime Op: type, params: Op.Params, options: Options) !ExactResult(Op) {
        var arena = std.heap.ArenaAllocator.init(self.engine.allocator);
        defer arena.deinit();
        const a = arena.allocator();
        try self.engine.check(options.request);
        var context = CheckContext{ .engine = self.engine, .options = options.request };
        const checkpoint: model.Checkpoint = .{ .context = &context, .check_fn = CheckContext.checkTyped };
        try validateParameters(Op, a, params, checkpoint);
        var path: []const u8 = Op.path;
        var query: std.ArrayList(u8) = .empty;
        inline for (@typeInfo(Op.Params).@"struct".field_names) |name| {
            try self.engine.check(options.request);
            if (comptime std.mem.eql(u8, name, "key")) {
                if (@field(params, name) != .absent) return error.UseClientAuthentication;
            } else if (try parameter(a, @field(params, name), checkpoint)) |text| {
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
        var plan: planner.Plan = .{ .arena = std.heap.ArenaAllocator.init(a), .calls = &.{.{ .path = path, .query = query.items, .selections = &.{}, .operation = Op.operation_id, .version = 2, .media = if (std.mem.eql(u8, Op.media_type, "text/csv")) .csv else .json, .fallback_supported = false }} };
        defer plan.deinit();
        const Gate = struct {
            fn validate(ctx: ?*anyopaque, _: std.mem.Allocator, _: planner.Call, payload: model.RawValue, d: *model.Diagnostic) !void {
                const engine: *runtime.Client = @ptrCast(@alignCast(ctx.?));
                var scratch = std.heap.ArenaAllocator.init(engine.allocator);
                defer scratch.deinit();
                const allocator = scratch.allocator();
                const doc = try std.json.parseFromSliceLeaky(model.RawValue, allocator, current.source_json, .{ .parse_numbers = false });
                const operation = try std.json.parseFromSliceLeaky(model.RawValue, allocator, Op.contract_json, .{ .parse_numbers = false });
                const contract = operation.object.get("responses").?.object.get("200").?.object.get("content").?.object.get(Op.media_type).?.object.get("schema").?;
                _ = try model.convert(Op.Response, allocator, payload, d);
                try schema.validateDetailed(doc, contract, payload, d);
                if (comptime schemaMetadata(Op.Response)) |json| {
                    const composite = try std.json.parseFromSliceLeaky(model.RawValue, allocator, json, .{ .parse_numbers = false });
                    try schema.validateDetailed(doc, composite, payload, d);
                }
            }
        };
        var validated = options;
        validated.validation = .{ .context = self.engine, .validate_fn = Gate.validate };
        var execution = try self.executePlan(&plan, validated);
        errdefer execution.deinit();
        const value: ?Op.Response = if (execution.failure == null) execution.decodeChecked(Op.Response, checkpoint) catch null else null;
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
    fn checkTyped(ctx: ?*anyopaque) error{ Canceled, Timeout }!void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        try self.engine.check(self.options);
    }
};
fn failureKind(err: anyerror) @FieldType(Failure, "kind") {
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
fn validatePublicModel(comptime T: type, allocator: std.mem.Allocator, raw: model.RawValue, d: *model.Diagnostic) !void {
    if (comptime current.schemaName(T) != null or schemaMetadata(T) != null) {
        var scratch = std.heap.ArenaAllocator.init(allocator);
        defer scratch.deinit();
        const a = scratch.allocator();
        if (d.checkpoint) |c| try c.check();
        const doc = try std.json.parseFromSliceLeaky(model.RawValue, a, current.source_json, .{ .parse_numbers = false });
        const contract = if (comptime current.schemaName(T)) |name| doc.object.get("components").?.object.get("schemas").?.object.get(name).? else try std.json.parseFromSliceLeaky(model.RawValue, a, schemaMetadata(T).?, .{ .parse_numbers = false });
        try schema.validateDetailed(doc, contract, raw, d);
    }
}
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
fn validateParameters(comptime Op: type, a: std.mem.Allocator, params: Op.Params, checkpoint: model.Checkpoint) !void {
    try checkpoint.check();
    const doc = try std.json.parseFromSliceLeaky(model.RawValue, a, current.source_json, .{ .parse_numbers = false });
    const contract = try std.json.parseFromSliceLeaky(model.RawValue, a, Op.contract_json, .{ .parse_numbers = false });
    const bytes = try model.stringifyChecked(a, params, checkpoint);
    const values = try std.json.parseFromSliceLeaky(model.RawValue, a, bytes, .{ .parse_numbers = false });
    for (contract.object.get("parameters").?.array.items) |parameter_contract| {
        try checkpoint.check();
        var p = parameter_contract;
        if (p.object.get("$ref")) |reference| {
            const at = std.mem.lastIndexOfScalar(u8, reference.string, '/') orelse return error.InvalidContract;
            p = doc.object.get("components").?.object.get("parameters").?.object.get(reference.string[at + 1 ..]) orelse return error.InvalidContract;
        }
        const name = p.object.get("name").?.string;
        if (std.mem.eql(u8, name, "key")) continue;
        if (values.object.get(name)) |v| try schema.validateChecked(doc, p.object.get("schema").?, v, checkpoint) else if (p.object.get("required")) |required| {
            if (required.bool) return error.MissingPathArgument;
        }
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
