# Optional SRFI sources

Import these libraries explicitly; they are not part of the baked prelude and
add no global SRFI feature identifiers. Query `(library (srfi N))` for resolver
availability. Project providers can override the installed sources.

SRFI 1 0.1.3, 2 0.1.1, 8 0.1.2 and 227 0.1.3 are unmodified snow-fort sources.
`upstream.sha256` pins their bytes (paths are repository-relative). Copyright
and MIT/MIT-0 notices remain in each implementation source.

SRFI 64 is an Emit port of Retropikzel's snow-fort 0.1.7 package:
https://snow-fort.org/s/iki.fi/retropikzel/srfi/64/0.1.7/srfi-64-0.1.7.tgz
Archive SHA-256: 85de19c0d3ef194c577241d72cfb9fa70ab979eb9f50aa6bab3e72cccc174f37.
Its MIT notices remain intact. Portable imports replace implementation/evaluator
branches, real approximate comparison uses absolute-error tolerance, and
`test-read-eval-string` explicitly raises an unsupported string-evaluation error.
Complex arithmetic is unsupported. All other runner/assertion code, including
nested includes, is retained; this is not a full SRFI 64 conformance claim.

The source repository retains the pristine package, reproducible patch,
upstream tests, per-file digests and complete acceptance details in `test/snow/`.
Installed programs do not depend on that test tree or any compiler artifacts.
