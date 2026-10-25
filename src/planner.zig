const std = @import("std");
const data = @import("generated/routing.zig");

pub const Resource = enum { user, faction, company, forum, key, market, property, racing, torn };
pub const Argument = struct { name: []const u8, value: []const u8 };
pub const Mode = enum { automatic, v1 };
pub const Input = struct {
    resource: Resource,
    selections: []const []const u8,
    target: []const Argument = &.{},
    filters: []const Argument = &.{},
    mode: Mode = .automatic,
    force_direct: bool = false,
    check_context: ?*anyopaque = null,
    check_fn: ?*const fn (?*anyopaque) anyerror!void = null,
};
fn checkpoint(input: Input) !void {
    if (input.check_fn) |check| try check(input.check_context);
}
pub const Media = enum { json, csv };
pub const Call = struct {
    path: []const u8,
    query: []const u8,
    selections: []const []const u8,
    operation: []const u8,
    version: u8,
    media: Media,
    fallback_supported: bool,
    target: []const Argument = &.{},
    filters: []const Argument = &.{},
};
/// All strings and slices in calls are owned by this arena, independent of input.
pub const Plan = struct {
    arena: std.heap.ArenaAllocator,
    calls: []const Call,
    pub fn deinit(self: *Plan) void {
        self.arena.deinit();
        self.* = undefined;
    }
};

const Value = std.json.Value;
fn field(v: Value, name: []const u8) Value {
    return v.object.get(name) orelse .null;
}
fn string(v: Value) []const u8 {
    return if (v == .string) v.string else "";
}
fn flag(v: Value, name: []const u8) bool {
    const f = field(v, name);
    return f == .bool and f.bool;
}
fn same(a: []const u8, b: []const u8) bool {
    return std.mem.eql(u8, a, b);
}
fn contains(v: Value, name: []const u8) bool {
    if (v != .array) return false;
    for (v.array.items) |entry| if (same(string(entry), name)) return true;
    return false;
}
fn findArg(args: []const Argument, name: []const u8) ?[]const u8 {
    for (args) |arg| if (same(arg.name, name)) return arg.value;
    return null;
}
fn validateArgs(args: []const Argument) !void {
    for (args, 0..) |arg, i| {
        if (arg.value.len == 0) return error.EmptyArgument;
        for (args[0..i]) |prev| if (same(prev.name, arg.name)) return error.DuplicateArgument;
    }
}
pub fn v1Contains(resource: Resource, selection: []const u8) bool {
    for (data.v1_catalog) |entry| if (same(entry.resource, @tagName(resource)) and same(entry.name, selection)) return true;
    return false;
}
fn capability(manifest: Value, resource: Resource, name: []const u8) ?Value {
    for (field(manifest, "capabilities").array.items) |entry| {
        if (same(string(field(entry, "resource")), @tagName(resource)) and same(string(field(entry, "name")), name)) return entry;
    }
    return null;
}
fn lessThan(_: void, a: []const u8, b: []const u8) bool {
    return std.mem.lessThan(u8, a, b);
}

/// RFC 3986 encoding of one path or query value; commas are escaped as data.
pub fn percentEncode(allocator: std.mem.Allocator, value: []const u8) ![]const u8 {
    return percentEncodeChecked(allocator, value, null);
}
fn percentEncodeChecked(allocator: std.mem.Allocator, value: []const u8, input: ?Input) ![]const u8 {
    var out: std.ArrayList(u8) = .empty;
    errdefer out.deinit(allocator);
    const hex = "0123456789ABCDEF";
    for (value, 0..) |c, i| {
        if (i % 1024 == 0) if (input) |in| try checkpoint(in);
        if (std.ascii.isAlphanumeric(c) or c == '-' or c == '.' or c == '_' or c == '~') {
            try out.append(allocator, c);
        } else {
            try out.appendSlice(allocator, &.{ '%', hex[c >> 4], hex[c & 15] });
        }
    }
    return out.toOwnedSlice(allocator);
}
fn appendParam(a: std.mem.Allocator, out: *std.ArrayList(u8), name: []const u8, value: []const u8, input: Input) !void {
    if (out.items.len > 0) try out.append(a, '&');
    try out.appendSlice(a, try percentEncodeChecked(a, name, input));
    try out.append(a, '=');
    try out.appendSlice(a, try percentEncodeChecked(a, value, input));
}
fn join(a: std.mem.Allocator, values: []const []const u8) ![]const u8 {
    return std.mem.join(a, ",", values);
}
fn copyNames(a: std.mem.Allocator, values: []const []const u8) ![]const []const u8 {
    const result = try a.alloc([]const u8, values.len);
    for (values, result) |v, *r| r.* = try a.dupe(u8, v);
    return result;
}
fn copyArgs(a: std.mem.Allocator, values: []const Argument) ![]const Argument {
    const result = try a.alloc(Argument, values.len);
    for (values, result) |v, *r| r.* = .{ .name = try a.dupe(u8, v.name), .value = try a.dupe(u8, v.value) };
    return result;
}
fn finishPlan(arena: *std.heap.ArenaAllocator, calls: *std.ArrayList(Call), input: Input) !Plan {
    const a = arena.allocator();
    for (calls.items) |*call| {
        try checkpoint(input);
        call.target = try copyArgs(a, input.target);
        call.filters = try copyArgs(a, input.filters);
    }
    return .{ .arena = arena.*, .calls = try calls.toOwnedSlice(a) };
}
fn genericParameters(resource: Resource) []const []const u8 {
    return switch (resource) {
        .user, .faction => &.{ "cat", "comment", "filters", "from", "limit", "offset", "sort", "stat", "striptags", "timestamp", "to" },
        .company => &.{ "cat", "comment", "limit", "striptags", "offset", "timestamp" },
        .forum => &.{ "comment", "striptags", "limit", "sort", "from", "to", "offset", "timestamp" },
        .key => &.{ "comment", "limit", "offset", "timestamp" },
        .market => &.{ "cat", "bonus", "comment", "sort", "offset", "limit", "timestamp" },
        .property => &.{ "comment", "timestamp" },
        .racing => &.{ "comment", "limit", "sort", "to", "from", "cat", "offset", "timestamp" },
        .torn => &.{ "comment", "striptags", "limit", "to", "from", "sort", "cat", "offset", "timestamp" },
    };
}
fn genericOperation(resource: Resource) []const u8 {
    return switch (resource) {
        .user => "getUserGeneric",
        .faction => "getFactionGeneric",
        .company => "getCompanyGeneric",
        .forum => "getForumGeneric",
        .key => "getKeyGeneric",
        .market => "getMarketGeneric",
        .property => "getPropertyGeneric",
        .racing => "getRacingGeneric",
        .torn => "getTornGeneric",
    };
}
const Domain = struct { name: []const u8, required: bool };
fn domain(cap: Value, name: []const u8) Domain {
    if (flag(cap, "legacy")) return .{ .name = "id", .required = false };
    if (same(name, "timestamp") or same(name, "lookup")) return .{ .name = "neutral", .required = false };
    var optional = false;
    var result: []const u8 = "self";
    for (field(cap, "endpoints").array.items) |endpoint| {
        const required = field(endpoint, "required");
        if (required == .null or (required == .array and required.array.items.len == 0)) {
            optional = true;
        } else if (required == .array) for (required.array.items) |r| {
            const n = string(r);
            if (!same(n, "id")) return .{ .name = n, .required = !hasOptionalEndpoint(cap) };
            result = "id";
        };
    }
    // The explicit generic-only overrides use generic ID interpretation.
    if (same(name, "factionbalance") or same(name, "itemmod") or same(name, "dirtbombs")) result = "id";
    return .{ .name = result, .required = !optional };
}
fn hasOptionalEndpoint(cap: Value) bool {
    for (field(cap, "endpoints").array.items) |endpoint| {
        const required = field(endpoint, "required");
        if (required == .null or (required == .array and required.array.items.len == 0)) return true;
    }
    return false;
}
fn inStrings(values: []const []const u8, v: []const u8) bool {
    for (values) |item| if (same(item, v)) return true;
    return false;
}
fn query(a: std.mem.Allocator, input: Input, names: []const []const u8, allowed: Value, generic: bool, id: ?[]const u8) ![]const u8 {
    try checkpoint(input);
    var out: std.ArrayList(u8) = .empty;
    if (names.len > 0) try appendParam(a, &out, "selections", try join(a, names), input);
    if (id) |value| try appendParam(a, &out, "id", value, input);
    const filters = try a.dupe(Argument, input.filters);
    std.mem.sort(Argument, filters, {}, struct {
        fn less(_: void, x: Argument, y: Argument) bool {
            return std.mem.lessThan(u8, x.name, y.name);
        }
    }.less);
    for (filters) |arg| {
        try checkpoint(input);
        if (same(arg.name, "key") or same(arg.name, "selections") or same(arg.name, "id") or same(arg.name, "legacy")) return error.ReservedParameter;
        if (generic) {
            if (!inStrings(genericParameters(input.resource), arg.name)) return error.UnsupportedParameter;
        } else if (!contains(allowed, arg.name)) return error.UnsupportedParameter;
        try appendParam(a, &out, arg.name, arg.value, input);
    }
    return out.toOwnedSlice(a);
}
fn legacyCall(a: std.mem.Allocator, input: Input, names: []const []const u8) !Call {
    try checkpoint(input);
    for (names) |name| if (!v1Contains(input.resource, name)) return error.UnsupportedV1Selection;
    for (input.target) |arg| if (!same(arg.name, "id")) return error.UnsupportedTarget;
    const catalog = try std.json.parseFromSlice(Value, a, data.v1_json, .{});
    var q: std.ArrayList(u8) = .empty;
    try appendParam(a, &q, "selections", try join(a, names), input);
    const filters = try a.dupe(Argument, input.filters);
    std.mem.sort(Argument, filters, {}, struct {
        fn less(_: void, x: Argument, y: Argument) bool {
            return std.mem.lessThan(u8, x.name, y.name);
        }
    }.less);
    for (filters) |arg| {
        try checkpoint(input);
        if (!contains(field(catalog.value, "filters"), arg.name) and !same(arg.name, "comment")) return error.UnsupportedParameter;
        try appendParam(a, &q, arg.name, arg.value, input);
    }
    const id = findArg(input.target, "id") orelse "";
    return .{
        .path = try std.fmt.allocPrint(a, "/{s}/{s}", .{ @tagName(input.resource), try percentEncodeChecked(a, id, input) }),
        .query = try q.toOwnedSlice(a),
        .selections = try copyNames(a, names),
        .operation = "v1Selections",
        .version = 1,
        .media = .json,
        .fallback_supported = true,
    };
}
fn endpointScore(endpoint: Value, targets: []const Argument) ?usize {
    const required = field(endpoint, "required");
    var score: usize = 0;
    if (required == .array) for (required.array.items) |r| {
        const name = string(r);
        if (findArg(targets, name) == null) return null;
        score += 1;
    };
    // A non-matching explicit ID must never be dropped by choosing a self endpoint.
    for (targets) |arg| if (!contains(required, arg.name)) return null;
    return score;
}
fn directCall(a: std.mem.Allocator, input: Input, cap: Value, name: []const u8) !Call {
    try checkpoint(input);
    var selected: ?Value = null;
    var best: usize = 0;
    for (field(cap, "endpoints").array.items) |endpoint| {
        if (endpointScore(endpoint, input.target)) |score| {
            if (selected == null or score > best) {
                selected = endpoint;
                best = score;
            }
        }
    }
    const endpoint = selected orelse return error.MissingOrConflictingTarget;
    const template = string(field(endpoint, "path"));
    var path: std.ArrayList(u8) = .empty;
    var pos: usize = 0;
    while (pos < template.len) {
        try checkpoint(input);
        if (template[pos] != '{') {
            try path.append(a, template[pos]);
            pos += 1;
            continue;
        }
        const end = std.mem.indexOfScalarPos(u8, template, pos + 1, '}') orelse return error.InvalidContract;
        const value = findArg(input.target, template[pos + 1 .. end]) orelse return error.MissingOrConflictingTarget;
        try path.appendSlice(a, try percentEncodeChecked(a, value, input));
        pos = end + 1;
    }
    return .{
        .path = try path.toOwnedSlice(a),
        .query = try query(a, input, &.{}, field(endpoint, "parameters"), false, null),
        .selections = try copyNames(a, &.{name}),
        .operation = try a.dupe(u8, string(field(endpoint, "id"))),
        .version = 2,
        .media = if (flag(cap, "csv")) .csv else .json,
        .fallback_supported = v1Contains(input.resource, name),
    };
}

/// Build a deterministic plan. All selections share one target and filter set.
pub fn build(allocator: std.mem.Allocator, input: Input) !Plan {
    try checkpoint(input);
    if (input.selections.len == 0) return error.EmptySelections;
    try validateArgs(input.target);
    try validateArgs(input.filters);
    var arena = std.heap.ArenaAllocator.init(allocator);
    errdefer arena.deinit();
    const a = arena.allocator();
    const manifest = try std.json.parseFromSlice(Value, a, data.manifest_json, .{});
    try checkpoint(input);
    const sorted = try a.dupe([]const u8, input.selections);
    for (sorted) |name| {
        try checkpoint(input);
        if (name.len == 0) return error.UnknownSelection;
    }
    std.mem.sort([]const u8, sorted, {}, lessThan);
    var names: std.ArrayList([]const u8) = .empty;
    for (sorted) |name| if (names.items.len == 0 or !same(names.items[names.items.len - 1], name)) try names.append(a, name);
    var calls: std.ArrayList(Call) = .empty;
    if (input.mode == .v1) {
        try calls.append(a, try legacyCall(a, input, names.items));
        return finishPlan(&arena, &calls, input);
    }
    var generic: std.ArrayList([]const u8) = .empty;
    var legacy: std.ArrayList([]const u8) = .empty;
    if (input.target.len > 1) return error.ConflictingTargetDomains;
    var shared_domain: ?[]const u8 = null;
    for (names.items) |name| {
        try checkpoint(input);
        if (capability(manifest.value, input.resource, name)) |cap| {
            const d = domain(cap, name);
            if (d.required and input.target.len == 0) return error.MissingOrConflictingTarget;
            if (input.target.len > 0 and !same(d.name, "neutral")) {
                if (same(d.name, "self")) return error.MissingOrConflictingTarget;
                if (shared_domain) |previous| {
                    if (!same(previous, d.name)) return error.ConflictingTargetDomains;
                } else shared_domain = d.name;
                const arg = input.target[0];
                if (!same(arg.name, "id") and !same(arg.name, d.name)) return error.MissingOrConflictingTarget;
            }
        }
    }
    for (names.items) |name| {
        try checkpoint(input);
        const cap = capability(manifest.value, input.resource, name) orelse {
            if (!v1Contains(input.resource, name)) return error.UnknownSelection;
            try legacy.append(a, name);
            continue;
        };
        if (flag(cap, "legacy")) {
            try legacy.append(a, name);
            continue;
        }
        if (flag(cap, "generic") and !flag(cap, "standalone") and !input.force_direct) {
            try generic.append(a, name);
        } else {
            if (input.target.len > 0 and (same(name, "timestamp") or same(name, "lookup"))) {
                var neutral = input;
                neutral.target = &.{};
                try calls.append(a, try directCall(a, neutral, cap, name));
            } else {
                var direct = input;
                var translated: [1]Argument = undefined;
                if (input.target.len == 1 and same(input.target[0].name, "id")) {
                    translated[0] = .{ .name = domain(cap, name).name, .value = input.target[0].value };
                    direct.target = &translated;
                }
                try calls.append(a, try directCall(a, direct, cap, name));
            }
        }
    }
    if (generic.items.len > 0) {
        var fallback = true;
        var generic_has_domain = false;
        for (generic.items) |name| {
            fallback = fallback and v1Contains(input.resource, name);
            const cap = capability(manifest.value, input.resource, name).?;
            generic_has_domain = generic_has_domain or !same(domain(cap, name).name, "neutral");
        }
        try calls.insert(a, 0, .{
            .path = try std.fmt.allocPrint(a, "/{s}", .{@tagName(input.resource)}),
            .query = try query(a, input, generic.items, .null, true, if (input.target.len == 1 and generic_has_domain) input.target[0].value else null),
            .selections = try copyNames(a, generic.items),
            .operation = try a.dupe(u8, genericOperation(input.resource)),
            .version = 2,
            .media = .json,
            .fallback_supported = fallback,
        });
    }
    if (legacy.items.len > 0) try calls.append(a, try legacyCall(a, input, legacy.items));
    return finishPlan(&arena, &calls, input);
}

test "profile and job combine, normalize and own all input strings" {
    var p = try build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "profile", "job", "profile" }, .target = &.{.{ .name = "id", .value = "123" }} });
    defer p.deinit();
    try std.testing.expectEqual(@as(usize, 1), p.calls.len);
    try std.testing.expectEqualStrings("/user", p.calls[0].path);
    try std.testing.expectEqualStrings("selections=job%2Cprofile&id=123", p.calls[0].query);
}

test "safe encoding" {
    const encoded = try percentEncode(std.testing.allocator, "a/b?c= d,é");
    defer std.testing.allocator.free(encoded);
    try std.testing.expectEqualStrings("a%2Fb%3Fc%3D%20d%2C%C3%A9", encoded);
}

test "all explicit v1 catalog entries have a v1 path and a single contribution" {
    try std.testing.expectEqual(@as(usize, 184), data.v1_catalog.len);
    for (data.v1_catalog) |entry| {
        const resource = std.meta.stringToEnum(Resource, entry.resource).?;
        var plan = try build(std.testing.allocator, .{ .resource = resource, .selections = &.{entry.name}, .mode = .v1, .target = &.{.{ .name = "id", .value = "123" }} });
        defer plan.deinit();
        try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
        try std.testing.expectEqual(@as(u8, 1), plan.calls[0].version);
        const expected_path = try std.fmt.allocPrint(std.testing.allocator, "/{s}/123", .{entry.resource});
        defer std.testing.allocator.free(expected_path);
        try std.testing.expectEqualStrings(expected_path, plan.calls[0].path);
        try std.testing.expectEqualStrings(entry.name, plan.calls[0].selections[0]);
    }
}

test "domain boundaries reject user versus crime and trade IDs" {
    try std.testing.expectError(error.ConflictingTargetDomains, build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "profile", "crimes" }, .target = &.{.{ .name = "id", .value = "123" }} }));
    try std.testing.expectError(error.ConflictingTargetDomains, build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "crimes", "trade" }, .target = &.{.{ .name = "id", .value = "123" }} }));
    try std.testing.expectError(error.MissingOrConflictingTarget, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"crimes"} }));
    try std.testing.expectError(error.MissingOrConflictingTarget, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"trade"}, .target = &.{.{ .name = "crimeId", .value = "123" }} }));
    try std.testing.expectError(error.MissingOrConflictingTarget, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"battlestats"}, .target = &.{.{ .name = "id", .value = "123" }} }));
    var plan = try build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "timestamp", "crimes" }, .target = &.{.{ .name = "crimeId", .value = "12" }} });
    defer plan.deinit();
    try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
    try std.testing.expectEqualStrings("selections=crimes%2Ctimestamp&id=12", plan.calls[0].query);
}

test "direct company type routing does not disable company batching" {
    var plan = try build(std.testing.allocator, .{ .resource = .company, .selections = &.{ "companies", "timestamp" }, .target = &.{.{ .name = "typeId", .value = "5" }} });
    defer plan.deinit();
    try std.testing.expectEqual(@as(usize, 2), plan.calls.len);
    try std.testing.expectEqualStrings("/company", plan.calls[0].path);
    try std.testing.expectEqualStrings("selections=timestamp", plan.calls[0].query);
    try std.testing.expectEqualStrings("/company/5/companies", plan.calls[1].path);
    var normal = try build(std.testing.allocator, .{ .resource = .company, .selections = &.{ "profile", "employees", "timestamp" } });
    defer normal.deinit();
    try std.testing.expectEqual(@as(usize, 1), normal.calls.len);
    try std.testing.expectEqualStrings("selections=employees%2Cprofile%2Ctimestamp", normal.calls[0].query);
}

test "generic spelling overrides and direct-only variants remain distinct" {
    const cases = .{
        .{ Resource.user, "itemmod", "/user", "selections=itemmod" },
        .{ Resource.user, "itemmods", "/user/itemmods", "" },
        .{ Resource.user, "factionbalance", "/user", "selections=factionbalance" },
        .{ Resource.faction, "dirtbombs", "/faction", "selections=dirtbombs" },
        .{ Resource.faction, "dirtybombs", "/faction/dirtybombs", "" },
    };
    inline for (cases) |c| {
        var plan = try build(std.testing.allocator, .{ .resource = c[0], .selections = &.{c[1]} });
        defer plan.deinit();
        try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
        try std.testing.expectEqualStrings(c[2], plan.calls[0].path);
        try std.testing.expectEqualStrings(c[3], plan.calls[0].query);
    }
}

test "dedicated CSV and standalone calls stay separate" {
    inline for (.{ Resource.company, Resource.faction, Resource.user }) |resource| {
        var plan = try build(std.testing.allocator, .{ .resource = resource, .selections = &.{ "timestamp", "snapshot" } });
        defer plan.deinit();
        try std.testing.expectEqual(@as(usize, 2), plan.calls.len);
        try std.testing.expectEqual(Media.json, plan.calls[0].media);
        try std.testing.expectEqual(Media.csv, plan.calls[1].media);
        try std.testing.expectEqualStrings("", plan.calls[1].query);
    }
}

test "generic versus direct versus v1 parameter allowlists" {
    try std.testing.expectError(error.UnsupportedParameter, build(std.testing.allocator, .{ .resource = .company, .selections = &.{"profile"}, .filters = &.{.{ .name = "sort", .value = "ASC" }} }));
    try std.testing.expectError(error.UnsupportedParameter, build(std.testing.allocator, .{ .resource = .property, .selections = &.{"timestamp"}, .filters = &.{.{ .name = "limit", .value = "1" }} }));
    try std.testing.expectError(error.ReservedParameter, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"profile"}, .filters = &.{.{ .name = "key", .value = "credential" }} }));
    try std.testing.expectError(error.UnsupportedParameter, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"snapshot"}, .filters = &.{.{ .name = "limit", .value = "1" }} }));
    try std.testing.expectError(error.UnsupportedParameter, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"profile"}, .mode = .v1, .filters = &.{.{ .name = "bonus", .value = "1" }} }));
}

test "unknown and legacy-only names do not receive blanket fallback" {
    try std.testing.expect(!v1Contains(.forum, "timestamp"));
    try std.testing.expect(!v1Contains(.user, "unlisted"));
    try std.testing.expect(v1Contains(.faction, "armorynews"));
    var plan = try build(std.testing.allocator, .{ .resource = .faction, .selections = &.{ "timestamp", "armorynews" } });
    defer plan.deinit();
    try std.testing.expectEqual(@as(usize, 2), plan.calls.len);
    try std.testing.expectEqual(@as(u8, 2), plan.calls[0].version);
    try std.testing.expectEqual(@as(u8, 1), plan.calls[1].version);
    try std.testing.expectError(error.UnknownSelection, build(std.testing.allocator, .{ .resource = .forum, .selections = &.{"armorynews"} }));
    try std.testing.expectError(error.UnsupportedV1Selection, build(std.testing.allocator, .{ .resource = .racing, .selections = &.{"timestamp"}, .mode = .v1 }));
}

test "multi-ID arrays are encoded as one comma-separated path value" {
    var plan = try build(std.testing.allocator, .{ .resource = .torn, .selections = &.{"itemdetails"}, .target = &.{.{ .name = "ids", .value = "1,2,3" }} });
    defer plan.deinit();
    try std.testing.expectEqualStrings("/torn", plan.calls[0].path);
    try std.testing.expectEqualStrings("selections=itemdetails&id=1%2C2%2C3", plan.calls[0].query);
}

fn allocationScenario(a: std.mem.Allocator) !void {
    var plan = try build(a, .{ .resource = .user, .selections = &.{ "profile", "job", "timestamp" }, .filters = &.{.{ .name = "comment", .value = "a/b & ☀" }} });
    defer plan.deinit();
}
test "every planner allocation failure releases all partial ownership" {
    try std.testing.checkAllAllocationFailures(std.testing.allocator, allocationScenario, .{});
}

fn variedAllocationScenario(a: std.mem.Allocator, mode: u8) !void {
    var plan = try build(a, switch (mode) {
        0 => .{ .resource = .company, .selections = &.{ "companies", "timestamp" }, .target = &.{.{ .name = "id", .value = "5" }} },
        1 => .{ .resource = .user, .selections = &.{ "snapshot", "timestamp" } },
        else => .{ .resource = .faction, .selections = &.{ "armorynews", "armor" }, .mode = .v1, .target = &.{.{ .name = "id", .value = "42" }}, .filters = &.{.{ .name = "from", .value = "100" }} },
    });
    defer plan.deinit();
}
test "direct CSV and v1 plan allocation failures are fully cleaned up" {
    // Arena growth may resize in place depending on allocator address layout.
    // Disable that optimization to enumerate deterministic allocation points.
    var backing = std.testing.allocator;
    const stable: std.mem.Allocator = .{ .ptr = &backing, .vtable = &.{
        .alloc = struct {
            fn alloc(ctx: *anyopaque, len: usize, alignment: std.mem.Alignment, address: usize) ?[*]u8 {
                const allocator: *std.mem.Allocator = @ptrCast(@alignCast(ctx));
                return allocator.rawAlloc(len, alignment, address);
            }
        }.alloc,
        .resize = std.mem.Allocator.noResize,
        .remap = std.mem.Allocator.noRemap,
        .free = struct {
            fn free(ctx: *anyopaque, memory: []u8, alignment: std.mem.Alignment, address: usize) void {
                const allocator: *std.mem.Allocator = @ptrCast(@alignCast(ctx));
                allocator.rawFree(memory, alignment, address);
            }
        }.free,
    } };
    for (0..3) |i| try std.testing.checkAllAllocationFailures(stable, variedAllocationScenario, .{@as(u8, @intCast(i))});
}

test "individual stock forces detailed endpoint and distinct ID semantics" {
    var plan = try build(std.testing.allocator, .{ .resource = .torn, .selections = &.{"stocks"}, .target = &.{.{ .name = "stockId", .value = "1" }}, .force_direct = true });
    defer plan.deinit();
    try std.testing.expectEqualStrings("/torn/1/stocks", plan.calls[0].path);
    try std.testing.expectEqualStrings("getSpecificTornStock", plan.calls[0].operation);
}

test "query argument order is deterministic for explicit v1" {
    var plan = try build(std.testing.allocator, .{ .resource = .user, .selections = &.{"profile"}, .mode = .v1, .filters = &.{ .{ .name = "to", .value = "100" }, .{ .name = "from", .value = "10" } } });
    defer plan.deinit();
    try std.testing.expectEqualStrings("selections=profile&from=10&to=100", plan.calls[0].query);
}

test "percent encoding fuzz property round-trips arbitrary bytes" {
    try std.testing.fuzz({}, encodeFuzz, .{});
}
fn encodeFuzz(_: void, smith: *std.testing.Smith) !void {
    var buffer: [255]u8 = undefined;
    const bytes = buffer[0..smith.value(u8)];
    smith.bytes(bytes);
    const encoded = try percentEncode(std.testing.allocator, bytes);
    defer std.testing.allocator.free(encoded);
    var i: usize = 0;
    var j: usize = 0;
    while (i < encoded.len) {
        const c = encoded[i];
        if (c == '%') {
            try std.testing.expect(i + 2 < encoded.len);
            const decoded = try std.fmt.parseInt(u8, encoded[i + 1 .. i + 3], 16);
            try std.testing.expectEqual(bytes[j], decoded);
            i += 3;
        } else {
            try std.testing.expect(std.ascii.isAlphanumeric(c) or c == '-' or c == '_' or c == '.' or c == '~');
            try std.testing.expectEqual(bytes[j], c);
            i += 1;
        }
        j += 1;
    }
    try std.testing.expectEqual(bytes.len, j);
}

test "cancellation at every serialization checkpoint releases partial plans" {
    const State = struct {
        count: usize = 0,
        cancel_at: ?usize = null,
        fn check(context: ?*anyopaque) !void {
            const self: *@This() = @ptrCast(@alignCast(context.?));
            const at = self.count;
            self.count += 1;
            if (self.cancel_at == at) return error.Canceled;
        }
    };
    var state: State = .{};
    var long_filter: [16384]u8 = undefined;
    @memset(&long_filter, ' ');
    const input: Input = .{
        .resource = .user,
        .selections = &.{ "profile", "job", "timestamp" },
        .filters = &.{.{ .name = "comment", .value = &long_filter }},
        .check_context = &state,
        .check_fn = State.check,
    };
    var baseline = try build(std.testing.allocator, input);
    baseline.deinit();
    const checkpoints = state.count;
    try std.testing.expect(checkpoints > 20);
    for (0..checkpoints) |at| {
        state = .{ .cancel_at = at };
        try std.testing.expectError(error.Canceled, build(std.testing.allocator, input));
    }
}
