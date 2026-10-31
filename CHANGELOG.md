# Changelog

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
