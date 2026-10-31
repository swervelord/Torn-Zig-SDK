//! Torn API error codes (P5.1) and the data-driven retry/failover policy (P2.3, P4.1).
//! The table is generated from the vendored spec/shared/error-codes.json; behavior is
//! keyed by numeric code, never by message text.
const std = @import("std");
const shared = @import("generated/shared.zig");

pub const TornErrorCode = shared.TornErrorCode;
pub const CodeInfo = shared.CodeInfo;
pub const Category = shared.Category;
pub const Action = shared.Action;
pub const DisableKey = shared.DisableKey;
pub const AccessLevel = shared.AccessLevel;
/// Retry defaults from error-codes.json `retry` (P4.2).
pub const retry = shared.retry;
pub const codes = shared.codes;

/// Open handling: any numeric code is representable; codes outside the table are
/// `@enumFromInt(code)` values without `info`.
pub fn fromInt(code: u32) TornErrorCode {
    return @fromBackingInt(@intCast(std.math.cast(u16, code) orelse std.math.maxInt(u16)));
}
pub fn info(code: TornErrorCode) ?*const CodeInfo {
    const raw = @backingInt(code);
    if (raw < codes.len and codes[raw].code == raw) return &codes[raw];
    for (&codes) |*entry| if (entry.code == raw) return entry;
    return null;
}
/// Policy action; unknown codes fail without retry.
pub fn action(code: TornErrorCode) Action {
    return if (info(code)) |entry| entry.action else .fail;
}
pub fn name(code: TornErrorCode) []const u8 {
    return if (info(code)) |entry| entry.name else "Unrecognized";
}
pub fn isKnown(code: TornErrorCode) bool {
    return info(code) != null;
}
pub fn isRetryable(code: TornErrorCode) bool {
    return if (info(code)) |entry| entry.retryable else false;
}
/// The key itself is the problem (incorrect, paused, owner jailed or inactive, ...).
pub fn isKeyError(code: TornErrorCode) bool {
    return if (info(code)) |entry| entry.category == .key else false;
}
/// Per-user rate limit (code 5) or IP block (code 8).
pub fn isRateLimit(code: TornErrorCode) bool {
    return if (info(code)) |entry| entry.category == .rate or entry.category == .ip else false;
}
pub fn isAccessError(code: TornErrorCode) bool {
    return if (info(code)) |entry| entry.category == .access else false;
}
/// Transient server-side failure that a later identical request may not hit.
pub fn isTransient(code: TornErrorCode) bool {
    return if (info(code)) |entry| entry.category == .transient else false;
}
pub fn isHttpRetryStatus(status: u16) bool {
    for (retry.http_retry_statuses) |candidate| if (candidate == status) return true;
    return false;
}

test "generated error table is complete, ordered and open (P5.1)" {
    try std.testing.expectEqual(@as(usize, 34), codes.len);
    for (codes, 0..) |entry, i| try std.testing.expectEqual(@as(u16, @intCast(i)), entry.code);
    try std.testing.expectEqual(TornErrorCode.incorrect_key, fromInt(2));
    try std.testing.expectEqualStrings("BackendError", name(fromInt(17)));
    try std.testing.expect(!isKnown(fromInt(999)) and action(fromInt(999)) == .fail);
    try std.testing.expectEqualStrings("Unrecognized", name(fromInt(999)));
    try std.testing.expectEqual(@as(u16, 999), @backingInt(fromInt(999)));
}

test "policy helpers classify by code (P5.3)" {
    try std.testing.expect(isKeyError(.incorrect_key) and isKeyError(.api_key_paused) and !isKeyError(.backend_error));
    try std.testing.expect(isRateLimit(.too_many_requests) and isRateLimit(.ip_blocked));
    try std.testing.expect(isAccessError(.access_level_too_low));
    try std.testing.expect(isTransient(.backend_error) and isTransient(.key_read_error) and !isTransient(.incorrect_id));
    try std.testing.expect(isRetryable(.backend_error) and !isRetryable(.api_disabled));
    try std.testing.expectEqual(Action.rotate_key, action(.key_owner_in_federal_jail));
    try std.testing.expectEqual(DisableKey.until_utc_midnight, info(.daily_read_limit_reached).?.disable_key);
    try std.testing.expectEqual(Action.reroute_version, action(.only_available_in_api_v1));
    try std.testing.expect(isHttpRetryStatus(503) and !isHttpRetryStatus(408));
    try std.testing.expectEqual(@as(u32, 4), retry.max_attempts);
}
