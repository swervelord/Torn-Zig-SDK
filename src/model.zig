const std = @import("std");
pub const RawValue = std.json.Value;
pub const Raw = RawValue;
pub const ExactNumber = struct { lexeme: []const u8 };
pub const Checkpoint = struct {
    context: ?*anyopaque = null,
    check_fn: *const fn (?*anyopaque) error{ Canceled, Timeout }!void,
    pub fn check(self: Checkpoint) error{ Canceled, Timeout }!void {
        try self.check_fn(self.context);
    }
};
pub const CompatField = struct { name: []const u8, key: []const u8, aliases: []const []const u8, has_default: bool, flatten: bool, custom: []const u8 };
pub fn Presence(comptime T: type) type {
    return union(enum) {
        absent,
        null,
        value: T,
        pub const presence_child = T;
    };
}
pub fn Map(comptime T: type) type {
    return struct {
        pub const map_child = T;
        pub const Entry = struct { key: []const u8, value: T };
        entries: []Entry,
        pub fn get(self: @This(), key: []const u8) ?T {
            for (self.entries) |entry| if (std.mem.eql(u8, entry.key, key)) return entry.value;
            return null;
        }
    };
}

/// Owns every buffer, JSON node, and borrowed field in value. Do not copy this handle.
pub fn Owned(comptime T: type) type {
    return struct {
        value: T,
        raw: RawValue,
        arena: *std.heap.ArenaAllocator,
        allocator: std.mem.Allocator,
        pub fn deinit(self: *@This()) void {
            self.arena.deinit();
            self.allocator.destroy(self.arena);
            self.* = undefined;
        }
        /// Serializes the retained input, preserving unknown fields and exact numbers.
        pub fn originalJson(self: @This(), allocator: std.mem.Allocator) ![]u8 {
            return std.json.Stringify.valueAlloc(allocator, self.raw, .{});
        }
        /// Serializes current typed fields, retaining unknown original fields.
        pub fn toJson(self: @This(), allocator: std.mem.Allocator) ![]u8 {
            return self.toJsonChecked(allocator, null);
        }
        pub fn toJsonChecked(self: @This(), allocator: std.mem.Allocator, checkpoint: ?Checkpoint) ![]u8 {
            var arena = std.heap.ArenaAllocator.init(allocator);
            defer arena.deinit();
            const raw = try toRaw(T, arena.allocator(), self.value, self.raw, checkpoint);
            if (checkpoint) |c| try c.check();
            const output = try std.json.Stringify.valueAlloc(allocator, raw, .{});
            errdefer allocator.free(output);
            if (checkpoint) |c| try c.check();
            return output;
        }
    };
}

pub const Diagnostic = struct {
    checkpoint: ?Checkpoint = null,
    path: [512]u8 = @splat(0),
    path_len: usize = 0,
    reason: ?anyerror = null,
    pub fn jsonPath(self: *const Diagnostic) []const u8 {
        return self.path[0..self.path_len];
    }
};
pub const DecodeError = error{ Canceled, Timeout, InvalidType, MissingField, AliasCollision, InvalidEnum, InvalidUnion, OutOfRange, NonIntegral, InvalidNumber, OutOfMemory };

pub fn decode(comptime T: type, allocator: std.mem.Allocator, text: []const u8) !Owned(T) {
    var diagnostic: Diagnostic = .{};
    return decodeDetailed(T, allocator, text, &diagnostic);
}
pub fn decodeChecked(comptime T: type, allocator: std.mem.Allocator, text: []const u8, checkpoint: ?Checkpoint) !Owned(T) {
    var diagnostic: Diagnostic = .{ .checkpoint = checkpoint };
    return decodeDetailed(T, allocator, text, &diagnostic);
}
pub fn decodeDetailed(comptime T: type, allocator: std.mem.Allocator, text: []const u8, diagnostic: *Diagnostic) !Owned(T) {
    diagnostic.* = .{ .checkpoint = diagnostic.checkpoint };
    if (diagnostic.checkpoint) |c| try c.check();
    const arena = try allocator.create(std.heap.ArenaAllocator);
    errdefer allocator.destroy(arena);
    arena.* = std.heap.ArenaAllocator.init(allocator);
    errdefer arena.deinit();
    const a = arena.allocator();
    const raw = try std.json.parseFromSliceLeaky(RawValue, a, text, .{ .allocate = .alloc_always, .parse_numbers = false, .duplicate_field_behavior = .@"error" });
    if (diagnostic.checkpoint) |c| try c.check();
    const value = convert(T, a, raw, diagnostic) catch |err| {
        diagnostic.reason = err;
        return err;
    };
    return .{ .value = value, .raw = raw, .arena = arena, .allocator = allocator };
}

/// Exact bounded-space conversion of decimal/exponent JSON notation to integer domains.
pub fn validNumberSyntax(text: []const u8) bool {
    if (text.len == 0) return false;
    var i: usize = if (text[0] == '-') 1 else 0;
    if (i == text.len or text[i] < '0' or text[i] > '9') return false;
    if (text[i] == '0') {
        i += 1;
        if (i < text.len and text[i] >= '0' and text[i] <= '9') return false;
    } else {
        while (i < text.len and text[i] >= '0' and text[i] <= '9') : (i += 1) {}
    }
    if (i < text.len and text[i] == '.') {
        i += 1;
        const start = i;
        while (i < text.len and text[i] >= '0' and text[i] <= '9') : (i += 1) {}
        if (i == start) return false;
    }
    if (i < text.len and (text[i] == 'e' or text[i] == 'E')) {
        i += 1;
        if (i < text.len and (text[i] == '+' or text[i] == '-')) i += 1;
        const start = i;
        while (i < text.len and text[i] >= '0' and text[i] <= '9') : (i += 1) {}
        if (i == start) return false;
    }
    return i == text.len;
}
pub fn integer(comptime T: type, text: []const u8) DecodeError!T {
    if (!validNumberSyntax(text)) return error.InvalidNumber;
    const negative = text[0] == '-';
    const start: usize = if (negative) 1 else 0;
    var exponent_at = text.len;
    var dot_at: ?usize = null;
    for (text[start..], start..) |c, i| {
        if (c == 'e' or c == 'E') {
            exponent_at = i;
            break;
        }
        if (c == '.') {
            if (dot_at != null) return error.InvalidNumber;
            dot_at = i;
        } else if (c < '0' or c > '9') return error.InvalidNumber;
    }
    var exp: i64 = 0;
    if (exponent_at < text.len) {
        const exp_text = text[exponent_at + 1 ..];
        if (exp_text.len == 0) return error.InvalidNumber;
        exp = std.fmt.parseInt(i64, exp_text, 10) catch |err| switch (err) {
            error.Overflow => if (exp_text[0] == '-') std.math.minInt(i64) else std.math.maxInt(i64),
            else => return error.InvalidNumber,
        };
    }
    var digits: usize = 0;
    var leading: usize = 0;
    var trailing: usize = 0;
    var nonzero = false;
    for (text[start..exponent_at]) |c| {
        if (c == '.') continue;
        digits += 1;
        if (!nonzero and c == '0') leading += 1;
        if (c != '0') {
            nonzero = true;
            trailing = 0;
        } else trailing += 1;
    }
    if (digits == 0) return error.InvalidNumber;
    if (!nonzero) return 0;
    if (negative and @typeInfo(T).int.signedness == .unsigned) return error.OutOfRange;
    const fraction: i64 = if (dot_at) |dot| @intCast(exponent_at - dot - 1) else 0;
    const scale = std.math.sub(i64, exp, fraction) catch return if (exp < 0) error.NonIntegral else error.OutOfRange;
    const drop: usize = if (scale < 0) blk: {
        if (scale == std.math.minInt(i64)) return error.NonIntegral;
        const count: u64 = @intCast(-scale);
        if (count > trailing) return error.NonIntegral;
        break :blk @intCast(count);
    } else 0;
    const significant = digits - leading - drop;
    if (significant > 20 or scale > 20) return error.OutOfRange;
    var magnitude: u64 = 0;
    var seen: usize = 0;
    for (text[start..exponent_at]) |c| {
        if (c == '.') continue;
        seen += 1;
        if (seen > digits - drop) break;
        magnitude = std.math.mul(u64, magnitude, 10) catch return error.OutOfRange;
        magnitude = std.math.add(u64, magnitude, c - '0') catch return error.OutOfRange;
    }
    if (scale > 0) for (0..@intCast(scale)) |_| {
        magnitude = std.math.mul(u64, magnitude, 10) catch return error.OutOfRange;
    };
    if (@typeInfo(T).int.signedness == .unsigned) return std.math.cast(T, magnitude) orelse error.OutOfRange;
    if (negative) {
        const limit: u64 = @as(u64, @intCast(std.math.maxInt(T))) + 1;
        if (magnitude > limit) return error.OutOfRange;
        if (magnitude == limit) return std.math.minInt(T);
        return -@as(T, @intCast(magnitude));
    }
    return std.math.cast(T, magnitude) orelse error.OutOfRange;
}

fn hasDecl(comptime T: type, comptime name: []const u8) bool {
    return switch (@typeInfo(T)) {
        .@"struct", .@"union", .@"enum", .@"opaque" => @hasDecl(T, name),
        else => false,
    };
}
fn push(d: *Diagnostic, key: []const u8) usize {
    const old = d.path_len;
    if (d.path_len < d.path.len) {
        d.path[d.path_len] = '/';
        d.path_len += 1;
    }
    const n = @min(key.len, d.path.len - d.path_len);
    @memcpy(d.path[d.path_len..][0..n], key[0..n]);
    d.path_len += n;
    return old;
}
pub fn convert(comptime T: type, a: std.mem.Allocator, raw: RawValue, d: *Diagnostic) DecodeError!T {
    if (d.checkpoint) |c| try c.check();
    if (T == RawValue) return raw;
    if (T == ExactNumber) return switch (raw) {
        .number_string => |s| if (validNumberSyntax(s)) .{ .lexeme = s } else error.InvalidNumber,
        .integer => |i| .{ .lexeme = try std.fmt.allocPrint(a, "{d}", .{i}) },
        .float => |f| if (std.math.isFinite(f)) .{ .lexeme = try std.fmt.allocPrint(a, "{d}", .{f}) } else error.InvalidNumber,
        else => error.InvalidType,
    };
    if (comptime hasDecl(T, "presence_child")) {
        if (raw == .null) return .null;
        return .{ .value = try convert(T.presence_child, a, raw, d) };
    }
    if (comptime hasDecl(T, "map_child")) {
        if (raw != .object) return error.InvalidType;
        const entries = try a.alloc(T.Entry, raw.object.count());
        var it = raw.object.iterator();
        var i: usize = 0;
        while (it.next()) |entry| : (i += 1) {
            const old = push(d, entry.key_ptr.*);
            entries[i] = .{ .key = entry.key_ptr.*, .value = try convert(T.map_child, a, entry.value_ptr.*, d) };
            d.path_len = old;
        }
        return .{ .entries = entries };
    }
    switch (@typeInfo(T)) {
        .bool => return if (raw == .bool) raw.bool else error.InvalidType,
        .int => switch (raw) {
            .number_string => |n| return integer(T, n),
            .integer => |n| return std.math.cast(T, n) orelse error.OutOfRange,
            else => return error.InvalidType,
        },
        .float => {
            const value: T = switch (raw) {
                .number_string => |n| std.fmt.parseFloat(T, n) catch return error.InvalidNumber,
                .integer => |n| @floatFromInt(n),
                .float => |n| @floatCast(n),
                else => return error.InvalidType,
            };
            if (!std.math.isFinite(value)) return error.OutOfRange;
            return value;
        },
        .optional => |info| return if (raw == .null) null else try convert(info.child, a, raw, d),
        .pointer => |info| {
            if (info.size == .one) {
                const value = try a.create(info.child);
                value.* = try convert(info.child, a, raw, d);
                return value;
            }
            if (info.size != .slice) return error.InvalidType;
            if (info.child == u8) return if (raw == .string) raw.string else error.InvalidType;
            if (raw != .array) return error.InvalidType;
            const out = try a.alloc(info.child, raw.array.items.len);
            for (raw.array.items, 0..) |v, i| {
                var buf: [24]u8 = undefined;
                const old = push(d, std.fmt.bufPrint(&buf, "{d}", .{i}) catch unreachable);
                out[i] = try convert(info.child, a, v, d);
                d.path_len = old;
            }
            return out;
        },
        .@"enum" => {
            const name = switch (raw) {
                .string => |s| s,
                .number_string => |s| s,
                else => return error.InvalidEnum,
            };
            if (std.meta.stringToEnum(T, name)) |v| return v;
            if (raw == .number_string) {
                var buffer: [32]u8 = undefined;
                const value = integer(i64, name) catch return error.InvalidEnum;
                const canonical = std.fmt.bufPrint(&buffer, "{d}", .{value}) catch return error.InvalidEnum;
                return std.meta.stringToEnum(T, canonical) orelse error.InvalidEnum;
            }
            return error.InvalidEnum;
        },
        .@"struct" => |info| {
            if (raw != .object) return error.InvalidType;
            if (comptime hasDecl(T, "compatibility_fields")) return compatStruct(T, a, raw, d);
            var result: T = undefined;
            inline for (info.field_names, info.field_types, info.field_attrs) |field_name, field_type, field_attrs| {
                const old = push(d, field_name);
                if (raw.object.get(field_name)) |v| {
                    @field(result, field_name) = try convert(field_type, a, v, d);
                } else if (comptime hasDecl(field_type, "presence_child")) {
                    @field(result, field_name) = .absent;
                } else if (field_attrs.defaultValue(field_type)) |default| {
                    @field(result, field_name) = default;
                } else return error.MissingField;
                d.path_len = old;
            }
            return result;
        },
        .@"union" => |info| {
            if (comptime hasDecl(T, "compatibility_name")) {
                if (compatBranch(T.compatibility_name, raw)) |selected| {
                    inline for (info.field_names, info.field_types, 0..) |field_name, field_type, i| {
                        if (selected == i) return @unionInit(T, field_name, try convert(field_type, a, try unionPayload(field_type, a, raw), d));
                    }
                    return error.InvalidUnion;
                }
            }
            var selected: ?T = null;
            var best: i64 = std.math.minInt(i64);
            inline for (info.field_names, info.field_types) |field_name, field_type| {
                const saved = d.*;
                if (convert(field_type, a, raw, d)) |v| {
                    const score = try coverage(field_type, raw, 0, d.checkpoint);
                    if (score > best) {
                        selected = @unionInit(T, field_name, v);
                        best = score;
                    }
                    d.* = saved;
                } else |err| {
                    if (err == error.OutOfMemory or err == error.Canceled or err == error.Timeout) return err;
                    d.* = saved;
                }
            }
            return selected orelse error.InvalidUnion;
        },
        .void => return if (raw == .null) {} else error.InvalidType,
        else => @compileError("Unsupported JSON target type: " ++ @typeName(T)),
    }
}
fn coverage(comptime T: type, raw: Raw, depth: usize, checkpoint: ?Checkpoint) error{ Canceled, Timeout }!i64 {
    if (checkpoint) |c| try c.check();
    if (depth > 64) return 0;
    if (T == Raw) return -1;
    if (comptime hasDecl(T, "presence_child")) return coverage(T.presence_child, raw, depth + 1, checkpoint);
    if (comptime hasDecl(T, "map_child")) return 0;
    return switch (@typeInfo(T)) {
        .optional => |o| if (raw == .null) 1 else try coverage(o.child, raw, depth + 1, checkpoint),
        .pointer => |p| blk: {
            if (p.size == .one) break :blk try coverage(p.child, raw, depth + 1, checkpoint);
            if (p.child == u8) break :blk 1;
            if (raw != .array) break :blk 0;
            var score: i64 = 1;
            for (raw.array.items) |value| score += @max(1, try coverage(p.child, value, depth + 1, checkpoint));
            break :blk score;
        },
        .@"struct" => |info| blk: {
            if (raw != .object) break :blk 0;
            var score: i64 = 1;
            inline for (info.field_names, info.field_types) |name, F| if (raw.object.get(name)) |value| {
                score += 1 + @max(0, try coverage(F, value, depth + 1, checkpoint));
            };
            break :blk score;
        },
        .@"enum" => 3,
        .@"union" => |info| blk: {
            var best: i64 = 0;
            inline for (info.field_types) |F| best = @max(best, try coverage(F, raw, depth + 1, checkpoint));
            break :blk best;
        },
        else => 1,
    };
}

fn defaultValue(comptime T: type) T {
    if (T == Raw) return .null;
    if (comptime hasDecl(T, "map_child")) return .{ .entries = &.{} };
    return switch (@typeInfo(T)) {
        .optional => null,
        .bool => false,
        .int, .float => 0,
        .pointer => |p| if (p.size == .slice) &.{} else unreachable,
        .@"struct" => |info| blk: {
            var result: T = undefined;
            inline for (info.field_names, info.field_types) |n, F| @field(result, n) = defaultValue(F);
            break :blk result;
        },
        else => unreachable,
    };
}
fn unionPayload(comptime T: type, a: std.mem.Allocator, raw: Raw) DecodeError!Raw {
    if (comptime hasDecl(T, "compatibility_fields")) {
        inline for (T.compatibility_fields) |field| {
            if (comptime std.mem.eql(u8, field.name, "extra") and !field.flatten) {
                if (raw != .object) return raw;
                var object = try raw.object.clone(a);
                if (!object.contains(field.key)) {
                    var extras: std.json.ObjectMap = .{};
                    var it = raw.object.iterator();
                    while (it.next()) |entry| if (!compatKey(T, entry.key_ptr.*)) {
                        try extras.put(a, entry.key_ptr.*, entry.value_ptr.*);
                    };
                    try object.put(a, field.key, .{ .object = extras });
                }
                inline for (T.compatibility_fields) |meta| {
                    if (comptime std.mem.eql(u8, meta.name, "job_type") or std.mem.eql(u8, meta.name, "item_type")) {
                        if (!object.contains(meta.key)) if (raw.object.get("type")) |tag| try object.put(a, meta.key, tag);
                    }
                }
                return .{ .object = object };
            }
        }
    }
    return raw;
}
fn compatKey(comptime T: type, key: []const u8) bool {
    inline for (T.compatibility_fields) |f| {
        if (!f.flatten and std.mem.eql(u8, f.key, key)) return true;
        inline for (f.aliases) |alias| if (std.mem.eql(u8, alias, key)) return true;
    }
    return false;
}
fn stringish(a: std.mem.Allocator, raw: Raw) DecodeError!Raw {
    return switch (raw) {
        .null, .string => raw,
        .number_string => |s| .{ .string = s },
        .integer => |i| .{ .string = try std.fmt.allocPrint(a, "{d}", .{i}) },
        .float => |f| .{ .string = try std.fmt.allocPrint(a, "{d}", .{f}) },
        .bool => |b| .{ .string = if (b) "true" else "false" },
        else => error.InvalidType,
    };
}
fn customConvert(comptime T: type, a: std.mem.Allocator, raw: Raw, comptime custom: []const u8, d: *Diagnostic) DecodeError!T {
    if (comptime std.mem.eql(u8, custom, "optional_stringish")) return convert(T, a, try stringish(a, raw), d);
    if (comptime std.mem.eql(u8, custom, "optional_position_name")) {
        if (raw == .object) return convert(T, a, try stringish(a, raw.object.get("name") orelse return error.MissingField), d);
        return convert(T, a, try stringish(a, raw), d);
    }
    if (comptime std.mem.eql(u8, custom, "company_news")) {
        if (raw == .null) return defaultValue(T);
        if (raw != .object and raw != .array) return error.InvalidType;
        const count = if (raw == .object) raw.object.count() else raw.array.items.len;
        const entries = try a.alloc(T.Entry, count);
        for (0..count) |i| {
            var value = if (raw == .object) raw.object.values()[i] else raw.array.items[i];
            const key = if (raw == .object) raw.object.keys()[i] else blk: {
                if (value == .object) if (value.object.get("id")) |id| {
                    const s = try stringish(a, id);
                    if (s == .string) break :blk s.string;
                };
                break :blk try std.fmt.allocPrint(a, "{d}", .{i});
            };
            if (value == .string) {
                var object: std.json.ObjectMap = .{};
                try object.put(a, "news", value);
                value = .{ .object = object };
            }
            if (value == .object) if (value.object.get("id")) |id| {
                var object = try value.object.clone(a);
                try object.put(a, "id", try stringish(a, id));
                value = .{ .object = object };
            };
            entries[i] = .{ .key = key, .value = try convert(T.map_child, a, value, d) };
        }
        return .{ .entries = entries };
    }
    return convert(T, a, raw, d);
}
fn compatStruct(comptime T: type, a: std.mem.Allocator, raw: Raw, d: *Diagnostic) DecodeError!T {
    const info = @typeInfo(T).@"struct";
    var result: T = undefined;
    inline for (info.field_names, info.field_types, T.compatibility_fields) |name, F, meta| {
        const old = push(d, meta.key);
        if (comptime meta.flatten) {
            var object: std.json.ObjectMap = .{};
            var it = raw.object.iterator();
            while (it.next()) |kv| if (!compatKey(T, kv.key_ptr.*)) {
                try object.put(a, kv.key_ptr.*, kv.value_ptr.*);
            };
            @field(result, name) = try convert(F, a, .{ .object = object }, d);
        } else {
            var found = raw.object.get(meta.key);
            var matched = if (found != null) @as(usize, 1) else 0;
            inline for (meta.aliases) |alias| {
                if (comptime !std.mem.eql(u8, alias, meta.key)) if (raw.object.get(alias)) |v| {
                    matched += 1;
                    found = v;
                };
            }
            if (matched > 1) return error.AliasCollision;
            if (found) |value| @field(result, name) = try customConvert(F, a, value, meta.custom, d) else if (comptime meta.has_default or @typeInfo(F) == .optional) @field(result, name) = defaultValue(F) else return error.MissingField;
        }
        d.path_len = old;
    }
    return result;
}
fn stringField(raw: Raw, key: []const u8) ?[]const u8 {
    if (raw != .object) return null;
    const v = raw.object.get(key) orelse return null;
    return if (v == .string) v.string else null;
}
fn compatBranch(name: []const u8, raw: Raw) ?usize {
    if (std.mem.eql(u8, name, "UserCompetition")) {
        const tag = stringField(raw, "name") orelse return 4;
        const tags = .{ "Halloween", "Easter Egg Hunt", "Rock, Paper, Scissors", "Elimination" };
        inline for (tags, 0..) |tag_name, i| if (std.ascii.eqlIgnoreCase(tag, tag_name)) return i;
        if (std.ascii.eqlIgnoreCase(tag, "Easter")) return 1;
        return 4;
    }
    if (std.mem.eql(u8, name, "UserEmployment")) {
        const tag = stringField(raw, "type") orelse stringField(raw, "job_type") orelse return 2;
        if (std.ascii.eqlIgnoreCase(tag, "job")) return 0;
        if (std.ascii.eqlIgnoreCase(tag, "company")) return 1;
        return 2;
    }
    if (std.mem.eql(u8, name, "TradeItem")) {
        const tag = stringField(raw, "type") orelse stringField(raw, "item_type") orelse return 6;
        const tags = .{ "money", "item", "faction", "company", "property", "nap" };
        inline for (tags, 0..) |tag_name, i| if (std.ascii.eqlIgnoreCase(tag, tag_name)) return i;
        return 6;
    }
    if (std.mem.eql(u8, name, "FactionWarfareEntry")) {
        if (raw != .object) return 4;
        if (raw.object.contains("factions")) return 0;
        if (raw.object.contains("territory")) return 1;
        if (raw.object.contains("chain")) return 2;
        if (raw.object.contains("aggressor") and raw.object.contains("defender")) return 3;
        return 4;
    }
    if (std.mem.eql(u8, name, "UserOrganizedCrimeSelection") and raw == .object and raw.object.contains("error")) return 1;
    return null;
}

pub fn stringify(a: std.mem.Allocator, value: anytype) ![]u8 {
    return stringifyChecked(a, value, null);
}
pub fn stringifyChecked(a: std.mem.Allocator, value: anytype, checkpoint: ?Checkpoint) ![]u8 {
    var arena = std.heap.ArenaAllocator.init(a);
    defer arena.deinit();
    const raw = try toRaw(@TypeOf(value), arena.allocator(), value, null, checkpoint);
    if (checkpoint) |c| try c.check();
    const output = try std.json.Stringify.valueAlloc(a, raw, .{});
    errdefer a.free(output);
    if (checkpoint) |c| try c.check();
    return output;
}
fn priorField(previous: ?Raw, key: []const u8) ?Raw {
    if (previous) |p| if (p == .object) return p.object.get(key);
    return null;
}
fn toRaw(comptime T: type, a: std.mem.Allocator, value: T, previous: ?Raw, checkpoint: ?Checkpoint) anyerror!Raw {
    if (checkpoint) |c| try c.check();
    if (T == Raw) return value;
    if (T == ExactNumber) return if (validNumberSyntax(value.lexeme)) .{ .number_string = value.lexeme } else error.InvalidNumber;
    if (comptime hasDecl(T, "presence_child")) return switch (value) {
        .absent => .null,
        .null => .null,
        .value => |v| toRaw(T.presence_child, a, v, previous, checkpoint),
    };
    if (comptime hasDecl(T, "map_child")) {
        var object: std.json.ObjectMap = .{};
        for (value.entries) |entry| try object.put(a, entry.key, try toRaw(T.map_child, a, entry.value, priorField(previous, entry.key), checkpoint));
        return .{ .object = object };
    }
    return switch (@typeInfo(T)) {
        .bool => .{ .bool = value },
        .int => .{ .number_string = try std.fmt.allocPrint(a, "{d}", .{value}) },
        .float => if (std.math.isFinite(value)) .{ .number_string = try std.fmt.allocPrint(a, "{d}", .{value}) } else error.InvalidNumber,
        .void => .null,
        .optional => |info| if (value) |v| toRaw(info.child, a, v, previous, checkpoint) else .null,
        .pointer => |info| blk: {
            if (info.size == .one) break :blk try toRaw(info.child, a, value.*, previous, checkpoint);
            if (info.size != .slice) return error.InvalidType;
            if (info.child == u8) break :blk .{ .string = value };
            var items = std.array_list.Managed(Raw).init(a);
            for (value, 0..) |v, i| {
                const prior = if (previous) |p| if (p == .array and i < p.array.items.len) p.array.items[i] else null else null;
                try items.append(try toRaw(info.child, a, v, prior, checkpoint));
            }
            break :blk .{ .array = items };
        },
        .@"enum" => if (comptime hasDecl(T, "json_numeric")) .{ .number_string = @tagName(value) } else .{ .string = @tagName(value) },
        .@"union" => |info| blk: {
            inline for (info.field_names, info.field_types, 0..) |name, F, index| if (std.meta.activeTag(value) == @field(info.tag_type.?, name)) {
                const payload = try toRaw(F, a, @field(value, name), previous, checkpoint);
                if (comptime hasDecl(T, "compatibility_name")) break :blk try unionSerialized(a, T.compatibility_name, index, payload);
                break :blk payload;
            };
            unreachable;
        },
        .@"struct" => |info| blk: {
            var object: std.json.ObjectMap = if (previous) |p| if (p == .object) try p.object.clone(a) else .{} else .{};
            inline for (info.field_names) |name| {
                _ = object.orderedRemove(name);
            }
            if (comptime hasDecl(T, "compatibility_fields")) {
                inline for (T.compatibility_fields) |meta| {
                    _ = object.orderedRemove(meta.key);
                    inline for (meta.aliases) |alias| {
                        _ = object.orderedRemove(alias);
                    }
                }
                inline for (info.field_names, info.field_types, T.compatibility_fields) |name, F, meta| {
                    if (comptime meta.flatten) {
                        const extra = try toRaw(F, a, @field(value, name), null, checkpoint);
                        var it = extra.object.iterator();
                        while (it.next()) |entry| {
                            try object.put(a, entry.key_ptr.*, entry.value_ptr.*);
                        }
                    } else {
                        var prior = priorField(previous, meta.key);
                        inline for (meta.aliases) |alias| {
                            if (prior == null) prior = priorField(previous, alias);
                        }
                        try object.put(a, meta.key, try toRaw(F, a, @field(value, name), prior, checkpoint));
                    }
                }
            } else {
                inline for (info.field_names, info.field_types) |name, F| {
                    if (comptime hasDecl(F, "presence_child")) {
                        if (@field(value, name) != .absent) try object.put(a, name, try toRaw(F, a, @field(value, name), priorField(previous, name), checkpoint));
                    } else try object.put(a, name, try toRaw(F, a, @field(value, name), priorField(previous, name), checkpoint));
                }
            }
            break :blk .{ .object = object };
        },
        else => error.InvalidType,
    };
}
fn unionSerialized(a: std.mem.Allocator, name: []const u8, index: usize, payload: Raw) !Raw {
    if (payload != .object) return payload;
    var object = payload.object;
    if (object.get("extra")) |extras| if (extras == .object) {
        _ = object.orderedRemove("extra");
        var it = extras.object.iterator();
        while (it.next()) |entry| try object.put(a, entry.key_ptr.*, entry.value_ptr.*);
    };
    if (std.mem.eql(u8, name, "TradeItem")) {
        const tags = [_][]const u8{ "Money", "Item", "Faction", "Company", "Property", "NAP" };
        if (index < tags.len) try object.put(a, "type", .{ .string = tags[index] }) else if (object.get("item_type")) |tag| {
            _ = object.orderedRemove("item_type");
            try object.put(a, "type", tag);
        }
    }
    if (std.mem.eql(u8, name, "UserEmployment") and index == 2) if (object.get("job_type")) |tag| {
        _ = object.orderedRemove("job_type");
        try object.put(a, "type", tag);
    };
    return .{ .object = object };
}

test "exact decimal and exponent integer boundaries" {
    try std.testing.expectEqual(@as(u64, 9007199254740993), try integer(u64, "9007199254740993.0"));
    try std.testing.expectEqual(std.math.maxInt(u64), try integer(u64, "18446744073709551615"));
    try std.testing.expectEqual(std.math.minInt(i64), try integer(i64, "-9223372036854775808.0"));
    try std.testing.expectEqual(@as(u64, 1000), try integer(u64, "1e3"));
    try std.testing.expectEqual(@as(u64, 1), try integer(u64, "1000e-3"));
    try std.testing.expectError(error.NonIntegral, integer(u64, "1e-99999999999999999999999999999"));
    try std.testing.expectError(error.OutOfRange, integer(u64, "1e99999999999999999999999999999"));
    try std.testing.expectError(error.OutOfRange, integer(u64, "18446744073709551616"));
    try std.testing.expectError(error.NonIntegral, integer(u64, "1.01"));
}
test "owned response retains unknown fields and required-nullable presence" {
    const T = struct { id: u64, nullable: ?bool, maybe: Presence([]const u8) = .absent };
    var r = try decode(T, std.testing.allocator, "{\"id\":9007199254740993,\"nullable\":null,\"unknown\":1e3}");
    defer r.deinit();
    try std.testing.expectEqual(@as(u64, 9007199254740993), r.value.id);
    try std.testing.expect(r.value.nullable == null and r.value.maybe == .absent);
    const json = try r.originalJson(std.testing.allocator);
    defer std.testing.allocator.free(json);
    try std.testing.expect(std.mem.indexOf(u8, json, "1e3") != null);
    try std.testing.expectError(error.MissingField, decode(T, std.testing.allocator, "{\"id\":1}"));
}
test "decode reports nested failure path" {
    var d: Diagnostic = .{};
    try std.testing.expectError(error.MissingField, decodeDetailed(struct { data: struct { id: u64 } }, std.testing.allocator, "{\"data\":{}}", &d));
    try std.testing.expectEqualStrings("/data/id", d.jsonPath());
}
fn allocationScenario(a: std.mem.Allocator) !void {
    var r = try decode(struct { name: []const u8, values: []const u64 }, a, "{\"name\":\"retained\",\"values\":[1,2,3]}");
    defer r.deinit();
    try std.testing.expectEqualStrings("retained", r.value.name);
}
test "systematic allocation failures clean up owned decoding" {
    try std.testing.checkAllAllocationFailures(std.testing.allocator, allocationScenario, .{});
}

test "integer helper enforces JSON number grammar before range interpretation" {
    const malformed = [_][]const u8{ "", "-", "+1", "01", "-01", "00", "1.", ".0", "-.0", "1e", "1e+", "1e-", "1e_3", "1e1_0", "1e--1", "1e+-1", " 1", "1 ", "1.0.0", "1ee2" };
    for (malformed) |text| try std.testing.expectError(error.InvalidNumber, integer(i64, text));
    const valid = .{ .{ "0", @as(i64, 0) }, .{ "-0", @as(i64, 0) }, .{ "1e+3", @as(i64, 1000) }, .{ "1E3", @as(i64, 1000) }, .{ "100e-2", @as(i64, 1) }, .{ "1.000e3", @as(i64, 1000) } };
    inline for (valid) |case| try std.testing.expectEqual(case[1], try integer(i64, case[0]));
    try std.testing.expectEqual(@as(i64, 0), try integer(i64, "0e999999999999999999999999999999999999999999999999999999999999999999"));
    try std.testing.expectError(error.OutOfRange, integer(i64, "1e999999999999999999999999999999999999999999999999999999999999999999"));
}
const TestCheckpoint = struct {
    calls: usize = 0,
    fail_at: usize,
    timeout: bool = false,
    fn check(context: ?*anyopaque) error{ Canceled, Timeout }!void {
        const self: *TestCheckpoint = @ptrCast(@alignCast(context.?));
        self.calls += 1;
        if (self.calls >= self.fail_at) return if (self.timeout) error.Timeout else error.Canceled;
    }
    fn checkpoint(self: *TestCheckpoint) Checkpoint {
        return .{ .context = self, .check_fn = check };
    }
};
test "decoding and serialization checkpoint cancellation clean up partial work" {
    const T = struct { items: []const struct { id: u64 } };
    const text = "{\"items\":[{\"id\":1},{\"id\":2},{\"id\":3}]}";
    var canceled: TestCheckpoint = .{ .fail_at = 6 };
    try std.testing.expectError(error.Canceled, decodeChecked(T, std.testing.allocator, text, canceled.checkpoint()));
    var deadline: TestCheckpoint = .{ .fail_at = 6, .timeout = true };
    try std.testing.expectError(error.Timeout, decodeChecked(T, std.testing.allocator, text, deadline.checkpoint()));
    var result = try decode(T, std.testing.allocator, text);
    defer result.deinit();
    var serialize: TestCheckpoint = .{ .fail_at = 4 };
    try std.testing.expectError(error.Canceled, result.toJsonChecked(std.testing.allocator, serialize.checkpoint()));
    var standalone: TestCheckpoint = .{ .fail_at = 4, .timeout = true };
    try std.testing.expectError(error.Timeout, stringifyChecked(std.testing.allocator, result.value, standalone.checkpoint()));
    try std.testing.expectEqual(@as(u64, 3), result.value.items[2].id);
    const bytes = try result.toJson(std.testing.allocator);
    defer std.testing.allocator.free(bytes);
    try std.testing.expectEqualStrings(text, bytes);
}
