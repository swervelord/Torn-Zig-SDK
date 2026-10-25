# Runtime, ownership, and configuration

The SDK uses Zig 0.17.0 `std.Io`. Calls are synchronous from the caller's perspective; cancelable I/O and a concurrent timer task enforce each HTTP attempt's timeout. Supply a concurrent backend such as `std.Io.Threaded`. A backend without concurrency returns `ConcurrencyUnavailable`; the SDK does not pretend to enforce an unavailable timeout.

`runtime.Client.init(allocator, io, config, transport)` clones credentials, route strings, base URLs, and the user agent. Keep the client at a stable address. Simultaneous callers share its quota counters and semaphore. Its allocator must be thread safe; do not pass a shared, unsynchronized scratch arena. Each transport response owns its body and route name and provides `deinit`. Typed executions keep their own arena and retain all borrowed model strings until execution/result `deinit`.

Finish or cancel and join every caller before destroying a client. The client does not own the application's Io backend or caller tasks. An execution/result may move between threads when its allocator supports that use, but mutation or destruction must not race another reader. An owned response/result can outlive the client.

## Defaults and environment

These are configurable SDK policies, not permanent Torn service limits:

| Policy | Default |
| --- | --- |
| HTTP attempt timeout | 30 seconds |
| Attempts | 3 |
| Linear retry base | 250 milliseconds |
| Shared in-flight sends | 8 |
| Calls per unique key per minute | 100 |
| Calls per named route per minute | 1,000 |
| Response body limit | 64 MiB |
| Default route | `direct`, without an inferred environment proxy |

`Client.initFromEnvironment(allocator, io, environ_map, transport)` reads an explicit environment snapshot. `TORN_API_KEYS` accepts comma, semicolon, or newline separated credentials and takes precedence over `TORN_API_KEY` whenever present, including an empty value. Credentials are trimmed and deduplicated; duplicate credentials share one quota counter. No credentials produces `NoApiKeys`.

| Environment variable | Config field |
| --- | --- |
| `TORN_API_BASE_URL_V2` | `base_url_v2` |
| `TORN_API_BASE_URL_V1` | `base_url_v1` |
| `TORN_HTTP_TIMEOUT_SECS` | `attempt_timeout_ms`, seconds converted with overflow checking |
| `TORN_USER_AGENT` | `user_agent` |
| `TORN_MAX_ATTEMPTS` | `max_attempts` |
| `TORN_NETWORK_RETRY_BACKOFF_MS` | `backoff_ms` |
| `TORN_RATE_LIMIT_PER_KEY_PER_MIN` | `per_key_per_minute` |
| `TORN_RATE_LIMIT_PER_IP_PER_MIN` | `per_route_per_minute` |
| `TORN_MAX_IN_FLIGHT` | `max_in_flight` |

Numeric environment settings require positive decimal digits; signs, whitespace, suffixes, zero, and overflow fail explicitly. Base URL environment settings require HTTP or HTTPS and reject credentials, query strings, and fragments. No additional aliases are silently read.

## Quotas, retry, and cancelation

Accounting belongs to one client in this process. Separate clients, other processes, and external applications do not share counters. Credentials rotate in order. Counters reset at absolute wall-clock minute boundaries. Named routes spill over in configured order unless `Options.route` pins an index. The caller must give each route the correct egress identity: differently named routes sharing one public IP are separate local counters and cannot guarantee a service-wide IP limit. The default direct route intentionally does not read system proxy variables.

Quota sleepers release the semaphore, so an exhausted pinned route cannot occupy the only permit and block an available route. Network retry backoff also releases its permit. The accounting reservation is charged before the transport call; a canceled or failed attempt may consume a local quota slot. Reports are successful contributions and are not a total-attempt counter.

Retries cover transport failures, HTTP 408/429/500/502/503/504, and Torn codes 5/8/9 within the attempt budget. Allocation failure, cancelation, and an oversized response are terminal. The delay is the larger of the linear backoff and `Retry-After`; both delta-seconds and preferred IMF-fixdate are supported. Malformed retry dates are ignored. Per-request options override attempts, timeout, pinned route, and an absolute outer `deadline_ms`. The outer deadline includes quota waits, semaphore waits, retries, and network I/O. Caller-side serialization can use the public `Client.check(options)` to observe cancelation and that deadline.

The timer race cancels and joins the losing task. Completed allocated responses from a race are explicitly drained and released. Semaphore, quota, backoff, and native network/body-read paths use the backend's cancelation facilities. The application cancels its surrounding Io task to cancel a call. Scheduler injection supplies a clock and wait callback for deterministic tests; callbacks must remain cancelable. Route observer callbacks run outside the accounting lock and must be thread safe, fast, and non-reentrant with respect to the client.

## Transport and credential handling

The default transport uses `std.http.Client` for HTTP, TLS with system trust roots, and HTTP proxies. The inspected Zig 0.17.0 source passes an explicit remote hostname and CA bundle into TLS verification (`lib/std/http/Client.zig`, Connection.Tls.create); the TLS client verifies the leaf hostname and chain (`lib/std/crypto/tls/Client.zig`). It sends the API key in the `Authorization: ApiKey ...` header. Redirect responses are returned without following them. A declared or streamed oversized JSON or CSV body fails `ResponseTooLarge`; no partial body is returned as successful output. The transport requests identity encoding and explicitly rejects unexpected compressed responses.

HTTP proxy URLs are configured per named route. Plain HTTP uses absolute-form targets. HTTPS through a proxy currently fails `SecureProxyUnsupported` before connecting or sending any credentials: the inspected Zig 0.17.0 CONNECT helper returns a connection using the proxy protocol without upgrading the tunnel to the target TLS protocol. Until a verified secure tunnel implementation is added, silently using that path would risk forwarding application authentication without target TLS. Percent-encoded credentials in supported HTTP proxy URLs become Basic proxy authentication; a colon in the decoded username is rejected because Basic authentication reserves it as a separator. The native transport owns each request/client lifetime; it does not wrap a command-line HTTP program.

Credential-bearing Config, Client, and transport Request implement redacted `{f}` formatting and JSON serialization hooks. Do not use Zig's explicit generic `{any}` introspection on objects holding credentials: that formatting mode bypasses custom formatters and exposes fields by design. The SDK itself does not log credentials or format request URLs into errors. Never serialize credentials manually or place them in query filters. Injectable transports must obey the same confidentiality and body-size contracts.

## Verified evidence and limitations

Native Windows tests exercise real local HTTP, a local plain HTTP proxy with Basic authentication, non-forwarded redirects, explicit oversized-body rejection, cancelation during a stalled real HTTP body, and rejection of a malformed TLS peer before application authentication. Deterministic tests verify unique-key rotation, minute reset, retry delay precedence, quota sleeper fairness across routes, permit cleanup, environment validation, and owned response lifetimes. Systematic allocation-failure tests cover client construction and mocked execution/body/retry inspection. Tests are offline and use synthetic credentials.

These tests do not establish race freedom, full branch coverage, every network failure, or all acceptance requirements. Local TLS certificate fixtures remain an evidence gap; secure HTTPS proxy tunneling is explicitly unsupported. The standard library provides a TLS client, not a TLS server suitable for constructing certificate fixtures directly. No unsupported sanitizer flag or race detector is claimed.

Zig 0.17.0 optimization names are `debug`, `safe`, `fast`, and `small`: for example, `zig build test -Doptimize=safe`. These correspond to the familiar debug, optimized-with-safety, optimized-for-speed, and optimized-for-size behaviors. This project tests runtime behavior with safety disabled as well as enabled.
