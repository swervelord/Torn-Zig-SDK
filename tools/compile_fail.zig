//! Native build API checks: a case passes only when its intended diagnostic occurs.
const std = @import("std");
pub fn add(b: *std.Build, torn: *std.Build.Module, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode) *std.Build.Step {
    const step = b.step("compile-fail", "Verify invalid static API combinations are rejected");
    const cases = .{
        .{ "cross_resource", "Cannot batch selections from different resources" },
        .{ "empty_batch", "A batch requires at least one selection" },
        .{ "wrong_exact_parameter", "expected type 'i64', found '*const [13:0]u8'" },
        .{ "missing_required_parameter", "missing struct field: tradeId" },
        .{ "invalid_closed_enum", "has no member named 'DoesNotExist'" },
    };
    inline for (cases) |case| {
        const compile = b.addObject(.{
            .name = "compile-fail-" ++ case[0],
            .root_module = b.createModule(.{
                .root_source_file = b.path("tests/compile-fail/" ++ case[0] ++ ".zig"),
                .target = target,
                .optimize = optimize,
                .imports = &.{.{ .name = "torn", .module = torn }},
            }),
        });
        compile.expect_errors = .{ .contains = case[1] };
        step.dependOn(&compile.step);
    }
    return step;
}
