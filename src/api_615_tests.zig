const std = @import("std");
const current = @import("generated/current.zig");
const operations = @import("generated/operations.zig");
const contracts = @import("contracts.zig");
const selections = @import("generated/selections.zig");
const planner = @import("planner.zig");
const client = @import("client.zig");
const runtime = @import("runtime.zig");
const transport = @import("transport.zig");

// Shape of the official 6.15.0 /user/travelinventory example: one equipped item
// with a unique ID and one stackable item whose required `uid` is null.
const travel_inventory =
    \\{"travelinventory":{"capacity":{"base":28,"special":0},"inventory":[{"id":732365689,"item":{"id":177,"uid":18545986362,"name":"Cobra Derringer","type":"Secondary","is_equipped":true,"is_faction_owned":false,"is_permanent":true}},{"id":742823284,"item":{"id":738,"uid":null,"name":"Blood Bag : O+","type":"Medical","is_equipped":false,"is_faction_owned":false,"is_permanent":true}}]}}
;

test "travel inventory payload decodes into concrete capacity, slots and nullable item fields" {
    var result = try contracts.decodeCurrent(current.UserTravelInventoryResponse, std.testing.allocator, travel_inventory);
    defer result.deinit();
    const value = result.value.travelinventory;
    try std.testing.expectEqual(@as(i64, 28), value.capacity.base);
    try std.testing.expectEqual(@as(i64, 0), value.capacity.special);
    try std.testing.expectEqual(@as(usize, 2), value.inventory.len);
    const first = value.inventory[0];
    try std.testing.expectEqual(@as(i64, 732365689), first.id);
    try std.testing.expectEqual(@as(current.ItemId, 177), first.item.?.id);
    try std.testing.expectEqual(@as(?current.ItemUid, 18545986362), first.item.?.uid);
    try std.testing.expectEqualStrings("Cobra Derringer", first.item.?.name);
    try std.testing.expectEqualStrings("Secondary", first.item.?.type);
    try std.testing.expect(first.item.?.is_equipped);
    try std.testing.expect(!first.item.?.is_faction_owned);
    try std.testing.expect(first.item.?.is_permanent);
    const second = value.inventory[1].item.?;
    try std.testing.expectEqual(@as(current.ItemId, 738), second.id);
    try std.testing.expectEqual(@as(?current.ItemUid, null), second.uid);
    try std.testing.expectEqualStrings("Blood Bag : O+", second.name);
    try std.testing.expect(!second.is_equipped);
}

test "empty travel inventory slots are null, but required nullable fields cannot be omitted" {
    var empty = try contracts.decodeCurrent(current.UserTravelInventorySlot, std.testing.allocator,
        \\{"id":1,"item":null}
    );
    defer empty.deinit();
    try std.testing.expect(empty.value.item == null);
    try std.testing.expectError(error.MissingField, contracts.decodeCurrent(current.UserTravelInventorySlot, std.testing.allocator,
        \\{"id":1}
    ));
    try std.testing.expectError(error.MissingField, contracts.decodeCurrent(current.UserTravelInventoryItem, std.testing.allocator,
        \\{"id":738,"name":"Blood Bag : O+","type":"Medical","is_equipped":false,"is_faction_owned":false,"is_permanent":true}
    ));
    try std.testing.expectError(error.MissingField, contracts.decodeCurrent(current.UserTravelInventoryCapacity, std.testing.allocator,
        \\{"base":28}
    ));
}

test "travel inventory selection, exact operation and limited access contract are exposed" {
    try std.testing.expect(selections.user.travelinventory.Response == current.UserTravelInventoryResponse);
    try std.testing.expectEqualStrings("travelinventory", selections.user.travelinventory.name);
    try std.testing.expectEqual(planner.Resource.user, selections.user.travelinventory.resource);
    const Op = operations.getMyTravelInventory;
    try std.testing.expect(Op.Response == current.UserTravelInventoryResponse);
    try std.testing.expectEqualStrings("/user/travelinventory", Op.path);
    try std.testing.expectEqualStrings("Unstable", Op.stability);
    try std.testing.expectEqual(@as(?u32, null), Op.upstream_cache_ttl_seconds);
    // Access level is official contract metadata: the operation's key parameter.
    try std.testing.expect(std.mem.indexOf(u8, Op.contract_json, "#/components/parameters/ApiKeyLimited") != null);
    try std.testing.expect(std.mem.indexOf(u8, Op.contract_json, "Requires limited access key.") != null);
    const Known = @FieldType(current.UserSelectionName, "v0");
    try std.testing.expect(@hasField(Known, "travelinventory"));
    const generic: operations.getUserGeneric.Params = .{ .selections = .{ .value = &.{.{ .v0 = .travelinventory }} } };
    try std.testing.expectEqual(Known.travelinventory, generic.selections.value[0].v0);
    // A new v2-only selection is not part of the maintained v1 catalog.
    try std.testing.expect(!planner.v1Contains(.user, "travelinventory"));
}

test "travel inventory combines with other user selections in one generic call" {
    var plan = try planner.build(std.testing.allocator, .{ .resource = .user, .selections = &.{ "travelinventory", "job", "travel" } });
    defer plan.deinit();
    try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
    try std.testing.expectEqualStrings("/user", plan.calls[0].path);
    try std.testing.expectEqualStrings("selections=job%2Ctravel%2Ctravelinventory", plan.calls[0].query);
    try std.testing.expectEqual(@as(u8, 2), plan.calls[0].version);
}

const Wire = struct {
    url: []const u8,
    body: []const u8,
    count: usize = 0,
    fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
        const self: *@This() = @ptrCast(@alignCast(ctx.?));
        try std.testing.expectEqualStrings(self.url, request.url);
        self.count += 1;
        return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, self.body) };
    }
    fn engine(self: *@This()) !runtime.Client {
        return runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only-placeholder"}, .base_url_v2 = "https://example.invalid/v2", .base_url_v1 = "https://example.invalid", .max_attempts = 1 }, .{ .context = self, .send_fn = send });
    }
};

test "typed batch decodes travel inventory and a casino Dealer job from one send" {
    var wire: Wire = .{
        .url = "https://example.invalid/v2/user?selections=job%2Ctimestamp%2Ctravelinventory",
        .body =
        \\{"job":{"type":"job","name":"Casino","position":"Dealer"},"timestamp":1000,"travelinventory":{"capacity":{"base":28,"special":0},"inventory":[{"id":1,"item":null}]}}
        ,
    };
    var engine = try wire.engine();
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.batch(.{ selections.user.travelinventory, selections.user.job, selections.user.timestamp }, &.{}, &.{}, .{});
    defer result.deinit();
    try std.testing.expect(result.execution.failure == null);
    try std.testing.expectEqual(@as(usize, 1), wire.count);
    try std.testing.expectEqual(@as(usize, 1), result.execution.reports.len);
    const data = result.value.?;
    try std.testing.expectEqual(@as(i64, 28), data[0].travelinventory.capacity.base);
    try std.testing.expect(data[0].travelinventory.inventory[0].item == null);
    try std.testing.expectEqual(current.JobTypeEnum.Casino, data[1].job.v0.name);
    try std.testing.expectEqual(current.JobPositionCasinoEnum.Dealer, data[1].job.v0.position.v2);
    try std.testing.expectEqual(@as(i64, 1000), data[2].timestamp);
}

test "exact travel inventory operation uses its direct path" {
    var wire: Wire = .{ .url = "https://example.invalid/v2/user/travelinventory", .body = travel_inventory };
    var engine = try wire.engine();
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.exact(operations.getMyTravelInventory, .{}, .{});
    defer result.deinit();
    try std.testing.expect(result.execution.failure == null);
    try std.testing.expectEqual(@as(usize, 1), wire.count);
    try std.testing.expectEqual(@as(?current.ItemUid, null), result.value.?.travelinventory.inventory[1].item.?.uid);
}

test "6.15.0 enum additions decode as named public literals" {
    var war = try contracts.decodeCurrent(current.FactionTerritoryWarResultEnum, std.testing.allocator, "\"end_with_dirty_bomb\"");
    defer war.deinit();
    try std.testing.expectEqual(current.FactionTerritoryWarResultEnum.end_with_dirty_bomb, war.value);
    var dealer = try contracts.decodeCurrent(current.JobPositionCasinoEnum, std.testing.allocator, "\"Dealer\"");
    defer dealer.deinit();
    try std.testing.expectEqual(current.JobPositionCasinoEnum.Dealer, dealer.value);
    var job = try contracts.decodeCurrent(current.UserJobResponse, std.testing.allocator,
        \\{"job":{"type":"job","name":"Casino","position":"Dealer"}}
    );
    defer job.deinit();
    try std.testing.expectEqual(current.JobPositionCasinoEnum.Dealer, job.value.job.v0.position.v2);
    try std.testing.expectEqual(@as(usize, 7), std.enums.values(current.FactionTerritoryWarResultEnum).len);
    try std.testing.expectEqual(@as(usize, 6), std.enums.values(current.JobPositionCasinoEnum).len);
}

test "official enums stay closed: values beyond the pinned contract are rejected" {
    // Why the 6.15.0 additions require a contract update: a 6.14.0 build rejected
    // these literals the same way, so decoding fails instead of guessing.
    try std.testing.expectError(error.InvalidEnum, contracts.decodeCurrent(current.FactionTerritoryWarResultEnum, std.testing.allocator, "\"end_with_future_value\""));
    try std.testing.expectError(error.InvalidEnum, contracts.decodeCurrent(current.JobPositionCasinoEnum, std.testing.allocator, "\"Croupier\""));
}
