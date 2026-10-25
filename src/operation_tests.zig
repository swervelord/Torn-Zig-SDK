//! Expected paths, parameters, media, and fixtures come directly from the pinned
//! official contract, independently of generated operation descriptors.
const std = @import("std");
const operations = @import("generated/operations.zig");
const current = @import("generated/current.zig");
const fixtures = @import("model_contract_tests.zig");
const model = @import("model.zig");
const client = @import("client.zig");
const runtime = @import("runtime.zig");
const transport = @import("transport.zig");
const V = std.json.Value;

const Wire = struct {
    expected_url: []const u8,
    body: []const u8,
    sends: usize = 0,
    fn send(ctx: ?*anyopaque, a: std.mem.Allocator, _: std.Io, request: transport.Request) !transport.Response {
        const self: *Wire = @ptrCast(@alignCast(ctx.?));
        try std.testing.expectEqualStrings(self.expected_url, request.url);
        self.sends += 1;
        return .{ .allocator = a, .status = 200, .body = try a.dupe(u8, self.body) };
    }
};

fn encode(a: std.mem.Allocator, text: []const u8) ![]const u8 {
    var output: std.ArrayList(u8) = .empty;
    const digits = "0123456789ABCDEF";
    for (text) |byte| {
        switch (byte) {
            'A'...'Z', 'a'...'z', '0'...'9', '-', '_', '.', '~' => try output.append(a, byte),
            else => try output.appendSlice(a, &.{ '%', digits[byte / 16], digits[byte % 16] }),
        }
    }
    return output.toOwnedSlice(a);
}
fn textValue(a: std.mem.Allocator, value: V) anyerror![]const u8 {
    return switch (value) {
        .string => value.string,
        .number_string => value.number_string,
        .integer => try std.fmt.allocPrint(a, "{d}", .{value.integer}),
        .bool => if (value.bool) "true" else "false",
        .array => blk: {
            var parts: std.ArrayList([]const u8) = .empty;
            for (value.array.items) |item| try parts.append(a, try textValue(a, item));
            break :blk try std.mem.join(a, ",", parts.items);
        },
        else => error.InvalidParameterFixture,
    };
}
fn equal(expected: V, actual: V) bool {
    if (std.meta.activeTag(expected) != std.meta.activeTag(actual)) return false;
    return switch (expected) {
        .null => true,
        .bool => expected.bool == actual.bool,
        .integer => expected.integer == actual.integer,
        .float => expected.float == actual.float,
        .string => std.mem.eql(u8, expected.string, actual.string),
        .number_string => std.mem.eql(u8, expected.number_string, actual.number_string),
        .array => blk: {
            if (expected.array.items.len != actual.array.items.len) break :blk false;
            for (expected.array.items, actual.array.items) |e, v| if (!equal(e, v)) break :blk false;
            break :blk true;
        },
        .object => blk: {
            if (expected.object.count() != actual.object.count()) break :blk false;
            var it = expected.object.iterator();
            while (it.next()) |entry| if (!equal(entry.value_ptr.*, actual.object.get(entry.key_ptr.*) orelse break :blk false)) break :blk false;
            break :blk true;
        },
    };
}
fn exercise(comptime Op: type, doc: V) !void {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    var selected_operation: ?V = null;
    var selected_path: []const u8 = undefined;
    var it = doc.object.get("paths").?.object.iterator();
    while (it.next()) |entry| {
        if (entry.value_ptr.object.get("get")) |get| if (std.mem.eql(u8, get.object.get("operationId").?.string, Op.operation_id)) {
            selected_operation = get;
            selected_path = entry.key_ptr.*;
            break;
        };
    }
    const operation = selected_operation orelse return error.MissingOperationContract;
    var params: std.json.ObjectMap = .{};
    var path = selected_path;
    var query: std.ArrayList([]const u8) = .empty;
    if (operation.object.get("parameters")) |parameters| for (parameters.array.items) |p| {
        const resolved = if (p.object.get("$ref")) |ref| doc.object.get("components").?.object.get("parameters").?.object.get(ref.string[24..]).? else p;
        const name = resolved.object.get("name").?.string;
        if (std.mem.eql(u8, name, "key")) continue;
        const schema = resolved.object.get("schema").?;
        var value = try fixtures.sample(a, doc, schema, 1, 0);
        if (value == .null) value = try fixtures.sample(a, doc, schema, 0, 0);
        try params.put(a, name, value);
        const encoded = try encode(a, try textValue(a, value));
        if (std.mem.eql(u8, resolved.object.get("in").?.string, "path")) {
            const needle = try std.fmt.allocPrint(a, "{{{s}}}", .{name});
            const where = std.mem.indexOf(u8, path, needle) orelse return error.MissingPathPlaceholder;
            path = try std.mem.concat(a, u8, &.{ path[0..where], encoded, path[where + needle.len ..] });
        } else {
            try query.append(a, try std.fmt.allocPrint(a, "{s}={s}", .{ try encode(a, name), encoded }));
        }
    };
    const query_text = try std.mem.join(a, "&", query.items);
    const url = try std.fmt.allocPrint(a, "https://example.invalid/v2{s}{s}{s}", .{ path, if (query_text.len > 0) "?" else "", query_text });
    const content = operation.object.get("responses").?.object.get("200").?.object.get("content").?;
    const csv = content.object.get("text/csv") != null;
    const expected: V = if (csv) .{ .string = "id,name\n1,example\n" } else try fixtures.sample(a, doc, content.object.get("application/json").?.object.get("schema").?, 0, 0);
    const body = if (csv) expected.string else try std.json.Stringify.valueAlloc(a, expected, .{});
    var wire: Wire = .{ .expected_url = url, .body = body };
    var engine = try runtime.Client.init(std.testing.allocator, std.testing.io, .{ .keys = &.{"test-only-placeholder"}, .base_url_v2 = "https://example.invalid/v2", .max_attempts = 1, .per_key_per_minute = 10000 }, .{ .context = &wire, .send_fn = Wire.send });
    defer engine.deinit();
    const c: client.Client = .{ .engine = &engine };
    const params_json = try std.json.Stringify.valueAlloc(a, V{ .object = params }, .{});
    var decoded_params = try model.decode(Op.Params, std.testing.allocator, params_json);
    defer decoded_params.deinit();
    var response = try c.exact(Op, decoded_params.value, .{});
    defer response.deinit();
    if (response.execution.failure) |failure| {
        std.debug.print("exact invocation failed {s}: {s}\n", .{ Op.operation_id, if (failure.cause) |cause| @errorName(cause) else "structured error" });
        return error.ExactInvocationFailed;
    }
    try std.testing.expectEqual(@as(usize, 1), wire.sends);
    try std.testing.expectEqual(@as(usize, 1), response.execution.reports.len);
    try std.testing.expectEqualStrings(Op.operation_id, response.execution.reports[0].operation);
    try std.testing.expect(response.value != null);
    const serialized = try model.stringify(a, response.value.?);
    const observed = try std.json.parseFromSliceLeaky(V, a, serialized, .{ .parse_numbers = false });
    if (!equal(expected, observed)) {
        std.debug.print("exact typed value mismatch {s}\n", .{Op.operation_id});
        return error.ExactValueMismatch;
    }
}
test "all 234 exact operations send independently checked paths and decode concrete values" {
    @setEvalBranchQuota(10000000);
    var parsed = try std.json.parseFromSlice(V, std.testing.allocator, current.source_json, .{ .parse_numbers = false });
    defer parsed.deinit();
    var count: usize = 0;
    inline for (@typeInfo(operations).@"struct".decl_names) |name| {
        const Op = @field(operations, name);
        if (@TypeOf(Op) == type and @hasDecl(Op, "Params") and @hasDecl(Op, "Response")) {
            try exercise(Op, parsed.value);
            count += 1;
        }
    }
    try std.testing.expectEqual(@as(usize, 234), count);
}
