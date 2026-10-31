//! Torn domain helpers (P8.6): web URL builders and Torn time (TCT = UTC) conversion.
//! URL builders write into a caller buffer and never allocate.
const std = @import("std");

pub const web_base = "https://www.torn.com";

fn build(buffer: []u8, comptime pattern: []const u8, args: anytype) ![]const u8 {
    return std.fmt.bufPrint(buffer, web_base ++ pattern, args);
}
pub fn profileUrl(buffer: []u8, user_id: i64) ![]const u8 {
    return build(buffer, "/profiles.php?XID={d}", .{user_id});
}
pub fn attackUrl(buffer: []u8, user_id: i64) ![]const u8 {
    return build(buffer, "/loader.php?sid=attack&user2ID={d}", .{user_id});
}
pub fn factionUrl(buffer: []u8, faction_id: i64) ![]const u8 {
    return build(buffer, "/factions.php?step=profile&ID={d}", .{faction_id});
}
pub fn companyUrl(buffer: []u8, company_id: i64) ![]const u8 {
    return build(buffer, "/joblist.php#/p=corpinfo&ID={d}", .{company_id});
}
pub fn bazaarUrl(buffer: []u8, user_id: i64) ![]const u8 {
    return build(buffer, "/bazaar.php?userId={d}", .{user_id});
}
pub fn itemMarketUrl(buffer: []u8, item_id: i64) ![]const u8 {
    return build(buffer, "/page.php?sid=ItemMarket#/market/view=search&itemID={d}", .{item_id});
}
pub fn tradeUrl(buffer: []u8, trade_id: i64) ![]const u8 {
    return build(buffer, "/trade.php#step=view&ID={d}", .{trade_id});
}
pub fn forumThreadUrl(buffer: []u8, forum_id: i64, thread_id: i64) ![]const u8 {
    return build(buffer, "/forums.php#/p=threads&f={d}&t={d}", .{ forum_id, thread_id });
}
pub fn propertyUrl(buffer: []u8, property_id: i64) ![]const u8 {
    return build(buffer, "/properties.php#/p=propertyinfo&ID={d}", .{property_id});
}

/// Torn City Time is UTC. Torn timestamps are Unix seconds.
pub const Tct = struct {
    year: u16,
    month: u4,
    day: u5,
    hour: u5,
    minute: u6,
    second: u6,
    pub fn format(self: Tct, writer: *std.Io.Writer) std.Io.Writer.Error!void {
        try writer.print("{d:0>2}:{d:0>2}:{d:0>2} - {d:0>2}/{d:0>2}/{d:0>2}", .{ self.hour, self.minute, self.second, self.day, self.month, self.year % 100 });
    }
};
/// Converts a Torn (Unix seconds) timestamp to TCT calendar fields. Negative
/// timestamps (before 1970) are rejected.
pub fn fromTimestamp(timestamp: i64) !Tct {
    if (timestamp < 0) return error.InvalidTimestamp;
    const seconds: std.time.epoch.EpochSeconds = .{ .secs = @intCast(timestamp) };
    const day = seconds.getEpochDay();
    const year_day = day.calculateYearDay();
    const month_day = year_day.calculateMonthDay();
    const day_seconds = seconds.getDaySeconds();
    return .{
        .year = year_day.year,
        .month = @intCast(month_day.month.numeric()),
        .day = @intCast(month_day.day_index + 1),
        .hour = @intCast(day_seconds.getHoursIntoDay()),
        .minute = @intCast(day_seconds.getMinutesIntoHour()),
        .second = @intCast(day_seconds.getSecondsIntoMinute()),
    };
}
/// Converts TCT calendar fields back to a Torn timestamp.
pub fn toTimestamp(tct: Tct) !i64 {
    if (tct.year < 1970 or tct.month < 1 or tct.month > 12 or tct.day < 1 or tct.hour > 23 or tct.minute > 59 or tct.second > 59) return error.InvalidDate;
    const month: std.time.epoch.Month = @fromBackingInt(@intCast(tct.month));
    if (tct.day > std.time.epoch.getDaysInMonth(tct.year, month)) return error.InvalidDate;
    var days: i64 = 0;
    var year: u16 = 1970;
    while (year < tct.year) : (year += 1) days += std.time.epoch.getDaysInYear(year);
    var m: u4 = 1;
    while (m < tct.month) : (m += 1) days += std.time.epoch.getDaysInMonth(tct.year, @fromBackingInt(@intCast(m)));
    days += tct.day - 1;
    return ((days * 24 + tct.hour) * 60 + tct.minute) * 60 + tct.second;
}
/// Current Torn timestamp from the given Io clock.
pub fn nowTimestamp(io: std.Io) i64 {
    return @divFloor(std.Io.Clock.real.now(io).toMilliseconds(), 1000);
}
/// Milliseconds (runtime clock unit) to a Torn timestamp and back.
pub fn timestampFromMillis(ms: i64) i64 {
    return @divFloor(ms, 1000);
}
pub fn millisFromTimestamp(timestamp: i64) i64 {
    return timestamp * 1000;
}

test "web URL builders (P8.6)" {
    var buffer: [128]u8 = undefined;
    try std.testing.expectEqualStrings("https://www.torn.com/profiles.php?XID=4", try profileUrl(&buffer, 4));
    try std.testing.expectEqualStrings("https://www.torn.com/loader.php?sid=attack&user2ID=4", try attackUrl(&buffer, 4));
    try std.testing.expectEqualStrings("https://www.torn.com/factions.php?step=profile&ID=9", try factionUrl(&buffer, 9));
    try std.testing.expectEqualStrings("https://www.torn.com/joblist.php#/p=corpinfo&ID=7", try companyUrl(&buffer, 7));
    try std.testing.expectEqualStrings("https://www.torn.com/bazaar.php?userId=4", try bazaarUrl(&buffer, 4));
    try std.testing.expectEqualStrings("https://www.torn.com/page.php?sid=ItemMarket#/market/view=search&itemID=206", try itemMarketUrl(&buffer, 206));
    try std.testing.expectEqualStrings("https://www.torn.com/trade.php#step=view&ID=5", try tradeUrl(&buffer, 5));
    try std.testing.expectEqualStrings("https://www.torn.com/forums.php#/p=threads&f=2&t=16000000", try forumThreadUrl(&buffer, 2, 16_000_000));
    try std.testing.expectEqualStrings("https://www.torn.com/properties.php#/p=propertyinfo&ID=3", try propertyUrl(&buffer, 3));
    var small: [8]u8 = undefined;
    try std.testing.expectError(error.NoSpaceLeft, profileUrl(&small, 4));
}

test "TCT conversion round-trips and formats like Torn (P8.6)" {
    const tct = try fromTimestamp(1_700_000_000);
    try std.testing.expectEqual(Tct{ .year = 2023, .month = 11, .day = 14, .hour = 22, .minute = 13, .second = 20 }, tct);
    try std.testing.expectEqual(@as(i64, 1_700_000_000), try toTimestamp(tct));
    const text = try std.fmt.allocPrint(std.testing.allocator, "{f}", .{tct});
    defer std.testing.allocator.free(text);
    try std.testing.expectEqualStrings("22:13:20 - 14/11/23", text);
    try std.testing.expectEqual(@as(i64, 951_782_400), try toTimestamp(.{ .year = 2000, .month = 2, .day = 29, .hour = 0, .minute = 0, .second = 0 }));
    try std.testing.expectError(error.InvalidDate, toTimestamp(.{ .year = 2001, .month = 2, .day = 29, .hour = 0, .minute = 0, .second = 0 }));
    try std.testing.expectError(error.InvalidTimestamp, fromTimestamp(-1));
    try std.testing.expectEqual(@as(i64, 1), timestampFromMillis(1999));
}
