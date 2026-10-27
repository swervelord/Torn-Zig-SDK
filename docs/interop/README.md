# Optional local HTTPS-proxy interoperability verification

This evidence fixture is separate from the SDK runtime, Zig-native generators,
ordinary tests and CI. Reproduction requires Go and Python 3 in addition to the
pinned Zig compiler. It makes no external network requests and needs no API key.

From a scratch workspace containing the checkout at `work/Torn-Zig-SDK`, run:

```powershell
python work/Torn-Zig-SDK/docs/interop/make_https_harness.py
go run work/Torn-Zig-SDK/docs/interop/https_proxy_peer.go
```

The Go peer writes a public ephemeral fixture CA and loopback endpoints into
`work/`, then serves for up to four minutes. In a second terminal in that same
scratch workspace:

```powershell
zig run work/https_proxy_harness.zig -O safe
```

Read `work/https-proxy-result.json`. The test requires successful separately
verified target TLS through HTTPS CONNECT and a successful plain HTTP origin
through an HTTPS proxy. The peer checks proxy authorization, absence of the
origin credential in CONNECT, and target authorization. Private fixture keys
exist only in the peer's memory. Credentials are fixed synthetic strings.

The harness generator copies production `src/transport.zig`, appends the local
fixture CA immediately after the two normal system-root initialization calls,
and appends a main function. It does not disable certificate/hostname checks or
change production sources/system trust. Its provenance JSON records the exact
production and derived source hashes and the precise modification. The recorded
successful run is `../https-proxy-verification.json`; its peer source hash is
also recorded. This is controlled interoperability evidence with injected fixture
trust, rather than a public HTTPS-proxy service test using only system roots.
