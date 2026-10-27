const std = @import("std");
const current = @import("generated/current.zig");
const operations = @import("generated/operations.zig");
const contracts = @import("contracts.zig");
const selections = @import("generated/selections.zig");

test "Halloween treats and purchased upgrade timestamps have concrete public types" {
    var result = try contracts.decodeCurrent(current.UserHalloweenResponse, std.testing.allocator,
        \\{"halloween":{"treats":{"current":25,"total":300},"basket_upgrades":[{"id":1,"timestamp":1793100000}]}}
    );
    defer result.deinit();
    try std.testing.expectEqual(@as(i64, 25), result.value.halloween.treats.current);
    try std.testing.expectEqual(@as(i64, 300), result.value.halloween.treats.total);
    try std.testing.expectEqual(@as(i64, 1793100000), result.value.halloween.basket_upgrades[0].timestamp);
    try std.testing.expect(selections.user.halloween.Response == current.UserHalloweenResponse);
    try std.testing.expect(selections.torn.halloween.Response == current.TornHalloweenResponse);
}

test "unspecified required Halloween upgrade type is retained and cannot be omitted" {
    const json =
        \\{"id":1,"name":"Basket","description":"Benefit","flavor":"Flavor","cost":25,"requirement":0,"type":"unknown-future-type"}
    ;
    var result = try contracts.decodeCurrent(current.TornHalloweenUpgrade, std.testing.allocator, json);
    defer result.deinit();
    try std.testing.expectEqualStrings("unknown-future-type", result.value.type.string);
    try std.testing.expectError(error.MissingField, contracts.decodeCurrent(current.TornHalloweenUpgrade, std.testing.allocator,
        \\{"id":1,"name":"Basket","description":"Benefit","flavor":"Flavor","cost":25,"requirement":0}
    ));
}

test "official stability spelling and upstream inventory TTL are explicit metadata" {
    try std.testing.expectEqualStrings("Untable", operations.getMyHalloween.stability);
    try std.testing.expectEqualStrings("Stable", operations.getTornHalloween.stability);
    try std.testing.expectEqual(@as(?u32, 900), operations.getMyInventory.upstream_cache_ttl_seconds);
    try std.testing.expectEqual(@as(?u32, 300), operations.getMyFactionInventory.upstream_cache_ttl_seconds);
}
