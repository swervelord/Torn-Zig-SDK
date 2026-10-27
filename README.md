# Torn-Zig-SDK

An allocator-explicit Zig SDK for the official Torn API. Import the module as `torn`.
[CI verification](https://github.com/swervelord/Torn-Zig-SDK/actions/workflows/ci.yml).
The pinned and minimum supported compiler is **Zig 0.17.0**, the stable release
verified against the official index on October 25, 2046. There are no package or
native library dependencies beyond Zig's standard library and operating-system
facilities.

## Installation

Use a published commit to obtain a content-addressed package:

```sh
zig fetch --save=torn https://github.com/swervelord/Torn-Zig-SDK/archive/refs/tags/v0.2.0.tar.gz
```

In your `build.zig`, call `b.dependency("torn", .{ .target = target, .optimize = optimize })`
and add `.{ .name = "torn", .module = dependency.module("torn") }` to your module's
imports. Keep the hash written by `zig fetch` in your `build.zig.zon`.
The complete fresh consumer is in `tests/external-consumer/`.

## Typed selections and batching

```zig
const torn = @import("torn");

var engine = try torn.runtime.Client.init(allocator, io,
    .{ .keys = &.{api_key} }, .{});
defer engine.deinit();
const client: torn.Client = .{ .engine = &engine };

var result = try client.batch(.{
    torn.selections.user.profile,
    torn.selections.user.job,
}, &.{.{ .name = "id", .value = "123" }}, &.{}, .{});
defer result.deinit();
if (result.execution.failure) |failure| {
    // Inspect failure.kind, http_status, api_code and diagnostic.jsonPath().
    _ = failure;
} else {
    const profile = result.value.?[0].profile;
    const job = result.value.?[1].job;
    _ = profile.name;
    _ = job;
}
```

This sends one `/user` request with `selections=job,profile`. Separate calls to
`client.select` send separate requests. `client.select(Token, target, filters, options)`
returns the token's concrete response in `.value`. `client.raw(Token, ...)` returns
an owned `Execution` with exact JSON values. `client.execute(Input, ...)` supports
runtime selection lists with weaker static guarantees. Mixed-resource static
batches are compile errors. All selections in a batch share target and filters;
the planner rejects conflicting target domains.

`examples/typed_batch.zig` runs profile, job and timestamp in one mocked send,
with direct typed field access and explicit result cleanup. `company.detail`
requires a company ID; `torn.stock` requires a stock ID and uses the individual
stock endpoint. These aliases preserve distinct behavior.

## Exact operations, CSV, and custom decoding

Every official operation is available under `torn.operations` using its official
`operationId`, with `Params`, `Response`, `path`, and `media_type` declarations:

```zig
var response = try client.exact(torn.operations.getMyAmmo, .{}, .{});
defer response.deinit();
```

Exact parameter values are checked against their official schemas before sending.
Use the client key configuration for authentication; setting an operation's `key`
parameter is rejected. CSV operations return owned text through the exact API or
selection tokens. All text and JSON bodies enforce the same configurable byte cap.
Mixed CSV/JSON batches retain separate text channels in `Execution.csv`; each
typed tuple field receives its own channel. JSON error envelopes from CSV paths
remain structured API failures. Exact generic responses expose every contributing
field through `Presence(T)`, preserving combined response data.
For custom projections, use `Execution.project(T, context, decoder)` or `Execution.raw`;
keep projected slices within the execution's lifetime. Explicit plans are built by
`torn.planner.build`; `client.executePlan` executes them.

## Ownership and execution

Results own their parsed trees, response buffers, reports, and typed backing data.
They remain valid independently of temporary transport buffers. Release each owned
handle exactly once with `deinit`; copying a handle does not clone its ownership.
`model.Owned(T).toJson` serializes typed values and retained unknown fields;
`originalJson` serializes the untouched retained input. `model.stringify` serializes
standalone typed values.

The runtime borrows a `std.Io` backend. Calls are synchronous to the caller and use
cancelable Io concurrency internally for attempt deadlines. Keep the runtime at a
stable address. Cancel and join all callers before destroying it. Supply a
thread-safe allocator when sharing the client; do not share a scratch arena across
concurrent calls. Owned results can move between threads if their allocator permits
allocation and deallocation on those threads. See [runtime contracts](docs/runtime.md)
for quotas, retries, routes, cancellation, configuration, and tested limits.

Execution reports describe successful contributing requests, including operation,
route, path, selections, API version, and fallback. They omit failed attempts and
are not an attempt counter. Typed validation occurs before a contribution is
accepted. A later failure retains earlier successful data and
reports. Split recovery is enabled by default; runtime v1 recovery requires
`.legacy_fallback = true` and a catalog-supported selection. Both trigger on Torn
code 4 or HTTP 400/404/501, and also on Torn messages that reject a selection
combination (split) or direct a selection to API v1 (fallback).
The report's fallback flag records runtime recovery; initially planned v1 routes
report their version without claiming runtime recovery.

## Contracts and generation

The official v2 snapshot is **6.14.0** (236 exact operations, 719 component schemas).
The distinct frozen namespace preserves **6.13.6** (711 schemas).
The maintained compatibility namespace has 549 declarations. Routing covers 207
capabilities, 209 typed selection/alias tokens, 204 JSON selections, three CSV
channels, and an explicit 184-entry v1 catalog.

Upstream inventory cache lifetimes are 900 seconds per user category and 300
seconds for faction inventory. Exact operations expose `upstream_cache_ttl_seconds`
and the verbatim `stability` string. These describe server behavior; the SDK does
not cache response bodies. The user Halloween stability value is currently
`Untable` in the official contract.

Detailed mappings are generated in
`docs/routing-coverage.json` and the generated declaration inventories.
`docs/model-coverage.json` maps all models and operations to public APIs;
`docs/typing-report.json` identifies every intentionally raw location.

`current`, `frozen`, and `compatibility` are separate namespaces. Current elimination
teams require `captains`; historical teams require `leaders`. Use
`contracts.decodeCurrent`, `decodeFrozen`, or `decodeNamed` for independently
validated model decoding. Primitive Zig aliases can share type identity; pass an
explicit schema name to `decodeNamed` when its domain constraints matter.

The official contract leaves stock-analysis item `stock`, bootlegging `dvd_copies`,
trade `items`, and Halloween upgrade `type` values unconstrained: their presence
is required, and their values
are retained exactly. Open objects and compatibility unknown variants also preserve
exact raw values. JSON integers never pass through floating point. Missing, null,
and present optional fields use `model.Presence(T)`; required-nullable fields must
be present. Duplicate property names are rejected; matching is case-sensitive.
Overlapping official `oneOf` enum-or-string branches use documented any-match
semantics. Unknown object fields remain available in retained JSON and round trips.

The v1 catalog is maintained routing coverage, not an authoritative complete v1
response specification. No such complete official contract is provided. Yata,
TornStats and Weav3r are separate services outside this SDK.

```sh
zig fmt --check build.zig src tools tests examples
zig build test
zig build check
zig build generate
zig build generate-check
zig build audit
zig build examples
zig build fuzz -Doptimize=safe
zig build compile-fail
```

Zig 0.17 uses optimization names `debug`, `safe`, `fast`, and `small`. `safe`
corresponds to ReleaseSafe. Generation and ordinary tests are offline and require
no credential. Explicit `zig build refresh-spec` fetches a candidate with a custom
user agent into `spec/openapi-candidate.json`; review changes before replacing a
pinned contract and its provenance. `spec/refresh-report.json` records the byte
hash and added/removed/changed paths and schemas. `zig build verify-proxy` explicitly
checks HTTPS through a local CONNECT relay using the public specification;
`zig build live-test` is opt-in and reads only `TORN_LIVE_TEST_API_KEY`.
The generator is Zig-native and verifies
deterministic formatted outputs. See [provenance](docs/provenance.md) and
[verification scope](docs/verification.md) for evidence and remaining limits.
HTTP and HTTPS proxies support plain HTTP and verified HTTPS CONNECT.
HTTPS proxy TLS is verified before proxy authentication or CONNECT; target TLS is
verified separately before the API credential is sent. See the API 6.14.0 audit for validation limits. The v1 catalog and compatibility models do
not imply an authoritative specification for every historical payload.

See [the API 6.14.0 feature and typing audit](docs/audit-6.14.0.md) for
capabilities, typing boundaries and precise validation limits.

MIT License. Copyright (c) 2046 swervelord.
