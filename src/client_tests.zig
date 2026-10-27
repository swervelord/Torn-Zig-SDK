const std = @import("std");
const planner = @import("planner.zig");
const client = @import("client.zig");
const runtime = @import("runtime.zig");
const transport = @import("transport.zig");
const cases = @import("planner_cases.zig");

const Step = struct { url: []const u8, status: u16 = 200, body: []const u8 = "{}" };
const Wire = struct {
    steps: []const Step,
    count: usize = 0,
    fn send(context: ?*anyopaque, a: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
        const self: *Wire = @ptrCast(@alignCast(context.?));
        if (self.count >= self.steps.len) return error.UnexpectedTransportCall;
        const step = self.steps[self.count];
        try std.testing.expectEqualStrings(step.url, request.url);
        self.count += 1;
        return .{ .allocator = a, .status = step.status, .body = try a.dupe(u8, step.body) };
    }
    fn engine(self: *Wire) !runtime.Client {
        return runtime.Client.init(std.testing.allocator, std.testing.io, .{
            .keys = &.{"test-only-placeholder"},
            .base_url_v2 = "https://example.invalid/v2",
            .base_url_v1 = "https://example.invalid",
            .max_attempts = 1,
            .per_key_per_minute = 10000,
            .per_route_per_minute = 10000,
        }, .{ .context = self, .send_fn = send });
    }
};

test "3132 independently specified compatible pairs each cause exactly one actual send" {
    var total: usize = 0;
    for (cases.all_groups) |group| {
        for (group.selections, 0..) |left, i| {
            for (group.selections[i + 1 ..]) |right| {
                if (!cases.shouldTestPair(group, left, right)) continue;
                const query = try cases.expectedQuery(std.testing.allocator, left, right);
                defer std.testing.allocator.free(query);
                const expected_url = try std.fmt.allocPrint(std.testing.allocator, "https://example.invalid/v2{s}?{s}{s}", .{ group.path, query, group.query_suffix });
                defer std.testing.allocator.free(expected_url);
                var wire: Wire = .{ .steps = &.{.{ .url = expected_url }} };
                var engine = try wire.engine();
                defer engine.deinit();
                const c: client.Client = .{ .engine = &engine };
                var result = try c.execute(.{ .resource = group.resource, .selections = &.{ right, left, right }, .target = group.target, .filters = group.filters }, .{});
                defer result.deinit();
                try std.testing.expect(result.failure == null);
                try std.testing.expectEqual(@as(usize, 1), wire.count);
                try std.testing.expectEqual(@as(usize, 1), result.reports.len);
                try std.testing.expectEqual(@as(usize, 2), result.reports[0].selections.len);
                total += 1;
            }
        }
    }
    try std.testing.expectEqual(@as(usize, 3132), total);
}

test "full resource and semantic domain groups each execute one contributing call" {
    for (cases.all_groups) |group| {
        const a = std.testing.allocator;
        const names = try a.dupe([]const u8, group.selections);
        defer a.free(names);
        std.mem.sort([]const u8, names, {}, struct {
            fn less(_: void, x: []const u8, y: []const u8) bool {
                return std.mem.lessThan(u8, x, y);
            }
        }.less);
        const selections_query = try std.mem.join(a, "%2C", names);
        defer a.free(selections_query);
        const url = try std.fmt.allocPrint(a, "https://example.invalid/v2{s}?selections={s}{s}", .{ group.path, selections_query, group.query_suffix });
        defer a.free(url);
        var wire: Wire = .{ .steps = &.{.{ .url = url }} };
        var engine = try wire.engine();
        defer engine.deinit();
        const c: client.Client = .{ .engine = &engine };
        var result = try c.execute(.{ .resource = group.resource, .selections = group.selections, .target = group.target, .filters = group.filters }, .{});
        defer result.deinit();
        try std.testing.expect(result.failure == null);
        try std.testing.expectEqual(@as(usize, 1), wire.count);
        try std.testing.expectEqual(@as(usize, 1), result.reports.len);
        try std.testing.expectEqual(group.selections.len, result.reports[0].selections.len);
    }
}

test "split recovery retains target and encoded filters and reports successes only" {
    var wire: Wire = .{ .steps = &.{
        .{ .url = "https://example.invalid/v2/user?selections=job%2Cprofile&id=123&comment=check%20me", .status = 400, .body = "unsupported combination" },
        .{ .url = "https://example.invalid/v2/user?selections=job&id=123&comment=check%20me", .body = "{\"job\":{\"name\":\"example\"}}" },
        .{ .url = "https://example.invalid/v2/user?selections=profile&id=123&comment=check%20me", .body = "{\"profile\":{\"name\":\"example\"}}" },
    } };
    var engine = try wire.engine();
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.execute(.{ .resource = .user, .selections = &.{ "profile", "job" }, .target = &.{.{ .name = "id", .value = "123" }}, .filters = &.{.{ .name = "comment", .value = "check me" }} }, .{});
    defer result.deinit();
    try std.testing.expect(result.failure == null);
    try std.testing.expectEqual(@as(usize, 3), wire.count);
    try std.testing.expectEqual(@as(usize, 2), result.reports.len);
    try std.testing.expect(result.raw.object.contains("job"));
    try std.testing.expect(result.raw.object.contains("profile"));
}

test "partial split success and its report survive a later failure" {
    var wire: Wire = .{ .steps = &.{
        .{ .url = "https://example.invalid/v2/user?selections=job%2Cprofile", .body = "{\"error\":{\"code\":4}}" },
        .{ .url = "https://example.invalid/v2/user?selections=job", .body = "{\"job\":{\"name\":\"example\"}}" },
        .{ .url = "https://example.invalid/v2/user?selections=profile", .body = "{\"error\":{\"code\":2}}" },
    } };
    var engine = try wire.engine();
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.execute(.{ .resource = .user, .selections = &.{ "profile", "job" } }, .{});
    defer result.deinit();
    try std.testing.expectEqual(@as(usize, 3), wire.count);
    try std.testing.expectEqual(@as(usize, 1), result.reports.len);
    try std.testing.expectEqual(@as(?u32, 2), result.failure.?.api_code);
    try std.testing.expect(result.raw.object.contains("job"));
}

test "legacy recovery retains target in the explicit v1 path" {
    var wire: Wire = .{ .steps = &.{
        .{ .url = "https://example.invalid/v2/user?selections=profile&id=123", .status = 404, .body = "not found" },
        .{ .url = "https://example.invalid/user/123?selections=profile", .body = "{\"profile\":{}}" },
    } };
    var engine = try wire.engine();
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    var result = try c.execute(.{ .resource = .user, .selections = &.{"profile"}, .target = &.{.{ .name = "id", .value = "123" }} }, .{ .legacy_fallback = true });
    defer result.deinit();
    try std.testing.expect(result.failure == null);
    try std.testing.expectEqual(@as(usize, 2), wire.count);
    try std.testing.expectEqual(@as(usize, 1), result.reports.len);
    try std.testing.expectEqual(@as(u8, 1), result.reports[0].api_version);
    try std.testing.expect(result.reports[0].fallback);
}

test "fallback disabled and uncatalogued resources each stop after one send" {
    const scenarios = .{
        .{ planner.Resource.user, "profile", "https://example.invalid/v2/user?selections=profile", false },
        .{ planner.Resource.forum, "timestamp", "https://example.invalid/v2/forum?selections=timestamp", true },
    };
    inline for (scenarios) |s| {
        var wire: Wire = .{ .steps = &.{.{ .url = s[2], .body = "{\"error\":{\"code\":4}}" }} };
        var engine = try wire.engine();
        defer engine.deinit();
        const c: client.Client = .{ .engine = &engine };
        var result = try c.execute(.{ .resource = s[0], .selections = &.{s[1]} }, .{ .legacy_fallback = s[3] });
        defer result.deinit();
        try std.testing.expect(result.failure != null);
        try std.testing.expectEqual(@as(usize, 1), wire.count);
        try std.testing.expectEqual(@as(usize, 0), result.reports.len);
    }
}

test "three CSV channels use dedicated paths and preserve text" {
    const paths = .{ "/company/snapshot", "/faction/snapshot", "/user/snapshot" };
    inline for (.{ planner.Resource.company, planner.Resource.faction, planner.Resource.user }, paths) |resource, path| {
        var wire: Wire = .{ .steps = &.{.{ .url = "https://example.invalid/v2" ++ path, .body = "id,name\n1,example\n" }} };
        var engine = try wire.engine();
        defer engine.deinit();
        const c: client.Client = .{ .engine = &engine };
        var result = try c.execute(.{ .resource = resource, .selections = &.{"snapshot"} }, .{});
        defer result.deinit();
        try std.testing.expect(result.failure == null);
        try std.testing.expectEqualStrings("id,name\n1,example\n", result.raw.string);
        try std.testing.expectEqual(@as(usize, 1), wire.count);
    }
}

test "all 184 maintained v1 entries execute at the transport boundary" {
    const routing = @import("generated/routing.zig");
    var count: usize = 0;
    for (routing.v1_catalog) |entry| {
        const url = try std.fmt.allocPrint(std.testing.allocator, "https://example.invalid/{s}/123?selections={s}", .{ entry.resource, entry.name });
        defer std.testing.allocator.free(url);
        var wire: Wire = .{ .steps = &.{.{ .url = url }} };
        var engine = try wire.engine();
        defer engine.deinit();
        const c: client.Client = .{ .engine = &engine };
        var result = try c.execute(.{ .resource = std.meta.stringToEnum(planner.Resource, entry.resource).?, .selections = &.{entry.name}, .target = &.{.{ .name = "id", .value = "123" }}, .mode = .v1 }, .{});
        defer result.deinit();
        try std.testing.expect(result.failure == null);
        try std.testing.expectEqual(@as(usize, 1), wire.count);
        try std.testing.expectEqual(@as(usize, 1), result.reports.len);
        try std.testing.expectEqual(@as(u8, 1), result.reports[0].api_version);
        count += 1;
    }
    try std.testing.expectEqual(@as(usize, 184), count);
}

test "direct routing buckets match documented literal paths" {
    const Direct = struct { resource: planner.Resource, selection: []const u8, path: []const u8, target: []const planner.Argument = &.{} };
    const direct = [_]Direct{
        .{ .resource = .user, .selection = "itemmods", .path = "/user/itemmods" },
        .{ .resource = .faction, .selection = "dirtybombs", .path = "/faction/dirtybombs" },
        .{ .resource = .faction, .selection = "reports", .path = "/faction/reports" },
        .{ .resource = .company, .selection = "companies", .path = "/company/5/companies", .target = &.{.{ .name = "typeId", .value = "5" }} },
        .{ .resource = .company, .selection = "search", .path = "/company/search" },
        .{ .resource = .property, .selection = "property", .path = "/property/123/property", .target = &.{.{ .name = "id", .value = "123" }} },
        .{ .resource = .torn, .selection = "companies", .path = "/torn/companies" },
        .{ .resource = .torn, .selection = "searchforcash", .path = "/torn/searchforcash" },
        .{ .resource = .torn, .selection = "shoplifting", .path = "/torn/shoplifting" },
    };
    for (direct) |scenario| {
        const url = try std.mem.concat(std.testing.allocator, u8, &.{ "https://example.invalid/v2", scenario.path });
        defer std.testing.allocator.free(url);
        var wire: Wire = .{ .steps = &.{.{ .url = url }} };
        var engine = try wire.engine();
        defer engine.deinit();
        const c: client.Client = .{ .engine = &engine };
        var result = try c.execute(.{ .resource = scenario.resource, .selections = &.{scenario.selection}, .target = scenario.target }, .{});
        defer result.deinit();
        try std.testing.expect(result.failure == null);
        try std.testing.expectEqual(@as(usize, 1), wire.count);
        try std.testing.expectEqualStrings(scenario.path, result.reports[0].path);
    }
}
