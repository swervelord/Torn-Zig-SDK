//! Unit tests for the cross-SDK parity contract (spec/shared/PARITY_SPEC.md). Offline,
//! key-free, deterministic (torn.testing mock transport and virtual clock).
const std = @import("std");
const model = @import("model.zig");
const client = @import("client.zig");
const runtime = @import("runtime.zig");
const planner = @import("planner.zig");
const contracts = @import("contracts.zig");
const current = @import("generated/current.zig");
const operations = @import("generated/operations.zig");
const selections = @import("generated/selections.zig");
const kit = @import("testing.zig");
const version = @import("version.zig");
const transport = @import("transport.zig");

const profile_ok = "{\"profile\":{\"id\":1,\"name\":\"Test\",\"level\":10,\"gender\":\"Male\",\"status\":{\"description\":\"Okay\",\"details\":null,\"state\":\"Okay\",\"color\":\"green\",\"until\":null}}}";

const Harness = struct {
    mock: kit.MockTransport,
    clock: kit.VirtualClock = .init(0),
    engine: runtime.Client = undefined,
    fn init(self: *Harness, config: runtime.Config) !void {
        self.* = .{ .mock = kit.MockTransport.init(std.testing.allocator) };
        var tuned = config;
        tuned.jitter = .none;
        self.engine = try runtime.Client.init(std.testing.allocator, std.testing.io, tuned, self.mock.transport());
        self.clock.attach(&self.engine, &self.mock);
    }
    fn deinit(self: *Harness) void {
        self.engine.deinit();
        self.mock.deinit();
    }
    fn api(self: *Harness) client.Client {
        return .{ .engine = &self.engine };
    }
};

test "open enums decode unknown values, expose known values and round-trip byte exact (P1.1)" {
    const a = std.testing.allocator;
    var result = try model.decode(current.UserBasic, a, "{\"id\":1,\"name\":\"T\",\"level\":1,\"gender\":\"Futuregender\",\"status\":{\"description\":\"\",\"details\":null,\"state\":\"Okay\",\"color\":\"green\",\"until\":null}}");
    defer result.deinit();
    try std.testing.expect(!result.value.gender.isKnown());
    try std.testing.expectEqualStrings("Futuregender", result.value.gender.unknown);
    try std.testing.expect(current.UserGenderEnum.known_values.len >= 3);
    try std.testing.expect(current.UserGenderEnum.parse("Male").eql(.Male));
    const json = try result.toJson(a);
    defer a.free(json);
    try std.testing.expect(std.mem.indexOf(u8, json, "\"gender\":\"Futuregender\"") != null);
    var war = try model.decode(current.FactionTerritoryWarResultEnum, a, "\"end_with_future_bomb\"");
    defer war.deinit();
    try std.testing.expectEqualStrings("end_with_future_bomb", war.value.text());
    // Strict mode (contracts) reports the unknown value (P1.3).
    try std.testing.expectError(error.InvalidEnum, contracts.decodeCurrent(current.FactionTerritoryWarResultEnum, a, "\"end_with_future_bomb\""));
    // A Dealer-like addition inside a union picks the branch that still matches.
    var job = try model.decode(current.UserJobResponse, a, "{\"job\":{\"type\":\"job\",\"name\":\"Casino\",\"position\":\"Croupier\"}}");
    defer job.deinit();
    try std.testing.expect(job.value.job == .job);
    try std.testing.expect(job.value.job.job.name.eql(.Casino));
}

test "spec overrides make omitted fields optional while strict mode still reports them (P1.2, P1.3)" {
    const a = std.testing.allocator;
    const upgrade = "{\"id\":1,\"name\":\"Basket\",\"description\":\"d\",\"flavor\":\"f\",\"cost\":25,\"requirement\":0}";
    var tolerant = try model.decode(current.TornHalloweenUpgrade, a, upgrade);
    defer tolerant.deinit();
    try std.testing.expect(tolerant.value.type == .absent);
    try std.testing.expectError(error.MissingField, contracts.decodeCurrent(current.TornHalloweenUpgrade, a, upgrade));
    try std.testing.expect(@TypeOf(@as(current.UserTrade, undefined).items) == model.Presence(model.Raw));
    var strict: model.Diagnostic = .{ .mode = .strict };
    try std.testing.expectError(error.UnknownField, model.decodeDetailed(struct { id: i64 }, a, "{\"id\":1,\"extra\":2}", &strict));
    try std.testing.expectEqualStrings("/extra", strict.jsonPath());
}

test "batch keeps raw JSON and sibling selections when one selection fails to decode (P1.4)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"KEY_A"} });
    defer h.deinit();
    try h.mock.pushJson("{\"profile\":{\"id\":1,\"name\":\"T\",\"level\":10,\"gender\":\"Male\",\"status\":{\"description\":\"Okay\",\"details\":null,\"state\":\"Okay\",\"color\":\"green\",\"until\":null}},\"timestamp\":\"not-a-number\"}");
    var result = try h.api().batch(.{ selections.user.basic, selections.user.timestamp }, &.{}, &.{}, .{});
    defer result.deinit();
    try std.testing.expect(result.value == null);
    try std.testing.expectEqualStrings("T", result.results[0].ok.profile.name);
    const failure = result.results[1].failed;
    try std.testing.expectEqualStrings("timestamp", failure.selection);
    try std.testing.expectEqualStrings("getUserGeneric", failure.operation);
    try std.testing.expectEqualStrings("/timestamp", failure.diagnostic.jsonPath());
    try std.testing.expectEqualStrings("\"not-a-number\"", failure.diagnostic.excerpt());
    try std.testing.expect(failure.diagnostic.expected != null);
    try std.testing.expectEqualStrings("not-a-number", result.execution.raw.object.get("timestamp").?.string);
}

test "unknown selections and parameters pass through and stay readable as raw JSON (P1.5, P8.2)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"KEY_A"} });
    defer h.deinit();
    try h.mock.pushJson("{\"futureselection\":{\"n\":1}}");
    try h.mock.pushJson("{\"travelinventory\":{\"capacity\":{\"base\":1,\"special\":0},\"inventory\":[]}}");
    var result = try h.api().execute(.{ .resource = .user, .selections = &.{"futureselection"}, .filters = &.{.{ .name = "newfilter", .value = "x" }} }, .{});
    defer result.deinit();
    try std.testing.expect(result.failure == null);
    try std.testing.expectEqualStrings("x", h.mock.request(0).query("newfilter").?);
    const Future = struct { futureselection: struct { n: i64 } };
    try std.testing.expectEqual(@as(i64, 1), (try result.decode(Future)).futureselection.n);
    var raw = try h.api().rawPath("/user/travelinventory?comment=sdk", .{});
    defer raw.deinit();
    try std.testing.expectEqual(@as(i64, 1), (try raw.decode(current.UserTravelInventoryResponse)).travelinventory.capacity.base);
    try std.testing.expectEqualStrings("/v2/user/travelinventory", h.mock.request(1).path());
    try std.testing.expectError(error.UseClientAuthentication, h.api().rawPath("/user?key=leak", .{}));
}

test "v1 and v2 both authenticate by header and code 23 reroutes back to v2 (P2.1, P4.3)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"KEY_A"} });
    defer h.deinit();
    try h.mock.pushJson("{\"error\":{\"code\":23,\"error\":\"This selection is only available in API v2\"}}");
    try h.mock.pushJson(profile_ok);
    var result = try h.api().execute(.{ .resource = .user, .selections = &.{"basic"}, .mode = .v1 }, .{});
    defer result.deinit();
    try std.testing.expect(result.failure == null);
    try std.testing.expectEqualStrings("KEY_A", h.mock.request(0).api_key);
    try std.testing.expectEqualStrings("/user/", h.mock.request(0).path());
    try std.testing.expect(h.mock.request(0).query("key") == null);
    try std.testing.expect(std.mem.indexOf(u8, h.mock.request(0).url, "KEY_A") == null);
    try std.testing.expectEqualStrings("/v2/user", h.mock.request(1).path());
    try std.testing.expect(result.reports[0].fallback);
}

test "typed errors carry code, message, key hint and helpers (P5.1-P5.3)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"SECRETKEY1234567"} });
    defer h.deinit();
    try h.mock.pushJson("{\"error\":{\"code\":7,\"error\":\"Incorrect ID-entity relation\"}}");
    var result = try h.api().select(selections.user.basic, &.{}, &.{}, .{});
    defer result.deinit();
    const failure = result.execution.failure.?;
    try std.testing.expectEqual(client.Kind.api, failure.kind);
    try std.testing.expectEqual(@import("errors.zig").TornErrorCode.incorrect_id_entity_relation, failure.code().?);
    try std.testing.expectEqualStrings("Incorrect ID-entity relation", failure.api_message);
    try std.testing.expectEqualStrings("***4567", failure.key.text());
    try std.testing.expect(!failure.isRetryable() and !failure.isKeyError());
    try std.testing.expect(result.result == .failed);
}

test "check_access refuses before sending and access metadata is generated (P6.1, P6.2)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"KEY_A"}, .check_access = true, .key_access = &.{.{ .key = "KEY_A", .level = .minimal }} });
    defer h.deinit();
    var result = try h.api().select(selections.user.travelinventory, &.{}, &.{}, .{});
    defer result.deinit();
    try std.testing.expectEqual(@as(usize, 0), h.mock.sends());
    try std.testing.expectEqual(client.Kind.validation, result.execution.failure.?.kind);
    try std.testing.expectEqual(@as(?planner.AccessLevel, .limited), result.execution.failure.?.required_access);
    try std.testing.expectEqual(planner.AccessLevel.limited, operations.getMyTravelInventory.access_level);
    try std.testing.expectEqual(@as(?planner.AccessLevel, .limited), selections.user.travelinventory.access_level);
    try std.testing.expectEqual(planner.AccessLevel.public, operations.getKeyInfo.access_level);
}

test "key/info detection learns access levels and groups keys of one owner (P3.2, P6.2)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{ "KEY_A", "KEY_B", "KEY_C" } });
    defer h.deinit();
    const info = "{{\"info\":{{\"selections\":{{}},\"access\":{{\"level\":3,\"type\":\"{s}\",\"faction\":false,\"company\":false,\"log\":{{\"custom_permissions\":false,\"available\":[]}}}},\"user\":{{\"id\":{d},\"faction_id\":null,\"company_id\":null}}}}}}";
    for ([_]struct { []const u8, i64 }{ .{ "Limited Access", 4 }, .{ "Full Access", 4 }, .{ "Public Only", 9 } }) |entry| {
        const body = try std.fmt.allocPrint(std.testing.allocator, info, .{ entry[0], entry[1] });
        defer std.testing.allocator.free(body);
        try h.mock.pushJson(body);
    }
    try h.api().detectKeys(.{});
    const states = try h.engine.keyStates(std.testing.allocator);
    defer std.testing.allocator.free(states);
    try std.testing.expectEqual(@as(?planner.AccessLevel, .limited), states[0].access);
    try std.testing.expectEqual(@as(?planner.AccessLevel, .public), states[2].access);
    try std.testing.expectEqual(states[0].group, states[1].group);
    try std.testing.expect(states[0].group != states[2].group);
    try std.testing.expectEqualStrings("KEY_C", h.mock.request(2).api_key);
}

test "typed pager follows links, strips keys and validates hosts (P7.1)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"KEY_A"} });
    defer h.deinit();
    try h.mock.pushJson("{\"attacks\":[],\"_metadata\":{\"links\":{\"next\":\"https://api.torn.com/v2/user/attacks?limit=1&to=5&key=LEAKED\",\"prev\":null}}}");
    try h.mock.pushJson("{\"attacks\":[],\"_metadata\":{\"links\":{\"next\":null,\"prev\":null}}}");
    var pager = try h.api().pages(operations.getMyAttacks, .{ .limit = .{ .value = 1 } }, .{});
    defer pager.deinit();
    var count: usize = 0;
    while (try pager.next()) |page_value| {
        var page = page_value;
        defer page.deinit();
        try std.testing.expect(page.value != null);
        count += 1;
    }
    try std.testing.expectEqual(@as(usize, 2), count);
    try std.testing.expectEqualStrings("5", h.mock.request(1).query("to").?);
    try std.testing.expect(h.mock.request(1).query("key") == null);
    try std.testing.expect(operations.getMyAttacks.paginated and !operations.getMyTravelInventory.paginated);
}

test "runtime constants and generated metadata (P8.4, P8.7)" {
    try std.testing.expectEqualStrings("6.15.0", version.SPEC_VERSION);
    try std.testing.expectEqual(@as(usize, 64), version.SPEC_SHA256.len);
    try std.testing.expect(std.mem.endsWith(u8, version.user_agent, version.SDK_VERSION));
    try std.testing.expectEqualStrings(version.user_agent, (runtime.Config{ .keys = &.{} }).user_agent);
    try std.testing.expectEqual(@as(?u32, 900), operations.getMyInventory.upstream_cache_ttl_seconds);
    try std.testing.expectEqual(@as(?u32, 3600), operations.getMyNewMessages.upstream_cache_ttl_seconds);
    // Descriptive union tags derived from schema names (no positional v0..vN).
    try std.testing.expect(@hasField(@FieldType(current.UserJobResponse, "job"), "company"));
    try std.testing.expect(@hasField(current.TradeItem, "money"));
    try std.testing.expect(!@hasField(@TypeOf(@as(operations.getUserGeneric.Params, .{})), "key"));
}

test "exact operations use the upstream cache TTL when a cache is attached (P8.4)" {
    var h: Harness = undefined;
    try h.init(.{ .keys = &.{"KEY_A"} });
    defer h.deinit();
    var memory = runtime.MemoryCache.init(std.testing.allocator, std.testing.io);
    defer memory.deinit();
    h.engine.cache = memory.cache();
    try h.mock.pushJson("{\"newmessages\":{\"count\":1}}");
    for (0..2) |_| {
        var result = try h.api().rawPath("/user/newmessages", .{ .request = .{ .cache_ttl_ms = 60_000 } });
        defer result.deinit();
        try std.testing.expect(result.failure == null);
    }
    try std.testing.expectEqual(@as(usize, 1), h.mock.sends());
}
