const std = @import("std");
const data = @import("generated/routing.zig");
const shared = @import("generated/shared.zig");

pub const Resource = enum { user, faction, company, forum, key, market, property, racing, torn };
pub const Argument = struct { name: []const u8, value: []const u8 };
pub const Mode = enum { automatic, v1 };
pub const AccessLevel = shared.AccessLevel;
pub const Input = struct {
    resource: Resource,
    selections: []const []const u8,
    target: []const Argument = &.{},
    filters: []const Argument = &.{},
    mode: Mode = .automatic,
    force_direct: bool = false,
    /// v1 mode normally requires catalog membership; Torn's code 22 ("only available in
    /// API v1") is authoritative, so the reroute (P4.3) plans unlisted names too.
    allow_unlisted_v1: bool = false,
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
    /// Highest known access level among the call's selections (P6.1); null if none known.
    access_level: ?AccessLevel = null,
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

const Capability = data.Capability;
fn same(a: []const u8, b: []const u8) bool {
    return std.mem.eql(u8, a, b);
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
/// Precomputed routing capability of a selection, or null for names this SDK does not know.
pub fn capability(resource: Resource, name: []const u8) ?*const Capability {
    for (&data.capabilities) |*entry| {
        if (same(entry.resource, @tagName(resource)) and same(entry.name, name)) return entry;
    }
    return null;
}
/// Required key access level of a selection (P6.1); null when unknown or unlisted.
pub fn selectionAccess(resource: Resource, name: []const u8) ?AccessLevel {
    return if (capability(resource, name)) |cap| cap.access_level else null;
}
/// True when `have` satisfies `need`. `custom` keys and requirements are incomparable
/// and never cause a client-side refusal.
pub fn accessSatisfies(have: AccessLevel, need: AccessLevel) bool {
    if (have == .custom or need == .custom) return true;
    return @backingInt(have) >= @backingInt(need);
}
fn maxAccess(current: ?AccessLevel, next: ?AccessLevel) ?AccessLevel {
    const n = next orelse return current;
    if (n == .custom) return current;
    const c = current orelse return n;
    return if (@backingInt(n) > @backingInt(c)) n else c;
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
/// Parameters the generic `/{resource}` endpoint documents. Used only for routing
/// decisions; filters outside this list are still forwarded verbatim (P1.5).
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
fn pathDomain(cap: *const Capability, name: []const u8) Domain {
    var d = domain(cap, name);
    if (domainOverride(cap, name)) |entry| d.name = entry.name;
    return d;
}
fn domainOverride(cap: *const Capability, name: []const u8) ?data.IdDomain {
    for (data.id_domains) |entry| if (same(entry.resource, cap.resource) and same(entry.selection, name)) return entry;
    return null;
}
fn domainParameter(cap: *const Capability, name: []const u8) []const u8 {
    return if (domainOverride(cap, name)) |entry| entry.parameter else domain(cap, name).name;
}
fn directOverride(resource: Resource, name: []const u8) bool {
    for (data.force_direct) |entry| {
        const slash = std.mem.indexOfScalar(u8, entry, '/').?;
        if (same(entry[0..slash], @tagName(resource)) and same(entry[slash + 1 ..], name)) return true;
    }
    return false;
}
fn queryRequirements(input: Input, selection: []const u8) !bool {
    var compatible_generic = true;
    for (data.required_queries) |required| {
        if (!same(required.resource, @tagName(input.resource)) or !same(required.selection, selection)) continue;
        const value = findArg(input.filters, required.parameter) orelse {
            if (required.required) return error.MissingRequiredParameter;
            continue;
        };
        if (required.choices.len > 0 and !inStrings(required.choices, value)) return error.InvalidParameterValue;
        if (!inStrings(genericParameters(input.resource), required.parameter)) compatible_generic = false;
    }
    return compatible_generic;
}
fn requiredEmpty(required: ?[]const []const u8) bool {
    return if (required) |r| r.len == 0 else true;
}
fn domain(cap: *const Capability, name: []const u8) Domain {
    if (cap.legacy) return .{ .name = "id", .required = false };
    if (same(name, "timestamp") or same(name, "lookup")) return .{ .name = "neutral", .required = false };
    var optional = false;
    var result: []const u8 = "self";
    for (cap.endpoints) |endpoint| {
        if (requiredEmpty(endpoint.required)) {
            optional = true;
        } else for (endpoint.required.?) |n| {
            if (!same(n, "id")) return .{ .name = n, .required = !hasOptionalEndpoint(cap) };
            result = "id";
        }
    }
    return .{ .name = result, .required = !optional };
}
fn hasOptionalEndpoint(cap: *const Capability) bool {
    for (cap.endpoints) |endpoint| if (requiredEmpty(endpoint.required)) return true;
    return false;
}
fn inStrings(values: []const []const u8, v: []const u8) bool {
    for (values) |item| if (same(item, v)) return true;
    return false;
}
/// Every filter except the reserved names is forwarded verbatim, including names this
/// SDK does not know (P1.5); Torn decides what it accepts.
fn query(a: std.mem.Allocator, input: Input, names: []const []const u8, id: ?[]const u8) ![]const u8 {
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
        try appendParam(a, &out, arg.name, arg.value, input);
    }
    return out.toOwnedSlice(a);
}
fn legacyCall(a: std.mem.Allocator, input: Input, names: []const []const u8) !Call {
    try checkpoint(input);
    if (!input.allow_unlisted_v1) for (names) |name| if (!v1Contains(input.resource, name)) return error.UnsupportedV1Selection;
    for (input.target) |arg| if (!same(arg.name, "id")) return error.UnsupportedTarget;
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
        if (same(arg.name, "key") or same(arg.name, "selections")) return error.ReservedParameter;
        // `comment` and unknown filters are forwarded on v1 as well (P1.5).
        try appendParam(a, &q, arg.name, arg.value, input);
    }
    const id = findArg(input.target, "id") orelse "";
    var access: ?AccessLevel = null;
    for (names) |name| access = maxAccess(access, selectionAccess(input.resource, name));
    return .{
        .path = try std.fmt.allocPrint(a, "/{s}/{s}", .{ @tagName(input.resource), try percentEncodeChecked(a, id, input) }),
        .query = try q.toOwnedSlice(a),
        .selections = try copyNames(a, names),
        .operation = "v1Selections",
        .version = 1,
        .media = .json,
        .fallback_supported = true,
        .access_level = access,
    };
}
fn endpointScore(endpoint: data.Endpoint, targets: []const Argument) ?usize {
    var score: usize = 0;
    if (endpoint.required) |required| for (required) |name| {
        if (findArg(targets, name) == null) return null;
        score += 1;
    };
    // A non-matching explicit ID must never be dropped by choosing a self endpoint.
    for (targets) |arg| if (endpoint.required == null or !inStrings(endpoint.required.?, arg.name)) return null;
    return score;
}
fn directCall(a: std.mem.Allocator, input: Input, cap: *const Capability, name: []const u8) !Call {
    try checkpoint(input);
    var selected: ?data.Endpoint = null;
    var best: usize = 0;
    for (cap.endpoints) |endpoint| {
        if (endpointScore(endpoint, input.target)) |score| {
            if (selected == null or score > best) {
                selected = endpoint;
                best = score;
            }
        }
    }
    const endpoint = selected orelse return error.MissingOrConflictingTarget;
    const template = endpoint.path;
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
        .query = try query(a, input, &.{}, null),
        .selections = try copyNames(a, &.{name}),
        .operation = try a.dupe(u8, endpoint.id),
        .version = 2,
        .media = if (cap.csv) .csv else .json,
        .fallback_supported = v1Contains(input.resource, name),
        .access_level = cap.access_level,
    };
}

/// Build a deterministic plan (same input, same calls). All selections share one
/// target and filter set; selections keep their first-occurrence order.
/// Names this SDK does not know are sent as v2 generic selections (P1.5).
pub fn build(allocator: std.mem.Allocator, input: Input) !Plan {
    try checkpoint(input);
    if (input.selections.len == 0) return error.EmptySelections;
    try validateArgs(input.target);
    try validateArgs(input.filters);
    var arena = std.heap.ArenaAllocator.init(allocator);
    errdefer arena.deinit();
    const a = arena.allocator();
    try checkpoint(input);
    const sorted = try a.dupe([]const u8, input.selections);
    for (sorted) |name| {
        try checkpoint(input);
        if (name.len == 0) return error.UnknownSelection;
    }
    // Selections keep the caller's order (first occurrence wins), so requests and
    // per-selection splits match the shared conformance contract.
    var names: std.ArrayList([]const u8) = .empty;
    for (sorted) |name| {
        if (!inStrings(names.items, name)) try names.append(a, name);
    }
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
        if (capability(input.resource, name)) |cap| {
            const d = pathDomain(cap, name);
            if (d.required and input.target.len == 0) return error.MissingOrConflictingTarget;
            if (input.target.len > 0 and !same(d.name, "neutral")) {
                if (same(d.name, "self")) return error.MissingOrConflictingTarget;
                if (shared_domain) |previous| {
                    if (!same(previous, d.name)) return error.ConflictingTargetDomains;
                } else shared_domain = d.name;
                const arg = input.target[0];
                if (!same(arg.name, "id") and !same(arg.name, d.name) and !same(arg.name, domainParameter(cap, name))) return error.MissingOrConflictingTarget;
            }
        }
    }
    var unlisted_generic = false;
    for (names.items) |name| {
        try checkpoint(input);
        const cap = capability(input.resource, name) orelse {
            if (v1Contains(input.resource, name)) {
                try legacy.append(a, name);
            } else {
                // Unknown upstream selection: pass through as a v2 generic selection.
                try generic.append(a, name);
                unlisted_generic = true;
            }
            continue;
        };
        if (cap.legacy) {
            // Listed in the v2 selection enum without an exact v2 endpoint: ask v2
            // generic first; Torn answers code 22 when only v1 serves it, and the
            // client reroutes once (P4.3). Other legacy names go to v1 directly.
            if (cap.v2_enum) try generic.append(a, name) else try legacy.append(a, name);
            continue;
        }
        const compatible_generic = try queryRequirements(input, name);
        if (cap.generic and !cap.standalone and !input.force_direct and compatible_generic and !directOverride(input.resource, name)) {
            try generic.append(a, name);
        } else {
            if (input.target.len > 0 and (same(name, "timestamp") or same(name, "lookup"))) {
                var neutral = input;
                neutral.target = &.{};
                try calls.append(a, try directCall(a, neutral, cap, name));
            } else {
                var direct = input;
                var translated: [1]Argument = undefined;
                const override = domainOverride(cap, name);
                if (override != null and override.?.query and input.target.len == 1) {
                    direct.target = &.{};
                    const extended = try a.alloc(Argument, input.filters.len + 1);
                    @memcpy(extended[0..input.filters.len], input.filters);
                    extended[input.filters.len] = .{ .name = override.?.parameter, .value = input.target[0].value };
                    direct.filters = extended;
                } else if (input.target.len == 1 and (same(input.target[0].name, "id") or same(input.target[0].name, pathDomain(cap, name).name))) {
                    translated[0] = .{ .name = domainParameter(cap, name), .value = input.target[0].value };
                    direct.target = &translated;
                }
                try calls.append(a, try directCall(a, direct, cap, name));
            }
        }
    }
    if (generic.items.len > 0) {
        var fallback = true;
        var generic_has_domain = unlisted_generic and input.target.len == 1;
        var access: ?AccessLevel = null;
        for (generic.items) |name| {
            fallback = fallback and v1Contains(input.resource, name);
            const cap = capability(input.resource, name) orelse continue;
            access = maxAccess(access, cap.access_level);
            generic_has_domain = generic_has_domain or !same(domain(cap, name).name, "neutral");
        }
        try calls.insert(a, 0, .{
            .path = try std.fmt.allocPrint(a, "/{s}", .{@tagName(input.resource)}),
            .query = try query(a, input, generic.items, if (input.target.len == 1 and generic_has_domain) input.target[0].value else null),
            .selections = try copyNames(a, generic.items),
            .operation = try a.dupe(u8, genericOperation(input.resource)),
            .version = 2,
            .media = .json,
            .fallback_supported = fallback,
            .access_level = access,
        });
    }
    if (legacy.items.len > 0) try calls.append(a, try legacyCall(a, input, legacy.items));
    return finishPlan(&arena, &calls, input);
}

test "profile and job combine in caller order, drop duplicates and own all input strings" {
    var p = try build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "profile", "job", "profile" }, .target = &.{.{ .name = "id", .value = "123" }} });
    defer p.deinit();
    try std.testing.expectEqual(@as(usize, 1), p.calls.len);
    try std.testing.expectEqualStrings("/user", p.calls[0].path);
    try std.testing.expectEqualStrings("selections=profile%2Cjob&id=123", p.calls[0].query);
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
    try std.testing.expectEqualStrings("selections=timestamp%2Ccrimes&id=12", plan.calls[0].query);
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
    try std.testing.expectEqualStrings("selections=profile%2Cemployees%2Ctimestamp", normal.calls[0].query);
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

test "unknown parameters are forwarded verbatim on generic direct and v1 calls (P1.5)" {
    const cases = .{
        .{ Resource.company, "profile", Mode.automatic, "sort", "selections=profile&sort=ASC" },
        .{ Resource.property, "timestamp", Mode.automatic, "limit", "selections=timestamp&limit=ASC" },
        .{ Resource.user, "snapshot", Mode.automatic, "limit", "limit=ASC" },
        .{ Resource.user, "profile", Mode.v1, "bonus", "selections=profile&bonus=ASC" },
        .{ Resource.user, "profile", Mode.v1, "comment", "selections=profile&comment=ASC" },
    };
    inline for (cases) |c| {
        var plan = try build(std.testing.allocator, .{ .resource = c[0], .selections = &.{c[1]}, .mode = c[2], .filters = &.{.{ .name = c[3], .value = "ASC" }} });
        defer plan.deinit();
        try std.testing.expectEqualStrings(c[4], plan.calls[0].query);
    }
    try std.testing.expectError(error.ReservedParameter, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"profile"}, .filters = &.{.{ .name = "key", .value = "credential" }} }));
    try std.testing.expectError(error.ReservedParameter, build(std.testing.allocator, .{ .resource = .user, .selections = &.{"profile"}, .mode = .v1, .filters = &.{.{ .name = "key", .value = "credential" }} }));
}

test "unknown selections pass through as v2 generic selections (P1.5)" {
    try std.testing.expect(!v1Contains(.forum, "timestamp"));
    try std.testing.expect(!v1Contains(.user, "unlisted"));
    try std.testing.expect(v1Contains(.faction, "armorynews"));
    var plan = try build(std.testing.allocator, .{ .resource = .faction, .selections = &.{ "timestamp", "armorynews" } });
    defer plan.deinit();
    try std.testing.expectEqual(@as(usize, 2), plan.calls.len);
    try std.testing.expectEqual(@as(u8, 2), plan.calls[0].version);
    try std.testing.expectEqual(@as(u8, 1), plan.calls[1].version);
    var unknown = try build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "futureselection", "profile" }, .target = &.{.{ .name = "id", .value = "7" }} });
    defer unknown.deinit();
    try std.testing.expectEqual(@as(usize, 1), unknown.calls.len);
    try std.testing.expectEqualStrings("/user", unknown.calls[0].path);
    try std.testing.expectEqualStrings("selections=futureselection%2Cprofile&id=7", unknown.calls[0].query);
    var forum = try build(std.testing.allocator, .{ .resource = .forum, .selections = &.{"armorynews"} });
    defer forum.deinit();
    try std.testing.expectEqualStrings("selections=armorynews", forum.calls[0].query);
    try std.testing.expectError(error.UnsupportedV1Selection, build(std.testing.allocator, .{ .resource = .racing, .selections = &.{"timestamp"}, .mode = .v1 }));
    var rerouted = try build(std.testing.allocator, .{ .resource = .racing, .selections = &.{"timestamp"}, .mode = .v1, .allow_unlisted_v1 = true });
    defer rerouted.deinit();
    try std.testing.expectEqualStrings("/racing/", rerouted.calls[0].path);
}

test "calls carry the highest known selection access level (P6.1)" {
    var plan = try build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "profile", "travelinventory", "futureselection" } });
    defer plan.deinit();
    try std.testing.expectEqual(@as(?AccessLevel, .limited), plan.calls[0].access_level);
    try std.testing.expectEqual(@as(?AccessLevel, .limited), selectionAccess(.user, "travelinventory"));
    try std.testing.expectEqual(@as(?AccessLevel, null), selectionAccess(.user, "futureselection"));
    try std.testing.expect(accessSatisfies(.full, .limited) and !accessSatisfies(.public, .limited) and accessSatisfies(.custom, .full));
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

test "required query parameters are not silently omitted by selection helpers" {
    const cases = .{
        .{ Resource.user, "list" },             .{ Resource.faction, "contributors" },
        .{ Resource.faction, "inventory" },     .{ Resource.faction, "news" },
        .{ Resource.faction, "warfarechains" }, .{ Resource.faction, "warfare" },
        .{ Resource.company, "news" },          .{ Resource.torn, "attacklog" },
        .{ Resource.torn, "factionhof" },       .{ Resource.torn, "hof" },
    };
    inline for (cases) |c| try std.testing.expectError(error.MissingRequiredParameter, build(std.testing.allocator, .{ .resource = c[0], .selections = &.{c[1]} }));
    try std.testing.expectError(error.MissingRequiredParameter, build(std.testing.allocator, .{ .resource = .racing, .selections = &.{"records"}, .target = &.{.{ .name = "trackId", .value = "1" }} }));
}

test "incompatible shared categories fail against each selection contract" {
    try std.testing.expectError(error.InvalidParameterValue, build(std.testing.allocator, .{ .resource = .faction, .selections = &.{ "news", "warfarechains" }, .filters = &.{.{ .name = "cat", .value = "main" }} }));
    try std.testing.expectError(error.InvalidParameterValue, build(std.testing.allocator, .{ .resource = .faction, .selections = &.{ "news", "crimes" }, .filters = &.{.{ .name = "cat", .value = "main" }} }));
    try std.testing.expectError(error.InvalidParameterValue, build(std.testing.allocator, .{ .resource = .company, .selections = &.{"news"}, .filters = &.{.{ .name = "cat", .value = "MAIN" }} }));
}

test "attack log required query routes to exact operation" {
    var plan = try build(std.testing.allocator, .{ .resource = .torn, .selections = &.{"attacklog"}, .filters = &.{.{ .name = "log", .value = "d51ad4fe6be884b309b142e2d1d4f807" }} });
    defer plan.deinit();
    try std.testing.expectEqualStrings("/torn/attacklog", plan.calls[0].path);
    try std.testing.expectEqualStrings("log=d51ad4fe6be884b309b142e2d1d4f807", plan.calls[0].query);
}

test "item honor medal and auction listing IDs remain separate domains" {
    try std.testing.expectError(error.ConflictingTargetDomains, build(std.testing.allocator, .{ .resource = .torn, .selections = &.{ "items", "honors" }, .target = &.{.{ .name = "ids", .value = "1,2" }} }));
    try std.testing.expectError(error.ConflictingTargetDomains, build(std.testing.allocator, .{ .resource = .torn, .selections = &.{ "honors", "medals" }, .target = &.{.{ .name = "ids", .value = "1,2" }} }));
    try std.testing.expectError(error.ConflictingTargetDomains, build(std.testing.allocator, .{ .resource = .market, .selections = &.{ "auctionhouselisting", "itemmarket" }, .target = &.{.{ .name = "id", .value = "1" }} }));
    var plan = try build(std.testing.allocator, .{ .resource = .torn, .selections = &.{ "items", "itemdetails", "itemstats" }, .target = &.{.{ .name = "itemIds", .value = "1,2" }} });
    defer plan.deinit();
    try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
    try std.testing.expectEqualStrings("selections=items%2Citemdetails%2Citemstats&id=1%2C2", plan.calls[0].query);
}

test "territory ID list maps generic id and direct query ids correctly" {
    inline for (.{ false, true }) |direct| {
        var plan = try build(std.testing.allocator, .{ .resource = .torn, .selections = &.{"territory"}, .target = &.{.{ .name = "territoryIds", .value = "AAA,AAB" }}, .force_direct = direct });
        defer plan.deinit();
        try std.testing.expectEqualStrings(if (direct) "/torn/territory" else "/torn", plan.calls[0].path);
        try std.testing.expectEqualStrings(if (direct) "ids=AAA%2CAAB" else "selections=territory&id=AAA%2CAAB", plan.calls[0].query);
    }
}
