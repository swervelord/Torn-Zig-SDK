# Contract provenance

On October 25, 2026, the live official specification at
https://www.torn.com/swagger/openapi.json was fetched with the custom user agent
`Torn-Zig-SDK-audit/1.0`. Its version is 6.13.8; it contains 234 GET operations and
712 component schemas. Its 1,402,969 bytes have SHA-256
`7c4930218f15066a7d44c3666c3212ebc2a3b777e40754493ca89d092aef76d6`.
This exactly matches the supplied pinned snapshot. The Zig-native refresh tool
also fetched it successfully using the native standard-library HTTPS client and
received the same bytes.

Both supplied snapshot hashes were verified before generation. The historical
6.13.6 snapshot hash is
`dc04c6a03424da1d0361f29e80971d830115a23ddb1c47fbe5824fb54bb46ec4`.
Its semantic content was independently compared, using `tools/audit.zig`, with
`refs/specs/torn-openapi.json` at Torn-API documentation commit
`ac4ba829bbdbdc4ef5e058b48aae5088b9d5fd22`, retrieved through authorized GitHub
access. The documents are semantically equal despite differing formatting. That
documentation repository's provenance identifies the official source; this is
historical documentary evidence, not a second direct historical server fetch.
The availability of that documentation to unauthenticated consumers is not
assumed. The snapshots and recorded hashes are included for offline reproduction.

`spec/compatibility-models.json`, routing overrides, and v1 catalog are maintained
contracts supplied with the reference bundle. They are distinguished from
official schema evidence. Expected planner fixtures and model sample production
are separate test implementations; generated production outputs are never used
to manufacture golden expected responses.

The official Zig index https://ziglang.org/download/index.json identified 0.17.0
(October 1, 2026) as stable, while master identified a development release. The
Windows distribution was SHA-256 verified before extraction. CI pins version,
download URL, and official SHA-256 for each native platform. Standard-library
source from the hashed release was inspected for Io, HTTP, TLS, proxies,
concurrency, JSON, timing, allocator and build APIs.

Routing overrides explicitly address `faction/dirtbombs` versus direct
`dirtybombs`, `user/itemmod` versus direct `itemmods`, generic-only
`user/factionbalance`, and company `companies` enum/response mismatch. Generic
eligibility requires an associated generic response branch as well as enum
membership. Source inputs remain the reviewable authority for these overrides.
