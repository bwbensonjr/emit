# Proposal

## Why

The archived `srfi-1-library-composition` change makes selected SRFI 1/227 cases
work, but users still import test fixtures, upstream suites cannot run without
SRFI 64, and `emit lib` outputs are not actually reusable through manifests.
Finish that workflow and its recorded verification gaps before expanding the SRFI
catalogue.

## What Changes

- Ship the pinned SRFI 1, 2, 8, and 227 sources as ordinary, explicitly imported
  libraries under `lib/srfi/`, available in checkouts and installations. Preserve
  upstream bytes, notices, and provenance; retain fixture coverage.
- Add an ordinary `(srfi 64)` library using a documented Emit port of a pinned
  upstream implementation. Support real-number approximate comparisons and the
  runner/assertion API needed to execute the four complete upstream package suites.
  Explicitly diagnose unsupported `test-read-eval-string`; do not add a fake
  `(scheme eval)` or claim complete SRFI 64 conformance.
- Run the existing upstream SRFI 1/2/8/227 test files unchanged. Assert test counts
  and runner failures as well as process status, since those files end in `(exit 0)`.
  Retain focused REPL, macro composition, and standalone executable acceptance.
- Close [#123](https://github.com/bwbensonjr/emit/issues/123): define versioned,
  source-validated explicit artifacts, publish them with `emit lib`, and consume
  compatible Emit-produced artifacts through manifest directories in native
  commands. Chez remains an independent verification host, not an interchange
  producer or consumer for these artifacts.
- Close [#125](https://github.com/bwbensonjr/emit/issues/125): pin effectful lowering
  traversal order and restore full `(scheme base)` IR equivalence across hosts.
- Close [#128](https://github.com/bwbensonjr/emit/issues/128): normalize internal
  procedure definitions before expanding their initializers, preserving dotted
  and rest-only formals, lexical keyword shadowing, and internal mutual scope.
  This enables SRFI 64's internal variadic callback without modifying upstream code.
- Close [#129](https://github.com/bwbensonjr/emit/issues/129): allow captured escape
  continuations to return zero, one, or multiple values, preserving cleanup,
  parameter restoration, and the existing escape-only lifetime restriction.
- Close [#130](https://github.com/bwbensonjr/emit/issues/130): escape string literals
  in the shared datum renderer so exported macro interfaces survive serialization,
  including quotes, backslashes, control characters, and shared string objects.
- Close [#131](https://github.com/bwbensonjr/emit/issues/131) as part of the planned
  unwritable-cache fallback: do not capture native objects under an empty cache
  key, preventing collisions between baked and ordinary-library capture groups.
- Close [#117](https://github.com/bwbensonjr/emit/issues/117) and
  [#126](https://github.com/bwbensonjr/emit/issues/126): use the supported `lli`
  dynamic-library option and preserve/assert REPL child status and diagnostics.

Non-goals: general Snow/package-manager integration, automatic downloads, every
SRFI, source-free or cross-target binary packages, a larger baked prelude, general
`eval`, complex arithmetic, full syntax-object hygiene, Chez/native artifact
interchange, a shared compiler-source fingerprint, or unrelated issue cleanup.
Import conflict policy (#118) and integrated primitive/keyword aliases (#119)
remain explicitly deferred; this change retains current import compatibility.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: remove the base-IR parity exception and add bounded SRFI 64 and
  complete upstream package-test acceptance, including internal procedure
  definition semantics required by library bodies.
- `artifact-cache`: reusable native Emit full-unit artifacts, versioned compatibility
  metadata, dependency freshness, atomic publication, and observable consumption.
- `distribution`: selected SRFI sources, nested includes, and notices ship as
  optional libraries, discoverable through the existing provider hierarchy.
- `dynamic-extent`: zero/multiple-value delivery through live escape continuations,
  with the existing expiration and unwinding rules preserved.

## Impact

Shared datum rendering (`src/core.ss`), expansion (`src/passes/expand.ss`) and lowering (`src/passes/lower.ss`), native artifact production/loading
(`src/emit.cpp`), Chez JIT commands (`src/compile.ss`) and independent parity tests,
`src/prelude.scm` and its generated library sources, `lib/srfi/`, `Makefile` install payload, package/composition/backend/interactive
test suites, and library documentation. There is no additional runtime dependency
for delivered executables. Old artifact metadata is a miss and recompiles from
source. Explicit artifacts use the existing native executable identity, accepting
conservative invalidation after rebuilding or relinking Emit. Private native
machine-code cache identities remain unchanged; no regeneration-owned compiler
identity file is introduced.

The design records review of the original 15 open GitHub issues and adds #128 and
#129 and #130, discovered and approved during implementation, plus #131 found
within the scheduled unwritable-cache acceptance. It sequences the eight scheduled
fixes ahead of package acceptance. Implementation requires
the compiler-source regeneration barrier and both complete test runners.
