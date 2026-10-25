const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const torn = b.addModule("torn", .{ .root_source_file = b.path("src/root.zig"), .target = target, .optimize = optimize });
    const tests = b.addTest(.{ .root_module = torn });
    const compile_fail = @import("tools/compile_fail.zig").add(b, torn, target, optimize);
    b.step("test", "Run offline tests with allocation checks").dependOn(&b.addRunArtifact(tests).step);
    const check = b.step("check", "Compile public types and runtime");
    check.dependOn(&tests.step);
    check.dependOn(compile_fail);
    const generate = b.step("generate", "Regenerate pinned contracts offline");
    const fresh = b.step("generate-check", "Verify generated files match pinned contracts");
    for ([_][]const u8{ "generate", "generate_routing" }) |name| {
        const tool = b.addExecutable(.{ .name = name, .root_module = b.createModule(.{ .root_source_file = b.path(b.fmt("tools/{s}.zig", .{name})), .target = b.graph.host, .optimize = .safe }) });
        const run = b.addRunArtifact(tool);
        run.setCwd(b.path("."));
        generate.dependOn(&run.step);
        const verify = b.addRunArtifact(tool);
        verify.setCwd(b.path("."));
        verify.addArg("--check");
        fresh.dependOn(&verify.step);
    }
    const examples = b.step("examples", "Compile and run offline consumer examples");
    const example = b.addExecutable(.{ .name = "typed-batch", .root_module = b.createModule(.{ .root_source_file = b.path("examples/typed_batch.zig"), .target = target, .optimize = optimize, .imports = &.{.{ .name = "torn", .module = torn }} }) });
    examples.dependOn(&b.addRunArtifact(example).step);
    for ([_][]const u8{ "audit", "fuzz", "refresh_spec", "live_test" }) |name| {
        const tool = b.addExecutable(.{ .name = name, .root_module = b.createModule(.{ .root_source_file = b.path(b.fmt("tools/{s}.zig", .{name})), .target = target, .optimize = optimize, .imports = &.{.{ .name = "torn", .module = torn }} }) });
        const run = b.addRunArtifact(tool);
        run.setCwd(b.path("."));
        run.addPassthruArgs();
        b.step(if (std.mem.eql(u8, name, "refresh_spec")) "refresh-spec" else if (std.mem.eql(u8, name, "live_test")) "live-test" else name, "Run Zig-native verification or explicit refresh").dependOn(&run.step);
    }
}
