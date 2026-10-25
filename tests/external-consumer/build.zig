const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const dependency = b.dependency("torn", .{ .target = target, .optimize = optimize });
    const executable = b.addExecutable(.{
        .name = "external-consumer",
        .root_module = b.createModule(.{
            .root_source_file = b.path("main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{.{ .name = "torn", .module = dependency.module("torn") }},
        }),
    });
    b.step("run", "Run a mocked typed batch using the fetched public package").dependOn(&b.addRunArtifact(executable).step);
}
