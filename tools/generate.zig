//! Offline, deterministic contract generation. Inputs are read from spec/.
const std = @import("std");
const V = std.json.Value;
const A = std.mem.Allocator;
const Gen = struct {
    a: A,
    out: std.ArrayList(u8) = .empty,
    document: V = .null,
    compatibility_names: V = .null,
    source_path: []const u8 = "",
    raw_count: usize = 0,
    fn add(g: *Gen, s: []const u8) !void {
        try g.out.appendSlice(g.a, s);
    }
    fn fmt(g: *Gen, comptime f: []const u8, args: anytype) !void {
        try g.add(try std.fmt.allocPrint(g.a, f, args));
    }
    fn quote(g: *Gen, s: []const u8) !void {
        try g.add("\"");
        for (s) |c| switch (c) {
            '"' => try g.add("\\\""),
            '\\' => try g.add("\\\\"),
            '\n' => try g.add("\\n"),
            '\r' => try g.add("\\r"),
            '\t' => try g.add("\\t"),
            0...8, 11, 12, 14...31 => try g.fmt("\\x{x:0>2}", .{c}),
            else => try g.out.append(g.a, c),
        };
        try g.add("\"");
    }
    fn ident(g: *Gen, s: []const u8) !void {
        try g.add("@");
        try g.quote(s);
    }
    fn rawLocation(g: *Gen, namespace: []const u8, path: []const u8, reason: []const u8) !void {
        if (g.raw_count != 0) try g.add(",\n");
        g.raw_count += 1;
        try g.add("{\"namespace\":");
        try g.quote(namespace);
        try g.add(",\"location\":");
        try g.quote(path);
        try g.add(",\"reason\":");
        try g.quote(reason);
        try g.add("}");
    }
    fn typing(g: *Gen, namespace: []const u8, path: []const u8, v: V, depth: usize) anyerror!void {
        if (depth > 128) return error.SchemaDepth;
        if (get(v, "$ref") != null) return;
        var described = false;
        inline for (.{ "allOf", "oneOf", "anyOf" }) |key| if (get(v, key)) |branches| {
            described = true;
            for (branches.array.items, 0..) |branch, i| try g.typing(namespace, try std.fmt.allocPrint(g.a, "{s}/{s}/{d}", .{ path, key, i }), branch, depth + 1);
        };
        const props = get(v, "properties");
        if (props) |p| {
            described = true;
            var it = p.object.iterator();
            while (it.next()) |entry| try g.typing(namespace, try std.fmt.allocPrint(g.a, "{s}/properties/{s}", .{ path, entry.key_ptr.* }), entry.value_ptr.*, depth + 1);
        }
        if (get(v, "required")) |required| {
            described = true;
            for (required.array.items) |name| {
                if (props == null or !props.?.object.contains(name.string)) try g.rawLocation(namespace, try std.fmt.allocPrint(g.a, "{s}/properties/{s}", .{ path, name.string }), "required property without a narrower value schema");
            }
        }
        if (get(v, "items")) |items| {
            described = true;
            try g.typing(namespace, try std.fmt.allocPrint(g.a, "{s}/items", .{path}), items, depth + 1);
        }
        if (get(v, "type")) |ty| {
            described = true;
            if (ty == .string and std.mem.eql(u8, ty.string, "object")) {
                const additional = get(v, "additionalProperties");
                if (additional == null or additional.? == .bool and additional.?.bool) try g.rawLocation(namespace, try std.fmt.allocPrint(g.a, "{s}/*", .{path}), if (props == null) "open object values represented by Map(Raw)" else "unknown object fields retained by Owned raw tree");
            }
            if (ty == .string and std.mem.eql(u8, ty.string, "array") and get(v, "items") == null) try g.rawLocation(namespace, try std.fmt.allocPrint(g.a, "{s}/items", .{path}), "array item value schema unspecified");
        }
        if (get(v, "additionalProperties")) |additional| if (additional == .object) {
            described = true;
            try g.typing(namespace, try std.fmt.allocPrint(g.a, "{s}/additionalProperties", .{path}), additional, depth + 1);
        };
        if (get(v, "enum") != null or get(v, "const") != null) described = true;
        if (!described) try g.rawLocation(namespace, path, "unconstrained value schema");
    }
    fn compatibilityTyping(g: *Gen, path: []const u8, v: V) anyerror!void {
        if (get(v, "name")) |name| if (name == .string and std.mem.eql(u8, name.string, "raw")) try g.rawLocation("compatibility", path, "explicit maintained raw/unknown value contract");
        if (get(v, "arguments")) |args| for (args.array.items, 0..) |arg, i| try g.compatibilityTyping(try std.fmt.allocPrint(g.a, "{s}/arguments/{d}", .{ path, i }), arg);
    }
    fn ref(g: *Gen, s: []const u8) !void {
        const p = std.mem.lastIndexOfScalar(u8, s, '/') orelse return error.InvalidReference;
        try g.ident(s[p + 1 ..]);
    }
    fn schema(g: *Gen, v: V, depth: usize) anyerror!void {
        if (depth > 80) return error.SchemaDepth;
        if (get(v, "$ref")) |r| return g.ref(r.string);
        if (get(v, "allOf")) |all| {
            var props = std.json.ObjectMap{};
            var req: std.ArrayList(V) = .empty;
            for (all.array.items) |part| try collect(g.a, part, &props, &req, g.document);
            var obj = std.json.ObjectMap{};
            try obj.put(g.a, "properties", .{ .object = props });
            try obj.put(g.a, "required", .{ .array = std.array_list.Managed(V).fromOwnedSlice(g.a, try req.toOwnedSlice(g.a)) });
            return g.schema(.{ .object = obj }, depth + 1);
        }
        if (get(v, "enum")) |en| {
            if (en.array.items.len == 0) return g.add("model.Raw");
            try g.add("enum { ");
            for (en.array.items) |item| {
                const name = try scalarName(g.a, item);
                try g.ident(name);
                try g.add(", ");
            }
            if (en.array.items[0] != .string) try g.add("pub const json_numeric = true; ");
            try g.add("}");
            return;
        }
        const alternatives = get(v, "oneOf") orelse get(v, "anyOf");
        if (alternatives) |alts| {
            if (alts.array.items.len == 2) {
                if (isNull(alts.array.items[0])) {
                    try g.add("?");
                    return g.schema(alts.array.items[1], depth + 1);
                }
                if (isNull(alts.array.items[1])) {
                    try g.add("?");
                    return g.schema(alts.array.items[0], depth + 1);
                }
            }
            try g.add("union(enum) { ");
            for (alts.array.items, 0..) |part, i| {
                try g.fmt("v{d}: ", .{i});
                try g.schema(part, depth + 1);
                try g.add(", ");
            }
            try g.add("}");
            return;
        }
        if (get(v, "type")) |ty| {
            if (ty == .array) {
                var other: ?[]const u8 = null;
                var nullable = false;
                for (ty.array.items) |t| {
                    if (std.mem.eql(u8, t.string, "null")) nullable = true else other = t.string;
                }
                if (nullable and other != null) {
                    try g.add("?");
                    var copy = v.object;
                    try copy.put(g.a, "type", .{ .string = other.? });
                    return g.schema(.{ .object = copy }, depth + 1);
                }
            }
            if (ty == .string) {
                const t = ty.string;
                if (std.mem.eql(u8, t, "string")) return g.add("[]const u8");
                if (std.mem.eql(u8, t, "integer")) return g.add("i64");
                if (std.mem.eql(u8, t, "number")) return g.add("f64");
                if (std.mem.eql(u8, t, "boolean")) return g.add("bool");
                if (std.mem.eql(u8, t, "null")) return g.add("void");
                if (std.mem.eql(u8, t, "array")) {
                    try g.add("[]const ");
                    if (get(v, "items")) |item| try g.schema(item, depth + 1) else try g.add("model.Raw");
                    return;
                }
            }
        }
        if (get(v, "properties")) |props| {
            try g.add("struct {\n");
            const required = get(v, "required");
            var it = props.object.iterator();
            while (it.next()) |kv| {
                const needed = contains(required, kv.key_ptr.*);
                try g.ident(kv.key_ptr.*);
                try g.add(": ");
                if (!needed) try g.add("model.Presence(");
                try g.schema(kv.value_ptr.*, depth + 1);
                if (!needed) try g.add(") = .absent");
                try g.add(",\n");
            }
            if (required) |r| for (r.array.items) |name| {
                if (!props.object.contains(name.string)) {
                    try g.ident(name.string);
                    try g.add(": model.Raw,\n");
                }
            };
            // Schema metadata is retained on concrete object types for strict validation.
            try g.add("pub const json_schema = ");
            try g.quote(try std.json.Stringify.valueAlloc(g.a, v, .{}));
            try g.add(";\n}");
            return;
        }
        if (get(v, "additionalProperties")) |ap| {
            try g.add("model.Map(");
            if (ap == .object) try g.schema(ap, depth + 1) else try g.add("model.Raw");
            try g.add(")");
            return;
        }
        if (get(v, "required")) |required| {
            try g.add("struct { ");
            for (required.array.items) |name| {
                try g.ident(name.string);
                try g.add(": model.Raw, ");
            }
            try g.add("}");
            return;
        }
        if (get(v, "type")) |ty| if (ty == .string and std.mem.eql(u8, ty.string, "object")) return g.add("model.Map(model.Raw)");
        try g.add("model.Raw");
    }
    fn official(g: *Gen, doc: V) !void {
        g.document = doc;
        try g.add("// Generated by tools/generate.zig; do not edit.\nconst model = @import(\"../model.zig\");\n");
        try g.add("pub const source_json = @embedFile(");
        try g.quote(g.source_path);
        try g.add(");\n");
        const schemas = get(get(doc, "components").?, "schemas").?;
        var it = schemas.object.iterator();
        while (it.next()) |kv| {
            try g.add("pub const ");
            try g.ident(kv.key_ptr.*);
            try g.add(" = ");
            try g.schema(kv.value_ptr.*, 0);
            try g.add(";\n");
        }
        try g.fmt("pub const schema_count = {d};\n", .{schemas.object.count()});
        try g.add("pub const all_types = .{\n");
        it = schemas.object.iterator();
        while (it.next()) |kv| {
            try g.ident(kv.key_ptr.*);
            try g.add(",\n");
        }
        try g.add("};\n");
        try g.add("pub const all_schema_names = .{\n");
        it = schemas.object.iterator();
        while (it.next()) |kv| {
            try g.quote(kv.key_ptr.*);
            try g.add(",\n");
        }
        try g.add("};\npub fn schemaName(comptime T: type) ?[]const u8 { @setEvalBranchQuota(1000000); inline for (all_types, all_schema_names) |Candidate, name| { if(T == Candidate) return name; } return null; }\n");
    }
    fn compatType(g: *Gen, t: V) anyerror!void {
        const n = get(t, "name").?.string;
        const args = get(t, "arguments");
        if (std.mem.eql(u8, n, "optional")) {
            try g.add("?");
            return g.compatType(args.?.array.items[0]);
        }
        if (std.mem.eql(u8, n, "box")) {
            try g.add("*");
            return g.compatType(args.?.array.items[0]);
        }
        if (std.mem.eql(u8, n, "array")) {
            try g.add("[]const ");
            return g.compatType(args.?.array.items[0]);
        }
        if (std.mem.eql(u8, n, "map")) {
            try g.add("model.Map(");
            try g.compatType(args.?.array.items[1]);
            try g.add(")");
            return;
        }
        const pairs = .{ .{ "string", "[]const u8" }, .{ "bool", "bool" }, .{ "int64", "i64" }, .{ "uint64", "u64" }, .{ "uint32", "u32" }, .{ "float64", "f64" }, .{ "float32", "f32" }, .{ "raw", "model.Raw" }, .{ "exact_number", "model.ExactNumber" }, .{ "null", "void" } };
        inline for (pairs) |p| if (std.mem.eql(u8, n, p[0])) return g.add(p[1]);
        if (g.compatibility_names == .object and !g.compatibility_names.object.contains(n)) try g.add("current.");
        try g.ident(n);
    }
    fn compatibility(g: *Gen, doc: V) !void {
        g.compatibility_names = doc;
        try g.add("// Generated maintained compatibility contracts.\nconst model = @import(\"../model.zig\");\nconst current = @import(\"current.zig\");\n");
        var it = doc.object.iterator();
        while (it.next()) |kv| {
            const v = kv.value_ptr.*;
            const kind = get(v, "Kind").?.string;
            try g.add("pub const ");
            try g.ident(kv.key_ptr.*);
            try g.add(" = ");
            if (std.mem.eql(u8, kind, "alias")) {
                try g.compatType(get(v, "Type").?);
            } else if (std.mem.eql(u8, kind, "union")) {
                try g.add("union(enum) {\n");
                for (get(v, "Variants").?.array.items, 0..) |t, i| {
                    try g.fmt("v{d}: ", .{i});
                    try g.compatType(t);
                    try g.add(",\n");
                }
                try g.add("pub const compatibility_name = ");
                try g.quote(kv.key_ptr.*);
                try g.add(";\n");
                try g.add("pub const compatibility_json = ");
                try g.quote(try std.json.Stringify.valueAlloc(g.a, v, .{}));
                try g.add(";\n}");
            } else if (std.mem.eql(u8, kind, "struct")) {
                try g.add("struct {\n");
                for (get(v, "Fields").?.array.items) |f| {
                    try g.ident(get(f, "Name").?.string);
                    try g.add(": ");
                    try g.compatType(get(f, "Type").?);
                    try g.add(",\n");
                }
                try g.add("pub const compatibility_fields = [_]model.CompatField{\n");
                for (get(v, "Fields").?.array.items) |f| {
                    try g.add(".{ .name = ");
                    try g.quote(get(f, "Name").?.string);
                    try g.add(", .key = ");
                    try g.quote(get(f, "Key").?.string);
                    try g.add(", .aliases = &.{");
                    for (get(f, "Aliases").?.array.items) |alias| {
                        try g.quote(alias.string);
                        try g.add(",");
                    }
                    try g.add("}, .has_default = ");
                    try g.add(if (get(f, "Default").?.bool) "true" else "false");
                    try g.add(", .flatten = ");
                    try g.add(if (get(f, "Flatten").?.bool) "true" else "false");
                    try g.add(", .custom = ");
                    try g.quote(get(f, "Custom").?.string);
                    try g.add(" },\n");
                }
                try g.add("};\n");
                try g.add("pub const compatibility_json = ");
                try g.quote(try std.json.Stringify.valueAlloc(g.a, v, .{}));
                try g.add(";\n}");
            } else return error.UnknownCompatibilityKind;
            try g.add(";\n");
        }
        try g.fmt("pub const schema_count = {d};\n", .{doc.object.count()});
        try g.add("pub const all_types = .{\n");
        it = doc.object.iterator();
        while (it.next()) |kv| {
            try g.ident(kv.key_ptr.*);
            try g.add(",\n");
        }
        try g.add("};\n");
    }
    fn operations(g: *Gen, doc: V) !void {
        g.document = doc;
        try g.add("// Generated exact operation contracts.\nconst model = @import(\"../model.zig\");\nconst current = @import(\"current.zig\");\n");
        // Parameter references use the current namespace without creating public duplicates.
        const components = get(get(doc, "components").?, "schemas").?;
        var sit = components.object.iterator();
        while (sit.next()) |kv| {
            try g.add("const ");
            try g.ident(kv.key_ptr.*);
            try g.add(" = current.");
            try g.ident(kv.key_ptr.*);
            try g.add(";\n");
        }
        var paths = get(doc, "paths").?.object.iterator();
        var names: std.ArrayList([]const u8) = .empty;
        while (paths.next()) |path| {
            const op = get(path.value_ptr.*, "get") orelse continue;
            const name = get(op, "operationId").?.string;
            try names.append(g.a, name);
            try g.add("pub const ");
            try g.ident(name);
            try g.add(" = struct {\npub const operation_id = ");
            try g.quote(name);
            try g.add(";\npub const path = ");
            try g.quote(path.key_ptr.*);
            try g.add(";\npub const method = \"GET\";\npub const Params = @This().Parameters;\npub const Parameters = struct {\n");
            if (get(op, "parameters")) |ps| for (ps.array.items) |raw| {
                var p = raw;
                if (get(p, "$ref")) |r| {
                    const slash = std.mem.lastIndexOfScalar(u8, r.string, '/').?;
                    p = get(get(get(doc, "components").?, "parameters").?, r.string[slash + 1 ..]).?;
                }
                const pn = get(p, "name").?.string;
                const required = if (get(p, "required")) |r| r.bool else false;
                try g.ident(pn);
                try g.add(": ");
                if (!required) try g.add("model.Presence(");
                try g.schema(get(p, "schema").?, 0);
                if (!required) try g.add(") = .absent");
                try g.add(",\n");
            };
            try g.add("};\npub const Response = ");
            const response = get(get(get(op, "responses").?, "200").?, "content").?;
            if (get(response, "application/json")) |json| {
                const response_schema = get(json, "schema").?;
                if (try g.compositeResponse(response_schema)) |composite| try g.schema(composite, 0) else try g.schema(response_schema, 0);
                try g.add(";\npub const media_type = \"application/json\";\n");
            } else {
                try g.add("[]const u8;\npub const media_type = \"text/csv\";\n");
            }
            try g.add("pub const contract_json = ");
            try g.quote(try std.json.Stringify.valueAlloc(g.a, op, .{}));
            try g.add(";\n};\n");
        }
        try g.add("pub const all_operations = .{\n");
        for (names.items) |n| {
            try g.ident(n);
            try g.add(",\n");
        }
        try g.add("};\n");
        try g.fmt("pub const operation_count = {d};\n", .{names.items.len});
    }
    /// Generic anyOf response branches are contributing object selections, not
    /// mutually exclusive result variants. Preserve every contributing key.
    fn compositeResponse(g: *Gen, v: V) !?V {
        const alternatives = get(v, "anyOf") orelse return null;
        for (alternatives.array.items) |branch| if (!objectSchema(g.document, branch)) return null;
        var properties: std.json.ObjectMap = .{};
        for (alternatives.array.items) |branch| try g.contributingProperties(branch, &properties);
        var composite: std.json.ObjectMap = .{};
        try composite.put(g.a, "type", .{ .string = "object" });
        try composite.put(g.a, "properties", .{ .object = properties });
        return .{ .object = composite };
    }
    fn contributingProperties(g: *Gen, v: V, properties: *std.json.ObjectMap) anyerror!void {
        if (get(v, "$ref")) |reference| {
            const slash = std.mem.lastIndexOfScalar(u8, reference.string, '/').?;
            return g.contributingProperties(get(get(get(g.document, "components").?, "schemas").?, reference.string[slash + 1 ..]).?, properties);
        }
        inline for (.{ "allOf", "anyOf", "oneOf" }) |key| if (get(v, key)) |branches| for (branches.array.items) |branch| try g.contributingProperties(branch, properties);
        if (get(v, "properties")) |props| {
            var it = props.object.iterator();
            while (it.next()) |entry| try g.mergeProperty(properties, entry.key_ptr.*, entry.value_ptr.*);
        }
    }
    fn mergeProperty(g: *Gen, properties: *std.json.ObjectMap, key: []const u8, value: V) !void {
        const previous = properties.get(key) orelse return properties.put(g.a, key, value);
        const candidate = try std.json.Stringify.valueAlloc(g.a, value, .{});
        var branches = std.array_list.Managed(V).init(g.a);
        if (previous == .object and previous.object.count() == 1 and get(previous, "anyOf") != null) {
            for (get(previous, "anyOf").?.array.items) |branch| {
                if (std.mem.eql(u8, candidate, try std.json.Stringify.valueAlloc(g.a, branch, .{}))) return;
                try branches.append(branch);
            }
        } else {
            if (std.mem.eql(u8, candidate, try std.json.Stringify.valueAlloc(g.a, previous, .{}))) return;
            try branches.append(previous);
        }
        try branches.append(value);
        var combined: std.json.ObjectMap = .{};
        try combined.put(g.a, "anyOf", .{ .array = branches });
        try properties.put(g.a, key, .{ .object = combined });
    }
};
fn objectSchema(doc: V, v: V) bool {
    if (get(v, "$ref")) |ref| {
        const slash = std.mem.lastIndexOfScalar(u8, ref.string, '/') orelse return false;
        const child = get(get(get(doc, "components") orelse return false, "schemas") orelse return false, ref.string[slash + 1 ..]) orelse return false;
        return objectSchema(doc, child);
    }
    if (get(v, "allOf") orelse get(v, "anyOf") orelse get(v, "oneOf")) |branches| {
        for (branches.array.items) |branch| if (!objectSchema(doc, branch)) return false;
        return true;
    }
    if (get(v, "type")) |ty| return ty == .string and std.mem.eql(u8, ty.string, "object");
    return get(v, "properties") != null or get(v, "required") != null;
}
fn get(v: V, key: []const u8) ?V {
    return if (v == .object) v.object.get(key) else null;
}
fn isNull(v: V) bool {
    const t = get(v, "type") orelse return false;
    return t == .string and std.mem.eql(u8, t.string, "null");
}
fn contains(v: ?V, key: []const u8) bool {
    if (v) |a| for (a.array.items) |item| {
        if (std.mem.eql(u8, item.string, key)) return true;
    };
    return false;
}
fn scalarName(a: A, v: V) ![]const u8 {
    return switch (v) {
        .string => v.string,
        .integer => std.fmt.allocPrint(a, "{d}", .{v.integer}),
        .float => std.fmt.allocPrint(a, "{d}", .{v.float}),
        else => error.UnsupportedEnum,
    };
}
fn collect(a: A, v: V, props: *std.json.ObjectMap, req: *std.ArrayList(V), doc: V) anyerror!void {
    if (get(v, "$ref")) |r| {
        const slash = std.mem.lastIndexOfScalar(u8, r.string, '/').?;
        return collect(a, get(get(get(doc, "components").?, "schemas").?, r.string[slash + 1 ..]).?, props, req, doc);
    }
    if (get(v, "allOf")) |all| for (all.array.items) |p| {
        try collect(a, p, props, req, doc);
    };
    if (get(v, "properties")) |p| {
        var it = p.object.iterator();
        while (it.next()) |kv| try props.put(a, kv.key_ptr.*, kv.value_ptr.*);
    }
    if (get(v, "required")) |r| for (r.array.items) |n| {
        var seen = false;
        for (req.items) |old| {
            if (std.mem.eql(u8, old.string, n.string)) seen = true;
        }
        if (!seen) try req.append(a, n);
    };
}
pub fn main(init: std.process.Init) !void {
    const a = init.arena.allocator();
    const io = init.io;
    const cwd = std.Io.Dir.cwd();
    const args = try init.minimal.args.toSlice(a);
    const check = args.len > 1 and std.mem.eql(u8, args[1], "--check");
    const inputs = .{ "spec/openapi-6.13.8.json", "spec/openapi-6.13.6.json", "spec/compatibility-models.json", "spec/openapi-6.13.8.json" };
    const outputs = .{ "src/generated/current.zig", "src/generated/frozen.zig", "src/generated/compatibility.zig", "src/generated/operations.zig" };
    var manifest: Gen = .{ .a = a };
    var typing: Gen = .{ .a = a };
    try typing.add("{\n\"policy\":\"Raw values are retained only at unconstrained value locations, open object extras, and explicit maintained unknown contracts. Numeric exact_number uses ExactNumber.\",\n\"locations\":[\n");
    try manifest.add("{\n\"generator\":\"tools/generate.zig\",\n\"alias_identity\":\"Zig scalar aliases may share type identity; use explicit schema names to retain domain constraints.\",\n\"models\":[\n");
    inline for (inputs, outputs, 0..) |input, output, i| {
        const bytes = try cwd.readFileAlloc(io, input, a, .limited(32 * 1024 * 1024));
        const doc = try std.json.parseFromSlice(V, a, bytes, .{ .allocate = .alloc_always, .max_value_len = 32 * 1024 * 1024 });
        if (i < 3) {
            const namespace = if (i == 0) "current" else if (i == 1) "frozen" else "compatibility";
            const schemas = if (i == 2) doc.value else get(get(doc.value, "components").?, "schemas").?;
            var sit = schemas.object.iterator();
            while (sit.next()) |entry| {
                const path = try std.fmt.allocPrint(a, "#/components/schemas/{s}", .{entry.key_ptr.*});
                if (i != 2) try typing.typing(namespace, path, entry.value_ptr.*, 0) else {
                    if (get(entry.value_ptr.*, "Fields")) |fields| if (fields == .array) for (fields.array.items) |field| try typing.compatibilityTyping(try std.fmt.allocPrint(a, "{s}/fields/{s}", .{ path, get(field, "Name").?.string }), get(field, "Type").?);
                    if (get(entry.value_ptr.*, "Variants")) |variants| if (variants == .array) for (variants.array.items, 0..) |variant, j| try typing.compatibilityTyping(try std.fmt.allocPrint(a, "{s}/variants/{d}", .{ path, j }), variant);
                    if (get(entry.value_ptr.*, "Type")) |alias| try typing.compatibilityTyping(try std.fmt.allocPrint(a, "{s}/alias", .{path}), alias);
                }
                if (i != 0 or sit.index != 1) try manifest.add(",\n");
                try manifest.add("{\"namespace\":");
                try manifest.quote(namespace);
                try manifest.add(",\"schema\":");
                try manifest.quote(entry.key_ptr.*);
                try manifest.add(",\"api\":");
                try manifest.quote(try std.fmt.allocPrint(a, "torn.{s}.{s}", .{ namespace, entry.key_ptr.* }));
                try manifest.add(",\"source\":");
                try manifest.quote(input);
                try manifest.add(",\"evidence\":");
                try manifest.quote(if (i == 2) "maintained compatibility contract" else "official OpenAPI snapshot");
                try manifest.add("}");
            }
        } else {
            try manifest.add("\n],\n\"operations\":[\n");
            var pit = get(doc.value, "paths").?.object.iterator();
            var first = true;
            while (pit.next()) |entry| {
                const op = get(entry.value_ptr.*, "get") orelse continue;
                if (!first) try manifest.add(",\n");
                first = false;
                const name = get(op, "operationId").?.string;
                try manifest.add("{\"operation\":");
                try manifest.quote(name);
                try manifest.add(",\"path\":");
                try manifest.quote(entry.key_ptr.*);
                try manifest.add(",\"api\":");
                try manifest.quote(try std.fmt.allocPrint(a, "torn.operations.{s}", .{name}));
                try manifest.add(",\"params\":");
                try manifest.quote(try std.fmt.allocPrint(a, "torn.operations.{s}.Params", .{name}));
                try manifest.add(",\"result\":");
                try manifest.quote(try std.fmt.allocPrint(a, "torn.operations.{s}.Response", .{name}));
                const content = get(get(get(op, "responses").?, "200").?, "content").?;
                try manifest.add(",\"media_type\":");
                try manifest.quote(if (get(content, "application/json") != null) "application/json" else "text/csv");
                try manifest.add("}");
            }
            try manifest.add("\n]\n}\n");
        }
        const document_path = if (i == 0) "current-contract.json" else "frozen-contract.json";
        var g: Gen = .{ .a = a, .source_path = document_path };
        if (i == 2) try g.compatibility(doc.value) else if (i == 3) try g.operations(doc.value) else try g.official(doc.value);
        if (i < 2) {
            const target = try std.fmt.allocPrint(a, "src/generated/{s}", .{document_path});
            if (check) {
                const existing = try cwd.readFileAlloc(io, target, a, .limited(32 * 1024 * 1024));
                if (!std.mem.eql(u8, existing, bytes)) return error.GeneratedFilesStale;
            } else try cwd.writeFile(io, .{ .sub_path = target, .data = bytes });
        }
        const tree = try std.zig.Ast.parse(a, try a.dupeSentinel(u8, g.out.items, 0), .{});
        if (tree.errors.len != 0) return error.InvalidGeneratedSyntax;
        const formatted = try tree.renderAlloc(a);
        if (check) {
            const existing = try cwd.readFileAlloc(io, output, a, .limited(64 * 1024 * 1024));
            if (!std.mem.eql(u8, existing, formatted)) return error.GeneratedFilesStale;
        } else try cwd.writeFile(io, .{ .sub_path = output, .data = formatted });
    }
    const manifest_path = "docs/model-coverage.json";
    if (check) {
        const existing = try cwd.readFileAlloc(io, manifest_path, a, .limited(16 * 1024 * 1024));
        if (!std.mem.eql(u8, existing, manifest.out.items)) return error.GeneratedFilesStale;
    } else try cwd.writeFile(io, .{ .sub_path = manifest_path, .data = manifest.out.items });
    try typing.add("\n],\n\"location_count\":");
    try typing.fmt("{d}\n}}\n", .{typing.raw_count});
    const typing_path = "docs/typing-report.json";
    if (check) {
        const existing = try cwd.readFileAlloc(io, typing_path, a, .limited(16 * 1024 * 1024));
        if (!std.mem.eql(u8, existing, typing.out.items)) return error.GeneratedFilesStale;
    } else try cwd.writeFile(io, .{ .sub_path = typing_path, .data = typing.out.items });
}
