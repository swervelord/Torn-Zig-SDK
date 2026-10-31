//! Opt-in, read-only live checks (P9.2). Never writes or prints account response data.
//! Key: `TORN_API_KEY`, or the legacy `TORN_LIVE_TEST_API_KEY`. The smoke batch includes
//! `travelinventory`, so the key needs at least limited access.
//!
//! `zig build live-test` runs the one-send typed smoke batch, then the live sweep:
//! every typed operation whose path parameters can be filled with the key owner's own
//! ids (user, faction, company) and that has no other required parameter is called
//! and decoded in the default (tolerant) mode. Torn API errors (private data, access
//! level, not in a faction, ...) are reported as skips; any decode failure fails the
//! run and is printed with its JSON path. Calls are spaced >= 0.75 s apart and code 5
//! backs off 61 s. `zig build live-test -- --smoke` skips the sweep.
const std = @import("std");
const torn = @import("torn");
const Counter = struct {
    sends: usize = 0,
    fn observe(ctx: ?*anyopaque, _: usize, _: usize, _: i64) void {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        self.sends += 1;
    }
};
const Ids = struct { user: ?i64 = null, faction: ?i64 = null, company: ?i64 = null };

pub fn main(init: std.process.Init) !void {
    const key = init.environ_map.get("TORN_API_KEY") orelse init.environ_map.get("TORN_LIVE_TEST_API_KEY") orelse return error.LiveCredentialRequired;
    if (std.mem.trim(u8, key, " \t\r\n").len == 0) return error.LiveCredentialRequired;
    const args = try init.minimal.args.toSlice(init.arena.allocator());
    const smoke_only = args.len > 1 and std.mem.eql(u8, args[1], "--smoke");
    var engine = try torn.runtime.Client.init(init.gpa, init.io, .{ .keys = &.{key}, .max_attempts = 1 }, .{});
    defer engine.deinit();
    var counter: Counter = .{};
    engine.observer = .{ .context = &counter, .on_send = Counter.observe };
    const client: torn.Client = .{ .engine = &engine };
    var result = try client.batch(.{ torn.selections.user.profile, torn.selections.user.job, torn.selections.user.travelinventory }, &.{}, &.{}, .{ .request = .{ .attempts = 1 }, .split_recovery = false, .legacy_fallback = false });
    defer result.deinit();
    if (result.execution.failure) |failure| {
        std.debug.print("live batch failed: {f}\n", .{failure});
        return error.LiveBatchFailed;
    }
    if (result.value == null) return error.LiveBatchFailed;
    if (counter.sends != 1 or result.execution.reports.len != 1) return error.LiveCallCountMismatch;
    if (result.value.?[0].profile.id <= 0) return error.InvalidLiveProfile;
    switch (result.value.?[1].job) {
        .job => |job| _ = job.name,
        .company => |company| _ = company.id,
        .null => {},
    }
    const travel = result.value.?[2].travelinventory;
    if (travel.capacity.base < 0 or travel.capacity.special < 0) return error.InvalidLiveTravelInventory;
    for (travel.inventory) |slot| if (slot.item) |item| {
        if (item.id <= 0) return error.InvalidLiveTravelInventory;
    };
    std.debug.print("Live typed profile/job/travelinventory batch passed: exactly one HTTP send; no response data retained.\n", .{});
    if (!smoke_only) try sweep(init.io, client);
}

fn pause(io: std.Io, ms: i64) !void {
    try std.Io.sleep(io, .fromMilliseconds(ms), .awake);
}

fn sweep(io: std.Io, client: torn.Client) !void {
    var ids: Ids = .{};
    try pause(io, 750);
    var info = try client.keyInfo(.{});
    defer info.deinit();
    const owner = (info.value orelse return error.KeyInfoFailed).info.user;
    ids.user = owner.id;
    ids.faction = owner.faction_id;
    ids.company = owner.company_id;
    var arena = std.heap.ArenaAllocator.init(client.engine.allocator);
    defer arena.deinit();
    var decoded: usize = 0;
    var skipped: usize = 0;
    var unreachable_count: usize = 0;
    var failures: usize = 0;
    inline for (torn.operations.all_operations) |Op| {
        _ = arena.reset(.retain_capacity);
        if (try livePath(arena.allocator(), Op, ids)) |path| {
            var attempt: usize = 0;
            while (true) : (attempt += 1) {
                try pause(io, 750);
                var execution = try client.rawPath(path, .{});
                defer execution.deinit();
                if (execution.failure) |failure| {
                    if (failure.api_code == 5 and attempt == 0) {
                        std.debug.print("  {s}: rate limited, backing off 61 s\n", .{Op.operation_id});
                        try pause(io, 61_000);
                        continue;
                    }
                    std.debug.print("  skip {s}: {s} code={any}\n", .{ Op.operation_id, failure.kindName(), failure.api_code });
                    skipped += 1;
                } else if (comptime Op.Response == []const u8) {
                    decoded += 1;
                } else {
                    _ = execution.decode(Op.Response) catch |err| {
                        const failure = execution.failure.?;
                        std.debug.print("  DECODE FAILED {s}: {s} at {s} (expected {s})\n", .{ Op.operation_id, @errorName(err), failure.diagnostic.jsonPath(), failure.diagnostic.expected orelse "?" });
                        failures += 1;
                        break;
                    };
                    decoded += 1;
                }
                break;
            }
        } else unreachable_count += 1;
    }
    std.debug.print("Live sweep: {d} decoded, {d} skipped (API errors), {d} not reachable with own ids, {d} decode failures.\n", .{ decoded, skipped, unreachable_count, failures });
    if (failures != 0) return error.LiveSweepDecodeFailures;
}

/// Fills `{id}`/`{userId}`/`{factionId}`/`{companyId}` with the key owner's ids; null
/// when another path or required query parameter is needed.
fn livePath(a: std.mem.Allocator, comptime Op: type, ids: Ids) !?[]const u8 {
    const params = try std.json.parseFromSliceLeaky(std.json.Value, a, Op.parameters_json, .{});
    for (params.array.items) |p| {
        if (p.object.get("required").?.bool and std.mem.eql(u8, p.object.get("in").?.string, "query")) return null;
    }
    var out: std.ArrayList(u8) = .empty;
    var rest: []const u8 = Op.path;
    const resource = Op.path[1 .. std.mem.indexOfScalarPos(u8, Op.path, 1, '/') orelse Op.path.len];
    while (std.mem.indexOfScalar(u8, rest, '{')) |open| {
        const close = std.mem.indexOfScalarPos(u8, rest, open, '}') orelse return null;
        const name = rest[open + 1 .. close];
        const value: ?i64 = if (std.mem.eql(u8, name, "userId")) ids.user else if (std.mem.eql(u8, name, "factionId")) ids.faction else if (std.mem.eql(u8, name, "companyId")) ids.company else if (std.mem.eql(u8, name, "id")) (if (std.mem.eql(u8, resource, "user")) ids.user else if (std.mem.eql(u8, resource, "faction")) ids.faction else if (std.mem.eql(u8, resource, "company")) ids.company else null) else null;
        try out.appendSlice(a, rest[0..open]);
        try out.print(a, "{d}", .{value orelse return null});
        rest = rest[close + 1 ..];
    }
    try out.appendSlice(a, rest);
    return out.items;
}
