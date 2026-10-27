//! Offline certificate checks with public, pinned certificate data only.
const std = @import("std");
const torn = @import("torn");
const self_signed_pem = @embedFile("fixtures/tls/badssl-self-signed.pem");
const expired_pem = @embedFile("fixtures/tls/badssl-expired.pem");

test "public TLS fixture hashes match the pinned source bytes" {
    const fixtures = .{
        .{ self_signed_pem, "990c242d02a15d5a384d2625b4c1942e861ba5f18eaebd58116b85fbb5b49096" },
        .{ expired_pem, "c194779d77a90a4ad104d049cffd7a05656326c3cb2ddeb6fce7103082d67156" },
        .{ @embedFile("fixtures/tls/LICENSE.badssl"), "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30" },
    };
    inline for (fixtures) |fixture| {
        var digest: [32]u8 = undefined;
        std.crypto.hash.sha2.Sha256.hash(fixture[0], &digest, .{});
        var expected: [32]u8 = undefined;
        _ = try std.fmt.hexToBytes(&expected, fixture[1]);
        try std.testing.expectEqualSlices(u8, &expected, &digest);
    }
}

fn certificate(arena: std.mem.Allocator, pem: []const u8, index: usize) ![]const u8 {
    const begin = "-----BEGIN CERTIFICATE-----";
    const end = "-----END CERTIFICATE-----";
    var remaining = pem;
    var nth: usize = 0;
    while (true) : (nth += 1) {
        const at = (std.mem.indexOf(u8, remaining, begin) orelse return error.CertificateMissing) + begin.len;
        const stop = std.mem.indexOfPos(u8, remaining, at, end) orelse return error.CertificateMissing;
        if (nth == index) {
            const encoded = remaining[at..stop];
            const decoder = std.base64.standard.decoderWithIgnore(" \t\r\n");
            const bytes = try arena.alloc(u8, decoder.calcSizeUpperBound(encoded.len));
            return bytes[0..try decoder.decode(bytes, encoded)];
        }
        remaining = remaining[stop + end.len ..];
    }
}

fn parsed(bytes: []const u8) !std.crypto.Certificate.Parsed {
    return (std.crypto.Certificate{ .buffer = bytes, .index = 0 }).parse();
}

test "public certificate signatures validity hostname and untrusted root are checked" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    const self_signed = try parsed(try certificate(a, self_signed_pem, 0));
    // Independently recorded validity is 2016-08-08 through 2018-08-08.
    try self_signed.verify(self_signed, 1_483_228_800); // 2017-01-01 UTC
    try self_signed.verifyHostName("badssl.com");
    try self_signed.verifyHostName("fixture.badssl.com");
    try std.testing.expectError(error.CertificateHostMismatch, self_signed.verifyHostName("example.invalid"));
    try std.testing.expectError(error.CertificateExpired, self_signed.verify(self_signed, 1_577_836_800)); // 2020-01-01
    try std.testing.expectError(error.CertificateNotYetValid, self_signed.verify(self_signed, 1_451_606_400)); // 2016-01-01
    const no_trust: std.crypto.Certificate.Bundle = .empty;
    try std.testing.expectError(error.CertificateIssuerNotFound, no_trust.verify(self_signed, 1_483_228_800));
    const expired = try parsed(try certificate(a, expired_pem, 0));
    const issuer = try parsed(try certificate(a, expired_pem, 1));
    // The leaf's independently recorded validity is 2015-04-09..2015-04-12.
    try expired.verify(issuer, 1_428_624_000); // 2015-04-10 UTC
    try std.testing.expectError(error.CertificateExpired, expired.verify(issuer, 1_483_228_800));
}

const CertificatePeer = struct {
    listener: std.Io.net.Server,
    der: []const u8,

    fn serve(self: *CertificatePeer, io: std.Io) !void {
        const stream = try self.listener.accept(io);
        defer stream.close(io);
        var input: [32768]u8 = undefined;
        var reader = stream.reader(io, &input);
        const record = try reader.interface.take(5);
        try std.testing.expectEqual(@as(u8, 0x16), record[0]);
        const length = std.mem.readInt(u16, record[3..5], .big);
        const hello = try reader.interface.take(length);
        try std.testing.expect(std.mem.indexOf(u8, hello, "fixture-only-auth") == null);
        var output: [32768]u8 = undefined;
        var writer = stream.writer(io, &output);
        // A minimal TLS 1.2 ServerHello selects the offered RSA/ECDHE cipher.
        const random: [32]u8 = @splat(0x42);
        const server_hello = [_]u8{ 0x03, 0x03 } ++ random ++ [_]u8{ 0, 0xC0, 0x2F, 0 };
        try writeRecord(&writer.interface, 2, &server_hello);
        var payload: std.Io.Writer.Allocating = .init(std.testing.allocator);
        defer payload.deinit();
        try payload.writer.writeInt(u24, @intCast(self.der.len + 3), .big);
        try payload.writer.writeInt(u24, @intCast(self.der.len), .big);
        try payload.writer.writeAll(self.der);
        try writeRecord(&writer.interface, 11, payload.written());
        try writer.interface.flush();
    }

    fn writeRecord(writer: *std.Io.Writer, handshake_type: u8, body: []const u8) !void {
        try writer.writeByte(0x16);
        try writer.writeInt(u16, 0x0303, .big);
        try writer.writeInt(u16, @intCast(body.len + 4), .big);
        try writer.writeByte(handshake_type);
        try writer.writeInt(u24, @intCast(body.len), .big);
        try writer.writeAll(body);
    }

    fn init(der: []const u8) !CertificatePeer {
        const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", 0);
        return .{ .listener = try address.listen(std.testing.io, .{}), .der = der };
    }
};

fn handshake(peer: *CertificatePeer, host: []const u8, now_seconds: i64, trust: *std.crypto.Certificate.Bundle) !void {
    const io = std.testing.io;
    const address = try std.Io.net.IpAddress.parseIp4("127.0.0.1", peer.listener.socket.address.getPort());
    const stream = try address.connect(io, .{ .mode = .stream });
    defer stream.close(io);
    var input: [std.crypto.tls.Client.min_buffer_len]u8 = undefined;
    var output: [std.crypto.tls.Client.min_buffer_len]u8 = undefined;
    var plain_input: [std.crypto.tls.Client.min_buffer_len + 8192]u8 = undefined;
    var plain_output: [std.crypto.tls.Client.min_buffer_len]u8 = undefined;
    var reader = stream.reader(io, &input);
    var writer = stream.writer(io, &output);
    var entropy: [std.crypto.tls.Client.Options.entropy_len]u8 = undefined;
    io.random(&entropy);
    var lock: std.Io.RwLock = .init;
    _ = try std.crypto.tls.Client.init(&reader.interface, &writer.interface, .{
        .host = .{ .explicit = host },
        .ca = .{ .bundle = .{ .gpa = std.testing.allocator, .io = io, .lock = &lock, .bundle = trust } },
        .read_buffer = &plain_input,
        .write_buffer = &plain_output,
        .entropy = &entropy,
        .realtime_now = .fromNanoseconds(@as(i96, now_seconds) * std.time.ns_per_s),
    });
}

test "native TLS handshake rejects certificate hostname mismatch" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const der = try certificate(arena.allocator(), self_signed_pem, 0);
    var peer = try CertificatePeer.init(der);
    defer peer.listener.deinit(std.testing.io);
    var server = try std.testing.io.concurrent(CertificatePeer.serve, .{ &peer, std.testing.io });
    defer server.cancel(std.testing.io) catch {};
    var trust: std.crypto.Certificate.Bundle = .empty;
    defer trust.deinit(std.testing.allocator);
    try std.testing.expectError(error.CertificateHostMismatch, handshake(&peer, "example.invalid", 1_483_228_800, &trust));
    try server.await(std.testing.io);
}

test "native TLS handshake rejects an expired trusted certificate" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const der = try certificate(arena.allocator(), self_signed_pem, 0);
    var trust: std.crypto.Certificate.Bundle = .empty;
    defer trust.deinit(std.testing.allocator);
    try trust.bytes.appendSlice(std.testing.allocator, der);
    try trust.parseCert(std.testing.allocator, 0, 1_483_228_800);
    var peer = try CertificatePeer.init(der);
    defer peer.listener.deinit(std.testing.io);
    var server = try std.testing.io.concurrent(CertificatePeer.serve, .{ &peer, std.testing.io });
    defer server.cancel(std.testing.io) catch {};
    try std.testing.expectError(error.CertificateExpired, handshake(&peer, "badssl.com", 1_577_836_800, &trust));
    try server.await(std.testing.io);
}

test "SDK native transport rejects a local certificate before origin authentication" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const der = try certificate(arena.allocator(), self_signed_pem, 0);
    var peer = try CertificatePeer.init(der);
    defer peer.listener.deinit(std.testing.io);
    var server = try std.testing.io.concurrent(CertificatePeer.serve, .{ &peer, std.testing.io });
    defer server.cancel(std.testing.io) catch {};
    const url = try std.fmt.allocPrint(arena.allocator(), "https://127.0.0.1:{d}/", .{peer.listener.socket.address.getPort()});
    try std.testing.expectError(error.TlsInitializationFailed, torn.transport.nativeSend(null, std.testing.allocator, std.testing.io, .{
        .url = url,
        .api_key = "fixture-only-auth",
    }));
    try server.await(std.testing.io);
}

test "HTTPS proxy certificate is verified before CONNECT or proxy authentication" {
    inline for (.{ "http://origin.invalid/user", "https://origin.invalid/user" }) |origin| {
        var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
        defer arena.deinit();
        const der = try certificate(arena.allocator(), self_signed_pem, 0);
        var peer = try CertificatePeer.init(der);
        defer peer.listener.deinit(std.testing.io);
        var server = try std.testing.io.concurrent(CertificatePeer.serve, .{ &peer, std.testing.io });
        defer server.cancel(std.testing.io) catch {};
        const proxy_url = try std.fmt.allocPrint(arena.allocator(), "https://fixture-only-auth:password@127.0.0.1:{d}", .{peer.listener.socket.address.getPort()});
        try std.testing.expectError(error.TlsInitializationFailed, torn.transport.nativeSend(null, std.testing.allocator, std.testing.io, .{
            .url = origin,
            .api_key = "fixture-only-auth",
            .proxy_url = proxy_url,
        }));
        try server.await(std.testing.io);
    }
}
