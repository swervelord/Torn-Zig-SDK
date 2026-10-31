const std = @import("std");
const torn = @import("torn");
const V = std.json.Value;
pub fn main(init: std.process.Init) !void {
    const a = init.arena.allocator();
    const io = init.io;
    const cwd = std.Io.Dir.cwd();
    const provenance_bytes = try cwd.readFileAlloc(io, "spec/provenance.json", a, .limited(1024 * 1024));
    const provenance = try std.json.parseFromSliceLeaky(V, a, provenance_bytes, .{});
    for (provenance.object.get("snapshots").?.array.items) |snapshot| {
        const bytes = try cwd.readFileAlloc(io, snapshot.object.get("file").?.string, a, .limited(16 * 1024 * 1024));
        var digest: [32]u8 = undefined;
        std.crypto.hash.sha2.Sha256.hash(bytes, &digest, .{});
        const actual = std.fmt.bytesToHex(digest, .lower);
        if (!std.mem.eql(u8, &actual, snapshot.object.get("sha256").?.string)) return error.SnapshotHashMismatch;
        const doc = try std.json.parseFromSliceLeaky(V, a, bytes, .{});
        if (!std.mem.eql(u8, doc.object.get("info").?.object.get("version").?.string, snapshot.object.get("version").?.string)) return error.SnapshotVersionMismatch;
        var operations: usize = 0;
        var paths = doc.object.get("paths").?.object.iterator();
        while (paths.next()) |path| {
            var methods = path.value_ptr.object.iterator();
            while (methods.next()) |method| if (std.mem.eql(u8, method.key_ptr.*, "get")) {
                operations += 1;
            };
        }
        if (operations != snapshot.object.get("operations").?.integer) return error.OperationInventoryMismatch;
        if (doc.object.get("components").?.object.get("schemas").?.object.count() != snapshot.object.get("schemas").?.integer) return error.SchemaInventoryMismatch;
    }
    if (torn.current.schema_count != 724 or torn.frozen.schema_count != 711 or torn.compatibility.schema_count != 549 or torn.operations.operation_count != 237) return error.PublicInventoryMismatch;
    const args = try init.minimal.args.toSlice(a);
    if (args.len == 3 and std.mem.eql(u8, args[1], "--historical")) {
        const old_bytes = try cwd.readFileAlloc(io, args[2], a, .limited(16 * 1024 * 1024));
        const old = try std.json.parseFromSliceLeaky(V, a, old_bytes, .{ .parse_numbers = false });
        const pinned = try std.json.parseFromSliceLeaky(V, a, torn.frozen.source_json, .{ .parse_numbers = false });
        if (!equal(old, pinned)) return error.HistoricalSemanticMismatch;
    }
}
pub fn equal(a: V, b: V) bool {
    if (std.meta.activeTag(a) != std.meta.activeTag(b)) return false;
    return switch (a) {
        .null => true,
        .bool => |v| v == b.bool,
        .integer => |v| v == b.integer,
        .float => |v| v == b.float,
        .string => |v| std.mem.eql(u8, v, b.string),
        .number_string => |v| std.mem.eql(u8, v, b.number_string),
        .array => |arr| blk: {
            if (arr.items.len != b.array.items.len) break :blk false;
            for (arr.items, b.array.items) |x, y| if (!equal(x, y)) break :blk false;
            break :blk true;
        },
        .object => |obj| blk: {
            if (obj.count() != b.object.count()) break :blk false;
            var it = obj.iterator();
            while (it.next()) |kv| if (!equal(kv.value_ptr.*, b.object.get(kv.key_ptr.*) orelse break :blk false)) break :blk false;
            break :blk true;
        },
    };
}
