//! Runtime constants (P8.7). `SDK_VERSION` is the single source of the package version:
//! `zig build audit` checks that build.zig.zon matches it, and every user agent uses it.
const current = @import("generated/current.zig");

/// Semantic version of this SDK package.
pub const SDK_VERSION = "0.4.0";
/// OpenAPI `info.version` of the embedded Torn contract.
pub const SPEC_VERSION = current.spec_version;
/// SHA-256 (hex) of the embedded contract bytes (`src/generated/current-contract.json`).
pub const SPEC_SHA256 = current.spec_sha256;
/// Default HTTP user agent.
pub const user_agent = "Torn-Zig-SDK/" ++ SDK_VERSION;
