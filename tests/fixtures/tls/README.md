# Public TLS certificate fixtures

These files contain public certificate data only. No private keys or account information are included. The SDK implementation is independent; no external TLS implementation was incorporated.

Source repository: [chromium/badssl.com](https://github.com/chromium/badssl.com), pinned commit `bfc80f7c2bf0873e2fdc9ba79f38a5afd93570fb`.

| Local file | Original path | SHA-256 |
| --- | --- | --- |
| `badssl-self-signed.pem` | `certs/sets/prod/pregen/chain/wildcard-self-signed.pem` | `990c242d02a15d5a384d2625b4c1942e861ba5f18eaebd58116b85fbb5b49096` |
| `badssl-expired.pem` | `certs/sets/prod/pregen/chain/wildcard-expired.pem` | `c194779d77a90a4ad104d049cffd7a05656326c3cb2ddeb6fce7103082d67156` |
| `LICENSE.badssl` | `LICENSE` | `cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30` |

The source Apache License 2.0 is preserved verbatim in `LICENSE.badssl`. The fixture bytes are unmodified. Torn-Zig-SDK's code remains MIT licensed.

Independently inspected certificate fields establish the test expectations: the self-signed certificate covers `*.badssl.com` and `badssl.com`, with validity from August 8, 2016 to August 8, 2018. The expired leaf covers the same names and was valid April 9 through April 12, 2015. Tests use fixed UTC times inside/outside those intervals; they do not depend on today's clock or system trust contents.

`tests/tls_tests.zig` decodes PEM using Zig, verifies actual certificate signatures and trust/name/time failures, and sends independently constructed TLS 1.2 ServerHello and Certificate records from a local Zig socket server. That partial peer suffices to reach certificate rejection before key exchange, without incorporating a full TLS server or needing a private key. The SDK native transport also receives that real local TLS certificate and rejects it before origin authentication. A completed local successful TLS handshake is not claimed by this partial peer; the explicit public-contract proxy verification covers a real completed verified TLS connection separately.
