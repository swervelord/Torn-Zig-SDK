# Model contracts and verification

`torn.current` contains the 712 official 6.13.8 component declarations;
`torn.frozen` contains the 711 official 6.13.6 declarations; and
`torn.compatibility` contains 549 maintained declarations. Their names,
public API locations, source evidence, and all 234 exact operation
parameter/result contracts appear in `model-coverage.json`.

The generated operation descriptors expose `Params` (also `Parameters`),
`Response`, `path`, `operation_id`, `method`, `media_type`, and the source
operation contract. Response objects provide direct typed fields; nullable
required fields use `?T`, while optional official fields use
`model.Presence(T)` with `absent`, `null`, and `value` states. Maps contain
typed `entries` and a `get` accessor. Unions expose actual Zig tagged
alternatives (`v0`, `v1`, and so forth) in source branch order.

The decoder selects a successfully decoded union branch with the greatest
nested recognized-field coverage, retaining source order for ties. Literal
enum fields constrain branches. This avoids a permissive earlier object
branch silently discarding fields belonging to a later, more specific
branch. Compatibility competition, employment, trade, and warfare unions
add explicit discriminator/shape rules and permitted unknown variants.
Overlapping official enum-or-string `oneOf` contracts use compatible
any-match validation: documented enum strings match both declared branches.

`contracts.decodeCurrent` and `contracts.decodeFrozen` validate the full
corresponding official schema in addition to concrete typed decoding.
`contracts.decodeNamed` accepts an explicit schema name. Use the named API
for scalar/domain aliases: Zig aliases of the same integer or string type
share type identity, so reflection alone cannot distinguish their different
source constraints. Client exact operations retain the operation contract
needed to select the response schema explicitly.

`model.decode` provides concrete structural decoding; it does not by itself
apply every official source constraint. Compatibility structs deliberately
apply maintained defaults, aliases, canonical keys, flattened extras, and
custom position/string-like/company-news normalization. Supplying both a
canonical key and its alias produces `AliasCollision`, even for equal
values. Unknown official fields remain in the owned result's raw tree.

An owned result retains every borrowed string and buffer until `deinit`.
`originalJson` serializes the retained original input.
`toJson` serializes the current typed value, preserving retained unknown
fields and canonicalizing maintained aliases. `model.stringify` serializes
a standalone typed value, without an original input tree. Presence states,
exact integer values, untagged JSON union payloads, map objects, and numeric
enums are handled explicitly. Compatibility trade serializers restore the
wire discriminator and flatten the variant's stored extra fields.

The three required-but-unspecified current properties remain required raw
JSON values: `ReportStockAnalysis.items[].item.stock`,
`UserCrimeDetailsBootlegging.dvd_copies`, and `UserTrade.items`. This does
not impose invented value types. Open log values and explicitly maintained
unknown variants also retain raw values. Current elimination requires
`captains`; a payload containing only historical `leaders` is rejected.

## Evidence

`src/model_contract_tests.zig` independently constructs expectations from
the authoritative snapshots. Its fixture producer is separate from the
generator and decoder and never derives goldens from implementation output.
It checks three boundary variants for every component, then every root
union alternative and every literal of all 86 named enum components:
7,423 current and 7,419 frozen acceptance/typed-roundtrip
samples. Cases include missing optional fields, nullable alternatives,
empty/nonempty arrays, named enums, exact integers above 2^53, and required
unconstrained properties. The tests compare serialized concrete typed values
against the independently constructed values. This campaign caught a real
overlapping mission-details union data-loss defect.

`src/compatibility_tests.zig` contains 76 explicit handwritten boundary
scenarios, plus additional branch-accessor, all-trade-discriminator,
serialization-mutation, flattened-extra, and allocation-failure tests.
`src/generated_checks.zig` explicitly instantiates all generated layouts and
decoders. The acceptance campaign also instantiates their serializers.

These inventories do not claim every nested branch combination, every
possible game state, or 100% branch coverage. Singleton schemas naturally
have fewer than three distinct valid values. The structural oracle is
contract-derived, while compatibility input/expected scenarios are
handwritten; both evidence sources are retained separately.

`typing-report.json` lists all 1,938 recorded raw-value locations: 788
current, 787 frozen, and 363 maintained compatibility locations. These
include permissive unknown fields retained by the owned raw tree, not just
explicit raw-valued fields. Explicit open objects use `Map(Raw)` so their
object domain is concrete. Maintained exact-number branches use
`model.ExactNumber { lexeme }`, which accepts only valid JSON numbers and
preserves their notation without conversion through floating point.

Checked decode, validation, and serialization APIs accept an optional
`model.Checkpoint` callback that can return `Canceled` or `Timeout`. It runs
before/after synchronous JSON scanning/emission and between recursive
conversion/validation/serialization nodes. Partial arenas and output
buffers are cleaned up on cancellation. The standard library scanner and
emitter perform synchronous spans between checkpoints; there is no
instruction-level interruption guarantee inside those spans.
