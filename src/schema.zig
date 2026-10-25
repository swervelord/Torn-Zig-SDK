//! Official schema validation. Overlapping oneOf uses compatible any-match semantics
//! because upstream selection enums overlap a general string branch.
const std = @import("std");
const model = @import("model.zig");
const V = std.json.Value;
pub const Error = error{ Canceled, Timeout, InvalidType, MissingField, InvalidEnum, InvalidUnion, OutOfRange, InvalidReference, SchemaDepth, UnknownField, InvalidLength, InvalidPattern, UnsupportedConstraint };
fn get(v: V, key: []const u8) ?V {
    return if (v == .object) v.object.get(key) else null;
}
fn integral(v: V) !i128 {
    return switch (v) {
        .integer => |i| i,
        .number_string => |s| if (s.len > 0 and s[0] == '-') @as(i128, model.integer(i64, s) catch return error.OutOfRange) else @as(i128, model.integer(u64, s) catch return error.OutOfRange),
        .float => |f| if (std.math.isFinite(f) and @trunc(f) == f and f >= -9223372036854775808.0 and f <= 18446744073709551616.0) @as(i128, @intFromFloat(f)) else error.InvalidType,
        else => error.InvalidType,
    };
}
const Decimal = struct {
    negative: bool,
    coefficient: []const u8,
    significant: usize,
    magnitude: i128,
    capped: bool,
    fn parse(s: []const u8) !Decimal {
        if (!model.validNumberSyntax(s)) return error.InvalidType;
        const negative = s[0] == '-';
        const begin: @TypeOf(s.len) = if (negative) 1 else 0;
        const exponent_at = std.mem.indexOfAny(u8, s, "eE") orelse s.len;
        const decimal_at = std.mem.indexOfScalar(u8, s[begin..exponent_at], '.');
        const fraction = if (decimal_at) |dot| exponent_at - begin - dot - 1 else @as(usize, 0);
        var first: usize = exponent_at;
        var last: usize = begin;
        var significant: usize = 0;
        for (s[begin..exponent_at], begin..) |c, i| if (c != '.' and c != '0') {
            first = @min(first, i);
            last = i;
        };
        if (first == exponent_at) return .{ .negative = false, .coefficient = "", .significant = 0, .magnitude = 0, .capped = false };
        for (s[first .. last + 1]) |c| if (c != '.') {
            significant += 1;
        };
        var trailing: usize = 0;
        for (s[last + 1 .. exponent_at]) |c| if (c != '.') {
            trailing += 1;
        };
        var capped = false;
        const exponent: i128 = if (exponent_at == s.len) 0 else std.fmt.parseInt(i128, s[exponent_at + 1 ..], 10) catch blk: {
            capped = true;
            break :blk if (s[exponent_at + 1] == '-') std.math.minInt(i128) else std.math.maxInt(i128);
        };
        const offset = @as(i128, @intCast(trailing)) - @as(i128, @intCast(fraction)) + @as(i128, @intCast(significant));
        const magnitude: i128 = std.math.add(i128, exponent, offset) catch blk: {
            capped = true;
            break :blk if (exponent < 0) std.math.minInt(i128) else std.math.maxInt(i128);
        };
        return .{ .negative = negative, .coefficient = s[first .. last + 1], .significant = significant, .magnitude = magnitude, .capped = capped };
    }
};
fn numberText(v: V, buffer: []u8) ![]const u8 {
    return switch (v) {
        .number_string => v.number_string,
        .integer => std.fmt.bufPrint(buffer, "{d}", .{v.integer}),
        .float => if (std.math.isFinite(v.float)) std.fmt.bufPrint(buffer, "{d}", .{v.float}) else error.InvalidType,
        else => error.InvalidType,
    };
}
fn numericOrder(a: V, b: V) !std.math.Order {
    var ab: [128]u8 = undefined;
    var bb: [128]u8 = undefined;
    const at = try numberText(a, &ab);
    const bt = try numberText(b, &bb);
    if (std.mem.eql(u8, at, bt)) return .eq;
    const x = try Decimal.parse(at);
    const y = try Decimal.parse(bt);
    if (x.significant == 0 and y.significant == 0) return .eq;
    if (x.negative != y.negative) return if (x.negative) .lt else .gt;
    var order: std.math.Order = .eq;
    if (x.significant == 0) order = .lt else if (y.significant == 0) order = .gt else if (x.magnitude != y.magnitude) order = if (x.magnitude < y.magnitude) .lt else .gt else {
        if (x.capped or y.capped) return error.UnsupportedConstraint;
        var xi: usize = 0;
        var yi: usize = 0;
        for (0..@max(x.significant, y.significant)) |_| {
            if (xi < x.coefficient.len and x.coefficient[xi] == '.') xi += 1;
            if (yi < y.coefficient.len and y.coefficient[yi] == '.') yi += 1;
            const xd = if (xi < x.coefficient.len) x.coefficient[xi] else '0';
            const yd = if (yi < y.coefficient.len) y.coefficient[yi] else '0';
            if (xd != yd) {
                order = if (xd < yd) .lt else .gt;
                break;
            }
            xi += 1;
            yi += 1;
        }
    }
    return if (x.negative) switch (order) {
        .lt => .gt,
        .gt => .lt,
        .eq => .eq,
    } else order;
}
fn equivalent(a: V, b: V) bool {
    if (a == .string and b == .string) return std.mem.eql(u8, a.string, b.string);
    if (a == .null and b == .null) return true;
    if (a == .bool and b == .bool) return a.bool == b.bool;
    if ((a == .number_string or a == .integer or a == .float) and (b == .number_string or b == .integer or b == .float)) {
        return (numericOrder(a, b) catch return false) == .eq;
    }
    return false;
}
fn matchesType(raw: V, kind: []const u8) bool {
    if (std.mem.eql(u8, kind, "null")) return raw == .null;
    if (std.mem.eql(u8, kind, "object")) return raw == .object;
    if (std.mem.eql(u8, kind, "array")) return raw == .array;
    if (std.mem.eql(u8, kind, "string")) return raw == .string;
    if (std.mem.eql(u8, kind, "boolean")) return raw == .bool;
    if (std.mem.eql(u8, kind, "number")) return switch (raw) {
        .integer => true,
        .float => |f| std.math.isFinite(f),
        .number_string => |s| model.validNumberSyntax(s),
        else => false,
    };
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
    try validateChecked(document, contract, raw, null);
}
pub fn validateChecked(document: V, contract: V, raw: V, checkpoint: ?model.Checkpoint) Error!void {
    var diagnostic: model.Diagnostic = .{ .checkpoint = checkpoint };
    try validateDetailed(document, contract, raw, &diagnostic);
}
/// The diagnostic owns its bounded JSON-pointer path and retains its checkpoint.
pub fn validateDetailed(document: V, contract: V, raw: V, diagnostic: *model.Diagnostic) Error!void {
    diagnostic.* = .{ .checkpoint = diagnostic.checkpoint };
    inner(document, contract, raw, 0, diagnostic.checkpoint, diagnostic) catch |err| {
        diagnostic.reason = err;
        return err;
    };
}
fn pushPath(d: *model.Diagnostic, key: []const u8) usize {
    const old = d.path_len;
    if (d.path_len < d.path.len) {
        d.path[d.path_len] = '/';
        d.path_len += 1;
    }
    for (key) |c| {
        const text = if (c == '~') "~0" else if (c == '/') "~1" else null;
        if (text) |escaped| {
            for (escaped) |ch| if (d.path_len < d.path.len) {
                d.path[d.path_len] = ch;
                d.path_len += 1;
            };
        } else if (d.path_len < d.path.len) {
            d.path[d.path_len] = c;
            d.path_len += 1;
        }
    }
    return old;
}
fn inner(doc: V, s: V, raw: V, depth: usize, checkpoint: ?model.Checkpoint, diagnostic: *model.Diagnostic) Error!void {
    if (checkpoint) |c| try c.check();
    if (depth > 128) return error.SchemaDepth;
    if (s == .bool) return if (s.bool) {} else error.InvalidType;
    if (get(s, "$ref")) |ref| try inner(doc, try resolve(doc, ref.string), raw, depth + 1, checkpoint, diagnostic);
    if (get(s, "allOf")) |all| for (all.array.items) |branch| {
        try inner(doc, branch, raw, depth + 1, checkpoint, diagnostic);
    };
    if (get(s, "oneOf") orelse get(s, "anyOf")) |alternatives| {
        var accepted = false;
        const saved = diagnostic.*;
        for (alternatives.array.items) |branch| {
            diagnostic.* = saved;
            if (inner(doc, branch, raw, depth + 1, checkpoint, diagnostic)) |_| {
                accepted = true;
                diagnostic.* = saved;
                break;
            } else |err| {
                if (err == error.Canceled or err == error.Timeout) return err;
                diagnostic.* = saved;
            }
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
            if (!raw.object.contains(key.string)) {
                _ = pushPath(diagnostic, key.string);
                return error.MissingField;
            }
        };
        const props = get(s, "properties");
        var it = raw.object.iterator();
        while (it.next()) |kv| {
            const old = pushPath(diagnostic, kv.key_ptr.*);
            const child = if (props) |p| p.object.get(kv.key_ptr.*) else null;
            if (child) |c| try inner(doc, c, kv.value_ptr.*, depth + 1, checkpoint, diagnostic) else if (get(s, "additionalProperties")) |additional| {
                if (additional == .bool and !additional.bool) return error.UnknownField;
                if (additional == .object) try inner(doc, additional, kv.value_ptr.*, depth + 1, checkpoint, diagnostic);
            }
            diagnostic.path_len = old;
        }
        if (get(s, "minProperties")) |min| if (raw.object.count() < try integral(min)) return error.InvalidLength;
        if (get(s, "maxProperties")) |max| if (raw.object.count() > try integral(max)) return error.InvalidLength;
    }
    if (raw == .array) {
        if (get(s, "minItems")) |min| if (raw.array.items.len < try integral(min)) return error.InvalidLength;
        if (get(s, "maxItems")) |max| if (raw.array.items.len > try integral(max)) return error.InvalidLength;
        if (get(s, "items")) |items| for (raw.array.items, 0..) |v, i| {
            var index: [24]u8 = undefined;
            const old = pushPath(diagnostic, std.fmt.bufPrint(&index, "{d}", .{i}) catch unreachable);
            try inner(doc, items, v, depth + 1, checkpoint, diagnostic);
            diagnostic.path_len = old;
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
                const order = numericOrder(raw, bound) catch |err| return if (err == error.UnsupportedConstraint) error.UnsupportedConstraint else error.InvalidType;
                const bad = switch (index) {
                    0 => order == .lt,
                    1 => order == .gt,
                    2 => order != .gt,
                    3 => order != .lt,
                    else => unreachable,
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

test "schema union alternatives propagate cancellation without treating it as mismatch" {
    const State = struct {
        calls: usize = 0,
        fn check(context: ?*anyopaque) error{ Canceled, Timeout }!void {
            const self: *@This() = @ptrCast(@alignCast(context.?));
            self.calls += 1;
            if (self.calls == 2) return error.Canceled;
        }
    };
    var state: State = .{};
    var s = try std.json.parseFromSlice(V, std.testing.allocator, "{\"oneOf\":[{\"type\":\"string\"},{\"type\":\"integer\"}]}", .{});
    defer s.deinit();
    try std.testing.expectError(error.Canceled, validateChecked(.null, s.value, .{ .number_string = "1" }, .{ .context = &state, .check_fn = State.check }));
    try std.testing.expectEqual(@as(usize, 2), state.calls);
}
test "integer enum validation never rounds out-of-range values to an allowed integer" {
    var s = try std.json.parseFromSlice(V, std.testing.allocator, "{\"enum\":[18446744073709551615]}", .{ .parse_numbers = false });
    defer s.deinit();
    try validate(.null, s.value, .{ .number_string = "18446744073709551615.0" });
    try std.testing.expectError(error.InvalidEnum, validate(.null, s.value, .{ .number_string = "18446744073709551616" }));
}

test "decimal schema bounds compare exact significands without floating point" {
    const cases = .{
        .{ "1.00000000000000000001", "1", std.math.Order.gt },
        .{ "18446744073709551616", "18446744073709551615", std.math.Order.gt },
        .{ "1000e-3", "1.0", std.math.Order.eq },
        .{ "0.00001", "1e-5", std.math.Order.eq },
        .{ "-1.00000000000000000001", "-1", std.math.Order.lt },
        .{ "-0e999999999999999999999999999", "0", std.math.Order.eq },
        .{ "1e999999999999999999999999999999999999999999999999999", "18446744073709551615", std.math.Order.gt },
        .{ "1e-999999999999999999999999999999999999999999999999999", "1e-6", std.math.Order.lt },
    };
    inline for (cases) |case| try std.testing.expectEqual(case[2], try numericOrder(.{ .number_string = case[0] }, .{ .number_string = case[1] }));
    var s = try std.json.parseFromSlice(V, std.testing.allocator, "{\"type\":\"number\",\"maximum\":1}", .{ .parse_numbers = false });
    defer s.deinit();
    try std.testing.expectError(error.OutOfRange, validate(.null, s.value, .{ .number_string = "1.00000000000000000001" }));
    try std.testing.expectError(error.InvalidType, validate(.null, s.value, .{ .number_string = "1e+" }));
}

test "detailed schema paths include nested array bounds missing fields and escaped keys" {
    const a = std.testing.allocator;
    var s = try std.json.parseFromSlice(V, a, "{\"type\":\"object\",\"properties\":{\"items\":{\"type\":\"array\",\"items\":{\"type\":\"object\",\"required\":[\"id\"],\"properties\":{\"id\":{\"type\":\"integer\",\"format\":\"int32\"}}}}}}", .{});
    defer s.deinit();
    var bad = try std.json.parseFromSlice(V, a, "{\"items\":[{\"id\":2147483648}]}", .{ .parse_numbers = false });
    defer bad.deinit();
    var d: model.Diagnostic = .{};
    try std.testing.expectError(error.OutOfRange, validateDetailed(.null, s.value, bad.value, &d));
    try std.testing.expectEqualStrings("/items/0/id", d.jsonPath());
    try std.testing.expect(d.reason.? == error.OutOfRange);
    var missing = try std.json.parseFromSlice(V, a, "{\"items\":[{}]}", .{});
    defer missing.deinit();
    try std.testing.expectError(error.MissingField, validateDetailed(.null, s.value, missing.value, &d));
    try std.testing.expectEqualStrings("/items/0/id", d.jsonPath());
    var closed = try std.json.parseFromSlice(V, a, "{\"type\":\"object\",\"additionalProperties\":false}", .{});
    defer closed.deinit();
    var unknown = try std.json.parseFromSlice(V, a, "{\"a/b~c\":1}", .{});
    defer unknown.deinit();
    try std.testing.expectError(error.UnknownField, validateDetailed(.null, closed.value, unknown.value, &d));
    try std.testing.expectEqualStrings("/a~1b~0c", d.jsonPath());
    const copied = d;
    d.path_len = 0;
    try std.testing.expectEqualStrings("/a~1b~0c", copied.jsonPath());
}
test "schema alternative mismatch restores parent path and cancellation retains failing path" {
    const a = std.testing.allocator;
    var s = try std.json.parseFromSlice(V, a, "{\"properties\":{\"choice\":{\"oneOf\":[{\"type\":\"object\",\"required\":[\"inner\"]},{\"type\":\"integer\"}]}}}", .{});
    defer s.deinit();
    var raw = try std.json.parseFromSlice(V, a, "{\"choice\":{}}", .{});
    defer raw.deinit();
    var d: model.Diagnostic = .{};
    try std.testing.expectError(error.InvalidUnion, validateDetailed(.null, s.value, raw.value, &d));
    try std.testing.expectEqualStrings("/choice", d.jsonPath());
    const State = struct {
        calls: usize = 0,
        fn check(context: ?*anyopaque) error{ Canceled, Timeout }!void {
            const self: *@This() = @ptrCast(@alignCast(context.?));
            self.calls += 1;
            if (self.calls == 2) return error.Timeout;
        }
    };
    var state: State = .{};
    d.checkpoint = .{ .context = &state, .check_fn = State.check };
    try std.testing.expectError(error.Timeout, validateDetailed(.null, s.value, raw.value, &d));
    try std.testing.expectEqualStrings("/choice", d.jsonPath());
    try std.testing.expect(d.reason.? == error.Timeout and d.checkpoint != null);
}
