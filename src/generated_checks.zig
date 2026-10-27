const std = @import("std");
const model = @import("model.zig");
const current = @import("generated/current.zig");
const frozen = @import("generated/frozen.zig");
const compatibility = @import("generated/compatibility.zig");
const operations = @import("generated/operations.zig");

test "every generated type has a concrete layout" {
    @setEvalBranchQuota(1000000);
    inline for (current.all_types) |T| _ = @sizeOf(T);
    inline for (frozen.all_types) |T| _ = @sizeOf(T);
    inline for (compatibility.all_types) |T| _ = @sizeOf(T);
    inline for (operations.all_operations) |Op| {
        _ = @sizeOf(Op.Params);
        _ = @sizeOf(Op.Response);
        try std.testing.expect(Op.path.len > 0);
    }
}

test "generated current profile and job are direct typed fields" {
    const Profile = current.UserProfileResponse;
    const Job = current.UserJobResponse;
    _ = @sizeOf(Profile);
    _ = @sizeOf(Job);
    try std.testing.expectEqual(719, current.schema_count);
    try std.testing.expectEqual(711, frozen.schema_count);
    try std.testing.expectEqual(549, compatibility.schema_count);
    try std.testing.expectEqual(236, operations.operation_count);
}

test "every generated concrete decoder is instantiated" {
    @setEvalBranchQuota(10000000);
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    var diagnostic: model.Diagnostic = .{};
    inline for (current.all_types) |T| {
        _ = model.convert(T, arena.allocator(), .null, &diagnostic) catch {};
    }
    inline for (frozen.all_types) |T| {
        _ = model.convert(T, arena.allocator(), .null, &diagnostic) catch {};
    }
    inline for (compatibility.all_types) |T| {
        _ = model.convert(T, arena.allocator(), .null, &diagnostic) catch {};
    }
    inline for (operations.all_operations) |Op| {
        _ = model.convert(Op.Params, arena.allocator(), .null, &diagnostic) catch {};
        _ = model.convert(Op.Response, arena.allocator(), .null, &diagnostic) catch {};
    }
}
test "exact generic response retains all contributing selection fields concretely" {
    const T = operations.getUserGeneric.Response;
    const a = std.testing.allocator;
    var result = try model.decode(T, a, "{\"job\":null,\"timestamp\":1000}");
    defer result.deinit();
    try std.testing.expect(result.value.job == .null);
    try std.testing.expectEqual(@as(i64, 1000), result.value.timestamp.value);
    const bytes = try model.stringify(a, result.value);
    defer a.free(bytes);
    try std.testing.expectEqualStrings("{\"job\":null,\"timestamp\":1000}", bytes);
    var triple = try model.decode(T, a, "{\"job\":null,\"faction\":null,\"timestamp\":1000}");
    defer triple.deinit();
    try std.testing.expect(triple.value.job == .null and triple.value.faction == .null);
    try std.testing.expectEqual(@as(i64, 1000), triple.value.timestamp.value);
}
