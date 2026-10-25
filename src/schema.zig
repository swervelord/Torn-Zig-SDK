//! Official schema validation. Overlapping oneOf uses compatible any-match semantics
//! because upstream selection enums overlap a general string branch.
const std = @import("std");
const model = @import("model.zig");
const V = std.json.Value;
pub const Error = error{ InvalidType, MissingField, InvalidEnum, InvalidUnion, OutOfRange, InvalidReference, SchemaDepth, UnknownField, InvalidLength, InvalidPattern, UnsupportedConstraint };
fn get(v: V, key: []const u8) ?V {
    return if (v == .object) v.object.get(key) else null;
}
fn text(v: V) ?[]const u8 {
    return switch (v) {
        .string, .number_string => |s| s,
        else => null,
    };
}
fn number(v: V) !f64 {
    return switch (v) {
        .integer => |i| @floatFromInt(i),
        .float => |f| f,
        .number_string => |s| std.fmt.parseFloat(f64, s) catch error.InvalidType,
        else => error.InvalidType,
    };
}
fn integral(v: V) !i128 {
    return switch (v) {
        .integer => |i| i,
        .number_string => |s| if (s.len > 0 and s[0] == '-') @as(i128, model.integer(i64, s) catch return error.OutOfRange) else @as(i128, model.integer(u64, s) catch return error.OutOfRange),
        else => error.InvalidType,
    };
}
fn equivalent(a: V, b: V) bool {
    if (a == .string and b == .string) return std.mem.eql(u8, a.string, b.string);
    if (a == .null and b == .null) return true;
    if (a == .bool and b == .bool) return a.bool == b.bool;
    if ((a == .number_string or a == .integer or a == .float) and (b == .number_string or b == .integer or b == .float)) {
        const ai = integral(a) catch return (number(a) catch return false) == (number(b) catch return false);
        const bi = integral(b) catch return false;
        return ai == bi;
    }
    return false;
}
fn matchesType(raw: V, kind: []const u8) bool {
    if (std.mem.eql(u8, kind, "null")) return raw == .null;
    if (std.mem.eql(u8, kind, "object")) return raw == .object;
    if (std.mem.eql(u8, kind, "array")) return raw == .array;
    if (std.mem.eql(u8, kind, "string")) return raw == .string;
    if (std.mem.eql(u8, kind, "boolean")) return raw == .bool;
    if (std.mem.eql(u8, kind, "number")) return raw == .integer or raw == .float or raw == .number_string;
    if (std.mem.eql(u8, kind, "integer")) {
        _ = integral(raw) catch return false;
        return true;
    }
    return false;
}
fn resolve(doc: V, reference: []const u8) Error!V {
    if (!std.mem.startsWith(u8, reference, "#/")) return error.InvalidReference;
    var current = doc;
    var parts = std.mem.splitScalar(u8, reference[2..], '/');
    while (parts.next()) |part| {
        current = get(current, part) orelse return error.InvalidReference;
    }
    return current;
}
fn decimal(s: []const u8) bool {
    if (s.len == 0) return false;
    for (s) |c| if (c < '0' or c > '9') return false;
    return true;
}
fn matchesPattern(pattern: []const u8, value: []const u8) Error!bool {
    if (std.mem.eql(u8, pattern, "^factions:\\d+(;\\d+)*$")) {
        if (!std.mem.startsWith(u8, value, "factions:")) return false;
        var ids = std.mem.splitScalar(u8, value[9..], ';');
        while (ids.next()) |id| if (!decimal(id)) return false;
        return true;
    }
    const divider = std.mem.indexOf(u8, pattern, "):(") orelse return error.UnsupportedConstraint;
    const end = std.mem.indexOf(u8, pattern, "):\\d+$") orelse return error.UnsupportedConstraint;
    if (!std.mem.startsWith(u8, pattern, "^(")) return error.UnsupportedConstraint;
    var sections = std.mem.splitScalar(u8, value, ':');
    const field = sections.next() orelse return false;
    const op = sections.next() orelse return false;
    const operand = sections.next() orelse return false;
    if (sections.next() != null or !decimal(operand)) return false;
    var names = std.mem.splitScalar(u8, pattern[2..divider], '|');
    var field_valid = false;
    while (names.next()) |name| if (std.mem.eql(u8, name, field)) {
        field_valid = true;
    };
    var ops = std.mem.splitScalar(u8, pattern[divider + 3 .. end], '|');
    var op_valid = false;
    while (ops.next()) |name| if (std.mem.eql(u8, name, op)) {
        op_valid = true;
    };
    return field_valid and op_valid;
}
pub fn validate(document: V, contract: V, raw: V) Error!void {
    try inner(document, contract, raw, 0);
}
fn inner(doc: V, s: V, raw: V, depth: usize) Error!void {
    if (depth > 128) return error.SchemaDepth;
    if (s == .bool) return if (s.bool) {} else error.InvalidType;
    if (get(s, "$ref")) |ref| try inner(doc, try resolve(doc, ref.string), raw, depth + 1);
    if (get(s, "allOf")) |all| for (all.array.items) |branch| {
        try inner(doc, branch, raw, depth + 1);
    };
    if (get(s, "oneOf") orelse get(s, "anyOf")) |alternatives| {
        var accepted = false;
        for (alternatives.array.items) |branch| {
            if (inner(doc, branch, raw, depth + 1)) |_| {
                accepted = true;
                break;
            } else |_| {}
        }
        if (!accepted) return error.InvalidUnion;
    }
    if (get(s, "type")) |ty| {
        var valid = false;
        if (ty == .string) valid = matchesType(raw, ty.string) else if (ty == .array) for (ty.array.items) |t| {
            if (matchesType(raw, t.string)) valid = true;
        };
        if (!valid) return error.InvalidType;
    }
    if (get(s, "enum")) |values| {
        var found = false;
        for (values.array.items) |v| {
            if (equivalent(v, raw)) found = true;
        }
        if (!found) return error.InvalidEnum;
    }
    if (get(s, "const")) |value| if (!equivalent(value, raw)) return error.InvalidEnum;
    if (raw == .object) {
        if (get(s, "required")) |req| for (req.array.items) |key| {
            if (!raw.object.contains(key.string)) return error.MissingField;
        };
        const props = get(s, "properties");
        var it = raw.object.iterator();
        while (it.next()) |kv| {
            const child = if (props) |p| p.object.get(kv.key_ptr.*) else null;
            if (child) |c| try inner(doc, c, kv.value_ptr.*, depth + 1) else if (get(s, "additionalProperties")) |additional| {
                if (additional == .bool and !additional.bool) return error.UnknownField;
                if (additional == .object) try inner(doc, additional, kv.value_ptr.*, depth + 1);
            }
        }
        if (get(s, "minProperties")) |min| if (raw.object.count() < try integral(min)) return error.InvalidLength;
        if (get(s, "maxProperties")) |max| if (raw.object.count() > try integral(max)) return error.InvalidLength;
    }
    if (raw == .array) {
        if (get(s, "minItems")) |min| if (raw.array.items.len < try integral(min)) return error.InvalidLength;
        if (get(s, "maxItems")) |max| if (raw.array.items.len > try integral(max)) return error.InvalidLength;
        if (get(s, "items")) |items| for (raw.array.items) |v| {
            try inner(doc, items, v, depth + 1);
        };
    }
    if (raw == .string) {
        const length = std.unicode.utf8CountCodepoints(raw.string) catch return error.InvalidType;
        if (get(s, "minLength")) |min| if (length < try integral(min)) return error.InvalidLength;
        if (get(s, "maxLength")) |max| if (length > try integral(max)) return error.InvalidLength;
        if (get(s, "pattern")) |pattern| if (!try matchesPattern(pattern.string, raw.string)) return error.InvalidPattern;
    }
    if (raw == .integer or raw == .number_string or raw == .float) {
        const exact = integral(raw) catch null;
        if (get(s, "format")) |format| {
            if (format == .string and std.mem.eql(u8, format.string, "int32")) {
                const value = exact orelse return error.InvalidType;
                if (value < std.math.minInt(i32) or value > std.math.maxInt(i32)) return error.OutOfRange;
            }
            if (format == .string and std.mem.eql(u8, format.string, "int64")) {
                const value = exact orelse return error.InvalidType;
                if (value < std.math.minInt(i64) or value > std.math.maxInt(i64)) return error.OutOfRange;
            }
        }
        inline for (.{ "minimum", "maximum", "exclusiveMinimum", "exclusiveMaximum" }, 0..) |key, index| {
            if (get(s, key)) |bound| {
                const exact_bound = integral(bound) catch null;
                const bad = if (exact != null and exact_bound != null) switch (index) {
                    0 => exact.? < exact_bound.?,
                    1 => exact.? > exact_bound.?,
                    2 => exact.? <= exact_bound.?,
                    3 => exact.? >= exact_bound.?,
                    else => unreachable,
                } else blk: {
                    const value = number(raw) catch return error.InvalidType;
                    const limit = number(bound) catch return error.InvalidType;
                    break :blk switch (index) {
                        0 => value < limit,
                        1 => value > limit,
                        2 => value <= limit,
                        3 => value >= limit,
                        else => unreachable,
                    };
                };
                if (bad) return error.OutOfRange;
            }
        }
    }
}

test "required unconstrained fields remain mandatory" {
    const a = std.testing.allocator;
    var schema = try std.json.parseFromSlice(V, a, "{\"type\":\"object\",\"required\":[\"items\"]}", .{});
    defer schema.deinit();
    var absent = try std.json.parseFromSlice(V, a, "{}", .{});
    defer absent.deinit();
    try std.testing.expectError(error.MissingField, validate(.null, schema.value, absent.value));
    var present = try std.json.parseFromSlice(V, a, "{\"items\":null}", .{});
    defer present.deinit();
    try validate(.null, schema.value, present.value);
}
test "exact bounds and overlapping enum-string alternatives" {
    const a = std.testing.allocator;
    var s = try std.json.parseFromSlice(V, a, "{\"type\":\"integer\",\"maximum\":9007199254740993}", .{ .parse_numbers = false });
    defer s.deinit();
    try validate(.null, s.value, .{ .number_string = "9007199254740993" });
    try std.testing.expectError(error.OutOfRange, validate(.null, s.value, .{ .number_string = "9007199254740994" }));
    var overlap = try std.json.parseFromSlice(V, a, "{\"oneOf\":[{\"type\":\"string\",\"enum\":[\"profile\"]},{\"type\":\"string\"}]}", .{});
    defer overlap.deinit();
    try validate(.null, overlap.value, .{ .string = "profile" });
}

test "official filter pattern grammars" {
    try std.testing.expect(try matchesPattern("^(id|type|daysOld|rating|dailyIncome|weeklyIncome|dailyCustomers|weeklyCustomers):(=|!=|<|<=|>=|>|Equal|NotEqual|Less|LessOrEqual|GreaterOrEqual|Greater):\\d+$", "id:>=:9007199254740993"));
    try std.testing.expect(!try matchesPattern("^(level|daysOld|offences):(=|!=|<|<=|>=|>|Equal|NotEqual|Less|LessOrEqual|GreaterOrEqual|Greater):\\d+$", "id:=:1"));
    try std.testing.expect(try matchesPattern("^factions:\\d+(;\\d+)*$", "factions:1;2;3"));
    try std.testing.expect(!try matchesPattern("^factions:\\d+(;\\d+)*$", "factions:1;"));
}

test "strict maps unknown fields nullability and array bounds" {
    const a = std.testing.allocator;
    var s = try std.json.parseFromSlice(V, a, "{\"type\":\"object\",\"required\":[\"id\"],\"properties\":{\"id\":{\"oneOf\":[{\"type\":\"integer\"},{\"type\":\"null\"}]}},\"additionalProperties\":false}", .{});
    defer s.deinit();
    var good = try std.json.parseFromSlice(V, a, "{\"id\":null}", .{});
    defer good.deinit();
    try validate(.null, s.value, good.value);
    var bad = try std.json.parseFromSlice(V, a, "{\"id\":null,\"extra\":1}", .{});
    defer bad.deinit();
    try std.testing.expectError(error.UnknownField, validate(.null, s.value, bad.value));
}
