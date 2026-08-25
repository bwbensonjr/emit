## Why

Pitch is presently tied to Chez Scheme's R6RS environment, but its portable core exercises several facilities that R7RS-small also requires and Emit does not yet provide. Closing that intersection before porting Pitch gives the port a standards-based target, improves Emit's measured conformance, and keeps R6RS-only or operating-system-specific compatibility work out of Emit's language surface.

## What Changes

- Record a source-based Pitch prerequisite audit that distinguishes five genuine R7RS-small gaps from Pitch changes that remain the port's responsibility.
- Add the complete `(scheme case-lambda)` library, including fixed, dotted, and rest-only clauses with first-match dispatch; cover the clause shapes Pitch uses and resolve the related frontend failures tracked by issue #91.
- Add the complete Unicode-aware `(scheme char)` library. Pitch directly needs character classification and case folding for its lexer; Emit will provide the full R7RS-small library rather than an ASCII-only subset.
- Add `raise-continuable` with correct handler-chain and dynamic-extent behavior, which Pitch's tolerant reader uses to report a warning and continue.
- Add the complete `(scheme process-context)` library. Standalone executables and `emit run` will expose program arguments consistently, `exit` and `emergency-exit` will communicate status correctly, and environment access will complete the R7RS surface.
- Add the complete `(scheme write)` library, preserving the existing cycle-aware `write` behavior while adding `write-simple` and sharing-preserving `write-shared`.
- Register, build, install, and test the new standard libraries through the ordinary module/artifact path; remove every conformance-suite exclusion made stale by the implementation.
- Add a focused prerequisite test using the exact facility shapes Pitch relies upon, without modifying or vendoring Pitch as part of this change.
- Explicitly leave R6RS condition composition, record inheritance/protocols, R6RS hash-table APIs, sorting helpers, bitwise arithmetic, fixnum APIs, arbitrary-size numeric token values, directory traversal, symlink inspection, and atomic rename to the later Pitch port. These are not R7RS-small gaps even though Pitch currently uses them.

## Capabilities

### New Capabilities

- `case-lambda`: The `(scheme case-lambda)` library and arity-based clause selection semantics.
- `character-library`: The full Unicode-aware `(scheme char)` classification, case conversion, case-insensitive comparison, and digit-value surface.
- `process-context`: Command-line, process termination, and environment access through `(scheme process-context)`, with development-to-standalone parity.
- `write-library`: The `(scheme write)` partition and the distinct sharing contracts of `write`, `write-simple`, and `write-shared`.

### Modified Capabilities

- `dynamic-extent`: Add continuable exception delivery and restoration of the current handler when the handler returns.
- `emit-cli`: Add an unambiguous way for `emit run` to forward program arguments while retaining strict tool-option validation.

## Impact

This affects the prelude/compiler sources and therefore requires the full bootstrap regeneration barrier, the C runtime and standalone entry point, the `emit run` host, standard-library sources and manifest/install layout, generated Unicode data, conformance exclusions, and focused AOT/JIT/module tests. The implementation adds no runtime library dependency; Unicode tables are generated and committed in a deterministic representation whose binary-size impact is measured. Pitch itself and its repository remain unchanged.
