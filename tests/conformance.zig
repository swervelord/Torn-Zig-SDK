//! Shared cross-SDK conformance suite (P9.1). Loads every `*.json` file in
//! spec/shared/conformance/ at run time and runs each scenario through the SDK's
//! mock transport and virtual clock. A scenario this harness cannot run fails.
const std = @import("std");
const torn = @import("torn");
const options = @import("conformance_options");

const V = std.json.Value;

fn get(v: V, key: []const u8) ?V {
    if (v != .object) return null;
    const found = v.object.get(key) orelse return null;
    return if (found == .null) null else found;
}
fn str(v: ?V) ?[]const u8 {
    const value = v orelse return null;
    return if (value == .string) value.string else null;
}
fn int(v: ?V) ?i64 {
    const value = v orelse return null;
    return switch (value) {
        .integer => |i| i,
        .float => |f| @intFromFloat(f),
        .number_string => |s| std.fmt.parseInt(i64, s, 10) catch null,
        else => null,
    };
}
/// Query/param values compare as strings; lists are joined by ",".
fn valueText(a: std.mem.Allocator, v: V) ![]const u8 {
    return switch (v) {
        .string => |s| s,
        .integer => |i| try std.fmt.allocPrint(a, "{d}", .{i}),
        .float => |f| try std.fmt.allocPrint(a, "{d}", .{f}),
        .number_string => |s| s,
        .bool => |b| if (b) "true" else "false",
        .array => |items| blk: {
            var out: std.ArrayList(u8) = .empty;
            for (items.items, 0..) |item, i| {
                if (i > 0) try out.append(a, ',');
                try out.appendSlice(a, try valueText(a, item));
            }
            break :blk out.items;
        },
        else => error.UnsupportedValue,
    };
}
fn percentDecode(a: std.mem.Allocator, text: []const u8) ![]const u8 {
    const copy = try a.dupe(u8, text);
    for (copy) |*c| if (c.* == '+') {
        c.* = ' ';
    };
    return std.Uri.percentDecodeInPlace(copy);
}
fn jsonText(a: std.mem.Allocator, v: V) ![]const u8 {
    return std.json.Stringify.valueAlloc(a, v, .{});
}
/// Numbers compare by value (the SDK keeps lexemes; scenarios use plain integers).
fn sameJson(a: std.mem.Allocator, x: V, y: V) !bool {
    var parsed_x = try std.json.parseFromSliceLeaky(V, a, try jsonText(a, x), .{});
    var parsed_y = try std.json.parseFromSliceLeaky(V, a, try jsonText(a, y), .{});
    _ = &parsed_x;
    _ = &parsed_y;
    return std.mem.eql(u8, try jsonText(a, parsed_x), try jsonText(a, parsed_y));
}
fn dotted(root: V, path: []const u8) ?V {
    var current = root;
    var it = std.mem.splitScalar(u8, path, '.');
    while (it.next()) |part| {
        if (current != .object) return null;
        current = current.object.get(part) orelse return null;
    }
    return current;
}

/// Finds an open enum along `path` (struct fields; unions and optionals are
/// traversed transparently) and returns its preserved unknown text.
fn unknownAt(comptime T: type, value: T, path: []const []const u8) ?[]const u8 {
    if (comptime T == torn.model.RawValue) return null;
    if (comptime torn.model.isOpenEnum(T)) return if (path.len == 0 and value == .unknown) value.unknown else null;
    if (path.len == 0) return null;
    switch (@typeInfo(T)) {
        .optional => |info| return if (value) |inner| unknownAt(info.child, inner, path) else null,
        .@"struct" => |info| {
            inline for (info.field_names) |name| if (std.mem.eql(u8, name, path[0])) return unknownAt(@FieldType(T, name), @field(value, name), path[1..]);
            return null;
        },
        .@"union" => {
            if (comptime @hasDecl(T, "presence_child")) return switch (value) {
                .value => |inner| unknownAt(T.presence_child, inner, path),
                else => null,
            };
            switch (value) {
                inline else => |inner| return unknownAt(@TypeOf(inner), inner, path),
            }
        },
        .pointer => |info| {
            if (info.size == .one) return unknownAt(info.child, value.*, path);
            return null;
        },
        else => return null,
    }
}
const TypedOutcome = struct { decoded: bool, unknown: ?[]const u8 = null, found: bool };
fn typedDecode(execution: *torn.client.Execution, resource: []const u8, name: []const u8, unknown_path: []const []const u8) TypedOutcome {
    inline for (@typeInfo(torn.selections).@"struct".decl_names) |resource_name| {
        const Resource = @field(torn.selections, resource_name);
        if (@TypeOf(Resource) == type and std.mem.eql(u8, resource_name, resource)) {
            inline for (@typeInfo(Resource).@"struct".decl_names) |token_name| {
                const Token = @field(Resource, token_name);
                if (comptime @TypeOf(Token) == type and @hasDecl(Token, "Response") and @hasDecl(Token, "name")) {
                    if (std.mem.eql(u8, Token.name, name) and !@hasDecl(Token, "required_target")) {
                        if (comptime Token.Response == []const u8) return .{ .decoded = execution.csvText(name) != null, .found = true };
                        const value = execution.decode(Token.Response) catch return .{ .decoded = false, .found = true };
                        return .{ .decoded = true, .unknown = if (unknown_path.len > 0) unknownAt(Token.Response, value, unknown_path) else null, .found = true };
                    }
                }
            }
        }
    }
    return .{ .decoded = false, .found = false };
}

const Runner = struct {
    a: std.mem.Allocator,
    id: []const u8,
    fn fail(self: *const Runner, comptime fmt: []const u8, args: anytype) error{ScenarioFailed} {
        std.debug.print("conformance {s}: " ++ fmt ++ "\n", .{self.id} ++ args);
        return error.ScenarioFailed;
    }
};

fn runScenario(a: std.mem.Allocator, scenario: V) !void {
    const runner: Runner = .{ .a = a, .id = str(get(scenario, "id")) orelse "?" };
    const config_json = get(scenario, "config") orelse V{ .object = .{} };
    const request = get(scenario, "request") orelse return runner.fail("missing request", .{});
    const expect = get(scenario, "expect") orelse return runner.fail("missing expect", .{});
    const exchanges: []const V = if (get(scenario, "exchanges")) |e| e.array.items else &.{};

    var keys: std.ArrayList([]const u8) = .empty;
    for ((get(config_json, "keys") orelse return runner.fail("no keys", .{})).array.items) |k| try keys.append(a, k.string);
    var routes: std.ArrayList(torn.runtime.Route) = .empty;
    if (get(config_json, "routes")) |list| for (list.array.items) |r| try routes.append(a, .{ .name = r.string });
    var groups: std.ArrayList([]const []const u8) = .empty;
    if (get(config_json, "keyGroups")) |list| for (list.array.items) |group| {
        var members: std.ArrayList([]const u8) = .empty;
        for (group.array.items) |member| try members.append(a, member.string);
        try groups.append(a, members.items);
    };
    var access: std.ArrayList(torn.runtime.KeyAccess) = .empty;
    if (get(config_json, "keyAccess")) |map| {
        var it = map.object.iterator();
        while (it.next()) |entry| try access.append(a, .{ .key = entry.key_ptr.*, .level = std.meta.stringToEnum(torn.AccessLevel, entry.value_ptr.string) orelse return runner.fail("bad access level", .{}) });
    }
    var config: torn.runtime.Config = .{
        .keys = keys.items,
        .key_groups = groups.items,
        .key_access = access.items,
        .check_access = if (get(config_json, "checkAccess")) |v| v.bool else false,
        .jitter = if (std.mem.eql(u8, str(get(config_json, "jitter")) orelse "full", "none")) .none else .full,
    };
    if (int(get(config_json, "maxAttempts"))) |n| config.max_attempts = @intCast(n);
    if (int(get(config_json, "perKeyPerMinute"))) |n| config.per_key_per_minute = @intCast(n);
    if (routes.items.len > 0) config.routes = routes.items;

    var mock = torn.testing.MockTransport.init(a);
    defer mock.deinit();
    for (exchanges) |exchange| {
        const respond = get(exchange, "respond") orelse return runner.fail("missing respond", .{});
        if (get(respond, "networkError")) |flag| if (flag.bool) {
            try mock.push(.{ .network_error = true });
            continue;
        };
        var reply: torn.testing.Reply = .{ .status = @intCast(int(get(respond, "status")) orelse 200) };
        const body = get(respond, "body") orelse V{ .string = "" };
        reply.body = if (body == .string) body.string else try jsonText(a, body);
        if (get(respond, "headers")) |headers| {
            var it = headers.object.iterator();
            while (it.next()) |entry| if (std.ascii.eqlIgnoreCase(entry.key_ptr.*, "retry-after")) {
                reply.retry_after_ms = torn.transport.parseRetryAfter(entry.value_ptr.string, 0);
            };
        }
        try mock.push(reply);
    }
    var clock = torn.testing.VirtualClock.init(int(get(get(scenario, "clock") orelse V.null, "startMs")) orelse 0);
    var engine = try torn.runtime.Client.init(a, std.testing.io, config, mock.transport());
    defer engine.deinit();
    clock.attach(&engine, &mock);
    if (get(scenario, "preload")) |preload| for (preload.array.items) |entry| {
        const key = str(get(entry, "key")) orelse return runner.fail("preload key", .{});
        const index = for (engine.keys, 0..) |candidate, i| {
            if (std.mem.eql(u8, candidate, key)) break i;
        } else return runner.fail("preload key not configured", .{});
        for (get(entry, "sendsAtMs").?.array.items) |at| try engine.noteSend(index, int(at).?);
    };
    const client: torn.Client = .{ .engine = &engine };

    // Build and run the one logical SDK call.
    var filters: std.ArrayList(torn.planner.Argument) = .empty;
    var query: std.ArrayList(u8) = .empty;
    if (get(request, "params")) |params| {
        var it = params.object.iterator();
        while (it.next()) |entry| {
            const value = try valueText(a, entry.value_ptr.*);
            try filters.append(a, .{ .name = entry.key_ptr.*, .value = value });
            try query.append(a, if (query.items.len == 0) '?' else '&');
            try query.appendSlice(a, entry.key_ptr.*);
            try query.append(a, '=');
            try query.appendSlice(a, try torn.planner.percentEncode(a, value));
        }
    }
    const kind = str(get(request, "kind")) orelse return runner.fail("missing kind", .{});
    const resource = str(get(request, "resource")) orelse "";
    var names: std.ArrayList([]const u8) = .empty;
    if (get(request, "selections")) |list| for (list.array.items) |n| try names.append(a, n.string);
    var target: std.ArrayList(torn.planner.Argument) = .empty;
    if (get(request, "id")) |id| try target.append(a, .{ .name = "id", .value = try valueText(a, id) });

    var executions: std.ArrayList(torn.client.Execution) = .empty;
    defer for (executions.items) |*execution| execution.deinit();
    var pages: usize = 0;
    if (std.mem.eql(u8, kind, "selections")) {
        const parsed_resource = std.meta.stringToEnum(torn.planner.Resource, resource) orelse return runner.fail("unknown resource", .{});
        try executions.append(a, try client.execute(.{ .resource = parsed_resource, .selections = names.items, .target = target.items, .filters = filters.items }, .{}));
    } else if (std.mem.eql(u8, kind, "raw")) {
        const path = str(get(request, "path")) orelse return runner.fail("raw path", .{});
        try executions.append(a, try client.rawPath(try std.mem.concat(a, u8, &.{ path, query.items }), .{}));
    } else if (std.mem.eql(u8, kind, "paginate")) {
        const path = str(get(request, "path")) orelse return runner.fail("paginate path", .{});
        var pager = try client.paginate(try std.mem.concat(a, u8, &.{ path, query.items }), .{ .max_pages = if (int(get(request, "maxPages"))) |n| @intCast(n) else null });
        defer pager.deinit();
        while (try pager.next()) |page| {
            try executions.append(a, page);
            pages += 1;
            if (page.failure != null) break;
        }
    } else return runner.fail("unsupported request kind {s}", .{kind});

    // Exchanges: exact ordered sends.
    const expected_sends: usize = if (int(get(expect, "sends"))) |n| @intCast(n) else exchanges.len;
    if (expected_sends != exchanges.len) return runner.fail("scenario sends {d} != exchanges {d}", .{ expected_sends, exchanges.len });
    if (mock.sends() != expected_sends) return runner.fail("sent {d}, expected {d}", .{ mock.sends(), expected_sends });
    for (exchanges, 0..) |exchange, i| {
        const want = get(exchange, "expect") orelse continue;
        const got = mock.request(i);
        if (!std.mem.startsWith(u8, got.url, "https://api.torn.com/")) return runner.fail("send {d}: host {s}", .{ i, got.url });
        if (str(get(want, "method"))) |method| if (!std.mem.eql(u8, method, "GET")) return runner.fail("method {s}", .{method});
        if (str(get(want, "path"))) |path| if (!std.mem.eql(u8, path, got.path())) return runner.fail("send {d}: path {s}, expected {s}", .{ i, got.path(), path });
        if (get(want, "query")) |q| {
            var it = q.object.iterator();
            while (it.next()) |entry| {
                const actual = got.query(entry.key_ptr.*) orelse return runner.fail("send {d}: missing query {s}", .{ i, entry.key_ptr.* });
                const expected = try valueText(a, entry.value_ptr.*);
                if (!std.mem.eql(u8, try percentDecode(a, actual), expected)) return runner.fail("send {d}: query {s}={s}, expected {s}", .{ i, entry.key_ptr.*, actual, expected });
            }
        }
        if (get(want, "absentQuery")) |absent| for (absent.array.items) |name| {
            if (got.query(name.string) != null) return runner.fail("send {d}: query {s} must be absent", .{ i, name.string });
        };
        // P2.1: header auth (`Authorization: ApiKey <key>`) on v1 and v2; never in the URL.
        if (str(get(want, "auth"))) |key| if (!std.mem.eql(u8, got.api_key, key)) return runner.fail("send {d}: wrong key", .{i});
        if (std.mem.indexOf(u8, got.url, got.api_key) != null) return runner.fail("send {d}: key in URL", .{i});
        if (int(get(want, "atMs"))) |at| if ((got.at_ms orelse -1) < at) return runner.fail("send {d}: at {d}ms, expected >= {d}", .{ i, got.at_ms orelse -1, at });
    }

    // Outcome.
    var failure: ?torn.client.Failure = null;
    for (executions.items) |execution| if (execution.failure) |f| {
        failure = f;
    };
    const outcome = str(get(expect, "outcome")) orelse "ok";
    if (std.mem.eql(u8, outcome, "ok")) {
        if (failure) |f| return runner.fail("unexpected failure {f}", .{f});
    } else {
        const f = failure orelse return runner.fail("expected an error", .{});
        if (get(expect, "error")) |want| {
            if (str(get(want, "kind"))) |want_kind| if (!std.mem.eql(u8, want_kind, f.kindName())) return runner.fail("error kind {s}, expected {s}", .{ f.kindName(), want_kind });
            if (int(get(want, "code"))) |code| if (f.api_code == null or f.api_code.? != code) return runner.fail("error code {any}, expected {d}", .{ f.api_code, code });
            if (str(get(want, "requiredAccess"))) |level| if (f.required_access == null or !std.mem.eql(u8, @tagName(f.required_access.?), level)) return runner.fail("required access {any}, expected {s}", .{ f.required_access, level });
        }
    }
    if (get(expect, "data")) |checks| {
        if (executions.items.len == 0) return runner.fail("no data", .{});
        var it = checks.object.iterator();
        while (it.next()) |entry| {
            const actual = dotted(executions.items[0].raw, entry.key_ptr.*) orelse return runner.fail("data {s} missing", .{entry.key_ptr.*});
            if (!try sameJson(a, actual, entry.value_ptr.*)) return runner.fail("data {s} = {s}", .{ entry.key_ptr.*, try jsonText(a, actual) });
        }
    }
    if (get(expect, "keyStates")) |states_json| {
        const states = try engine.keyStates(a);
        var it = states_json.object.iterator();
        while (it.next()) |entry| {
            const index = for (engine.keys, 0..) |candidate, i| {
                if (std.mem.eql(u8, candidate, entry.key_ptr.*)) break i;
            } else return runner.fail("keyStates key not configured", .{});
            if (!std.mem.eql(u8, @tagName(states[index].status), entry.value_ptr.string)) return runner.fail("key {d} state {s}, expected {s}", .{ index, @tagName(states[index].status), entry.value_ptr.string });
        }
    }
    if (int(get(expect, "minElapsedMs"))) |min| if (clock.elapsed() < min) return runner.fail("elapsed {d} < {d}", .{ clock.elapsed(), min });
    if (int(get(expect, "maxElapsedMs"))) |max| if (clock.elapsed() > max) return runner.fail("elapsed {d} > {d}", .{ clock.elapsed(), max });
    if (int(get(expect, "pages"))) |want| if (pages != want) return runner.fail("pages {d}, expected {d}", .{ pages, want });
    if (str(get(expect, "typedDecode"))) |want| {
        if (executions.items.len == 0) return runner.fail("typed decode without a result", .{});
        var path: std.ArrayList([]const u8) = .empty;
        if (str(get(expect, "unknownEnum"))) |dotted_path| {
            var it = std.mem.splitScalar(u8, dotted_path, '.');
            while (it.next()) |part| try path.append(a, part);
        }
        for (names.items) |name| {
            const typed = typedDecode(&executions.items[0], resource, name, path.items);
            if (!typed.found) return runner.fail("no typed model for {s}/{s}", .{ resource, name });
            if (typed.decoded != std.mem.eql(u8, want, "ok")) return runner.fail("typed decode of {s} = {}", .{ name, typed.decoded });
            if (str(get(expect, "unknownEnum"))) |dotted_path| {
                const text = typed.unknown orelse return runner.fail("{s} is not an unknown enum", .{dotted_path});
                const raw_value = dotted(executions.items[0].raw, dotted_path) orelse return runner.fail("raw {s} missing", .{dotted_path});
                if (raw_value != .string or !std.mem.eql(u8, raw_value.string, text)) return runner.fail("unknown text not preserved", .{});
            }
        }
    } else if (get(expect, "unknownEnum") != null) return runner.fail("unknownEnum without typedDecode", .{});
    if (str(get(expect, "secretNotIn"))) |secret| {
        var outputs: std.ArrayList([]const u8) = .empty;
        if (failure) |f| {
            try outputs.append(a, try std.fmt.allocPrint(a, "{f}", .{f}));
            try outputs.append(a, try std.fmt.allocPrint(a, "{any}", .{f}));
            try outputs.append(a, try std.json.Stringify.valueAlloc(a, f, .{}));
            if (f.body) |body| try outputs.append(a, body);
            try outputs.append(a, f.api_message);
            try outputs.append(a, f.diagnostic.excerpt());
        }
        for (executions.items) |execution| for (execution.reports) |report| try outputs.append(a, try std.fmt.allocPrint(a, "{any}", .{report}));
        for (try engine.keyStates(a)) |state| {
            try outputs.append(a, try std.fmt.allocPrint(a, "{f}", .{state}));
            try outputs.append(a, try std.fmt.allocPrint(a, "{any}", .{state}));
            try outputs.append(a, try std.json.Stringify.valueAlloc(a, state, .{}));
        }
        try outputs.append(a, try std.fmt.allocPrint(a, "{f}", .{engine}));
        try outputs.append(a, try std.fmt.allocPrint(a, "{f}", .{config}));
        try outputs.append(a, try std.json.Stringify.valueAlloc(a, config, .{}));
        for (0..mock.sends()) |i| try outputs.append(a, try std.fmt.allocPrint(a, "{f}", .{mock.request(i)}));
        for (outputs.items) |text| if (std.mem.indexOf(u8, text, secret) != null) return runner.fail("secret disclosed in: {s}", .{text});
    }
}

test "shared conformance scenarios (P9.1)" {
    const io = std.testing.io;
    var dir = try std.Io.Dir.cwd().openDir(io, options.dir, .{ .iterate = true });
    defer dir.close(io);
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    var files: std.ArrayList([]const u8) = .empty;
    var it = dir.iterate();
    while (try it.next(io)) |entry| if (entry.kind == .file and std.mem.endsWith(u8, entry.name, ".json")) try files.append(a, try a.dupe(u8, entry.name));
    std.mem.sort([]const u8, files.items, {}, struct {
        fn less(_: void, x: []const u8, y: []const u8) bool {
            return std.mem.lessThan(u8, x, y);
        }
    }.less);
    try std.testing.expect(files.items.len > 0);
    var total: usize = 0;
    var failed: std.ArrayList([]const u8) = .empty;
    var seen: std.StringHashMapUnmanaged(void) = .empty;
    for (files.items) |file| {
        const bytes = try dir.readFileAlloc(io, file, a, .limited(16 * 1024 * 1024));
        const doc = try std.json.parseFromSliceLeaky(V, a, bytes, .{});
        for ((get(doc, "scenarios") orelse return error.MissingScenarios).array.items) |scenario| {
            total += 1;
            const id = str(get(scenario, "id")) orelse return error.MissingScenarioId;
            if ((try seen.getOrPut(a, id)).found_existing) return error.DuplicateScenarioId;
            // Each scenario gets its own leak-checked allocator arena.
            var scenario_arena = std.heap.ArenaAllocator.init(std.testing.allocator);
            defer scenario_arena.deinit();
            runScenario(scenario_arena.allocator(), scenario) catch |err| {
                std.debug.print("conformance {s}: FAILED ({s})\n", .{ id, @errorName(err) });
                try failed.append(a, id);
                continue;
            };
        }
    }
    std.debug.print("conformance: {d}/{d} scenarios passed\n", .{ total - failed.items.len, total });
    try std.testing.expectEqual(@as(usize, 0), failed.items.len);
}
