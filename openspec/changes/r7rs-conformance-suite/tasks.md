## 1. Licensing (settled; verify before vendoring)

- [x] 1.1 Emit is MIT-licensed — `LICENSE` at the repo root, with a License section in `README.md` naming the third-party convention
- [x] 1.2 Confirm the vendored suite's license is compatible before copying it in (chibi-scheme is BSD-3-clause; MIT-licensed work may carry it provided the notice, conditions and disclaimer travel with the file)

## 2. Vendor the suite

- [x] 2.1 Create `test/r7rs/` and vendor `r7rs-tests.scm` from chibi-scheme byte-for-byte, with no header added (a header would break the checksum guard and the verbatim rule)
- [x] 2.2 Commit chibi-scheme's `COPYING` text as `test/r7rs/LICENSE.chibi-scheme`, and name it from the root README's License section (design D1)
- [x] 2.3 Add `test/r7rs/README.md` recording the upstream source, the vendored revision and date, the verbatim rule (design D1), where the license notice lives, and that local adaptation belongs in the harness and exclusion manifest
- [x] 2.4 Commit `test/r7rs/r7rs-tests.sha256` over the vendored file

## 3. The form-manifest generator (Chez-hosted)

- [x] 3.1 Write `tools/r7rs-manifest.ss`: a character scanner over the suite that tracks strings, character literals (including `#\(`), block comments, datum comments and bar-quoted symbols, and never calls `read` (design D2)
- [x] 3.2 Emit a committed form manifest: per form its section (from the suite's own `test-begin` grouping), its extent, a content-derived stable key, and its line number plus a text excerpt as commentary (design D3)
- [x] 3.3 Assert in the generator that the form extents tile the file with no gaps and no overlaps, failing loudly otherwise
- [x] 3.4 Verify the generator locates the file's tail correctly, including the bar-quoted-symbol tests around line 2268 that defeated the exploration's throwaway splitter, so the *Numeric syntax* and *6.14 System interface* sections are covered
- [x] 3.5 Narrate per `docs/OUTPUT.md`: inputs, outputs, form and section counts, on stderr
- [x] 3.6 Add a generation-freshness check (the `test/scheme-base-gen-check.sh` pattern) so an edited suite with a stale manifest fails with the regeneration command named

## 4. The harness

- [x] 4.1 Write `test/r7rs/harness.scm` in the subset Emit accepts (top-level `define-syntax` only, `guard`, `call-with-values`) providing `test`, `test-assert`, `test-begin`, `test-end`, `test-error`, `test-values`
- [x] 4.2 Compare inexact results approximately, to the precision the expectation was written at; compare everything else with `equal?` (design D5)
- [x] 4.3 Report a failure with its expression, expected value and obtained value; accumulate per-section pass and fail counts
- [x] 4.4 Confirm the harness does not shadow or collide with the suite's own helpers (`test-numeric-syntax`, `test-write-syntax`, `test-precision`, `test-round-trip`, `test-read-error`, `test-exception-handler-N`)

## 5. The exclusion manifest

- [x] 5.1 Define the manifest format: one entry per excluded form, keyed as in 3.2, with a reason from the closed set `deliberate` / `issue-NN` / `unimplemented` / `blocked-by`
- [x] 5.2 Populate it from a full discovery run (the growing-prefix scan described in the exploration), tagging each entry
- [x] 5.3 Tag the ~20 exact-rational, bignum and complex forms `deliberate` citing #27; tag the reader, hygiene, matcher, `case`, `apply`, comparison and mutable-pair forms with #74, #75, #77, #78, #79, #80, #81, #82
- [x] 5.4 Tag as `blocked-by` every form excluded only because a helper it references was excluded (the ~35 `any-arity`, `rest-arity`, `dead-clause`, `head`, `sequence1`-class cascades), naming the blocking form, so the gap count does not overstate itself
- [x] 5.5 Validate the manifest: every entry keys a real form, every reason is in the closed set, every `deliberate` and `issue-NN` entry cites an issue or spec

## 6. The runner

- [x] 6.1 Write `test/r7rs-suite-tests.sh`, Chez-free, consuming only the vendored suite and committed manifests; verify the checksum first and fail with the regeneration command on mismatch
- [x] 6.2 Assemble one program per section (harness + non-excluded forms in file order) and run each through the shipped `emit` binary, with a per-section timeout that names the section on hang
- [x] 6.3 Report per section: assertions passed, failed, forms excluded; plus a total, and a one-line summary per reason class so the exclusion set reads as design rather than as noise (risk mitigation)
- [x] 6.4 Fail on a regression: a non-excluded form that no longer compiles or runs, naming the form and the error
- [x] 6.5 Fail on a stale exclusion: an excluded form that now compiles, runs and passes, naming the form and instructing that the entry be deleted (design D4) — including for `deliberate` entries
- [x] 6.6 Follow `docs/OUTPUT.md`: narration on stderr, results on stdout, honour `EMIT_VERBOSITY`
- [x] 6.7 Add one `run_suite` line to `run-all-tests.sh`
- [x] 6.8 Confirm the whole suite runs with no `chez` on `PATH`, and record its wall-clock time

## 7. Self-evaluating vector and bytevector literals (issue #76)

- [x] 7.1 Add an arm to `parse-expr` in `src/parse.ss` treating a vector or bytevector datum in expression position as a constant, identically to the quoted spelling; every other datum still reaches the existing `else` error
- [x] 7.2 Verify `#(1 2 3)`, `#u8(1 2 3)`, `#()` and `#u8()` evaluate, and that `(equal? #(1 2 3) '#(1 2 3))` is `#t`
- [x] 7.3 Extend `test/record-type-syntax-tests.sh`-style coverage or add cases to the appropriate existing suite for the bare-literal forms

## 8. The missing `(scheme base)` procedures

- [x] 8.1 Vector bulk operations in `src/prelude.scm`: `vector->list` `vector-copy` `vector-append` `vector-fill!` `vector-copy!` `vector-map` `vector-for-each`, with optional ranges, bounds checks, and correct overlapping `vector-copy!`
- [x] 8.2 String and vector interconversion and bulk string operations: `string->vector` `vector->string` `string-map` `string-for-each` `string-fill!` `string-copy!`, codepoint-indexed and bounds-checked
- [x] 8.3 List operations: `assv` and `list-copy` (fresh pairs; non-pair returned unchanged; improper tail preserved). NOT `list-set!` -- it mutates a pair, which needs #82
- [x] 8.4 Predicates: `boolean=?` and `symbol=?` (both n-ary) in the prelude; `procedure?` via a new `%procedure?` primitive (runtime tag test + `*prims*` + `*integrable*` + emitter declaration), true for a primitive used as a value
- [x] 8.5 String ordering comparisons `string<?` `string<=?` `string>?` `string>=?`, n-ary and chained
- [x] 8.6 Bytevector bulk operations: `bytevector-copy` `bytevector-copy!` `bytevector-append`
- [x] 8.7 `read-error?`/`file-error?` are NOT in this change -- they need a kind field on the error object (issue #85); exclude their suite forms tagged to it
- [x] 8.8 `rationalize`, with the no-exact-rationals diagnostic for an exact call whose simplest answer is not an integer
- [x] 8.9 Declare all of the above in `src/prelude-surface.scm` with the right partition member, and regenerate `lib/scheme/base.sld`

## 9. Arity and n-ary widening

- [x] 9.1 Add the optional-fill entries for `make-string` and `make-vector` to `*integrable*`, base arity first so value-position use etas the existing form (design D7)
- [x] 9.2 Add the optional-range forms of `string-copy` and `string->list`
- [x] 9.3 Make `string=?` n-ary via the frontend rewrite that already reduces n-ary `<`/`=` to binary form, rather than a variadic runtime procedure
- [x] 9.4 Add the optional `compare` argument to `assoc` and `member`, called with the key first
- [x] 9.5 Confirm the emitted IR for existing one- and two-argument call sites is unchanged (`test/self-emit-equiv.sh`, and the committed-IR trust check)

## 10. Regen and verification

- [x] 10.1 Confirm every compiler-source edit is finished (`src/parse.ss`, `src/prelude.scm`, `src/prelude-surface.scm`) before starting the barrier
- [x] 10.2 `make regen` (~12 min); check whether the prelude ordering needs a second pass to converge
- [x] 10.3 `./run-all-tests.sh`, including the new suite; `test/scheme-base-gen-check.sh` and `test/scheme-base-surface-check.sh` must pass
- [x] 10.4 `./run-dev-tests.sh` (run suites individually if they outlive the command timeout); commit before `test/trust-check.sh`, which skips on a dirty `bootstrap/`
- [x] 10.5 Delete the exclusion entries that tasks 7-9 made stale, and confirm the suite reports them as stale first — that report is the evidence the tier closed what it claimed

## 11. Close out

- [x] 11.1 Update `test/r7rs/README.md` and the exploration doc with the post-change baseline (passed, failed, excluded per reason class)
- [x] 11.2 Comment the new numbers on #33; close #76 from the fixing commit (`Fixes #76`), and phrase any reference to a still-open issue without a closing keyword
- [x] 11.3 `docs/COMPLEXITY.md` deliberately NOT refreshed here: it records 12033 authored lines while `tools/complexity.sh` now reports 16686, so it is already stale by roughly 3600 lines of work predating this change. Refreshing it as part of this diff would attribute that drift to this change; it wants its own pass (`/complexity-catalogue`)
