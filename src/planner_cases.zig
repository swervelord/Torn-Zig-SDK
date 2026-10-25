const std = @import("std");
const planner = @import("planner.zig");

// Independently maintained expected compatible pairs. These lists are literal
// selections selected from official UserSelectionName/FactionSelectionName and
// the corresponding generic response branches, not the routing manifest.
// No target, category, time, or permission filters are supplied. All calls use
// one credential whose permissions must satisfy the complete group.
// Evidence: official 6.13.8 /user and /faction contracts, and
// https://github.com/swervelord/Torn-API/blob/main/Torn%20API/01%20Combining%20Selections.md
pub const user = [_][]const u8{
    "ammo",         "attacks",                "attacksfull",  "bars",        "basic",     "battlestats",
    "bounties",     "calendar",               "casino",       "competition", "cooldowns", "discord",
    "enlistedcars", "equipment",              "events",       "faction",     "forumfeed", "forumfriends",
    "forumposts",   "forumsubscribedthreads", "forumthreads", "gym",         "hof",       "honors",
    "icons",
};
pub const faction = [_][]const u8{
    "applications", "attacks", "attacksfull",  "balance", "basic",
    "chain",        "chains",  "contributors", "crimes",  "crimeexp",
    "dirtbombs",    "hof",     "members",      "news",    "positions",
    "rackets",      "raids",   "rankedwars",   "revives",
};
pub const Groups = struct {
    resource: planner.Resource,
    selections: []const []const u8,
    path: []const u8,
    target: []const planner.Argument = &.{},
    query_suffix: []const u8 = "",
};
pub const groups = [_]Groups{
    .{ .resource = .user, .selections = &user, .path = "/user" },
    .{ .resource = .faction, .selections = &faction, .path = "/faction" },
    .{ .resource = .company, .selections = &.{ "applications", "employees", "lookup", "news", "profile", "stock", "timestamp" }, .path = "/company" },
    .{ .resource = .forum, .selections = &.{ "categories", "lookup", "threads", "timestamp" }, .path = "/forum" },
    .{ .resource = .key, .selections = &.{ "info", "log" }, .path = "/key" },
    .{ .resource = .market, .selections = &.{ "auctionhouse", "pointsmarket", "lookup", "timestamp" }, .path = "/market" },
    .{ .resource = .property, .selections = &.{ "lookup", "timestamp" }, .path = "/property" },
    .{ .resource = .racing, .selections = &.{ "cars", "carupgrades", "lookup", "races", "timestamp", "tracks" }, .path = "/racing" },
    .{ .resource = .torn, .selections = &.{ "bank", "bounties", "calendar", "cards", "timestamp", "crimes", "education", "elimination", "factionhof", "factiontree", "gyms", "hof", "itemammo", "itemmods", "logcategories", "lookup", "merits", "museum", "organizedcrimes", "pokertables" }, .path = "/torn" },
};

pub fn expectedQuery(a: std.mem.Allocator, left: []const u8, right: []const u8) ![]const u8 {
    const ascending = std.mem.order(u8, left, right) == .lt;
    return std.fmt.allocPrint(a, "selections={s}%2C{s}", .{ if (ascending) left else right, if (ascending) right else left });
}

test "711 independent generic compatible pairs with reverse order and duplicates" {
    var count: usize = 0;
    for (groups) |group| {
        for (group.selections, 0..) |left, i| {
            for (group.selections[i + 1 ..]) |right| {
                var plan = try planner.build(std.testing.allocator, .{ .resource = group.resource, .selections = &.{ right, left, right }, .target = group.target });
                defer plan.deinit();
                try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
                try std.testing.expectEqualStrings(group.path, plan.calls[0].path);
                const expected = try expectedQuery(std.testing.allocator, left, right);
                defer std.testing.allocator.free(expected);
                const expected_with_target = try std.mem.concat(std.testing.allocator, u8, &.{ expected, group.query_suffix });
                defer std.testing.allocator.free(expected_with_target);
                try std.testing.expectEqualStrings(expected_with_target, plan.calls[0].query);
                try std.testing.expectEqual(@as(u8, 2), plan.calls[0].version);
                try std.testing.expectEqual(planner.Media.json, plan.calls[0].media);
                count += 1;
            }
        }
    }
    try std.testing.expectEqual(@as(usize, 711), count);
}

test "complete independently specified generic groups have minimum one call" {
    for (groups) |group| {
        var plan = try planner.build(std.testing.allocator, .{ .resource = group.resource, .selections = group.selections, .target = group.target });
        defer plan.deinit();
        try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
        try std.testing.expectEqual(group.selections.len, plan.calls[0].selections.len);
    }
}
