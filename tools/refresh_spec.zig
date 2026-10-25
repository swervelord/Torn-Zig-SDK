//! Explicit online fetch. Writes a candidate only; pinned contracts need review.
const std = @import("std");
pub fn main(init: std.process.Init) !void {
    const a = init.arena.allocator();
    const io = init.io;
    var client: std.http.Client = .{ .allocator = a, .io = io };
    defer client.deinit();
    const uri = try std.Uri.parse("https://www.torn.com/swagger/openapi.json");
    var request = try client.request(.GET, uri, .{ .redirect_behavior = .unhandled, .headers = .{ .user_agent = .{ .override = "Torn-Zig-SDK-spec-refresh/0.1.0" }, .accept_encoding = .{ .override = "identity" } } });
    defer request.deinit();
    try request.sendBodiless();
    var response = try request.receiveHead(&.{});
    if (response.head.status != .ok) return error.RefreshHttpFailure;
    var buffer: [8192]u8 = undefined;
    const bytes = try response.reader(&buffer).allocRemaining(a, .limited(16 * 1024 * 1024));
    _ = try std.json.parseFromSliceLeaky(std.json.Value, a, bytes, .{});
    try std.Io.Dir.cwd().writeFile(io, .{ .sub_path = "spec/openapi-candidate.json", .data = bytes });
}
