# Verification scope

Ordinary checks are offline and require no private key. Inventory completeness
is distinct from branch coverage and from all possible live game states.

| Audited surface | Inventory and verification |
| --- | --- |
| Official operations | 237; all invoked with independently checked paths, parameters and responses |
| Current schemas | 724; 7,461 concrete acceptance/typed-roundtrip samples |
| Frozen schemas | 711; 7,419 concrete acceptance/typed-roundtrip samples |
| Compatibility declarations | 549; 76 handwritten scenarios plus focused regressions |
| Selection capabilities | 208 |
| Typed helpers/aliases | 210; all invoked with concrete value checks |
| Raw JSON helpers | 205; all invoked through checked transports |
| Dedicated CSV channels | 3; individually checked and mixed with JSON |
| Explicit v1 entries | 184; all exercised at the transport boundary |
| Compatible pair cases | 3,195; each checks exactly one actual send |
| Complete routing groups | 41 resource/semantic-domain groups; each checks one send |

The model sample producer is independently authored from official contracts. It
never uses production output to manufacture golden expectations. Three variants
per component are extended with root union alternatives and every literal value
of the 86 named enum schemas. Concrete serialization is compared with independently
constructed expected values. Singleton schemas cannot have three distinct valid
values. Nested branch combinations and live states are not exhaustive. See
[model contracts](model-contracts.md), [routing audit](routing-audit.md), and the
machine-readable coverage and typing reports.

All public model layouts, decoders, serializers, endpoint builders and helpers
receive explicit semantic instantiation checks. Compile-fail cases reject mixed
resources, empty batches, wrong/missing parameters and invalid closed enums.
Native tests cover retries, quotas, spillover, concurrency fairness, cancellation,
deadlines, bounded/chunked/truncated bodies, redirects, authenticated HTTP proxies
and target TLS after CONNECT. Allocation-failure sweeps cover plans, configuration,
execution and typed decoding, including retained partial successes. Diagnostics
retain inline JSON-pointer paths without escaping borrowed checkpoint contexts.

Five offline public-certificate fixture tests check signatures, validity windows,
untrusted roots, hostnames and native rejection of expired/mismatched local TLS
peers before authentication. Pinned fixtures and notices are in
`tests/fixtures/tls/`; no private keys are included. An explicit network check
completed verified HTTPS to the public specification through a local Zig CONNECT
proxy; `docs/proxy-verification.json` records its result.

The opt-in live check passed on October 30, 2026 against API 6.15.0: concrete profile,
job and travel inventory responses decoded from one batched generic call after exactly
one real HTTP send, with retries, split recovery and legacy fallback disabled. No
account response or credential was persisted. The executable reads only
`TORN_LIVE_TEST_API_KEY`, which needs at least limited access for `travelinventory`,
and prints a result without account data.

The bounded campaign uses fresh OS entropy for 100,000 iterations: 200,000 exact
numeric checks and 100,000 each of encoding, union, merge and JSON properties.
Selected-branch access and exact numeric/raw retention are checked. Measured
evidence is in `docs/fuzz-evidence.json`. This is randomized property testing,
not a claim of coverage-guided fuzzing or race freedom.

CI runs pinned Zig natively on Linux, Windows and macOS, with Debug and ReleaseSafe
(`debug`/`safe`) tests. Runnable batching and numeric/ownership/error consumers
also execute with safety disabled (`fast`/`small`). Exported consumer functions
force meaningful additional-architecture object compilation; cross-compilation
is distinguished from native execution. Fresh consumers install the public
archive with content hashes and an empty package cache.

Windows ThreadSanitizer is unavailable in this pinned distribution, confirmed by
actual compiler diagnostics. Linux TSAN compilation succeeds and native CI runs
the instrumented runtime tests; execution is evidence only when that step passes.
Ordinary tests do not prove race freedom. Client shutdown requires cancellation
and joining callers first. HTTP and HTTPS proxies support verified HTTPS CONNECT.
The nested TLS flush adapter has focused unit coverage. A controlled local
HTTPS-proxy test passed both HTTP and HTTPS origins using a test-only injected
fixture CA, with certificate verification enabled and no system trust change.
See `https-proxy-verification.json` and the optional `interop/` reproduction fixture
for its exact scope.

The v1 catalog is maintained routing coverage with explicitly limited historical
response evidence. It is not a complete authoritative v1 payload specification.
