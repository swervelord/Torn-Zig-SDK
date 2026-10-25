const std = @import("std");
const torn = @import("torn");
pub fn main() !void {
    const a = std.heap.page_allocator;
    const T = struct { id: u64, name: []const u8, nullable: ?bool, optional: torn.model.Presence(bool) = .absent };
    const input = try a.dupe(u8, "{\"id\":18446744073709551615.0,\"name\":\"retained\",\"nullable\":null,\"future\":1e999999999999999999}");
    var result = try torn.model.decode(T, a, input);
    defer result.deinit();
    a.free(input);
    if (result.value.id != std.math.maxInt(u64) or !std.mem.eql(u8, result.value.name, "retained") or result.value.nullable != null or result.value.optional != .absent) return error.InvalidOwnedValues;
    result.value.id = 0;
    const output = try result.toJson(a);
    defer a.free(output);
    var roundtrip = try torn.model.decode(T, a, output);
    defer roundtrip.deinit();
    if (roundtrip.value.id != 0 or !std.mem.eql(u8, roundtrip.raw.object.get("future").?.number_string, "1e999999999999999999")) return error.InvalidTypedRoundtrip;
    if (torn.model.integer(u64, "18446744073709551616")) |_| return error.UnsafeOverflow else |err| if (err != error.OutOfRange) return err;
    if (try torn.model.integer(i64, "-9223372036854775808.0") != std.math.minInt(i64)) return error.InvalidSignedBoundary;
    const Choice = union(enum) { counter: u64, word: []const u8 };
    var choice = try torn.model.decode(Choice, a, "9007199254740993");
    defer choice.deinit();
    if (choice.value != .counter or choice.value.counter != 9007199254740993) return error.InvalidUnion;
}
