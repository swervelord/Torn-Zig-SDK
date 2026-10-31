# API 6.15.0 feature and typing audit

Reviewed on October 30, 2026 against the official
[Torn OpenAPI contract](https://www.torn.com/swagger/openapi.json).
The pinned input's exact hash, version and counts are in `spec/provenance.json`.
Capabilities that did not change in this release are described in
[the API 6.14.0 audit](audit-6.14.0.md); this document records the 6.15.0 delta
and the refreshed inventories.

## Contract coverage

| Surface | Zig coverage | Evidence |
| --- | --- | --- |
| Official exact operations | 237 / 237 | Generated operation inventory; every parameter builder and concrete response decoder instantiated and exercised against an independent contract oracle |
| Current component schemas | 724 / 724 | Concrete layouts and decoders; 7,461 acceptance/typed roundtrip samples |
| Selection capabilities | 208 / 208 | Independent official enum/path/response-membership routing oracle |
| Typed tokens including aliases | 210 | Every token invoked with concrete value assertions |
| JSON raw helpers | 205 | Every helper executed through checked mock transport |
| CSV channels | 3 | Unchanged |
| Historical models | 711 frozen 6.13.6 schemas | Unchanged; independent decoding/roundtrip checks |
| Maintained compatibility models | 549 declarations | Unchanged |
| Maintained v1 catalog | 184 entries | Unchanged; `travelinventory` is v2-only and is not added |

The full compatible-pair regression now checks 3,195 pairs (3,132 before; the
independent user group gains `travelinventory`, adding one pair with
each of its other 63 selections). These inventories
measure declared surface coverage, not every possible combination of game states.

## Changes between 6.14.0 and 6.15.0

`zig build refresh-spec` reported one added path, one changed path, five added
schemas and three changed schemas. No path or schema was removed.

| Official change | SDK surface |
| --- | --- |
| `GET /user/travelinventory` (`getMyTravelInventory`) | `operations.getMyTravelInventory`, `Client.exact` |
| `travelinventory` added to `UserSelectionName` | `selections.user.travelinventory` for `Client.select`, `Client.batch` and `Client.raw`; `UserSelectionName.v0.travelinventory` for `getUserGeneric` |
| `UserTravelInventoryResponse` added to the generic `/user` response `anyOf` | Generic batching eligibility; `getUserGeneric.Response.travelinventory` |
| `UserTravelInventoryResponse`, `UserTravelInventory`, `UserTravelInventoryCapacity`, `UserTravelInventorySlot`, `UserTravelInventoryItem` | Concrete structs under `torn.current` |
| `JobPositionCasinoEnum` gains `Dealer` | `current.JobPositionCasinoEnum.Dealer`; `UserJob.position.v2` |
| `FactionTerritoryWarResultEnum` gains `end_with_dirty_bomb` | `current.FactionTerritoryWarResultEnum.end_with_dirty_bomb` |

The update notes describe the `Dealer` addition as a Swagger correction. The
`end_with_dirty_bomb` result appears only in the specification. The changed
`/user` path is the selection enum plus the new generic response branch. The
generic response branch is what makes `travelinventory` combinable in one
`/user?selections=...` call. Enum membership alone would not.

A server-side fix in the same release stops returning `type: Job` /
`position: Employee` from the `job` selection for test accounts. Neither value is in the
official `UserJob` contract, so such responses previously failed strict
decoding. No contract change was needed. The live check decodes `job` together
with the new selection.

### Travel inventory typing

| Field | Zig type | Notes |
| --- | --- | --- |
| `travelinventory` | `UserTravelInventory` | Required |
| `capacity.base`, `capacity.special` | `i64` | Official `int32`; bounds are enforced on decode |
| `inventory` | `[]const UserTravelInventorySlot` | Required array |
| `inventory[].id` | `i64` | Official `int64` slot ID |
| `inventory[].item` | `?UserTravelInventoryItem` | Required-nullable: `null` decodes as an empty slot; omission is rejected |
| `item.id` | `ItemId` | |
| `item.uid` | `?ItemUid` | Required-nullable: stackable items have no unique ID |
| `item.name`, `item.type` | `[]const u8` | `type` is an unconstrained official string, not an enum |
| `item.is_equipped`, `item.is_faction_owned`, `item.is_permanent` | `bool` | `is_permanent` is true for items added while the player was in Torn |

The five new schemas add only "unknown object fields retained" entries to
`docs/typing-report.json`. No new raw value locations are introduced.

### Access level and stability

The official operation takes the `ApiKeyLimited` key parameter and is described
as "Requires limited access key". The SDK does not model key access levels as a
separate typed field. This requirement is carried verbatim in
`operations.getMyTravelInventory.contract_json`, and the tests assert it. The
operation's `stability` is the official `Unstable`, and it has no upstream cache
TTL (`upstream_cache_ttl_seconds == null`). A key without limited access receives
the Torn access-level error envelope, which surfaces as a structured API failure.

### Enum forward compatibility

Official enums are generated as closed Zig enums. An unknown literal fails with
`error.InvalidEnum` instead of being guessed. A 6.14.0 build therefore rejects a
territory war with `end_with_dirty_bomb` and a casino job with position `Dealer`.
This release accepts both, and a regression test pins that closed behavior for
future values.

## Verification

- `src/api_615_tests.zig` decodes the official travel inventory example offline
  with no key. It covers an item with a unique ID, an item with `uid: null`, an
  empty slot, and rejection of omitted required-nullable fields. It also covers
  token, operation, stability and limited-key metadata, and the generic
  three-selection plan (`selections=job%2Ctravel%2Ctravelinventory`). Further
  cases cover a typed `job`+`timestamp`+`travelinventory` batch with one send and
  a `Dealer` position, the direct exact path `/v2/user/travelinventory`, both
  new enum literals, and closed-enum rejection.
- Existing inventory tests were re-pinned to the new counts. These are the
  operations, schemas, helpers, model samples and compatible pairs above.
- `zig build live-test` passed on October 30, 2026. One real HTTP send batched
  `profile`, `job` and `travelinventory` and decoded concrete values with retries,
  split recovery and legacy fallback disabled. No response data or credential
  was persisted.
- `zig build verify-proxy` retrieved API 6.15.0 (1,422,762 bytes) through the local
  CONNECT relay with verified target TLS, without a private key.

## Remaining limits

The 6.14.0 audit's typing boundaries and verification limits still apply
unchanged. Travel inventory contents depend on travel state. The live check
asserts shape and decoding only, not specific slots or capacities.
