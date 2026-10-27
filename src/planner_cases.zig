const std = @import("std");
const planner = @import("planner.zig");

// Independently maintained expected compatible pairs. These lists are literal
// selections selected from official UserSelectionName/FactionSelectionName and
// the corresponding generic response branches, not the routing manifest.
// No target, category, time, or permission filters are supplied. All calls use
// one credential whose permissions must satisfy the complete group.
// Evidence: official 6.14.0 /user and /faction contracts, and
// https://github.com/swervelord/Torn-API/blob/main/Torn%20API/01%20Combining%20Selections.md
pub const user = [_][]const u8{
    "ammo", "attacks", "attacksfull", "bars", "basic", "battlestats", "bounties", "calendar", "casino", "competition", "cooldowns", "discord", "enlistedcars", "equipment", "events", "faction", "factionbalance", "forumfeed", "forumfriends", "forumposts", "forumsubscribedthreads", "forumthreads", "gym", "halloween", "hof", "honors", "icons", "inventory", "itemmarket", "itemmod", "job", "jobpoints", "jobranks", "lookup", "medals", "merits", "messages", "missions", "money", "networth", "newevents", "newmessages", "notifications", "organizedcrime", "personalstats", "profile", "properties", "property", "races", "racingrecords", "refills", "reports", "revives", "revivesfull", "skills", "stocks", "trades", "travel", "timestamp", "weaponexp", "workstats", "education", "perks",
};
pub const faction = [_][]const u8{
    "applications", "attacks", "attacksfull", "balance", "basic", "chain", "chainreport", "chains", "crimes", "crimeexp", "dirtbombs", "hof", "lookup", "members", "positions", "rackets", "raids", "rankedwars", "revives", "revivesfull", "stats", "territory", "territoryownership", "territorywars", "timestamp", "upgrades", "warfareraids", "warfareranked", "warfareterritory", "wars",
};
pub const Groups = struct {
    resource: planner.Resource,
    selections: []const []const u8,
    path: []const u8,
    target: []const planner.Argument = &.{},
    filters: []const planner.Argument = &.{},
    query_suffix: []const u8 = "",
};

// Separate documented target and category domains. The whole resource is not
// one homogeneous ID space; neutral lookup/timestamp may accompany a domain.
pub const domain_groups = [_]Groups{
    .{ .resource = .user, .selections = &.{ "basic", "bounties", "competition", "discord", "faction", "forumposts", "forumthreads", "hof", "icons", "job", "medals", "personalstats", "profile", "properties", "property", "lookup", "timestamp" }, .path = "/user", .target = &.{.{ .name = "id", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .faction, .selections = &.{ "basic", "chain", "chains", "hof", "members", "raids", "rankedwars", "territory", "territorywars", "wars", "lookup", "timestamp" }, .path = "/faction", .target = &.{.{ .name = "id", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .company, .selections = &.{ "employees", "profile", "lookup", "timestamp" }, .path = "/company", .target = &.{.{ .name = "id", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .user, .selections = &.{ "crimes", "lookup", "timestamp" }, .path = "/user", .target = &.{.{ .name = "crimeId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .user, .selections = &.{ "trade", "lookup", "timestamp" }, .path = "/user", .target = &.{.{ .name = "tradeId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .user, .selections = &.{ "list", "lookup", "timestamp" }, .path = "/user", .filters = &.{.{ .name = "cat", .value = "Friends" }}, .query_suffix = "&cat=Friends" },
    .{ .resource = .faction, .selections = &.{ "crime", "lookup", "timestamp" }, .path = "/faction", .target = &.{.{ .name = "crimeId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .faction, .selections = &.{ "raidreport", "lookup", "timestamp" }, .path = "/faction", .target = &.{.{ .name = "raidWarId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .faction, .selections = &.{ "rankedwarreport", "lookup", "timestamp" }, .path = "/faction", .target = &.{.{ .name = "rankedWarId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .faction, .selections = &.{ "territorywarreport", "lookup", "timestamp" }, .path = "/faction", .target = &.{.{ .name = "territoryWarId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .faction, .selections = &.{ "contributors", "lookup", "timestamp" }, .path = "/faction", .filters = &.{.{ .name = "stat", .value = "medicalitemsused" }}, .query_suffix = "&stat=medicalitemsused" },
    .{ .resource = .faction, .selections = &.{ "news", "lookup", "timestamp" }, .path = "/faction", .filters = &.{.{ .name = "cat", .value = "main" }}, .query_suffix = "&cat=main" },
    .{ .resource = .faction, .selections = &.{ "warfarechains", "lookup", "timestamp" }, .path = "/faction", .filters = &.{.{ .name = "cat", .value = "active" }}, .query_suffix = "&cat=active" },
    .{ .resource = .company, .selections = &.{ "news", "lookup", "timestamp" }, .path = "/company", .filters = &.{.{ .name = "cat", .value = "main" }}, .query_suffix = "&cat=main" },
    .{ .resource = .forum, .selections = &.{ "posts", "thread", "lookup", "timestamp" }, .path = "/forum", .target = &.{.{ .name = "threadId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .forum, .selections = &.{ "threads", "lookup", "timestamp" }, .path = "/forum", .target = &.{.{ .name = "categoryIds", .value = "1,2" }}, .query_suffix = "&id=1%2C2" },
    .{ .resource = .market, .selections = &.{ "auctionhouselisting", "lookup", "timestamp" }, .path = "/market", .target = &.{.{ .name = "auctionListingId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .market, .selections = &.{ "auctionhouse", "bazaar", "itemmarket", "lookup", "timestamp" }, .path = "/market", .target = &.{.{ .name = "itemId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .market, .selections = &.{ "properties", "rentals", "lookup", "timestamp" }, .path = "/market", .target = &.{.{ .name = "propertyTypeId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .racing, .selections = &.{ "race", "lookup", "timestamp" }, .path = "/racing", .target = &.{.{ .name = "raceId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .racing, .selections = &.{ "records", "lookup", "timestamp" }, .path = "/racing", .target = &.{.{ .name = "trackId", .value = "1" }}, .filters = &.{.{ .name = "cat", .value = "A" }}, .query_suffix = "&id=1&cat=A" },
    .{ .resource = .torn, .selections = &.{ "items", "itemdetails", "itemstats", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "itemIds", .value = "1,2" }}, .query_suffix = "&id=1%2C2" },
    .{ .resource = .torn, .selections = &.{ "honors", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "honorIds", .value = "1,2" }}, .query_suffix = "&id=1%2C2" },
    .{ .resource = .torn, .selections = &.{ "medals", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "medalIds", .value = "1,2" }}, .query_suffix = "&id=1%2C2" },
    .{ .resource = .torn, .selections = &.{ "cityshops", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "shopId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .torn, .selections = &.{ "logtypes", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "logCategoryId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .torn, .selections = &.{ "stocks", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "stockId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .torn, .selections = &.{ "subcrimes", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "crimeId", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .torn, .selections = &.{ "eliminationteam", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "id", .value = "1" }}, .query_suffix = "&id=1" },
    .{ .resource = .torn, .selections = &.{ "territory", "lookup", "timestamp" }, .path = "/torn", .target = &.{.{ .name = "territoryIds", .value = "AAA,AAB" }}, .query_suffix = "&id=AAA%2CAAB" },
    .{ .resource = .torn, .selections = &.{ "hof", "lookup", "timestamp" }, .path = "/torn", .filters = &.{.{ .name = "cat", .value = "level" }}, .query_suffix = "&cat=level" },
    .{ .resource = .torn, .selections = &.{ "factionhof", "lookup", "timestamp" }, .path = "/torn", .filters = &.{.{ .name = "cat", .value = "respect" }}, .query_suffix = "&cat=respect" },
};
pub const all_groups = groups ++ domain_groups;
pub const compatible_pair_count = blk: {
    @setEvalBranchQuota(1000000);
    var count: usize = 0;
    for (all_groups) |group| for (group.selections, 0..) |left, i| for (group.selections[i + 1 ..]) |right| {
        if (shouldTestPair(group, left, right)) count += 1;
    };
    break :blk count;
};
pub fn shouldTestPair(group: Groups, left: []const u8, right: []const u8) bool {
    // The neutral-only pair already appears in the corresponding untargeted
    // resource group; its response does not consume a specialized ID.
    if (group.target.len > 0) {
        const left_neutral = std.mem.eql(u8, left, "lookup") or std.mem.eql(u8, left, "timestamp");
        const right_neutral = std.mem.eql(u8, right, "lookup") or std.mem.eql(u8, right, "timestamp");
        if (left_neutral and right_neutral) return false;
    }
    return true;
}
pub const groups = [_]Groups{
    .{ .resource = .user, .selections = &user, .path = "/user" },
    .{ .resource = .faction, .selections = &faction, .path = "/faction" },
    .{ .resource = .company, .selections = &.{ "applications", "employees", "lookup", "profile", "stock", "timestamp" }, .path = "/company" },
    .{ .resource = .forum, .selections = &.{ "categories", "lookup", "threads", "timestamp" }, .path = "/forum" },
    .{ .resource = .key, .selections = &.{ "info", "log" }, .path = "/key" },
    .{ .resource = .market, .selections = &.{ "auctionhouse", "bazaar", "pointsmarket", "lookup", "timestamp" }, .path = "/market" },
    .{ .resource = .property, .selections = &.{ "lookup", "timestamp" }, .path = "/property" },
    .{ .resource = .racing, .selections = &.{ "cars", "carupgrades", "lookup", "races", "timestamp", "tracks" }, .path = "/racing" },
    .{ .resource = .torn, .selections = &.{ "bank", "bounties", "calendar", "cards", "cityshops", "crimes", "education", "elimination", "factiontree", "gyms", "halloween", "honors", "itemammo", "itemmods", "items", "logcategories", "logtypes", "lookup", "medals", "merits", "museum", "organizedcrimes", "pokertables", "properties", "rockpaperscissors", "stats", "stocks", "territory", "timestamp" }, .path = "/torn" },
};

pub fn expectedQuery(a: std.mem.Allocator, left: []const u8, right: []const u8) ![]const u8 {
    const ascending = std.mem.order(u8, left, right) == .lt;
    return std.fmt.allocPrint(a, "selections={s}%2C{s}", .{ if (ascending) left else right, if (ascending) right else left });
}

test "independent complete compatible pair groups normalize reverse order and duplicates" {
    var count: usize = 0;
    for (all_groups) |group| {
        for (group.selections, 0..) |left, i| {
            for (group.selections[i + 1 ..]) |right| {
                if (!shouldTestPair(group, left, right)) continue;
                var plan = try planner.build(std.testing.allocator, .{ .resource = group.resource, .selections = &.{ right, left, right }, .target = group.target, .filters = group.filters });
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
    try std.testing.expectEqual(compatible_pair_count, count);
    try std.testing.expectEqual(@as(usize, 3132), count);
}

test "complete independently specified generic groups have minimum one call" {
    for (all_groups) |group| {
        var plan = try planner.build(std.testing.allocator, .{ .resource = group.resource, .selections = group.selections, .target = group.target, .filters = group.filters });
        defer plan.deinit();
        try std.testing.expectEqual(@as(usize, 1), plan.calls.len);
        try std.testing.expectEqual(group.selections.len, plan.calls[0].selections.len);
    }
}

fn responseContains(schema: std.json.Value, reference: []const u8) bool {
    if (schema.object.get("$ref")) |r| if (std.mem.eql(u8, r.string, reference)) return true;
    inline for (.{ "anyOf", "oneOf", "allOf" }) |key| if (schema.object.get(key)) |items| for (items.array.items) |item| {
        if (responseContains(item, reference)) return true;
    };
    return false;
}

test "literal full resource groups exhaust official generic selections with no mandatory target or filter" {
    const V = std.json.Value;
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    const doc = try std.json.parseFromSliceLeaky(V, a, @import("generated/current.zig").source_json, .{ .parse_numbers = false });
    for (groups) |group| {
        const resource = @tagName(group.resource);
        const title = switch (group.resource) {
            .user => "User",
            .faction => "Faction",
            .company => "Company",
            .forum => "Forum",
            .key => "Key",
            .market => "Market",
            .property => "Property",
            .racing => "Racing",
            .torn => "Torn",
        };
        const enum_name = try std.fmt.allocPrint(a, "{s}SelectionName", .{title});
        const names = doc.object.get("components").?.object.get("schemas").?.object.get(enum_name).?.object.get("oneOf").?.array.items[0].object.get("enum").?.array.items;
        const base = try std.fmt.allocPrint(a, "/{s}", .{resource});
        const generic_schema = doc.object.get("paths").?.object.get(base).?.object.get("get").?.object.get("responses").?.object.get("200").?.object.get("content").?.object.get("application/json").?.object.get("schema").?;
        var expected_count: usize = 0;
        for (names) |n| {
            const name = n.string;
            const tail = if (group.resource == .user and std.mem.eql(u8, name, "itemmod")) "itemmods" else if (group.resource == .faction and std.mem.eql(u8, name, "dirtbombs")) "dirtybombs" else name;
            var selected_path: ?[]const u8 = null;
            var op: V = undefined;
            var it = doc.object.get("paths").?.object.iterator();
            while (it.next()) |entry| {
                const path = entry.key_ptr.*;
                if (!std.mem.startsWith(u8, path, base) or path.len <= base.len or path[base.len] != '/') continue;
                const slash = std.mem.lastIndexOfScalar(u8, path, '/').?;
                if (!std.ascii.eqlIgnoreCase(path[slash + 1 ..], tail)) continue;
                if (selected_path == null or std.mem.count(u8, path, "{") < std.mem.count(u8, selected_path.?, "{")) {
                    selected_path = path;
                    op = entry.value_ptr.object.get("get").?;
                }
            }
            var reference: ?[]const u8 = null;
            if (selected_path) |path| {
                if (std.mem.indexOfScalar(u8, path, '{') != null) continue;
                if (op.object.get("description")) |description| if (std.mem.indexOf(u8, description.string, "standalone") != null) continue;
                var has_required = false;
                if (op.object.get("parameters")) |parameters| for (parameters.array.items) |p| {
                    const resolved = if (p.object.get("$ref")) |r| doc.object.get("components").?.object.get("parameters").?.object.get(r.string[24..]).? else p;
                    if (std.mem.eql(u8, resolved.object.get("name").?.string, "key")) continue;
                    if (resolved.object.get("required")) |required| has_required = has_required or required.bool;
                };
                if (has_required) continue;
                const content = op.object.get("responses").?.object.get("200").?.object.get("content").?;
                const json = content.object.get("application/json") orelse continue;
                const schema = json.object.get("schema").?;
                if (schema.object.get("$ref")) |r| reference = r.string;
            } else if (group.resource == .user and std.mem.eql(u8, name, "factionbalance")) reference = "#/components/schemas/UserFactionBalanceResponse";
            if (reference == null or !responseContains(generic_schema, reference.?)) continue;
            var present = false;
            for (group.selections) |listed| present = present or std.mem.eql(u8, listed, name);
            if (!present) {
                std.debug.print("missing full group member {s}/{s}\n", .{ resource, name });
                return error.IncompleteIndependentGroup;
            }
            expected_count += 1;
        }
        try std.testing.expectEqual(expected_count, group.selections.len);
    }
}
