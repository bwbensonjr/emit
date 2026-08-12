## Why

Emit's R7RS conformance has never been measured against an external suite; each change has
verified its own slice, so nothing answers "what does the standard require that we do not do?" A
one-off run of chibi-scheme's `tests/r7rs-tests.scm` against `emit run` answered it — 506
assertions pass, 19 give a wrong answer, and 438 of 999 forms do not execute — and turned up nine
previously unknown defects (#74-#82). That number is worthless as a conversation and valuable as a
gate: it is exactly the audit issue #33 asks for, and it stops being point-in-time only if the
suite lives in the test tree. The measurement details are in
`openspec/explorations/r7rs-conformance-suite.md`.

Timing: cheap now, expensive later. `homebrew-tap-distribution` establishes SemVer at 0.1.0, after
which a missing `(scheme base)` name is a surface change rather than a gap being filled.

## What Changes

**The suite as a gate.**

- Vendor `tests/r7rs-tests.scm` from chibi-scheme **verbatim** under `test/r7rs/`. Verbatim is a
  requirement, not a preference: a patched copy that quoted its own vector literals would silently
  absorb the gaps the suite exists to report. Because the file stays byte-identical, its BSD-3-clause
  notice cannot be carried in a header — chibi's license text is committed beside it as
  `test/r7rs/LICENSE.chibi-scheme`, which is what BSD-3 condition 1 asks of a source
  redistribution. Emit is MIT-licensed, and MIT-licensed work may carry BSD-3 code on those terms.
- A Chez-hosted generator (`tools/r7rs-manifest.ss`) emits a committed manifest of the suite's
  top-level forms and their section, keyed stably rather than by raw line number so an upstream
  refresh does not invalidate every exclusion. It scans characters rather than calling `read`.
- A committed, hand-maintained **exclusion manifest**: one entry per form Emit cannot run, each
  carrying a reason tag — `deliberate` (with the issue that decided it), `issue-NN`,
  `unimplemented`, or `blocked-by-<form>` for a form whose only problem is that its helper was
  excluded. This manifest is the living form of #33's inventory.
- A Chez-free runner (`test/r7rs-suite-tests.sh`) that assembles one program per section from the
  manifests and reports pass/fail/excluded per section, wired into `run-all-tests.sh`.
- **The manifest is checked in both directions.** A form that stops running but is not excluded is
  an ordinary regression. A form that is excluded but now *passes* is a **stale exclusion** and
  also fails the suite, reported by form. That is what makes closing a gap self-announcing rather
  than something someone must remember to re-measure.
- A `(chibi test)` substitute harness written in the subset Emit accepts, comparing inexact
  results **approximately**. The suite writes expected floats to 15 digits because `(chibi test)`
  compares that way; an exact `equal?` reports 13 false failures where Emit's doubles are correct.
- A sha256 guard on the vendored suite, so refreshing it forces manifest regeneration
  (the pattern `test/module-scaffold-baseline.sha256` already establishes).

**The cheap conformance tier**, closed in the same regen cycle because `src/parse.ss` and
`src/prelude.scm` are both regen inputs and one cycle costs ~12 minutes plus two full test runs:

- **Self-evaluating `#(…)` and `#u8(…)` literals** (#76). R7RS 4.1.2 makes vector and bytevector
  constants self-evaluating; Emit requires the quote. One `parse-expr` arm, and the highest-leverage
  fix available: 44 excluded forms, and the reason 6.8 Vectors runs 3 of 43 forms and 6.9
  Bytevectors 6 of 39.
- **~27 ordinary missing `(scheme base)` procedures**, writable over existing primitives:
  `assv` `boolean=?` `symbol=?` `procedure?` `list-copy` `vector->list`
  `vector->string` `string->vector` `vector-map` `vector-for-each` `vector-copy` `vector-copy!`
  `vector-fill!` `vector-append` `string-map` `string-for-each` `string-copy!` `string-fill!`
  `string<?` `string<=?` `string>?` `string>=?` `bytevector-copy` `bytevector-copy!`
  `bytevector-append` `rationalize`. Plus `procedure?`, which needs one new primitive (a closure
  tag test) because nothing existing can answer it -- the only runtime edit in this change.
- **Arity gaps** where Emit binds the name but not the standard's signature: the optional fill of
  `make-string`/`make-vector`, the optional range of `string-copy`/`string->list`, n-ary
  `string=?` and the string comparisons, and the optional `compare` argument of `assoc`/`member`.
  19 excluded forms are these.

**Deliberately out of scope**, each for a stated reason:

- Bignums, exact rationals, `(scheme complex)` — permanently absent per #27; these get
  `deliberate` exclusions, not fixes.
- Binary ports and bytevector I/O (~12 names) — a coherent chunk that wants its own change.
- `read-error?` and `file-error?` — found during implementation to need a *kind* on the error
  object, which is a representation change rather than a library addition; filed as #85.
- `(scheme char)` — 22 names, and the Unicode-table question the repo has already recorded.
- `(scheme lazy)`, `let-values`, `let*-values`, `(scheme case-lambda)` — all become prelude macros
  once #79 is fixed, so they sequence behind it rather than into this change.
- The reader, hygiene, matcher, `case`, `apply`, comparison and mutable-pair defects #74-#75 and
  #77-#82 — each is independently filed with a standalone reproduction, and each will show up as a
  named exclusion here, which is the point.

## Capabilities

### New Capabilities

- `r7rs-conformance`: an external R7RS-small suite vendored as a gate — how it is vendored and
  attributed, how the form and exclusion manifests are generated and validated, what the runner
  reports, and the two-directional check (regression *and* stale exclusion) that makes the
  exclusion set a ratchet rather than a snapshot.

### Modified Capabilities

- `core-language`: vector and bytevector literals become self-evaluating in expression position
  (currently "Vector printing and reader syntax" covers the quoted form only); the standard-library
  surface grows the ~30 procedures above; and several existing requirements gain the standard's
  optional and n-ary arities ("String construction procedures", "String to character list",
  "String content equality", "Structural list search (member, assoc)", "Vector data type and
  operations").

## Impact

- **New**: `test/r7rs/` (vendored suite, harness, manifests, sha256), `tools/r7rs-manifest.ss`,
  `test/r7rs-suite-tests.sh`; one `run_suite` line in `run-all-tests.sh`.
- **Modified**: `src/parse.ss` (`parse-expr` literal arm; `*integrable*` arity entries),
  `src/prelude.scm` (the new procedures and the widened arities), `src/prelude-surface.scm` (their
  export declarations), and the generated `lib/scheme/base.sld` that follows from it.
- **Regen barrier**: `src/parse.ss` and `src/prelude.scm` are both in `CORE_FLAT`, so this is a
  `make regen` change — all compiler-source edits land before regen, then
  `./run-all-tests.sh` and `./run-dev-tests.sh`. `test/scheme-base-gen-check.sh` and
  `test/scheme-base-surface-check.sh` both constrain the surface additions.
- **Third-party code enters the tree for the first time.** chibi-scheme is BSD-3-clause; Emit is
  MIT-licensed (`LICENSE`), so the combination is fine provided chibi's notice, conditions and
  disclaimer travel with the file. This change establishes the convention for that — license text
  committed beside the vendored file, named from the README — since nothing has been vendored
  before.
- **Runtime**: 18 compilations, roughly 30 seconds added to `run-all-tests.sh`.
