# Torn-Zig-SDK

An allocator-explicit Zig SDK for the official Torn API. Import the module as `torn`.
[CI verification](https://github.com/swervelord/Torn-Zig-SDK/actions/workflows/ci.yml).
The pinned and minimum supported compiler is **Zig 0.17.0** (stable release, verified
against the official index on October 25, 2026). There are no package or native
library dependencies beyond Zig's standard library and operating-system facilities.
`torn.SDK_VERSION` is `0.4.0`; the embedded OpenAPI contract is `torn.SPEC_VERSION`
**6.15.0**. Upgrading from 0.3.x? See the [migration guide](CHANGELOG.md#migrating-from-03x).

## Install

Fetch the tagged release (a content-addressed package):

```sh
zig fetch --save=torn https://github.com/swervelord/Torn-Zig-SDK/archive/refs/tags/v0.4.0.tar.gz
```

In your `build.zig`, call `b.dependency("torn", .{ .target = target, .optimize = optimize })`
and add `.{ .name = "torn", .module = dependency.module("torn") }` to your module's
imports. Keep the hash written by `zig fetch` in your `build.zig.zon`.
The complete fresh consumer is in `tests/external-consumer/`.

## Quickstart

```zig
const torn = @import("torn");

var engine = try torn.runtime.Client.init(allocator, io, .{ .keys = &.{api_key} }, .{});
defer engine.deinit();
const client: torn.Client = .{ .engine = &engine };

// Self-scoped: no id means the key owner (P8.1).
var result = try client.select(torn.selections.user.profile, &.{}, &.{}, .{});
defer result.deinit();
if (result.value) |value| std.debug.print("{s}\n", .{value.profile.name});
if (result.execution.failure) |failure| std.debug.print("{f}\n", .{failure});
```

`torn.runtime.Client` is the engine (keys, rate limits, retries, routes, transport);
`torn.Client` is the typed facade. Keep the engine at a stable address and release
every owned result exactly once with `deinit`.

## Authentication & keys

- v2 requests authenticate with `Authorization: ApiKey <key>`; v1 requests send
  `key=` on the wire only. No generated parameter has a `key` field, URLs in
  reports, hooks and errors never contain a key, and `rawPath` refuses `key=`.
- `Config.keys` is a pool: round-robin over **healthy** keys. Each key is
  `healthy`, `rate_limited(until)` or `disabled(reason, until?)`; inspect with
  `engine.keyStates(allocator)` (redacted `***` + last four characters, remaining
  budget, access level, group).
- Failover is driven by `spec/shared/error-codes.json`: codes 2/10/13/18 disable the
  key for the client lifetime, 14 until the next UTC midnight, 16 rotates without
  disabling. The same request is retried immediately with the next healthy key.
  When none remains the failure kind is `no_usable_keys` with the last error.
- `runtime.Client.initFromEnvironment` reads `TORN_API_KEYS` (comma separated) or
  `TORN_API_KEY`, plus the `TORN_*` limits documented in [runtime contracts](docs/runtime.md).
- Every key-holding type (`Config`, `runtime.Client`, `transport.Request`,
  `KeyState`, `client.Failure`, test-kit records) redacts `{f}`/`{any}`/JSON output.

## Typed calls

Every official operation is available under `torn.operations` by its `operationId`,
with typed `Params`, `Response`, `path`, `media_type`, `stability`,
`upstream_cache_ttl_seconds`, `access_level` and `paginated`:

```zig
var ammo = try client.exact(torn.operations.getMyAmmo, .{}, .{});
defer ammo.deinit();
```

Selection tokens (`torn.selections.<resource>.<name>`) give typed results through
`client.select`; `client.execute(Input, ...)` takes runtime selection lists. Parameter
values are checked against their official schemas before sending. CSV operations
return owned text. `oneOf` unions use descriptive tags derived from schema names
(`job.job` / `job.company` / `job.null`, `TradeItem.money`, ...).

## Batching

```zig
var result = try client.batch(.{
    torn.selections.user.profile,
    torn.selections.user.job,
}, &.{.{ .name = "id", .value = "123" }}, &.{}, .{});
defer result.deinit();
// All-or-nothing tuple:
if (result.value) |values| _ = values[0].profile.name;
// Per selection, also when a sibling or another call failed (P1.4):
switch (result.results[1]) {
    .ok => |job| _ = job,
    .failed => |failure| std.debug.print("{f}\n", .{failure}),
}
```

This sends one `/user?selections=job,profile` request. Mixed-resource static batches
are compile errors; all selections share target and filters. The planner splits
selections that need dedicated endpoints into separate calls; on Torn code 4 or
HTTP 400/404/501 a combined call is retried one selection at a time.

## Pagination

Operations with `_metadata.links` (`Op.paginated`) get a pager:

```zig
var pages = try client.pages(torn.operations.getMyAttacks, .{ .limit = .{ .value = 100 } }, .{ .max_pages = 5 });
defer pages.deinit();
while (try pages.next()) |page_value| {
    var page = page_value;
    defer page.deinit();
    for (page.value.?.attacks) |attack| _ = attack;
}
```

`client.paginate(path_query, options)` is the raw equivalent. Pagers follow
`links.next` (or `prev` with `.direction = .prev`), validate every link against the
configured API host (a foreign link fails the page with a `validation` failure),
drop any `key` in links and re-attach the key as a header. Rate limits, retries,
deadlines and cancellation apply to every page.

## Errors

Errors are values on the result (`execution.failure`, `results[i].failed`); Zig
errors are reserved for misuse, out-of-memory and cancellation. `client.Failure`:

- `kind`: `api`, `http`, `network` (transport), `decode`, `validation`/`planning`,
  `no_usable_keys`, `timeout`, `canceled`; `kindName()` gives the shared taxonomy name.
- `api_code`, `code()` (`torn.TornErrorCode`, generated, non-exhaustive for unknown
  codes), `api_message` (server text), `key` (redacted), `operation`, `selection`,
  `required_access`, `body` (raw failing body), `diagnostic` (JSON path, expected
  type and a truncated, redacted value excerpt).
- Helpers: `isRetryable`, `isKeyError`, `isRateLimit`, `isAccessError`, `isTransient`;
  `torn.errors` exposes the generated table (`info`, `action`, `name`, ...).

## Rate limits & retries

- Sliding window (rolling 60 s log), default 100 requests per key group and 1000 per
  route (egress IP). `Config.key_groups` or `client.detectKeys()` (key/info owners,
  also `Config.detect_key_owners`) make keys of one Torn user share a budget.
- Code 5 marks the key's group `rate_limited` until its window frees, rotates to a key
  with budget immediately, and sleeps only when none has budget.
- Code 8 blocks the route and rotates to another configured route, else fails.
- `retry_backoff` codes (12, 17, 24, 31), HTTP 429/500/502/503/504 and network
  errors retry with exponential backoff `500 ms * 2^(n-1)` (max 30 s) and full
  jitter; `Retry-After` is honored up to 120 s. `max_attempts` (default 4) counts
  sends; key failover does not consume attempts. Codes 22/23 re-plan once on the
  other API version. Classification never uses message text.
- Deadlines (`Options.request.deadline_ms`) and `std.Io` cancellation abort waits and
  in-flight sends. One pooled `std.http.Client` (keep-alive) serves all direct sends.

## Access levels

Every operation has `access_level` and every selection token `access_level`
(`public|minimal|limited|full|custom`, from `spec/shared/access-levels.json`).
`client.keyInfo()` is the typed `key/info` call; `client.detectKeys()` learns each
key's level. With `Config.check_access = true` (and levels known from
`Config.key_access` or detection), a call no key can serve fails before sending with
a `validation` failure naming `required_access`.

## Forward compatibility

- Enums are open: `model.Open(E)` decodes values Torn adds later as `.unknown`
  (the raw text, owned by the result arena) and serializes them back byte-exact.
  Use `value.eql(.Name)`, `get()`, `isKnown()`, `text()` and `E.known_values`.
- `spec/shared/spec-overrides.json` relaxes spec defects proven live
  (`TornHalloweenUpgrade.type`, `UserTrade.items` are optional).
- Decoding is tolerant by default: unknown properties are kept in the raw tree.
  `Options.mode = .strict` (and `torn.contracts.*`) also validates against the
  official contract and reports unknown enum values, unknown properties and
  override-relaxed fields.
- Unknown selection names are sent as v2 generic selections; unknown filters and
  `comment` are forwarded verbatim on v1 and v2.
- The merged raw JSON (`execution.raw`) is kept even when typed decoding fails.

## Caching

Off by default. Attach `engine.cache = memory.cache()` with a
`runtime.MemoryCache` (thread-safe, TTL, bounded) or your own `runtime.Cache`.
Exact operations use the upstream cache lifetime from the contract
(`upstream_cache_ttl_seconds`, e.g. inventory 900 s, new messages 3600 s); other calls
cache when `Options.request.cache_ttl_ms` is set. Only successful, non-error bodies
are cached, keyed by URL (which never contains a key).

## Hooks

`engine.hooks = .{ .on_request, .on_response, .on_retry, .on_error }` receive a
redacted `runtime.Event` (operation, URL without key, attempt, status, Torn code,
duration, delay, redacted key, route). `engine.observer` reports per-send key and
route indexes. Hooks run outside locks and must be thread safe.

## Testing

`torn.testing` is the consumer test kit: `MockTransport` (scripted replies, network
errors, `Retry-After`, recorded requests with path/query accessors and request
assertions), `VirtualClock` (deterministic waits) and fixture helpers
(`loadFixture`, `scrubSecret`). `examples/typed_batch.zig` shows a mocked batch.

```sh
zig fmt --check build.zig src tools tests examples
zig build check -Doptimize=debug
zig build test -Doptimize=debug       # includes the shared conformance suite
zig build test -Doptimize=safe
zig build conformance                 # spec/shared/conformance scenarios only
zig build generate-check && zig build audit
zig build examples && zig build fuzz -Doptimize=safe
TORN_API_KEY=... zig build live-test  # opt-in smoke batch + live sweep
```

The live check reads `TORN_API_KEY` (or the legacy `TORN_LIVE_TEST_API_KEY`), runs
a one-send typed batch (the key needs limited access), then sweeps every typed
operation reachable with the key owner's ids in tolerant mode and fails on any
decode error, printed with its JSON path. `zig build live-test -- --smoke` skips the
sweep.

## Raw access

`client.rawPath("/user/travelinventory?comment=x", .{})` sends any path and query
(v2; `.request.api_version = 1` for v1) and returns an `Execution` whose `raw` is the
exact JSON; `execution.decode(T)` decodes it into any generated or user model.
`client.raw(Token, ...)`, `Execution.project` and `engine.execute(url, ...)` remain
available. `torn.model.decode(T, allocator, bytes)` decodes standalone JSON.

## Helpers

`torn.helpers` builds Torn web URLs (`profileUrl`, `attackUrl`, `factionUrl`,
`companyUrl`, `bazaarUrl`, `itemMarketUrl`, `tradeUrl`, `forumThreadUrl`,
`propertyUrl`) into caller buffers and converts Torn timestamps to and from TCT
(UTC) calendar fields (`fromTimestamp`, `toTimestamp`, `nowTimestamp`).

## Versioning

Semantic versioning; before 1.0, breaking changes bump the minor version (0.4.0
changed enum and union representations, see the [CHANGELOG](CHANGELOG.md)).
`torn.SDK_VERSION`, `torn.SPEC_VERSION` and `torn.SPEC_SHA256` are runtime
constants; the default user agent is `Torn-Zig-SDK/<SDK_VERSION>`. Contracts and
capabilities are embedded; no filesystem paths are needed at run time.

## Contracts and generation

The official v2 snapshot is **6.15.0** (237 exact operations, 724 component schemas).
The distinct frozen namespace preserves **6.13.6** (711 schemas). The maintained
compatibility namespace has 549 declarations. Routing covers 208 capabilities, 210
typed selection/alias tokens, 205 JSON selections, three CSV channels, and an
explicit 184-entry v1 catalog. `docs/routing-coverage.json`, `docs/model-coverage.json`
and `docs/typing-report.json` are generated inventories.

`tools/generate.zig` and `tools/generate_routing.zig` read only `spec/` (including
the vendored `spec/shared/` inputs), are deterministic, and are checked by
`zig build generate-check`. `current`, `frozen` and `compatibility` are separate
namespaces. JSON integers never pass through floating point; missing, null and
present optional fields use `model.Presence(T)`. The v1 catalog is maintained
routing coverage, not an authoritative v1 response specification. See
[provenance](docs/provenance.md), [verification scope](docs/verification.md),
[runtime contracts](docs/runtime.md) and the [API 6.15.0 audit](docs/audit-6.15.0.md).

MIT License. Copyright (c) 2026 swervelord.
