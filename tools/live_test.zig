//! Opt-in, read-only live smoke check. Never writes account response data.
//! The batch includes `travelinventory`, so the key needs at least limited access.
const std = @import("std");
const torn = @import("torn");
const Counter = struct {
    sends: usize = 0,
    fn observe(ctx: ?*anyopaque, _: usize, _: usize, _: i64) void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        self.sends += 1;
    }
};
pub fn main(init: std.process.Init) !void {
    const key = init.environ_map.get("TORN_LIVE_TEST_API_KEY") orelse return error.LiveCredentialRequired;
    if (std.mem.trim(u8, key, " \t\r\n").len == 0) return error.LiveCredentialRequired;
    var engine = try torn.runtime.Client.init(init.gpa, init.io, .{ .keys = &.{key}, .max_attempts = 1 }, .{});
    defer engine.deinit();
    var counter: Counter = .{};
    engine.observer = .{ .context = &counter, .on_send = Counter.observe };
    const client: torn.Client = .{ .engine = &engine };
    var result = try client.batch(.{ torn.selections.user.profile, torn.selections.user.job, torn.selections.user.travelinventory }, &.{}, &.{}, .{ .request = .{ .attempts = 1 }, .split_recovery = false, .legacy_fallback = false });
    defer result.deinit();
    if (result.execution.failure != null or result.value == null) return error.LiveBatchFailed;
    if (counter.sends != 1 or result.execution.reports.len != 1) return error.LiveCallCountMismatch;
    if (result.value.?[0].profile.id <= 0) return error.InvalidLiveProfile;
    switch (result.value.?[1].job) {
        .v0 => |job| {
            _ = job.name;
        },
        .v1 => |company| {
            _ = company.id;
        },
        .v2 => {},
    }
    const travel = result.value.?[2].travelinventory;
    if (travel.capacity.base < 0 or travel.capacity.special < 0) return error.InvalidLiveTravelInventory;
    for (travel.inventory) |slot| if (slot.item) |item| {
        if (item.id <= 0) return error.InvalidLiveTravelInventory;
    };
    std.debug.print("Live typed profile/job/travelinventory batch passed: exactly one HTTP send; no response data retained.\n", .{});
}
