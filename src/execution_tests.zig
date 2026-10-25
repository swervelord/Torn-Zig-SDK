const std = @import("std");
const client = @import("client.zig");
const runtime = @import("runtime.zig");
const planner = @import("planner.zig");
const transport = @import("transport.zig");
const selections = @import("generated/selections.zig");
const Wire = struct {
    sends: usize = 0,
    csv_error: bool = false,
    fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, req: transport.Request) !transport.Response {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        self.sends += 1;
        const body: []const u8 = if (std.mem.indexOf(u8, req.url, "snapshot") != null) (if (self.csv_error) "{\"error\":{\"code\":2}}" else "id,name\n1,example\n") else "{\"timestamp\":1000}";
        return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, body) };
    }
};
test "heterogeneous CSV and JSON batch retains its separate concrete values" {
    var wire: Wire = .{};
    var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only"} }, .{ .context = &wire, .send_fn = Wire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.batch(.{ selections.user.snapshot, selections.user.timestamp }, &.{}, &.{}, .{});
    defer result.deinit();
    try std.testing.expect(result.execution.failure == null);
    try std.testing.expectEqualStrings("id,name\n1,example\n", result.value.?[0]);
    try std.testing.expectEqual(@as(i64, 1000), result.value.?[1].timestamp);
    try std.testing.expectEqual(@as(usize, 2), wire.sends);
    try std.testing.expectEqual(@as(usize, 2), result.execution.reports.len);
    try std.testing.expectEqual(@as(usize, 1), result.execution.csv.len);
}
test "CSV JSON error envelope remains a structured API failure" {
    var wire: Wire = .{ .csv_error = true };
    var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only"}, .max_attempts = 1 }, .{ .context = &wire, .send_fn = Wire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.select(selections.user.snapshot, &.{}, &.{}, .{});
    defer result.deinit();
    try std.testing.expect(result.value == null);
    try std.testing.expectEqual(@as(?u32, 2), result.execution.failure.?.api_code);
    try std.testing.expectEqual(@as(usize, 0), result.execution.reports.len);
}
test "custom projection retains its owned backing memory" {
    const Projection = struct {
        label: []const u8,
        fn decode(_: ?*anyopaque, a: std.mem.Allocator, raw: @import("model.zig").RawValue) !@This() {
            const timestamp = raw.object.get("timestamp").?.number_string;
            return .{ .label = try std.fmt.allocPrint(a, "observed:{s}", .{timestamp}) };
        }
    };
    var wire: Wire = .{};
    var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only"} }, .{ .context = &wire, .send_fn = Wire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var execution = try c.raw(selections.user.timestamp, &.{}, &.{}, .{});
    defer execution.deinit();
    const projected = try execution.project(Projection, null, Projection.decode);
    try std.testing.expectEqualStrings("observed:1000", projected.label);
}
const PartialWire = struct {
    sends: usize = 0,
    fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        self.sends += 1;
        return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, if (self.sends == 1) "{\"first\":1}" else "{\"second\":2}") };
    }
};
fn allocationScenario(a: std.mem.Allocator) !void {
    var wire: PartialWire = .{};
    var engine = try runtime.Client.init(a, std.testing.io, .{ .keys = &.{"test-only"}, .max_attempts = 1 }, .{ .context = &wire, .send_fn = PartialWire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var plan: planner.Plan = .{ .arena = std.heap.ArenaAllocator.init(a), .calls = &.{
        .{ .path = "/user", .query = "selections=profile", .selections = &.{"profile"}, .operation = "first", .version = 2, .media = .json, .fallback_supported = false },
        .{ .path = "/user", .query = "selections=job", .selections = &.{"job"}, .operation = "second", .version = 2, .media = .json, .fallback_supported = false },
    } };
    defer plan.deinit();
    var result = try c.executePlan(&plan, .{});
    defer result.deinit();
    if (result.failure) |failure| {
        if (failure.cause) |cause| {
            if (cause == error.OutOfMemory) {
                if (wire.sends >= 2) {
                    try std.testing.expectEqual(@as(usize, 1), result.reports.len);
                    try std.testing.expect(result.raw.object.contains("first"));
                    try std.testing.expect(!result.raw.object.contains("second"));
                }
                return error.OutOfMemory;
            }
        }
        return error.UnexpectedExecutionFailure;
    }
}
test "execution allocation failures preserve successful contributions and clean up" {
    try std.testing.checkAllAllocationFailures(std.testing.allocator, allocationScenario, .{});
}
fn typedAllocationScenario(a: std.mem.Allocator) !void {
    var wire: Wire = .{};
    var engine = try runtime.Client.init(a, std.testing.io, .{ .keys = &.{"test-only"}, .max_attempts = 1 }, .{ .context = &wire, .send_fn = Wire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.select(selections.user.timestamp, &.{}, &.{}, .{});
    defer result.deinit();
    if (result.execution.failure) |failure| {
        try std.testing.expect(result.value == null);
        if (failure.cause) |cause| if (cause == error.OutOfMemory) return error.OutOfMemory;
        return error.UnexpectedFailure;
    }
    try std.testing.expectEqual(@as(i64, 1000), result.value.?.timestamp);
}
test "typed decoding allocation failure never becomes an undefined success" {
    try std.testing.checkAllAllocationFailures(std.testing.allocator, typedAllocationScenario, .{});
}
test "strict response diagnostics retain a path without a borrowed checkpoint" {
    const BoundWire = struct {
        fn send(_: ?*anyopaque, a: std.mem.Allocator, _: std.Io, _: transport.Request) !transport.Response {
            return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, "{\"timestamp\":2147483648}") };
        }
    };
    var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only"} }, .{ .send_fn = BoundWire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.select(selections.user.timestamp, &.{}, &.{}, .{});
    defer result.deinit();
    try std.testing.expect(result.value == null);
    const failure = result.execution.failure.?;
    try std.testing.expectEqualStrings("/timestamp", failure.diagnostic.jsonPath());
    try std.testing.expect(failure.diagnostic.checkpoint == null);
}
test "exact generic response preserves both fields and validates every contribution" {
    const GenericWire = struct {
        invalid: bool,
        fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
            const self: *@This() = @ptrCast(@alignCast(ctx.?));
            try std.testing.expectEqualStrings("https://api.torn.com/v2/user?selections=job%2Ctimestamp", request.url);
            return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, if (self.invalid) "{\"job\":null,\"timestamp\":2147483648}" else "{\"job\":null,\"timestamp\":1000}") };
        }
    };
    for ([_]bool{ false, true }) |invalid| {
        var wire: GenericWire = .{ .invalid = invalid };
        var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only"} }, .{ .context = &wire, .send_fn = GenericWire.send });
        defer engine.deinit();
        const c: client.Client = .{ .engine = &engine };
        var result = try c.exact(@import("generated/operations.zig").getUserGeneric, .{ .selections = .{ .value = &.{ .{ .v0 = .job }, .{ .v0 = .timestamp } } } }, .{});
        defer result.deinit();
        if (invalid) {
            try std.testing.expect(result.value == null);
            try std.testing.expectEqualStrings("/timestamp", result.execution.failure.?.diagnostic.jsonPath());
            try std.testing.expectEqual(@as(usize, 0), result.execution.reports.len);
        } else {
            try std.testing.expect(result.value.?.job == .null);
            try std.testing.expectEqual(@as(i64, 1000), result.value.?.timestamp.value);
            try std.testing.expectEqual(@as(usize, 1), result.execution.reports.len);
        }
    }
}
