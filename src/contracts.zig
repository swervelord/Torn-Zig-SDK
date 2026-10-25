const std = @import("std");
const model = @import("model.zig");
const schema = @import("schema.zig");
const current = @import("generated/current.zig");
const frozen = @import("generated/frozen.zig");

pub fn decodeCurrent(comptime T: type, a: std.mem.Allocator, json: []const u8) !model.Owned(T) {
    return decodeNamed(T, a, current.source_json, current.schemaName(T) orelse return error.UnknownSchema, json);
}
pub fn decodeFrozen(comptime T: type, a: std.mem.Allocator, json: []const u8) !model.Owned(T) {
    return decodeNamed(T, a, frozen.source_json, frozen.schemaName(T) orelse return error.UnknownSchema, json);
}
/// Explicit names preserve constraints for scalar aliases that share a Zig type.
pub fn decodeNamed(comptime T: type, a: std.mem.Allocator, document: []const u8, name: []const u8, json: []const u8) !model.Owned(T) {
    var result = try model.decode(T, a, json);
    errdefer result.deinit();
    var arena = std.heap.ArenaAllocator.init(a);
    defer arena.deinit();
    const doc = try std.json.parseFromSliceLeaky(model.Raw, arena.allocator(), document, .{ .parse_numbers = false });
    const contract = doc.object.get("components").?.object.get("schemas").?.object.get(name) orelse return error.UnknownSchema;
    try schema.validate(doc, contract, result.raw);
    return result;
}

test "current elimination requires captains independently of frozen leaders" {
    const a = std.testing.allocator;
    const historical = "{\"id\":1,\"name\":\"Team\",\"participants\":1,\"participants_left\":1,\"position\":1,\"score\":0,\"lives\":1,\"wins\":0,\"losses\":0,\"eliminated\":false,\"eliminated_timestamp\":null,\"leaders\":[],\"attacking_summary\":[]}";
    try std.testing.expectError(error.MissingField, decodeCurrent(current.TornEliminationTeam, a, historical));
}
