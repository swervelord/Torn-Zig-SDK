const std = @import("std");
const model = @import("model.zig");
const schema = @import("schema.zig");
const current = @import("generated/current.zig");
const frozen = @import("generated/frozen.zig");

pub fn decodeCurrent(comptime T: type, a: std.mem.Allocator, json: []const u8) !model.Owned(T) {
    return decodeNamed(T, a, current.source_json, current.schemaName(T) orelse return error.UnknownSchema, json);
}
pub fn decodeCurrentChecked(comptime T: type, a: std.mem.Allocator, json: []const u8, checkpoint: ?model.Checkpoint) !model.Owned(T) {
    return decodeNamedChecked(T, a, current.source_json, current.schemaName(T) orelse return error.UnknownSchema, json, checkpoint);
}
pub fn decodeFrozenChecked(comptime T: type, a: std.mem.Allocator, json: []const u8, checkpoint: ?model.Checkpoint) !model.Owned(T) {
    return decodeNamedChecked(T, a, frozen.source_json, frozen.schemaName(T) orelse return error.UnknownSchema, json, checkpoint);
}
pub fn decodeFrozen(comptime T: type, a: std.mem.Allocator, json: []const u8) !model.Owned(T) {
    return decodeNamed(T, a, frozen.source_json, frozen.schemaName(T) orelse return error.UnknownSchema, json);
}
/// Explicit names preserve constraints for scalar aliases that share a Zig type.
pub fn decodeNamed(comptime T: type, a: std.mem.Allocator, document: []const u8, name: []const u8, json: []const u8) !model.Owned(T) {
    return decodeNamedChecked(T, a, document, name, json, null);
}
pub fn decodeNamedChecked(comptime T: type, a: std.mem.Allocator, document: []const u8, name: []const u8, json: []const u8, checkpoint: ?model.Checkpoint) !model.Owned(T) {
    var diagnostic: model.Diagnostic = .{ .checkpoint = checkpoint, .mode = .strict };
    return decodeNamedDetailed(T, a, document, name, json, &diagnostic);
}
/// Contract decoding is the strict validation mode (P1.3): unknown enum values, unknown
/// properties and override-relaxed fields are errors. Pass a `.tolerant` diagnostic to
/// keep only the official schema's structural checks.
pub fn decodeNamedDetailed(comptime T: type, a: std.mem.Allocator, document: []const u8, name: []const u8, json: []const u8, diagnostic: *model.Diagnostic) !model.Owned(T) {
    var result = try model.decodeDetailed(T, a, json, diagnostic);
    errdefer result.deinit();
    var arena = std.heap.ArenaAllocator.init(a);
    defer arena.deinit();
    const doc = try parsedDocument(arena.allocator(), document);
    const contract = doc.object.get("components").?.object.get("schemas").?.object.get(name) orelse return error.UnknownSchema;
    try schema.validateDetailed(doc, contract, result.raw, diagnostic);
    return result;
}

/// Parses an embedded contract once per process (lock-free once; losers spin until the
/// winner publishes). The parsed tree is immutable and lives for the process lifetime.
const DocumentCache = struct {
    state: std.atomic.Value(u8) = .init(0),
    value: model.Raw = .null,
    arena: std.heap.ArenaAllocator = .init(std.heap.page_allocator),
    fn get(self: *DocumentCache, source: []const u8) !model.Raw {
        while (true) switch (self.state.load(.acquire)) {
            2 => return self.value,
            0 => if (self.state.cmpxchgStrong(0, 1, .acquire, .monotonic) == null) {
                const parsed = std.json.parseFromSliceLeaky(model.Raw, self.arena.allocator(), source, .{ .parse_numbers = false }) catch |err| {
                    _ = self.arena.reset(.free_all);
                    self.state.store(0, .release);
                    return err;
                };
                self.value = parsed;
                self.state.store(2, .release);
                return parsed;
            },
            else => std.atomic.spinLoopHint(),
        };
    }
};
var current_document: DocumentCache = .{};
var frozen_document: DocumentCache = .{};
/// The embedded current (`current.source_json`) contract, parsed once.
pub fn currentDocument() !model.Raw {
    return current_document.get(current.source_json);
}
pub fn frozenDocument() !model.Raw {
    return frozen_document.get(frozen.source_json);
}
/// Embedded contracts come from the process-wide cache; other documents are parsed
/// into `arena` for this call only.
pub fn parsedDocument(arena: std.mem.Allocator, document: []const u8) !model.Raw {
    if (document.ptr == current.source_json.ptr and document.len == current.source_json.len) return currentDocument();
    if (document.ptr == frozen.source_json.ptr and document.len == frozen.source_json.len) return frozenDocument();
    return std.json.parseFromSliceLeaky(model.Raw, arena, document, .{ .parse_numbers = false });
}

test "current elimination requires captains independently of frozen leaders" {
    const a = std.testing.allocator;
    const historical = "{\"id\":1,\"name\":\"Team\",\"participants\":1,\"participants_left\":1,\"position\":1,\"score\":0,\"lives\":1,\"wins\":0,\"losses\":0,\"eliminated\":false,\"eliminated_timestamp\":null,\"leaders\":[],\"attacking_summary\":[]}";
    try std.testing.expectError(error.MissingField, decodeCurrent(current.TornEliminationTeam, a, historical));
}
test "named detailed decoding preserves schema-only bound path and frees owned failure" {
    const document = "{\"components\":{\"schemas\":{\"Boundary\":{\"type\":\"object\",\"properties\":{\"items\":{\"type\":\"array\",\"items\":{\"type\":\"object\",\"properties\":{\"id\":{\"type\":\"integer\",\"format\":\"int32\"}}}}}}}}}";
    const T = struct { items: []const struct { id: i64 } };
    var diagnostic: model.Diagnostic = .{};
    try std.testing.expectError(error.OutOfRange, decodeNamedDetailed(T, std.testing.allocator, document, "Boundary", "{\"items\":[{\"id\":2147483648}]}", &diagnostic));
    try std.testing.expectEqualStrings("/items/0/id", diagnostic.jsonPath());
    try std.testing.expect(diagnostic.reason.? == error.OutOfRange);
}
