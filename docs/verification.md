# Verification scope

Inventory completeness is distinct from branch coverage and from all possible
live game states. Ordinary checks do not contact Torn or read a private key.

Verification includes concrete layout/decoder/serializer instantiation for every
generated public model; independent schema-based acceptance data; 76 explicit
handwritten compatibility scenarios; 711 independently selected generic pairs
checked at the actual injected transport boundary; all 184 catalog memberships;
routing buckets and ID constraints; three CSV channels; structured partial
results; native HTTP/proxy/redirect/body/deadline tests; allocation-failure
campaigns; and a separate bounded mutation/property campaign.

The property campaign uses fresh operating-system entropy for 100,000 inputs,
200,000 exact numeric-domain checks, 100,000 path encoding checks, and JSON
decode/round-trip properties. Its measured run is recorded in
`docs/fuzz-evidence.json`. It is a bounded randomized property campaign, not
coverage-guided fuzzing or a proof of memory/thread safety.

Native operating-system checks, optimization checks, cross-compilation, and
fresh package installation are separate CI steps. Cross-compilation alone does
not establish runtime support. No unavailable sanitizer or race detector is
assumed. `std.testing.allocator` and systematic allocation failures check the
tested ownership paths. Client shutdown requires callers to cancel/join first.

Remaining evidence must be assessed from actual CI results and tests rather than
inferred from generated counts. In particular, positive/negative local TLS
certificate fixtures, an HTTPS CONNECT proxy exchange, need separate verification. A successful native
spec-refresh HTTPS request provides positive real TLS evidence, but does not
replace local certificate-error tests. Live tests must read only
`TORN_LIVE_TEST_API_KEY` and retain no account response fixtures.

The opt-in live check passed on October 25, 2026: a concrete profile/job batch
sent exactly one real HTTP request with split recovery, retries, and legacy
fallback disabled. No account response or credential was persisted. All 234 exact
operations are invoked offline against independently derived official paths,
parameters, media types, and response samples, with actual transport counts.
