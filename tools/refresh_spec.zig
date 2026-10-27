//! Explicit online fetch. Writes a candidate only; pinned contracts need review.
const std = @import("std");
pub fn main(init: std.process.Init) !void {
    const a = init.arena.allocator();
    const io = init.io;
    var client: std.http.Client = .{ .allocator = a, .io = io };
    defer client.deinit();
    const uri = try std.Uri.parse("https://www.torn.com/swagger/openapi.json");
    var request = try client.request(.GET, uri, .{ .redirect_behavior = .unhandled, .headers = .{ .user_agent = .{ .override = "Torn-Zig-SDK-spec-refresh/0.2.0" }, .accept_encoding = .{ .override = "identity" } } });
    defer request.deinit();
    try request.sendBodiless();
    var response = try request.receiveHead(&.{});
    if (response.head.status != .ok) return error.RefreshHttpFailure;
    var buffer: [8192]u8 = undefined;
    const bytes = try response.reader(&buffer).allocRemaining(a, .limited(16 * 1024 * 1024));
    const candidate = try std.json.parseFromSliceLeaky(std.json.Value, a, bytes, .{ .parse_numbers = false });
    const old_bytes = try std.Io.Dir.cwd().readFileAlloc(io, "spec/openapi-6.14.0.json", a, .limited(16 * 1024 * 1024));
    const old = try std.json.parseFromSliceLeaky(std.json.Value, a, old_bytes, .{ .parse_numbers = false });
    var digest: [32]u8 = undefined;
    std.crypto.hash.sha2.Sha256.hash(bytes, &digest, .{});
    const sha256 = std.fmt.bytesToHex(digest, .lower);
    const report = try std.json.Stringify.valueAlloc(a, .{
        .source = "https://www.torn.com/swagger/openapi.json",
        .previous_version = old.object.get("info").?.object.get("version").?.string,
        .candidate_version = candidate.object.get("info").?.object.get("version").?.string,
        .candidate_sha256 = &sha256,
        .semantically_equal = @import("audit.zig").equal(old, candidate),
        .paths = try diff(a, old.object.get("paths").?, candidate.object.get("paths").?),
        .schemas = try diff(a, old.object.get("components").?.object.get("schemas").?, candidate.object.get("components").?.object.get("schemas").?),
    }, .{ .whitespace = .indent_2 });
    try std.Io.Dir.cwd().writeFile(io, .{ .sub_path = "spec/openapi-candidate.json", .data = bytes });
    try std.Io.Dir.cwd().writeFile(io, .{ .sub_path = "spec/refresh-report.json", .data = report });
}
const Diff = struct { added: []const []const u8, removed: []const []const u8, changed: []const []const u8 };
fn diff(a: std.mem.Allocator, old: std.json.Value, new: std.json.Value) !Diff {
    var added: std.ArrayList([]const u8) = .empty;
    var removed: std.ArrayList([]const u8) = .empty;
    var changed: std.ArrayList([]const u8) = .empty;
    var it = new.object.iterator();
    while (it.next()) |entry| {
        if (old.object.get(entry.key_ptr.*)) |previous| {
            if (!@import("audit.zig").equal(previous, entry.value_ptr.*)) try changed.append(a, entry.key_ptr.*);
        } else try added.append(a, entry.key_ptr.*);
    }
    var prior = old.object.iterator();
    while (prior.next()) |entry| if (!new.object.contains(entry.key_ptr.*)) {
        try removed.append(a, entry.key_ptr.*);
    };
    return .{ .added = try added.toOwnedSlice(a), .removed = try removed.toOwnedSlice(a), .changed = try changed.toOwnedSlice(a) };
}
