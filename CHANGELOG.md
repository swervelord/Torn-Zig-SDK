# Changelog

## 0.4.0 - 2026-10-31

Cross-SDK parity release (requirement ids from `spec/shared/PARITY_SPEC.md`).
Breaking changes are listed under [Migrating from 0.3.x](#migrating-from-03x).

- P1.1 Generated enums are open (`model.Open(E)`): values Torn adds later decode to
  `.unknown` with the raw text and serialize back byte-exact; `isKnown`, `get`,
  `eql`, `text`, `parse`, `known_values`. One new enum value no longer fails a whole
  typed call or batch.
- P1.2 `spec/shared/spec-overrides.json` is applied by the generator:
  `TornHalloweenUpgrade.type` and `UserTrade.items` are optional.
- P1.3 Decoding is tolerant by default; `Options.mode = .strict` and
  `torn.contracts.*` report unknown enum values, unknown properties and
  override-relaxed fields.
- P1.4 `execution.raw` is always kept; batches return per-selection `results`;
  failures carry operation, selection, JSON path, expected type, a redacted value
  excerpt and the failing body.
- P1.5 Unknown selection names are sent as v2 generic selections; unknown filters and
  `comment` are forwarded on v1 and v2. Names the v2 selection enum lists as server-side
  v1 fallbacks (for example `user.bazaar`) ask v2 first (P4.3).
- P2.4a Key rotations (failover and code 5 moving to another key) do not consume
  `max_attempts`.
- P4.5 Code 4 (or HTTP 400/404/501) on a multi-selection request splits it once into
  per-selection requests; P4.6 `TORN_API_KEYS` takes precedence over `TORN_API_KEY`.
- P2 v1 authenticates with `key=` on the wire only; generated `Params` have no `key`
  field. Key pool states, failover per `error-codes.json`, `keyStates()`, redacted
  `KeyHint` in every report, hook and error.
- P3 Sliding 60 s windows per key group (`key_groups`, `detectKeys`) and route;
  code 5 rotates or waits for the window; code 8 blocks the route.
- P4 Exponential backoff with full jitter (defaults 4 attempts, 500 ms base, 30 s
  cap, Retry-After capped at 120 s); code 17 and the other `retry_backoff` codes are
  retried; codes 22/23 reroute once. Message text is never used for classification.
- P5 Generated `TornErrorCode` (`torn.errors`), `Failure.api_message`, `key`,
  `kindName()` and `isRetryable`/`isKeyError`/`isRateLimit`/`isAccessError`/`isTransient`.
- P6 `access_level` on every operation and selection token, `client.keyInfo()`,
  `client.detectKeys()`, `Config.check_access` / `key_access`.
- P7 `client.pages(Op, ...)` / `client.paginate(...)` follow `_metadata.links` with
  host validation and key stripping; `Op.paginated`.
- P8 `client.rawPath`, hooks (`engine.hooks`), optional cache
  (`runtime.MemoryCache`, upstream TTLs parsed from the contract, now including new
  messages 3600 s), `torn.testing` kit, `torn.helpers`, `SDK_VERSION`,
  `SPEC_VERSION`, `SPEC_SHA256`; the user agent derives from `SDK_VERSION`.
- P9 The shared conformance suite (`tests/conformance.zig`, 30 scenarios) runs in
  `zig build test`; the live tool reads `TORN_API_KEY` (legacy
  `TORN_LIVE_TEST_API_KEY` still works) and adds a live sweep.
- Union tags are descriptive names derived from schema names instead of `v0..vN`.
- Performance: routing data and parameter contracts are precomputed at generation
  time, strict validation parses the contract once per process, and one pooled
  `std.http.Client` serves all direct sends. `select(user.job)` with a mock
  transport: 8.9 ms to 0.026 ms per call (ReleaseSafe).
- Fixed: README install tag and impossible "2046" dates; the operation-test hex
  digit table.

### Migrating from 0.3.x

- Enums: `value == .Okay` becomes `value.eql(.Okay)` (or `value.get() == .Okay`);
  constructing one is `.of(.Okay)` or `.{ .known = .Okay }`; the closed set is
  `E.Known`. `std.enums.values(E)` becomes `E.known_values`. Handle `.unknown`.
- Union tags: `job.v0` becomes `job.job`, `job.v1` `job.company`, `job.v2` `job.null`;
  `UserSelectionName.v0` becomes `.named`; positional aliases cannot be kept (Zig
  unions have no tag aliases). Every tag is listed in the generated files.
- Typed calls no longer run full-contract validation by default. Pass
  `.mode = .strict` to keep 0.3.x behavior (plus unknown-property checks).
- `Failure.kind` gains `validation` and `no_usable_keys`; check `kindName()`.
- `BatchResult` gains `results`; `SelectionResult` gains `result`.
- Removed generated `key` parameters (the runtime authenticates).
- Retry defaults changed (4 attempts, exponential backoff, HTTP 408 no longer
  retried, code 8 never retried on the same route); split recovery and v1 fallback
  trigger on codes/statuses only, not on message text. Code 22 reroutes to v1
  without `.legacy_fallback`.
- Budgets are sliding windows, not wall-clock minutes; `UsageObserver` is unchanged.
- `planner.build` no longer rejects unknown selections or filters, and keeps the
  caller's selection order (first occurrence) instead of sorting: `batch(.{profile, job})`
  now sends `selections=profile,job`.


## 0.3.0 - 2026-10-30

- Refresh the current official contract from API 6.14.0 to 6.15.0: 237 exact
  operations, 724 schemas, 208 selection capabilities and 210 typed tokens.
- Add the `user/travelinventory` selection (`selections.user.travelinventory`)
  and exact operation `operations.getMyTravelInventory`, with concrete
  `UserTravelInventoryResponse`, `UserTravelInventory`,
  `UserTravelInventoryCapacity`, `UserTravelInventorySlot` and
  `UserTravelInventoryItem` models. Empty slots (`item`) and non-unique items
  (`uid`) are required-nullable optionals. It joins generic `/user` batches; the
  official contract marks it `Unstable` and requires a limited access key.
- Add `Dealer` to `JobPositionCasinoEnum` and `end_with_dirty_bomb` to
  `FactionTerritoryWarResultEnum`. Official enums stay closed, so builds pinned
  to 6.14.0 reject these values with `error.InvalidEnum`.
- The opt-in live check now batches profile, job and travel inventory in one
  call; its key needs at least limited access.
- Retain the 6.14.0 snapshot alongside 6.13.8 and frozen 6.13.6 inputs.

See [the API 6.15.0 audit](docs/audit-6.15.0.md) for evidence and limits.

## 0.2.0 - 2026-10-27

- Refresh the current official contract from API 6.13.8 to 6.14.0: 236 exact
  operations, 719 schemas, 207 selection capabilities and 209 typed tokens.
- Add user and Torn Halloween selections, exact operations and concrete models,
  including owned required-but-unspecified upgrade `type` values.
- Include all 25 added city statistics and updated selection/stability contracts.
- Expose verbatim operation `stability` and optional
  `upstream_cache_ttl_seconds`: user inventory 900, faction inventory 300.
  These are server cache lifetimes; no client response cache is introduced.
- Respect the next minute boundary when retrying Torn error code 5, with longer
  Retry-After/backoff, cancellation and outer deadlines still respected.
- Spend the key's remaining minute budget after Torn code 5, and the route's
  budget when the message attributes the limit to the IP, so other calls rotate.
- Recognize Torn combination-rejection and v1-migration messages for split
  recovery and opt-in v1 fallback, in addition to code 4 and HTTP 400/404/501.
- Make routing generation independent of checkout line endings; CI rejects CRLF.
- Add optional per-route `per_minute` quotas with global inheritance.
- Support HTTPS proxies, independently verifying proxy TLS and target TLS;
  recursively flush nested TLS through TCP. Initialize proxy trust explicitly
  for HTTP origins. Preserve proxy/origin authentication separation.
- Expand independent model, routing, transport, cancellation and quota checks.
- Preserve frozen 6.13.6 and maintained compatibility namespaces.

The official `/user/halloween` stability is currently spelled `Untable`.
`TornHalloweenUpgrade.type` is required but has no declared value schema.
Both are preserved rather than corrected speculatively. See
[the feature and typing audit](docs/audit-6.14.0.md) for evidence and limits.
