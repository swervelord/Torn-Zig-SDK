//! Explicit bounded property campaign, driven by fresh operating-system entropy.
const std = @import("std");
const torn = @import("torn");
pub fn main(init: std.process.Init) !void {
    const a = init.gpa;
    const io = init.io;
    const start = std.Io.Clock.awake.now(io).toMilliseconds();
    const iterations: usize = 100_000;
    var accepted: usize = 0;
    var entropy: [64]u8 = undefined;
    for (0..iterations) |iteration| {
        io.random(&entropy);
        const magnitude = std.mem.readInt(u64, entropy[0..8], .little);
        var number_buf: [96]u8 = undefined;
        const number = try std.fmt.bufPrint(&number_buf, "{d}.000e0", .{magnitude});
        if (try torn.model.integer(u64, number) != magnitude) return error.NumericPropertyViolation;
        var negative_buf: [96]u8 = undefined;
        const signed: i64 = @bitCast(magnitude);
        const negative = try std.fmt.bufPrint(&negative_buf, "{d}0e-1", .{signed});
        if (try torn.model.integer(i64, negative) != signed) return error.SignedNumericPropertyViolation;
        const length: usize = entropy[8] % 64;
        const encoded = try torn.planner.percentEncode(a, entropy[0..length]);
        defer a.free(encoded);
        const copy = try a.dupe(u8, encoded);
        defer a.free(copy);
        if (!std.mem.eql(u8, std.Uri.percentDecodeInPlace(copy), entropy[0..length])) return error.EncodingPropertyViolation;
        const input: []const u8 = if (iteration % 2 == 0) number else entropy[0..length];
        if (torn.model.decode(torn.model.RawValue, a, input)) |owned_value| {
            var owned = owned_value;
            defer owned.deinit();
            const output = try owned.originalJson(a);
            defer a.free(output);
            var second = try torn.model.decode(torn.model.RawValue, a, output);
            defer second.deinit();
            if (std.meta.activeTag(owned.raw) != std.meta.activeTag(second.raw)) return error.RoundtripPropertyViolation;
            accepted += 1;
        } else |err| if (err == error.OutOfMemory) return err;
    }
    const elapsed = std.Io.Clock.awake.now(io).toMilliseconds() - start;
    const evidence = try std.fmt.allocPrint(a, "{{\"campaign\":\"os-entropy-property-mutations\",\"iterations\":{d},\"numeric_cases\":{d},\"encoding_cases\":{d},\"json_inputs\":{d},\"accepted_json\":{d},\"elapsed_ms\":{d},\"optimization\":\"{s}\",\"zig\":\"0.17.0\"}}\n", .{ iterations, iterations * 2, iterations, iterations, accepted, elapsed, @tagName(@import("builtin").mode) });
    defer a.free(evidence);
    try std.Io.Dir.cwd().writeFile(io, .{ .sub_path = "docs/fuzz-evidence.json", .data = evidence });
}
