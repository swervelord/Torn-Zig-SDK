//! Independent structural acceptance oracle, authored separately from generation
//! and decoding. Samples derive from official contracts, never SDK output.
//! Three boundary variants per component are inventory checks, not exhaustive
//! coverage of nested combinations or possible live game states.
const std = @import("std");
const model = @import("model.zig");
const validator = @import("schema.zig");
const current = @import("generated/current.zig");
const frozen = @import("generated/frozen.zig");
const V = std.json.Value;
fn get(v: V, key: []const u8) ?V {
    return if (v == .object) v.object.get(key) else null;
}
fn num(a: std.mem.Allocator, value: i64) !V {
    return .{ .number_string = try std.fmt.allocPrint(a, "{d}", .{value}) };
}
fn resolve(doc: V, reference: []const u8) !V {
    if (!std.mem.startsWith(u8, reference, "#/components/schemas/")) return error.UnexpectedReference;
    return doc.object.get("components").?.object.get("schemas").?.object.get(reference[21..]) orelse error.MissingSchema;
}
fn untyped(a: std.mem.Allocator, variant: usize) !V {
    if (variant == 0) return .null;
    if (variant == 1) return .{ .number_string = "9007199254740993" };
    var object: std.json.ObjectMap = .{};
    try object.put(a, "unconstrained", .{ .bool = false });
    return .{ .object = object };
}
pub fn sample(a: std.mem.Allocator, doc: V, s: V, variant: usize, depth: usize) anyerror!V {
    if (depth > 64) return error.RecursiveContract;
    if (get(s, "$ref")) |r| return sample(a, doc, try resolve(doc, r.string), variant, depth + 1);
    if (get(s, "enum")) |en| return en.array.items[variant % en.array.items.len];
    if (get(s, "const")) |value| return value;
    if (get(s, "allOf")) |all| {
        var object: std.json.ObjectMap = .{};
        for (all.array.items) |part| {
            const child = try sample(a, doc, part, variant, depth + 1);
            if (child != .object) return error.UnexpectedComposition;
            var it = child.object.iterator();
            while (it.next()) |entry| try object.put(a, entry.key_ptr.*, entry.value_ptr.*);
        }
        return .{ .object = object };
    }
    if (get(s, "oneOf") orelse get(s, "anyOf")) |alts| return sample(a, doc, alts.array.items[variant % alts.array.items.len], variant, depth + 1);
    var ty = get(s, "type");
    if (ty != null and ty.? == .array) ty = ty.?.array.items[variant % ty.?.array.items.len];
    const kind = if (ty) |t| t.string else if (get(s, "properties") != null or get(s, "required") != null or get(s, "additionalProperties") != null) "object" else "unconstrained";
    if (std.mem.eql(u8, kind, "null")) return .null;
    if (std.mem.eql(u8, kind, "boolean")) return .{ .bool = variant % 2 == 1 };
    if (std.mem.eql(u8, kind, "integer")) {
        var value: i64 = switch (variant) {
            0 => 0,
            1 => 1,
            else => if (get(s, "format")) |f| if (std.mem.eql(u8, f.string, "int64")) 9007199254740993 else 2147483647 else 9007199254740993,
        };
        if (get(s, "minimum")) |min| value = @max(value, try std.fmt.parseInt(i64, min.number_string, 10));
        if (get(s, "maximum")) |max| value = @min(value, try std.fmt.parseInt(i64, max.number_string, 10));
        if (get(s, "exclusiveMinimum")) |min| value = @max(value, (try std.fmt.parseInt(i64, min.number_string, 10)) + 1);
        if (get(s, "exclusiveMaximum")) |max| value = @min(value, (try std.fmt.parseInt(i64, max.number_string, 10)) - 1);
        return num(a, value);
    }
    if (std.mem.eql(u8, kind, "number")) return .{ .number_string = if (variant == 0) "0" else if (variant == 1) "1.5" else "2.5" };
    if (std.mem.eql(u8, kind, "string")) {
        if (get(s, "pattern")) |pattern| {
            if (std.mem.startsWith(u8, pattern.string, "^factions:")) return .{ .string = "factions:1;2" };
            const end = std.mem.indexOfScalar(u8, pattern.string, '|') orelse return error.UnsupportedPattern;
            return .{ .string = try std.fmt.allocPrint(a, "{s}:=:1", .{pattern.string[2..end]}) };
        }
        return .{ .string = if (variant == 0) "" else if (variant == 1) "contract fixture" else "Unicode: \xc3\xa9\xf0\x9f\x8c\x8d" };
    }
    if (std.mem.eql(u8, kind, "array")) {
        var items = std.array_list.Managed(V).init(a);
        var count: usize = if (variant == 0) 0 else if (variant == 1) 1 else 2;
        if (get(s, "minItems")) |min| count = @max(count, try std.fmt.parseInt(usize, min.number_string, 10));
        if (get(s, "maxItems")) |max| count = @min(count, try std.fmt.parseInt(usize, max.number_string, 10));
        for (0..count) |i| try items.append(if (get(s, "items")) |item| try sample(a, doc, item, variant + i, depth + 1) else try untyped(a, variant));
        return .{ .array = items };
    }
    if (std.mem.eql(u8, kind, "object")) {
        var object: std.json.ObjectMap = .{};
        if (get(s, "properties")) |props| {
            var it = props.object.iterator();
            while (it.next()) |entry| {
                // Include optional fields in variants 1/2 to check concrete types;
                // variant 0 intentionally distinguishes absent from empty/null.
                var required = false;
                if (get(s, "required")) |r| for (r.array.items) |name| {
                    if (std.mem.eql(u8, name.string, entry.key_ptr.*)) required = true;
                };
                if (required or variant != 0) try object.put(a, entry.key_ptr.*, try sample(a, doc, entry.value_ptr.*, variant, depth + 1));
            }
        }
        if (get(s, "required")) |required| for (required.array.items) |name| {
            if (!object.contains(name.string)) try object.put(a, name.string, try untyped(a, variant));
        };
        if (get(s, "additionalProperties")) |extra| if (extra == .object and object.count() == 0 and variant != 0) try object.put(a, "fixture_key", try sample(a, doc, extra, variant, depth + 1));
        return .{ .object = object };
    }
    return untyped(a, variant);
}
fn equivalent(expected: V, actual: V) bool {
    if (expected == .number_string and actual == .number_string) {
        const e = std.fmt.parseInt(i128, expected.number_string, 10) catch return (std.fmt.parseFloat(f64, expected.number_string) catch return false) == (std.fmt.parseFloat(f64, actual.number_string) catch return false);
        return e == (std.fmt.parseInt(i128, actual.number_string, 10) catch return false);
    }
    if (std.meta.activeTag(expected) != std.meta.activeTag(actual)) return false;
    return switch (expected) {
        .null => true,
        .bool => expected.bool == actual.bool,
        .string => std.mem.eql(u8, expected.string, actual.string),
        .array => blk: {
            if (expected.array.items.len != actual.array.items.len) break :blk false;
            for (expected.array.items, actual.array.items) |e, v| if (!equivalent(e, v)) break :blk false;
            break :blk true;
        },
        .object => blk: {
            if (expected.object.count() != actual.object.count()) break :blk false;
            var it = expected.object.iterator();
            while (it.next()) |entry| {
                const v = actual.object.get(entry.key_ptr.*) orelse break :blk false;
                if (!equivalent(entry.value_ptr.*, v)) break :blk false;
            }
            break :blk true;
        },
        else => false,
    };
}
fn exercise(comptime T: type, doc: V, name: []const u8) !usize {
    const contract = doc.object.get("components").?.object.get("schemas").?.object.get(name).?;
    const root_alternatives = get(contract, "oneOf") orelse get(contract, "anyOf");
    const alternative_end = 3 + if (root_alternatives) |alts| alts.array.items.len else @as(usize, 0);
    const enum_values = get(contract, "enum");
    const count = alternative_end + if (enum_values) |en| en.array.items.len else @as(usize, 0);
    for (0..count) |variant| {
        var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
        defer arena.deinit();
        const a = arena.allocator();
        const chosen = if (variant < 3 or variant >= alternative_end) contract else root_alternatives.?.array.items[variant - 3];
        const expected = if (variant >= alternative_end) enum_values.?.array.items[variant - alternative_end] else try sample(a, doc, chosen, if (variant < 3) variant else variant - 2, 0);
        const input = try std.json.Stringify.valueAlloc(a, expected, .{});
        validator.validate(doc, contract, expected) catch |err| {
            std.debug.print("schema sample failed: {s} variant {d}: {s}\n", .{ name, variant, @errorName(err) });
            return err;
        };
        var result = model.decode(T, std.testing.allocator, input) catch |err| {
            std.debug.print("typed acceptance failed: {s} variant {d}: {s}\n", .{ name, variant, @errorName(err) });
            return err;
        };
        defer result.deinit();
        const output = try model.stringify(a, result.value);
        const serialized = try std.json.parseFromSliceLeaky(V, a, output, .{ .parse_numbers = false });
        if (!equivalent(expected, serialized)) {
            std.debug.print("typed roundtrip mismatch: {s} variant {d}\nexpected={s}\nactual={s}\n", .{ name, variant, input, output });
            return error.InvalidTypedRoundtrip;
        }
    }
    return count;
}
test "2157 current component acceptance samples and typed roundtrips" {
    @setEvalBranchQuota(10000000);
    var doc = try std.json.parseFromSlice(V, std.testing.allocator, current.source_json, .{ .parse_numbers = false });
    defer doc.deinit();
    var failures: usize = 0;
    var accepted: usize = 0;
    inline for (current.all_types, current.all_schema_names) |T, name| {
        accepted += exercise(T, doc.value, name) catch |err| blk: {
            std.debug.print("current component failure {s}: {s}\n", .{ name, @errorName(err) });
            failures += 1;
            break :blk 0;
        };
    }
    try std.testing.expectEqual(0, failures);
    try std.testing.expectEqual(2157, current.schema_count * 3);
    try std.testing.expectEqual(7444, accepted);
}
test "2133 frozen component acceptance samples and typed roundtrips" {
    @setEvalBranchQuota(10000000);
    var doc = try std.json.parseFromSlice(V, std.testing.allocator, frozen.source_json, .{ .parse_numbers = false });
    defer doc.deinit();
    var failures: usize = 0;
    var accepted: usize = 0;
    inline for (frozen.all_types, frozen.all_schema_names) |T, name| {
        accepted += exercise(T, doc.value, name) catch |err| blk: {
            std.debug.print("frozen component failure {s}: {s}\n", .{ name, @errorName(err) });
            failures += 1;
            break :blk 0;
        };
    }
    try std.testing.expectEqual(0, failures);
    try std.testing.expectEqual(2133, frozen.schema_count * 3);
    try std.testing.expectEqual(7419, accepted);
}
