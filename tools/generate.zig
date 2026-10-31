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
    /// Original (pre-override) schema retained as strict-validation metadata for the next struct.
    pending_original: ?V = null,
    /// Properties relaxed by spec/shared/spec-overrides.json for the next struct (P1.2).
    pending_relaxed: []const []const u8 = &.{},
    /// Parsed `overrides` array of spec/shared/spec-overrides.json; current contract only.
    overrides: ?V = null,
    applied_overrides: std.ArrayList([]const u8) = .empty,
    /// Parsed `operations` object of spec/shared/access-levels.json (P6.1).
    access_levels: ?V = null,
    source_sha256: []const u8 = "",
    fn overrideKey(g: *Gen, entry: V) ![]const u8 {
        return std.fmt.allocPrint(g.a, "{s}/{s}", .{ get(entry, "schema").?.string, get(entry, "property").?.string });
    }
    fn applied(g: *Gen, entry: V) bool {
        const key = g.overrideKey(entry) catch return false;
        for (g.applied_overrides.items) |done| if (std.mem.eql(u8, done, key)) return true;
        return false;
    }
    /// Applies spec/shared/spec-overrides.json entries for one schema (P1.2). The
    /// official schema stays available as strict metadata through pending_original.
    fn applyOverrides(g: *Gen, name: []const u8, v: V) !?V {
        const list = g.overrides orelse return null;
        var copy: ?std.json.ObjectMap = null;
        var relaxed: std.ArrayList([]const u8) = .empty;
        for (list.array.items) |entry| {
            if (!std.mem.eql(u8, get(entry, "schema").?.string, name)) continue;
            const property = get(entry, "property").?.string;
            const change = get(entry, "change").?.string;
            if (copy == null) copy = try v.object.clone(g.a);
            const object = &copy.?;
            var props: std.json.ObjectMap = if (object.get("properties")) |p| try p.object.clone(g.a) else .{};
            if (std.mem.eql(u8, change, "optional")) {
                const required = object.get("required") orelse return error.InvalidSpecOverride;
                var kept = std.array_list.Managed(V).init(g.a);
                var found = false;
                for (required.array.items) |item| {
                    if (std.mem.eql(u8, item.string, property)) found = true else try kept.append(item);
                }
                if (!found) return error.InvalidSpecOverride;
                try object.put(g.a, "required", .{ .array = kept });
                // A required property without a value schema stays a raw value, now optional.
                if (!props.contains(property)) try props.put(g.a, property, .{ .object = .{} });
            } else if (std.mem.eql(u8, change, "nullable")) {
                const prior = props.get(property) orelse return error.InvalidSpecOverride;
                var alternatives = std.array_list.Managed(V).init(g.a);
                try alternatives.append(prior);
                var null_schema: std.json.ObjectMap = .{};
                try null_schema.put(g.a, "type", .{ .string = "null" });
                try alternatives.append(.{ .object = null_schema });
                var wrapped: std.json.ObjectMap = .{};
                try wrapped.put(g.a, "oneOf", .{ .array = alternatives });
                try props.put(g.a, property, .{ .object = wrapped });
            } else return error.UnsupportedSpecOverride;
            try object.put(g.a, "properties", .{ .object = props });
            try relaxed.append(g.a, property);
            try g.applied_overrides.append(g.a, try g.overrideKey(entry));
        }
        if (copy == null) return null;
        g.pending_original = v;
        g.pending_relaxed = relaxed.items;
        return .{ .object = copy.? };
    }
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
            // Open enums decode values added upstream after generation (P1.1).
            try g.add("model.Open(enum { ");
            for (en.array.items) |item| {
                const name = try scalarName(g.a, item);
                try g.ident(name);
                try g.add(", ");
            }
            if (en.array.items[0] != .string) try g.add("pub const json_numeric = true; ");
            try g.add("})");
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
            const tags = try branchTags(g.a, alts.array.items);
            for (alts.array.items, tags) |part, tag| {
                try g.ident(tag);
                try g.add(": ");
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
            const original = g.pending_original orelse v;
            const relaxed = g.pending_relaxed;
            g.pending_original = null;
            g.pending_relaxed = &.{};
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
            // It is the official (pre-override) contract, so strict mode reports relaxed fields.
            try g.add("pub const json_schema = ");
            try g.quote(try std.json.Stringify.valueAlloc(g.a, original, .{}));
            try g.add(";\n");
            if (relaxed.len > 0) {
                try g.add("pub const relaxed_fields = .{ ");
                for (relaxed) |name| {
                    try g.quote(name);
                    try g.add(", ");
                }
                try g.add("};\n");
            }
            try g.add("}");
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
        const info = get(doc, "info").?;
        try g.add("/// OpenAPI `info.version` of the embedded contract.\npub const spec_version = ");
        try g.quote(get(info, "version").?.string);
        try g.add(";\n");
        if (g.source_sha256.len > 0) {
            try g.add("/// SHA-256 of the embedded contract bytes.\npub const spec_sha256 = ");
            try g.quote(g.source_sha256);
            try g.add(";\n");
        }
        const schemas = get(get(doc, "components").?, "schemas").?;
        var it = schemas.object.iterator();
        while (it.next()) |kv| {
            try g.add("pub const ");
            try g.ident(kv.key_ptr.*);
            try g.add(" = ");
            const relaxed = try g.applyOverrides(kv.key_ptr.*, kv.value_ptr.*);
            if (relaxed) |schema_value| {
                try g.schema(schema_value, 0);
            } else try g.schema(kv.value_ptr.*, 0);
            g.pending_original = null;
            g.pending_relaxed = &.{};
            try g.add(";\n");
        }
        if (g.overrides) |list| for (list.array.items) |entry| {
            if (!g.applied(entry)) return error.UnappliedSpecOverride;
        };
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
                const variants = get(v, "Variants").?.array.items;
                const tags = try compatTags(g.a, variants);
                for (variants, tags) |t, tag| {
                    try g.ident(tag);
                    try g.add(": ");
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
        try g.add("// Generated exact operation contracts.\nconst model = @import(\"../model.zig\");\nconst current = @import(\"current.zig\");\nconst shared = @import(\"shared.zig\");\n");
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
            try g.add(";\npub const stability = ");
            if (get(op, "x-stability")) |stability| try g.quote(stability.string) else try g.quote("Unknown");
            try g.add(";\n/// Parsed from the operation description (\"Cached selection (N minutes\" / \"cached for N hour\").\npub const upstream_cache_ttl_seconds: ?u32 = ");
            if (cacheTtlSeconds(get(op, "description"))) |ttl| try g.fmt("{d}", .{ttl}) else try g.add("null");
            try g.add(";\n/// Minimum key access level from spec/shared/access-levels.json (P6.1).\npub const access_level: shared.AccessLevel = .");
            const levels = g.access_levels orelse return error.MissingAccessLevels;
            const level = get(get(levels, name) orelse return error.MissingAccessLevel, "access") orelse return error.MissingAccessLevel;
            try g.ident(level.string);
            try g.add(";\n/// True when the response carries `_metadata.links` (P7.1 pager support).\npub const paginated = ");
            try g.add(if (g.paginatedResponse(op)) "true" else "false");
            try g.add(";\n/// Resolved parameter contracts (without `key`) for allocation-light validation.\npub const parameters_json = ");
            try g.quote(try g.resolvedParameters(op));
            try g.add(";\npub const method = \"GET\";\npub const Params = @This().Parameters;\n/// The API key is never a parameter: the runtime sends it as a header (P2.1).\npub const Parameters = struct {\n");
            if (get(op, "parameters")) |ps| for (ps.array.items) |raw| {
                var p = raw;
                if (get(p, "$ref")) |r| {
                    const slash = std.mem.lastIndexOfScalar(u8, r.string, '/').?;
                    p = get(get(get(doc, "components").?, "parameters").?, r.string[slash + 1 ..]).?;
                }
                const pn = get(p, "name").?.string;
                if (std.mem.eql(u8, pn, "key")) continue;
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
    fn component(g: *Gen, section: []const u8, reference: []const u8) ?V {
        const slash = std.mem.lastIndexOfScalar(u8, reference, '/') orelse return null;
        return get(get(get(g.document, "components") orelse return null, section) orelse return null, reference[slash + 1 ..]);
    }
    fn paginatedResponse(g: *Gen, op: V) bool {
        const content = get(get(get(op, "responses").?, "200").?, "content").?;
        var schema_value = get(get(content, "application/json") orelse return false, "schema") orelse return false;
        if (get(schema_value, "$ref")) |r| schema_value = g.component("schemas", r.string) orelse return false;
        var parts: [16]V = undefined;
        var count: usize = 0;
        parts[count] = schema_value;
        count += 1;
        if (get(schema_value, "allOf")) |all| for (all.array.items) |part| if (count < parts.len) {
            parts[count] = if (get(part, "$ref")) |r| g.component("schemas", r.string) orelse part else part;
            count += 1;
        };
        for (parts[0..count]) |part| {
            const metadata = get(get(part, "properties") orelse continue, "_metadata") orelse continue;
            const reference = get(metadata, "$ref") orelse continue;
            if (std.mem.indexOf(u8, reference.string, "RequestMetadataWithLinks") != null) return true;
        }
        return false;
    }
    /// Inlines component references so parameter validation needs no full document.
    fn inlineReferences(g: *Gen, v: V, depth: usize) anyerror!V {
        if (depth > 32) return error.SchemaDepth;
        switch (v) {
            .object => |object| {
                if (object.get("$ref")) |r| return g.inlineReferences(g.component("schemas", r.string) orelse return error.InvalidReference, depth + 1);
                var out: std.json.ObjectMap = .{};
                var it = object.iterator();
                while (it.next()) |entry| {
                    if (std.mem.eql(u8, entry.key_ptr.*, "description")) continue;
                    try out.put(g.a, entry.key_ptr.*, try g.inlineReferences(entry.value_ptr.*, depth + 1));
                }
                return .{ .object = out };
            },
            .array => |array| {
                var out = std.array_list.Managed(V).init(g.a);
                for (array.items) |item| try out.append(try g.inlineReferences(item, depth + 1));
                return .{ .array = out };
            },
            else => return v,
        }
    }
    fn resolvedParameters(g: *Gen, op: V) ![]const u8 {
        var list = std.array_list.Managed(V).init(g.a);
        if (get(op, "parameters")) |ps| for (ps.array.items) |raw| {
            var p = raw;
            if (get(p, "$ref")) |r| p = g.component("parameters", r.string).?;
            if (std.mem.eql(u8, get(p, "name").?.string, "key")) continue;
            var entry: std.json.ObjectMap = .{};
            try entry.put(g.a, "name", get(p, "name").?);
            try entry.put(g.a, "in", get(p, "in").?);
            try entry.put(g.a, "required", .{ .bool = if (get(p, "required")) |r| r.bool else false });
            try entry.put(g.a, "schema", try g.inlineReferences(get(p, "schema").?, 0));
            try list.append(.{ .object = entry });
        };
        return std.json.Stringify.valueAlloc(g.a, V{ .array = list }, .{});
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
/// "Cached selection (15 minutes per category)" / "cached for 1 hour". Global caches
/// without a stated duration have no TTL.
fn cacheTtlSeconds(description: ?V) ?u32 {
    const text = if (description) |d| (if (d == .string) d.string else return null) else return null;
    var at: usize = 0;
    while (std.ascii.findIgnoreCasePos(text, at, "cache")) |found| : (at = found + 5) {
        var i = found;
        while (i < text.len and i < found + 32 and !std.ascii.isDigit(text[i])) : (i += 1) {}
        const start = i;
        while (i < text.len and std.ascii.isDigit(text[i])) : (i += 1) {}
        if (start == i) continue;
        const amount = std.fmt.parseInt(u32, text[start..i], 10) catch continue;
        const unit = std.mem.trimStart(u8, text[i..], " ");
        if (std.ascii.startsWithIgnoreCase(unit, "minute")) return amount * 60;
        if (std.ascii.startsWithIgnoreCase(unit, "hour")) return amount * 3600;
        if (std.ascii.startsWithIgnoreCase(unit, "second")) return amount;
    }
    return null;
}
/// Splits CamelCase schema names into words ("UserJobPosition" -> User, Job, Position).
fn camelWords(a: A, name: []const u8) ![]const []const u8 {
    var words: std.ArrayList([]const u8) = .empty;
    var start: usize = 0;
    for (name, 0..) |c, i| {
        if (i == 0) continue;
        const prev = name[i - 1];
        const boundary = (std.ascii.isUpper(c) and (std.ascii.isLower(prev) or std.ascii.isDigit(prev))) or
            (std.ascii.isUpper(c) and std.ascii.isUpper(prev) and i + 1 < name.len and std.ascii.isLower(name[i + 1])) or
            c == '_' or prev == '_';
        if (boundary) {
            const word = std.mem.trim(u8, name[start..i], "_");
            if (word.len > 0) try words.append(a, word);
            start = i;
        }
    }
    const last = std.mem.trim(u8, name[start..], "_");
    if (last.len > 0) try words.append(a, last);
    return words.items;
}
fn snake(a: A, words: []const []const u8) ![]const u8 {
    var out: std.ArrayList(u8) = .empty;
    for (words, 0..) |word, i| {
        if (i > 0) try out.append(a, '_');
        for (word) |c| try out.append(a, std.ascii.toLower(c));
    }
    return out.items;
}
const Tag = struct { words: ?[]const []const u8 = null, fixed: []const u8 = "", suffix: []const u8 = "" };
/// Descriptive union tags (replacing positional v0..vN): referenced schema names with
/// shared CamelCase prefix/suffix words removed, else the JSON kind of the branch.
fn finishTags(a: A, tags: []Tag) ![]const []const u8 {
    var named: usize = 0;
    for (tags) |t| if (t.words != null) {
        named += 1;
    };
    if (named >= 2) {
        var prefix: usize = std.math.maxInt(usize);
        var suffix: usize = std.math.maxInt(usize);
        var first: ?[]const []const u8 = null;
        for (tags) |t| if (t.words) |w| {
            if (first == null) {
                first = w;
                prefix = w.len - 1;
                suffix = w.len - 1;
                continue;
            }
            var p: usize = 0;
            while (p < @min(prefix, w.len - 1) and std.mem.eql(u8, first.?[p], w[p])) : (p += 1) {}
            prefix = p;
            var s: usize = 0;
            while (s < @min(suffix, w.len - 1) and std.mem.eql(u8, first.?[first.?.len - 1 - s], w[w.len - 1 - s])) : (s += 1) {}
            suffix = s;
        };
        for (tags) |*t| if (t.words) |w| {
            const p = @min(prefix, w.len - 1);
            const s = @min(suffix, w.len - p - 1);
            t.words = w[p .. w.len - s];
        };
    }
    const out = try a.alloc([]const u8, tags.len);
    for (tags, out, 0..) |t, *name, i| {
        var base = if (t.words) |w| try snake(a, w) else t.fixed;
        if (t.suffix.len > 0) base = try std.fmt.allocPrint(a, "{s}_{s}", .{ base, t.suffix });
        for (out[0..i]) |prior| if (std.mem.eql(u8, prior, base)) {
            base = try std.fmt.allocPrint(a, "{s}_{d}", .{ base, i });
            break;
        };
        name.* = if (base.len == 0) try std.fmt.allocPrint(a, "v{d}", .{i}) else base;
    }
    return out;
}
fn referenceWords(a: A, reference: []const u8) ![]const []const u8 {
    const slash = std.mem.lastIndexOfScalar(u8, reference, '/') orelse return error.InvalidReference;
    var words = try camelWords(a, reference[slash + 1 ..]);
    if (words.len > 1 and std.mem.eql(u8, words[words.len - 1], "Enum")) words = words[0 .. words.len - 1];
    return words;
}
fn branchTags(a: A, alternatives: []const V) ![]const []const u8 {
    const tags = try a.alloc(Tag, alternatives.len);
    for (alternatives, tags) |branch, *tag| {
        tag.* = .{};
        if (get(branch, "$ref")) |r| {
            tag.words = try referenceWords(a, r.string);
        } else if (get(branch, "enum") != null) {
            tag.fixed = "named";
        } else if (get(branch, "type")) |ty| {
            const kind = if (ty == .string) ty.string else "value";
            if (std.mem.eql(u8, kind, "array")) {
                if (get(get(branch, "items") orelse V.null, "$ref")) |r| {
                    tag.words = try referenceWords(a, r.string);
                    tag.suffix = "list";
                } else tag.fixed = "array";
            } else if (std.mem.eql(u8, kind, "string") and get(branch, "pattern") != null) {
                tag.fixed = "pattern";
            } else tag.fixed = kind;
        } else if (get(branch, "properties") != null) {
            tag.fixed = "object";
        } else tag.fixed = "value";
    }
    return finishTags(a, tags);
}
fn compatTags(a: A, variants: []const V) ![]const []const u8 {
    const tags = try a.alloc(Tag, variants.len);
    for (variants, tags) |variant, *tag| {
        tag.* = .{};
        var t = variant;
        while (true) {
            const n = get(t, "name").?.string;
            if (std.mem.eql(u8, n, "box") or std.mem.eql(u8, n, "optional")) {
                t = get(t, "arguments").?.array.items[0];
                continue;
            }
            const primitive = .{ "string", "bool", "int64", "uint64", "uint32", "float64", "float32", "raw", "exact_number", "null", "array", "map" };
            inline for (primitive) |p| if (std.mem.eql(u8, n, p)) {
                tag.fixed = p;
            };
            if (tag.fixed.len == 0) tag.words = try camelWords(a, n);
            break;
        }
    }
    return finishTags(a, tags);
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
    const inputs = .{ "spec/openapi-6.15.0.json", "spec/openapi-6.13.6.json", "spec/compatibility-models.json", "spec/openapi-6.15.0.json" };
    const outputs = .{ "src/generated/current.zig", "src/generated/frozen.zig", "src/generated/compatibility.zig", "src/generated/operations.zig" };
    // Vendored cross-SDK inputs (spec/shared, never edited in this repository).
    const shared_overrides = try std.json.parseFromSlice(V, a, try cwd.readFileAlloc(io, "spec/shared/spec-overrides.json", a, .limited(1024 * 1024)), .{});
    const shared_access = try std.json.parseFromSlice(V, a, try cwd.readFileAlloc(io, "spec/shared/access-levels.json", a, .limited(4 * 1024 * 1024)), .{});
    const shared_errors = try std.json.parseFromSlice(V, a, try cwd.readFileAlloc(io, "spec/shared/error-codes.json", a, .limited(4 * 1024 * 1024)), .{});
    try writeOutput(a, io, "src/generated/shared.zig", try sharedModule(a, shared_errors.value, shared_access.value), check);
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
        if (i == 0) {
            // Spec overrides relax only the current contract; frozen 6.13.6 stays historical.
            g.overrides = get(shared_overrides.value, "overrides") orelse return error.InvalidSpecOverrides;
            var digest: [32]u8 = undefined;
            std.crypto.hash.sha2.Sha256.hash(bytes, &digest, .{});
            g.source_sha256 = try std.fmt.allocPrint(a, "{x}", .{&digest});
        }
        if (i == 3) g.access_levels = get(shared_access.value, "operations") orelse return error.MissingAccessLevels;
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
fn writeOutput(a: A, io: std.Io, path: []const u8, source: []const u8, check: bool) !void {
    const tree = try std.zig.Ast.parse(a, try a.dupeSentinel(u8, source, 0), .{});
    if (tree.errors.len != 0) return error.InvalidGeneratedSyntax;
    const formatted = try tree.renderAlloc(a);
    const cwd = std.Io.Dir.cwd();
    if (check) {
        const existing = try cwd.readFileAlloc(io, path, a, .limited(16 * 1024 * 1024));
        if (!std.mem.eql(u8, existing, formatted)) return error.GeneratedFilesStale;
    } else try cwd.writeFile(io, .{ .sub_path = path, .data = formatted });
}
fn uniqueValues(a: A, codes: []const V, key: []const u8) ![]const []const u8 {
    var values: std.ArrayList([]const u8) = .empty;
    for (codes) |entry| {
        const value = get(entry, key).?.string;
        var seen = false;
        for (values.items) |v| if (std.mem.eql(u8, v, value)) {
            seen = true;
        };
        if (!seen) try values.append(a, value);
    }
    std.mem.sort([]const u8, values.items, {}, struct {
        fn less(_: void, x: []const u8, y: []const u8) bool {
            return std.mem.lessThan(u8, x, y);
        }
    }.less);
    return values.items;
}
/// Error-code policy (P4/P5) and access levels (P6) from the vendored spec/shared inputs.
fn sharedModule(a: A, errors: V, access: V) ![]const u8 {
    var g: Gen = .{ .a = a };
    try g.add("// Generated by tools/generate.zig from spec/shared/error-codes.json and\n// spec/shared/access-levels.json; do not edit.\n");
    try g.add("pub const shared_spec_version = ");
    try g.quote(get(errors, "spec_version").?.string);
    try g.add(";\n/// Key access levels in ascending order of privilege (`custom` is incomparable).\npub const AccessLevel = enum { ");
    for (get(access, "order").?.array.items) |level| {
        try g.ident(level.string);
        try g.add(", ");
    }
    try g.add("};\n");
    const codes = get(errors, "codes").?.array.items;
    inline for (.{ .{ "Category", "category" }, .{ "Action", "action" }, .{ "DisableKey", "disable_key" } }) |pair| {
        try g.add("pub const " ++ pair[0] ++ " = enum { ");
        for (try uniqueValues(a, codes, pair[1])) |value| {
            try g.ident(value);
            try g.add(", ");
        }
        try g.add("};\n");
    }
    try g.add("pub const CodeInfo = struct { code: u16, name: []const u8, snake: []const u8, schema: []const u8, message: []const u8, category: Category, action: Action, disable_key: DisableKey, retryable: bool };\n");
    try g.add("/// Torn API error codes. Non-exhaustive: codes added upstream stay representable.\npub const TornErrorCode = enum(u16) {\n");
    for (codes) |entry| {
        try g.ident(get(entry, "snake").?.string);
        try g.fmt(" = {d},\n", .{get(entry, "code").?.integer});
    }
    try g.add("_,\n};\npub const codes = [_]CodeInfo{\n");
    for (codes) |entry| {
        try g.fmt(".{{ .code = {d}, .name = ", .{get(entry, "code").?.integer});
        try g.quote(get(entry, "name").?.string);
        try g.add(", .snake = ");
        try g.quote(get(entry, "snake").?.string);
        try g.add(", .schema = ");
        try g.quote(get(entry, "schema").?.string);
        try g.add(", .message = ");
        try g.quote(get(entry, "message").?.string);
        inline for (.{ "category", "action", "disable_key" }) |key| {
            try g.add(", ." ++ key ++ " = .");
            try g.ident(get(entry, key).?.string);
        }
        try g.fmt(", .retryable = {} }},\n", .{get(entry, "retryable").?.bool});
    }
    try g.add("};\n");
    const retry = get(errors, "retry").?;
    try g.add("/// Retry defaults (P4.2) from error-codes.json `retry`.\npub const retry = struct {\n");
    inline for (.{ "max_attempts", "base_delay_ms", "max_delay_ms", "retry_after_cap_ms" }) |key| {
        try g.fmt("pub const " ++ key ++ ": u32 = {d};\n", .{get(retry, key).?.integer});
    }
    try g.fmt("pub const jitter_full = {};\n", .{std.mem.eql(u8, get(retry, "jitter").?.string, "full")});
    try g.fmt("pub const network_errors_retry = {};\n", .{std.mem.eql(u8, get(retry, "network_errors").?.string, "retry_backoff")});
    try g.add("pub const http_retry_statuses = [_]u16{ ");
    for (get(retry, "http_retry_statuses").?.array.items) |status| try g.fmt("{d}, ", .{status.integer});
    try g.add("};\n};\n");
    return g.out.items;
}
