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
    try std.testing.expectEqual(712, current.schema_count);
    try std.testing.expectEqual(711, frozen.schema_count);
    try std.testing.expectEqual(549, compatibility.schema_count);
    try std.testing.expectEqual(234, operations.operation_count);
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
