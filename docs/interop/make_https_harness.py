from pathlib import Path
import hashlib,json
p=Path('work/Torn-Zig-SDK/src/transport.zig')
src=p.read_text()
needle='try client.ca_bundle.rescan(allocator, io, now);'
assert src.count(needle)==2
patched=src.replace(needle,needle+'\n    try client.ca_bundle.addCertsFromFilePath(allocator, io, now, .cwd(), "work/proxy-ca.pem");')
patched+='''
pub fn main(init: std.process.Init) !void {
    const a = init.arena.allocator();
    const endpoint_bytes = try std.Io.Dir.cwd().readFileAlloc(init.io, "work/proxy-endpoints.json", a, .limited(4096));
    const endpoint = try std.json.parseFromSliceLeaky(struct { target: []const u8, proxy: []const u8 }, a, endpoint_bytes, .{});
    var response = try nativeSend(null, init.gpa, init.io, .{ .url = endpoint.target, .proxy_url = endpoint.proxy, .api_key = "fixture-only-auth" });
    defer response.deinit();
    if (response.status != 200 or !std.mem.eql(u8, response.body, "{\\"verified\\":\\"nested-target-tls\\"}")) return error.InvalidNestedTlsResponse;
    var plain = try nativeSend(null, init.gpa, init.io, .{ .url = "http://origin.invalid/verify", .proxy_url = endpoint.proxy, .api_key = "fixture-only-auth" });
    defer plain.deinit();
    if (plain.status != 200 or !std.mem.eql(u8, plain.body, "{\\"verified\\":\\"http\\"}")) return error.InvalidHttpOriginResponse;
    try std.Io.Dir.cwd().writeFile(init.io, .{ .sub_path = "work/https-proxy-result.json", .data = "{\\"nested_tls_http_status\\":200,\\"http_origin_http_status\\":200,\\"proxy_auth_checked\\":true,\\"origin_auth_absent_from_connect\\":true,\\"target_auth_checked\\":true,\\"fixture_ca_injected_in_test_copy_only\\":true,\\"system_trust_modified\\":false}\\n" });
}
'''
Path('work/https_proxy_harness.zig').write_text(patched,encoding='utf-8')
Path('work/https-proxy-harness-provenance.json').write_text(json.dumps(dict(production_source='src/transport.zig',production_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),test_copy_sha256=hashlib.sha256(patched.encode()).hexdigest(),modification='Append fixture CA to existing system bundle after the two rescan calls; append a main function making both HTTPS and HTTP origin requests through local HTTPS proxy.'),indent=2)+'\n')
