//! Independent helper routing oracle: official enums, paths and response
//! associations, with explicit maintained compatibility fixtures.
const std = @import("std");
const selections = @import("generated/selections.zig");
const current = @import("generated/current.zig");
const producer = @import("model_contract_tests.zig");
const planner = @import("planner.zig");
const client = @import("client.zig");
const runtime = @import("runtime.zig");
const transport = @import("transport.zig");
const model = @import("model.zig");
const V = std.json.Value;

fn eq(a: []const u8, b: []const u8) bool {
    return std.mem.eql(u8, a, b);
}
fn get(v: V, name: []const u8) ?V {
    return if (v == .object) v.object.get(name) else null;
}
fn legacy(resource: []const u8, name: []const u8) bool {
    if (eq(resource, "faction")) for ([_][]const u8{ "armor", "boosters", "caches", "cesium", "drugs", "medical", "temporary", "utilities", "weapons" }) |n| {
        if (eq(name, n)) return true;
    };
    if (eq(resource, "user")) return eq(name, "bazaar") or eq(name, "criminalrecord") or eq(name, "display");
    if (eq(resource, "torn")) return eq(name, "competition") or eq(name, "organisedcrimes") or eq(name, "pawnshop");
    return false;
}
fn encode(a: std.mem.Allocator, s: []const u8) ![]const u8 {
    var out: std.ArrayList(u8) = .empty;
    for (s) |c| {
        if (std.ascii.isAlphanumeric(c) or std.mem.indexOfScalar(u8, "-_.~", c) != null) try out.append(a, c) else {
            const hex = "0123456789ABCDEF";
            try out.appendSlice(a, &.{ '%', hex[c / 16], hex[c % 16] });
        }
    }
    return out.toOwnedSlice(a);
}
fn enumContains(doc: V, resource: []const u8, name: []const u8) bool {
    const schema_name = switch (std.meta.stringToEnum(planner.Resource, resource).?) {
        .user => "UserSelectionName",
        .faction => "FactionSelectionName",
        .company => "CompanySelectionName",
        .forum => "ForumSelectionName",
        .key => "KeySelectionName",
        .market => "MarketSelectionName",
        .property => "PropertySelectionName",
        .racing => "RacingSelectionName",
        .torn => "TornSelectionName",
    };
    const values = doc.object.get("components").?.object.get("schemas").?.object.get(schema_name).?.object.get("oneOf").?.array.items[0].object.get("enum").?.array.items;
    for (values) |value| if (eq(value.string, name)) return true;
    return false;
}
fn hasBranch(schema: V, reference: []const u8) bool {
    if (get(schema, "$ref")) |r| if (eq(r.string, reference)) return true;
    inline for (.{ "oneOf", "anyOf", "allOf" }) |key| if (get(schema, key)) |items| for (items.array.items) |item| {
        if (hasBranch(item, reference)) return true;
    };
    return false;
}
fn resolveParameter(doc: V, p: V) V {
    return if (get(p, "$ref")) |r| doc.object.get("components").?.object.get("parameters").?.object.get(r.string[24..]).? else p;
}
fn pathCount(path: []const u8) usize {
    return std.mem.count(u8, path, "{");
}
const Expected = struct { url: []const u8, target: []const planner.Argument, filters: []const planner.Argument = &.{}, response: V, csv: bool, version: u8 };
fn scalarText(a: std.mem.Allocator, v: V) ![]const u8 {
    return switch (v) {
        .string => v.string,
        .number_string => v.number_string,
        .integer => try std.fmt.allocPrint(a, "{d}", .{v.integer}),
        else => error.InvalidFilterFixture,
    };
}
fn parameterAllowed(doc: V, operation: V, name: []const u8) bool {
    const parameters = get(operation, "parameters") orelse return false;
    for (parameters.array.items) |p| if (eq(resolveParameter(doc, p).object.get("name").?.string, name)) return true;
    return false;
}

fn expected(comptime Token: type, a: std.mem.Allocator, doc: V) !Expected {
    const resource = @tagName(Token.resource);
    const name = Token.name;
    if (legacy(resource, name)) {
        const payload = if (eq(name, "pawnshop")) "{\"pawnshop\":{\"points_value\":1}}" else if (eq(name, "criminalrecord")) "{\"criminalrecord\":{\"total\":1}}" else if (eq(name, "organisedcrimes")) "{\"organisedcrimes\":{}}" else try std.fmt.allocPrint(a, "{{\"{s}\":[]}}", .{name});
        return .{ .url = try std.fmt.allocPrint(a, "https://example.invalid/{s}/?selections={s}", .{ resource, name }), .target = &.{}, .response = try std.json.parseFromSliceLeaky(V, a, payload, .{ .parse_numbers = false }), .csv = false, .version = 1 };
    }
    const match_name = if (eq(resource, "user") and eq(name, "itemmod")) "itemmods" else if (eq(resource, "faction") and eq(name, "dirtbombs")) "dirtybombs" else name;
    const base = try std.fmt.allocPrint(a, "/{s}", .{resource});
    var selected_path: ?[]const u8 = null;
    var operation: V = undefined;
    var iter = doc.object.get("paths").?.object.iterator();
    while (iter.next()) |entry| {
        const path = entry.key_ptr.*;
        if (!std.mem.startsWith(u8, path, base) or path.len <= base.len or path[base.len] != '/') continue;
        const slash = std.mem.lastIndexOfScalar(u8, path, '/').?;
        if (!std.ascii.eqlIgnoreCase(path[slash + 1 ..], match_name)) continue;
        if (comptime @hasDecl(Token, "required_target")) {
            const placeholder = "{" ++ Token.required_target ++ "}";
            if (std.mem.indexOf(u8, path, placeholder) == null) continue;
        }
        if (selected_path == null or pathCount(path) < pathCount(selected_path.?)) {
            selected_path = path;
            operation = entry.value_ptr.object.get("get").?;
        }
    }
    var schema: V = undefined;
    var csv = false;
    if (selected_path != null) {
        const media = operation.object.get("responses").?.object.get("200").?.object.get("content").?;
        csv = get(media, "text/csv") != null;
        if (!csv) schema = media.object.get("application/json").?.object.get("schema").?;
    } else if (eq(resource, "user") and eq(name, "factionbalance")) {
        var ref: std.json.ObjectMap = .{};
        try ref.put(a, "$ref", .{ .string = "#/components/schemas/UserFactionBalanceResponse" });
        schema = .{ .object = ref };
    } else {
        std.debug.print("missing independent helper endpoint {s}/{s}\n", .{ resource, name });
        return error.MissingIndependentSelectionEndpoint;
    }
    var target: std.ArrayList(planner.Argument) = .empty;
    var filters: std.ArrayList(planner.Argument) = .empty;
    if (selected_path != null) if (get(operation, "parameters")) |parameters| for (parameters.array.items) |p| {
        const parameter = resolveParameter(doc, p);
        if (eq(parameter.object.get("in").?.string, "path")) {
            const parameter_name = parameter.object.get("name").?.string;
            const value = if (eq(parameter_name, "ids") or eq(parameter_name, "categoryIds")) "1,2" else "1";
            try target.append(a, .{ .name = parameter_name, .value = value });
        } else if (get(parameter, "required")) |required| {
            const parameter_name = parameter.object.get("name").?.string;
            if (required.bool and !eq(parameter_name, "key")) {
                const value = try producer.sample(a, doc, parameter.object.get("schema").?, 1, 0);
                try filters.append(a, .{ .name = parameter_name, .value = try scalarText(a, value) });
            }
        }
    };
    const generic = doc.object.get("paths").?.object.get(base).?.object.get("get").?;
    const generic_schema = generic.object.get("responses").?.object.get("200").?.object.get("content").?.object.get("application/json").?.object.get("schema").?;
    const standalone = if (selected_path != null) if (get(operation, "description")) |description| std.mem.indexOf(u8, description.string, "standalone") != null else false else false;
    const associated = if (!csv) if (get(schema, "$ref")) |reference| hasBranch(generic_schema, reference.string) else false else false;
    const force_direct = if (comptime @hasDecl(Token, "force_direct")) Token.force_direct else false;
    var generic_filters = true;
    for (filters.items) |filter| generic_filters = generic_filters and parameterAllowed(doc, generic, filter.name);
    const use_generic = enumContains(doc, resource, name) and associated and !standalone and !force_direct and generic_filters;
    const url = if (use_generic) try std.fmt.allocPrint(a, "https://example.invalid/v2{s}?selections={s}{s}{s}", .{ base, name, if (target.items.len > 0) "&id=" else "", if (target.items.len > 0) try encode(a, target.items[0].value) else "" }) else blk: {
        var path = selected_path orelse return error.MissingDirectEndpoint;
        for (target.items) |arg| {
            const placeholder = try std.fmt.allocPrint(a, "{{{s}}}", .{arg.name});
            const pos = std.mem.indexOf(u8, path, placeholder).?;
            path = try std.mem.concat(a, u8, &.{ path[0..pos], try encode(a, arg.value), path[pos + placeholder.len ..] });
        }
        break :blk try std.mem.concat(a, u8, &.{ "https://example.invalid/v2", path });
    };
    std.mem.sort(planner.Argument, filters.items, {}, struct {
        fn less(_: void, x: planner.Argument, y: planner.Argument) bool {
            return std.mem.lessThan(u8, x.name, y.name);
        }
    }.less);
    var filter_parts: std.ArrayList([]const u8) = .empty;
    for (filters.items) |filter| try filter_parts.append(a, try std.fmt.allocPrint(a, "{s}={s}", .{ try encode(a, filter.name), try encode(a, filter.value) }));
    const full_url = if (filters.items.len > 0) try std.fmt.allocPrint(a, "{s}{s}{s}", .{ url, if (std.mem.indexOfScalar(u8, url, '?') != null) "&" else "?", try std.mem.join(a, "&", filter_parts.items) }) else url;
    var response = if (csv) V{ .string = "id,name\n1,fixture\n" } else try producer.sample(a, doc, schema, 0, 0);
    // Maintained compatibility models intentionally allow defaults and aliases.
    // These literal fixtures exercise each associated compatibility projection.
    const maintained: ?[]const u8 = if (eq(resource, "company") and eq(name, "employees")) "{\"employees\":[]}" else if (eq(resource, "company") and eq(name, "profile")) "{\"company\":{\"id\":1,\"name\":\"fixture\"}}" else if (eq(resource, "market") and eq(name, "bazaar")) "{\"bazaar\":{\"bargain\":[]}}" else if (eq(resource, "torn") and eq(name, "stocks")) if (force_direct) "{\"stocks\":{\"id\":1,\"name\":\"fixture\"}}" else "{\"stocks\":[]}" else null;
    if (maintained) |payload| response = try std.json.parseFromSliceLeaky(V, a, payload, .{ .parse_numbers = false });
    return .{ .url = full_url, .target = try target.toOwnedSlice(a), .filters = try filters.toOwnedSlice(a), .response = response, .csv = csv, .version = 2 };
}

const Wire = struct {
    url: []const u8,
    body: []const u8,
    count: usize = 0,
    fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        try std.testing.expectEqualStrings(self.url, request.url);
        self.count += 1;
        return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, self.body) };
    }
};
fn subset(expected_value: V, actual: V) bool {
    if (std.meta.activeTag(expected_value) != std.meta.activeTag(actual)) return false;
    return switch (expected_value) {
        .null => true,
        .bool => expected_value.bool == actual.bool,
        .integer => expected_value.integer == actual.integer,
        .float => expected_value.float == actual.float,
        .number_string => eq(expected_value.number_string, actual.number_string),
        .string => eq(expected_value.string, actual.string),
        .array => blk: {
            if (expected_value.array.items.len != actual.array.items.len) break :blk false;
            for (expected_value.array.items, actual.array.items) |e, v| if (!subset(e, v)) break :blk false;
            break :blk true;
        },
        .object => blk: {
            var it = expected_value.object.iterator();
            while (it.next()) |entry| if (!subset(entry.value_ptr.*, actual.object.get(entry.key_ptr.*) orelse break :blk false)) break :blk false;
            break :blk true;
        },
    };
}
fn exercise(comptime Token: type, doc: V, raw: bool) !bool {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    const fixture = try expected(Token, a, doc);
    if (raw and (fixture.csv or @hasDecl(Token, "required_target"))) return false;
    const body = if (fixture.csv) fixture.response.string else try std.json.Stringify.valueAlloc(a, fixture.response, .{});
    var wire: Wire = .{ .url = fixture.url, .body = body };
    var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only-placeholder"}, .base_url_v2 = "https://example.invalid/v2", .base_url_v1 = "https://example.invalid", .max_attempts = 1 }, .{ .context = &wire, .send_fn = Wire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    if (raw) {
        var result = try c.raw(Token, fixture.target, fixture.filters, .{});
        defer result.deinit();
        try std.testing.expect(result.failure == null);
        try std.testing.expectEqual(fixture.version, result.reports[0].api_version);
        try std.testing.expect(subset(fixture.response, result.raw));
    } else {
        var result = try c.select(Token, fixture.target, fixture.filters, .{});
        defer result.deinit();
        if (result.execution.failure) |failure| {
            std.debug.print("helper failed {s}/{s}: {s}\n", .{ @tagName(Token.resource), Token.name, if (failure.cause) |err| @errorName(err) else "failure" });
            return error.TypedHelperFailed;
        }
        try std.testing.expect(result.value != null);
        try std.testing.expectEqual(fixture.version, result.execution.reports[0].api_version);
        const serialized = try model.stringify(a, result.value.?);
        const observed = try std.json.parseFromSliceLeaky(V, a, serialized, .{ .parse_numbers = false });
        if (!subset(fixture.response, observed)) {
            std.debug.print("helper value mismatch {s}/{s}\nexpected={s}\nobserved={s}\n", .{ @tagName(Token.resource), Token.name, body, serialized });
            return error.TypedHelperValueMismatch;
        }
    }
    try std.testing.expectEqual(@as(usize, 1), wire.count);
    return true;
}
test "all 207 typed helpers and 202 raw helpers execute independent routing fixtures" {
    @setEvalBranchQuota(10000000);
    var doc = try std.json.parseFromSlice(V, std.testing.allocator, current.source_json, .{ .parse_numbers = false });
    defer doc.deinit();
    var typed_count: usize = 0;
    var raw_count: usize = 0;
    inline for (@typeInfo(selections).@"struct".decl_names) |resource_name| {
        const R = @field(selections, resource_name);
        inline for (@typeInfo(R).@"struct".decl_names) |selection_name| {
            const Token = @field(R, selection_name);
            if (try exercise(Token, doc.value, false)) typed_count += 1;
            if (try exercise(Token, doc.value, true)) raw_count += 1;
        }
    }
    try std.testing.expectEqual(@as(usize, 207), typed_count);
    try std.testing.expectEqual(@as(usize, 202), raw_count);
}
