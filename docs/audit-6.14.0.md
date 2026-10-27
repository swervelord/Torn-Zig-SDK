# API 6.14.0 feature and typing audit

Reviewed on October 27, 2026 against the official
[Torn OpenAPI contract](https://www.torn.com/swagger/openapi.json).
The pinned input's exact hash, version and counts are in `spec/provenance.json`.

## Contract coverage

| Surface | Zig coverage | Evidence |
| --- | --- | --- |
| Official exact operations | 236 / 236 | Generated operation inventory; every parameter builder and concrete response decoder instantiated and exercised against an independent contract oracle |
| Current component schemas | 719 / 719 | Concrete layouts and decoders; 7,444 acceptance/typed roundtrip samples |
| Selection capabilities | 207 / 207 | Independent official enum/path/response-membership routing oracle |
| Typed tokens including aliases | 209 | Every token invoked with concrete value assertions |
| JSON raw helpers | 204 | Every helper executed through checked mock transport |
| CSV channels | 3 | Exact/selection APIs, separate channels in mixed batches |
| Historical models | 711 frozen 6.13.6 schemas | Independent decoding/roundtrip checks |
| Maintained compatibility models | 549 declarations | Generated inventory plus handwritten compatibility fixtures |
| Maintained v1 catalog | 184 entries | Transport-boundary routing checks; not an authoritative v1 payload specification |

`docs/model-coverage.json`, `docs/routing-coverage.json` and
`docs/typing-report.json` enumerate individual public mappings and raw locations.
The full compatible-pair regression now checks 3,132 pairs. These inventories
measure declared surface coverage, not every possible combination of game states.

## Developer capabilities

| Capability | Public surface / behavior |
| --- | --- |
| Exact typed endpoints | `operations`, `Client.exact`; schema-checked parameters/responses |
| Resource selection conveniences | `selections` and `Client.select`; typed response fields |
| Inferred typed batching | `Client.batch` returns a concrete tuple; cross-resource/empty tuples rejected at compile time |
| Planner inspection and explicit execution | `planner.build`, `Client.executePlan`; target-domain validation, generic/direct routes, split recovery and opt-in supported v1 recovery, triggered by code 4, HTTP 400/404/501, or Torn's combination/v1-migration messages |
| Raw and custom decoding | `Client.raw`, `Execution.raw`, `Execution.project` |
| Pagination | Typed official links/metadata; explicit parameters. No automatic page iterator is provided |
| Retries | Transport, selected HTTP statuses and Torn codes 5/8/9; Retry-After seconds/date support; code 5 minute-boundary cooldown that also spends the key's (and, for IP-attributed limits, the route's) remaining minute budget |
| Quotas and rotation | Deduplicated keys, shared key/route budgets, route spillover/pinning, independent `Route.per_minute` overrides |
| Concurrency and cancellation | Shared semaphore; cancelable Io operations; attempt and outer deadlines; waits release permits |
| Egress/proxies | HTTP or HTTPS proxy; proxy authentication; verified target TLS through CONNECT; verified proxy TLS for HTTPS proxies |
| Execution observability | Contributing-call reports, route observer; reports are not total-attempt counters |
| Configuration | Programmatic config and validated explicit environment snapshot; custom base URLs/user agent |
| Testability | Injectable transport and deterministic scheduler |
| Ownership and numerical handling | Explicit owned result cleanup, missing/null/value distinction, exact integer parsing, retained unknown JSON and exact source number lexemes |
| Credential protection | Authorization header, redacted custom formatting/serialization, no redirect forwarding |
| Upstream policy metadata | Verbatim operation stability; known inventory cache TTL seconds |

The audit found and fixed five practical gaps: Torn code 5 cooldown, route-specific
quotas, HTTPS proxy support, rate-limit exhaustion and message-based recovery.
After Torn code 5, the key's remaining minute budget is spent so other calls rotate
instead of repeating the rejection; when the message names the IP as a whole word
(so "multiple" does not match), the route's budget is spent too. HTTP 429 honors
its Retry-After without spending budgets. Split recovery and opt-in v1 fallback
recognize Torn's combination-rejection and v1-migration messages independent of
the error code.

The HTTPS-proxy implementation includes an explicit
nested TLS flush adapter because flushing Zig's TLS writer alone does not flush
its backing writer. Both proxy and target authentication wait for the relevant TLS
verification. An additional test caught and fixed the standard HTTP client's
missing automatic trust/time initialization for HTTP origins through TLS proxies.

## Precise typing boundary

Every field with a defined official value schema is generated into a concrete Zig
type. A blanket promise of fully specific types for every conceivable Torn payload
would exceed the upstream contract:

- Four required fields have no official value schema: stock-analysis item `stock`,
  bootlegging `dvd_copies`, trade `items`, and Halloween upgrade `type`. They are
  required `model.Raw` values, retain exact data, and reject omission. No invented
  enum or guessed payload shape is substituted.
- `UserLog.data` and `UserLog.params` are official open maps. Their arbitrary values
  and future object fields remain raw and accessible through retained JSON.
- Maintained historical/v1 unknown variants remain explicit raw values where the
  available contract does not define a complete shape.
- Zig scalar aliases may share identity. `decodeNamed` preserves the selected
  schema's domain when an independently decoded scalar would be ambiguous.
- Official `number` fields use `f64`, so decimal values are subject to binary
  floating-point representation; retained original JSON preserves the exact source
  lexeme for callers that need it. Integer conversion never goes through floating
  point and honors the official integer width and bounds.
- Upstream `/user/halloween` has `x-stability: "Untable"`. It is exposed verbatim;
  callers should treat an unrecognized stability value conservatively.

The SDK preserves the official contract rather than claiming authoritative types
for undocumented server behavior.

## Verification and remaining limits

Generated sources are byte-reproducible regardless of checkout newline settings.
An earlier routing module embedded a CRLF working copy of the manifest and failed
the LF-based CI freshness check. Embedded inputs are now normalized to LF, and CI
rejects CRLF in the index or checkout before any other step.

The refreshed checks cover all operations, models and helpers, the compatible pair
matrix, required Halloween fields and raw retention, inventory metadata, route
quotas, retry deadlines/cancellation, body caps, proxies and TLS rejection. The
nested writer test checks delayed buffers, splat/vector ordering and byte counts,
recursive flush propagation, duplicate-free repeated flushes, and sink errors.
Native TLS tests reject an invalid HTTPS-proxy certificate before CONNECT or
proxy credentials for both HTTP and HTTPS origins.

`zig build verify-proxy` completed HTTP 200/API 6.14.0 through a local HTTP CONNECT
relay with verified target TLS, without a private API key. Its evidence is in
`docs/proxy-verification.json`. A controlled local interoperability test additionally
returned HTTP 200 for both HTTPS and plain HTTP targets through an HTTPS proxy.
Both TLS verification layers stayed enabled. A test-only copy of the production
transport appended an ephemeral fixture CA after normal system-root initialization;
the machine trust store and production sources stayed unchanged. The peer checked
proxy authentication, target authentication and absence of the origin credential
in CONNECT. Source hashes, exact trust injection and results are recorded in
`docs/https-proxy-verification.json`; the optional fixture peer and reproduction
instructions are in `docs/interop/`. This is injected-fixture-trust evidence,
rather than a public HTTPS-proxy service test with only system roots.
The live account test remains credential-gated. CI runs natively on Linux, Windows
and macOS; the checks do not establish race freedom beyond the Linux thread-sanitizer
runtime tests, service-wide distributed rate limits, or every undocumented v1 shape.
v1 fallback calls also authenticate with the `Authorization` header; the official
contract documents that header for v2 only, and no live test covers v1 acceptance.
