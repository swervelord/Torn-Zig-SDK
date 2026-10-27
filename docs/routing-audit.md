# Routing evidence and public names

The pinned official 6.14.0 specification defines exact paths, parameter schemas,
generic selection enums, and generic response associations. Enum membership
alone does not establish a usable generic response contract. The maintained
overrides in `spec/routing-overrides.json` record associations and reviewed
exceptions. Generation includes those overrides in `docs/routing-coverage.json`.

## Reviewed exceptions

| Selection | Public token and behavior | Evidence |
| --- | --- | --- |
| Faction `dirtbombs` | `selections.faction.dirtbombs` uses the generic spelling; `dirtybombs` uses `/faction/dirtybombs`. | Official enum and exact path differ. |
| User `itemmod` | `selections.user.itemmod` uses the generic spelling; `itemmods` uses `/user/itemmods`. | Official enum and exact path differ. |
| User `factionbalance` | Generic-only response association to `UserFactionBalanceResponse`. | Official generic response branch; no exact path. |
| Company `companies` | Exact `/company/{typeId}/companies`; other company generic selections still combine. | The generic enum includes the name but its response omits the exact response association. |
| Faction `reports` | Exact `/faction/reports`. | The exact response is `ReportsResponse`, absent from generic response alternatives. |
| Property `property` | Exact `/property/{id}/property`. | The generic response uses `UserPropertyResponse`; the exact contract uses `PropertyPropertyResponse`. |
| Torn `companies`, `searchforcash`, `shoplifting` | Exact paths. | Their exact response associations are absent from the generic response alternatives. |
| Torn `attacklog` | Exact `/torn/attacklog`, with required `log` filter. | The generic enum and response advertise the selection, but the generic query allowlist has no `log`; its `id` union excludes `AttackCode`. |
| User and faction `revivesfull` | Lowercase selection token; exact operations retain `/user/revivesFull` and `/faction/revivesFull`. | Literal official paths have a capital `F`. |

Required query parameters and optional closed enum query constraints are
generated from the exact official operations. A helper rejects missing required
inputs, closed enum values outside their domains, and incompatible shared
category values. For example, faction news category `main` cannot also select
the warfare-chain category `active`. Explicit v1 planning uses its separate
maintained allowlist and does not inherit current v2 query constraints.

## Target domains

Plans distinguish the same numeric value used as a user ID, crime ID, trade ID,
company type ID, race ID, or report ID. The supplemental mappings also separate
item IDs from honor and medal IDs, and auction listing IDs from market item IDs.
Named aliases include `itemIds`, `honorIds`, `medalIds`, `territoryIds`,
`itemId`, and `auctionListingId`. Original exact parameter names such as `ids`
and the documented legacy `id` alias remain accepted, while unsafe combinations
are rejected. Comma-separated arrays are encoded as one value.

`territoryIds` maps to the generic `id` query parameter and the exact territory
endpoint's `ids` query parameter. Lookup and timestamp are neutral selections:
they may accompany a documented target domain, but a neutral-only request does
not consume an otherwise irrelevant specialized ID.

## Helper names and aliases

All 207 capability names appear under `selections.<resource>.<name>`. The typed
adapter is `Client.select(Token, target, filters, options)`, and JSON capabilities
also support `Client.raw(Token, target, filters, options)`. The three snapshot
tokens return owned CSV text through their result handle. Their raw JSON helper
count is zero.

The two additional typed helpers have distinct constraints and behavior:

- `selections.company.detail` requests `profile`, requires an explicit company
  `id`, and returns `compatibility.CompanyDetailedBundle`.
- `selections.torn.stock` requests an individual stock, requires `stockId` or
  its explicit `id` alias, forces `/torn/{stockId}/stocks`, and returns
  `compatibility.TornStockBundle`. `selections.torn.stocks` returns summaries.

Exact operation identifiers retain their official names under `operations` and
are invoked with `Client.exact(Operation, parameters, options)`. Generated schema
names retain their official spelling; Zig keywords and unusual field names use
quoted identifiers. The manifest records literal APIs and result types instead
of inventing additional method names to reach an inventory count.

## Independent verification boundaries

Literal test groups cover all eligible generic selections without mandatory
target/filter inputs in nine resources, plus 32 explicit target/filter buckets.
Their 3,132 specified pair inputs and 41 complete group inputs each execute one
actual injected transport send. Separate cases check direct, standalone, CSV,
legacy, conflicting-category, and conflicting-ID routes. All 236 exact
operations, 209 typed helpers, 204 raw JSON helpers, three CSV channels, and 184
maintained v1 catalog entries are invoked at the injected transport boundary.

Expected routing comes from independently authored literal groups or a separate
official-contract oracle, rather than the planner's generated manifest. Mocked
responses and local transport tests do not prove every live game state, every
possible filter combination, or a complete authoritative v1 response schema.
