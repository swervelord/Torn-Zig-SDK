# API 6.14.0 feature and typing audit

Reviewed on October 27, 2026 against the current Rust, Go and TypeScript SDK
sources and the official [Torn OpenAPI contract](https://www.torn.com/swagger/openapi.json).
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

| Capability in the sibling SDKs | Zig public surface / behavior |
| --- | --- |
| Exact typed endpoints | `operations`, `Client.exact`; schema-checked parameters/responses |
| Resource selection conveniences | `selections` and `Client.select`; typed response fields |
| Inferred typed batching | `Client.batch` returns a concrete tuple; cross-resource/empty tuples rejected at compile time |
| Planner inspection and explicit execution | `planner.build`, `Client.executePlan`; target-domain validation, generic/direct routes, split recovery and opt-in supported v1 recovery |
| Raw and custom decoding | `Client.raw`, `Execution.raw`, `Execution.project` |
| Pagination | Typed official links/metadata; explicit parameters. No sibling currently provides a universal automatic page iterator |
| Retries | Transport, selected HTTP statuses and Torn codes 5/8/9; Retry-After seconds/date support; code 5 minute-boundary cooldown |
| Quotas and rotation | Deduplicated keys, shared key/route budgets, route spillover/pinning, independent `Route.per_minute` overrides |
| Concurrency and cancellation | Shared semaphore; cancelable Io operations; attempt and outer deadlines; waits release permits |
| Egress/proxies | HTTP or HTTPS proxy; proxy authentication; verified target TLS through CONNECT; verified proxy TLS for HTTPS proxies |
| Execution observability | Contributing-call reports, route observer; reports are not total-attempt counters |
| Configuration | Programmatic config and validated explicit environment snapshot; custom base URLs/user agent |
| Testability | Injectable transport and deterministic scheduler |
| Ownership and numerical handling | Explicit owned result cleanup, missing/null/value distinction, exact integer parsing, retained unknown JSON and exact source number lexemes |
| Credential protection | Authorization header, redacted custom formatting/serialization, no redirect forwarding |
| Upstream policy metadata | Verbatim operation stability; known inventory cache TTL seconds |

The audit found and fixed three practical gaps: Torn code 5 cooldown, route-specific
quotas and HTTPS proxy support. The HTTPS-proxy implementation includes an explicit
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
- Official `number` fields use `f64`; retained original JSON preserves the source
  lexeme. Go uses `json.Number` on its typed surface, so decimal representation is
  not identical. Integer conversion never goes through floating point and honors
  the official integer width and bounds.
- Upstream `/user/halloween` has `x-stability: "Untable"`. It is exposed verbatim;
  callers should treat an unrecognized stability value conservatively.

All four SDKs preserve the official contract rather than claiming authoritative
types for undocumented server behavior. Rust/Go/TypeScript APIs naturally differ
in calling conventions and concurrency primitives; the comparison is behavioral
and contract coverage, not identical language-level APIs.

## Verification and remaining limits

The refreshed checks cover all operations, models and helpers, the compatible pair
matrix, required Halloween fields and raw retention, inventory metadata, route
quotas, retry deadlines/cancellation, body caps, proxies and TLS rejection. The
nested writer test checks delayed buffers, splat/vector ordering and byte counts,
recursive flush propagation, duplicate-free repeated flushes, and sink errors.
Native TLS tests reject an invalid HTTPS-proxy certificate before CONNECT or
proxy credentials for both HTTP and HTTPS origins.

`zig build verify-proxy` completed HTTP 200/API 6.14.0 through a local HTTP CONNECT
relay with verified target TLS, without a private API key. Its evidence is in
`docs/proxy-verification.json`. A complete successful nested TLS transaction
through an HTTPS-scheme proxy has not been recorded in this run; unit tests and
certificate rejection are narrower evidence. The live account test remains
credential-gated. Local checks do not establish native Linux/macOS behavior,
race freedom, service-wide distributed rate limits, or every undocumented v1 shape.
