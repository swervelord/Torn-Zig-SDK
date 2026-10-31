//! Torn API SDK. All owned handles must be released using deinit().
pub const model = @import("model.zig");
pub const current = @import("generated/current.zig");
pub const frozen = @import("generated/frozen.zig");
pub const compatibility = @import("generated/compatibility.zig");
pub const operations = @import("generated/operations.zig");
pub const planner = @import("planner.zig");
pub const runtime = @import("runtime.zig");
pub const transport = @import("transport.zig");
/// Torn error codes, policy table and helpers (P5).
pub const errors = @import("errors.zig");
pub const TornErrorCode = errors.TornErrorCode;
pub const AccessLevel = planner.AccessLevel;
/// Torn URL builders and time helpers (P8.6).
pub const helpers = @import("helpers.zig");
/// Consumer test kit: scripted mock transport, virtual clock, fixtures (P8.5).
pub const testing = @import("testing.zig");
const version = @import("version.zig");
/// Package version (single source; also used in the default user agent).
pub const SDK_VERSION = version.SDK_VERSION;
/// OpenAPI version of the embedded contract.
pub const SPEC_VERSION = version.SPEC_VERSION;
/// SHA-256 of the embedded contract bytes.
pub const SPEC_SHA256 = version.SPEC_SHA256;
test {
    _ = model;
    _ = planner;
    _ = runtime;
    _ = transport;
    _ = errors;
    _ = helpers;
    _ = testing;
}
pub const client = @import("client.zig");
pub const Client = client.Client;
pub const selections = @import("generated/selections.zig");
pub const contracts = @import("contracts.zig");
pub const schema = @import("schema.zig");
test {
    _ = client;
    _ = @import("generated_checks.zig");
}
test {
    _ = contracts;
    _ = schema;
}
test {
    _ = @import("client_tests.zig");
    _ = @import("planner_cases.zig");
    _ = @import("compatibility_tests.zig");
}
test {
    _ = @import("exact_checks.zig");
    _ = @import("operation_tests.zig");
    _ = @import("model_contract_tests.zig");
    _ = @import("helper_tests.zig");
    _ = @import("execution_tests.zig");
    _ = @import("api_614_tests.zig");
    _ = @import("api_615_tests.zig");
    _ = @import("parity_tests.zig");
}
