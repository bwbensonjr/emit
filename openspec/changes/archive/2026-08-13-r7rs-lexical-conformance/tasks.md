## 1. Flonum printing (#86) — the non-regen fix, done first

This is the only edit outside `CORE_FLAT`. It reaches the binaries through plain `make`, so it can be
written and validated on its own before the regen barrier closes.

- [x] 1.1 In `flonum_format` (`src/runtime/runtime.c:317`), keep the shortest-round-tripping `%.*g`
      search unchanged, then add the positional preference: when the chosen rendering used exponent
      notation and the value's decimal exponent lies in `[-3, 10)`, render positionally and accept
      that form **only if it survives the same `strtod` round-trip comparison** (design D6).
- [x] 1.2 Confirm the positional rendering cannot overflow the `snprintf(buf, 32, …)` bound at both
      ends of the range, and state the bound in a comment beside the range constants — the gate is a
      buffer constraint as well as a parity one, not a style preference.
- [x] 1.3 `make` and check `(display 100.0)` → `100.0`, `(display 1000.0)` → `1000.0`,
      `(display 0.001)` → `0.001`, `(display 1e300)` → exponent form, and that `write`,
      `number->string`, and the final-value printer all agree (they share `flonum_format`).
- [x] 1.4 Verify the round trip at the range edges: `(= x (read-from-string (number->string x)))`
      for values just inside and just outside both ends of `[-3, 10)`.
- [x] 1.5 Diff Emit's output against `chez`'s for the `1eN` and `1.5eN` series across `N` in
      `[-12, 25]`, and confirm the only remaining notation divergences are the two design D6 records as
      out of scope: `0.0001` vs `1e-4` at the low end, and `1e+10` vs `1e10` in exponent spelling. Both
      must be **unchanged from before this edit** — if either moved, the range is doing more than it
      should.

## 2. Reader lexical forms (#74) — `src/prelude.scm`

- [x] 2.1 `rd-hash`: accept `#true` / `#false` as well as `#t` / `#f`, consuming the whole token so
      nothing is left for the next read.
- [x] 2.2 `rd-char-name`: add `alarm` (7), `backspace` (8), `escape` (27), and the recorded extension
      `page` (12) — the last because design D8 makes its absence fatal once 2.4 lands, and
      `tools/r7rs-manifest.ss:104` already contains it.
- [x] 2.3 `rd-char`: add the `x<hex digits>` arm on the multi-character side, before the name table, so
      `#\x41` is `A` and `#\x03BB` is λ while bare `#\x` stays the letter `x` (design D2).
- [x] 2.4 `rd-char`: replace `rd-char-name`'s "unknown name → first character" fallback with the
      `rd-fail` sentinel, and add the matching `rd-report` arm naming the bad character name
      (design D1). The substrate cannot raise, so the report must arrive from the entry point.
- [x] 2.5 `rd-str-esc`: add `\a` (7) and `\b` (8) beside `\n \t \r`.
- [x] 2.6 `rd-string`: implement the R7RS §6.7 line continuation — backslash, optional intraline
      whitespace, newline, optional intraline whitespace, contributing no characters.
- [x] 2.7 `rd-nonfinite`: fold case when recognizing `+inf.0` / `-inf.0` / `+nan.0`, so `+INF.0` and
      `+NaN.0` read as numbers. Leave the printer emitting the lowercase spellings.
- [x] 2.8 Home every new `rd-*` helper in **both** the private list (`src/prelude-surface.scm:160`) and
      `*substrate-rehomed*` (`:286`), or `test/scheme-base-surface-check.sh` fails.
- [x] 2.9 Regenerate `lib/scheme/base.sld`, `lib/scheme/read.sld`, and `lib/emit/internal.sld` with
      `tools/gen-scheme-base.ss` if the surface moved, and commit the result.

## 3. `case` receiver clauses (#81) — `src/prelude.scm`

- [x] 3.1 Widen the `case` macro's literals list from `(else)` to `(else =>)`.
- [x] 3.2 Add the two receiver rules, each **before** the clause form it would otherwise be shadowed
      by: `((_ k ((d ...) => f) clause ...) …)` ahead of `((_ k ((d ...) e ...) clause ...) …)`, and
      `((_ k (else => f)) (f k))` ahead of `((_ k (else e ...)) …)`.
- [x] 3.3 Confirm the key is still evaluated exactly once when a receiver clause is selected — the
      compound-key rule already binds it to a temp, and the receiver must get that binding.

## 4. Literals-list precedence (#80) — `src/passes/expand.ss`

- [x] 4.1 `match-pat`: test literals-list membership **before** the `_` wildcard arm.
- [x] 4.2 `match-pat`: skip the ellipsis reading of `(p ... . tail)` when `...` is named in the
      literals list.
- [x] 4.3 `pattern-vars`: make the same two reorderings — the special-identifier arm and the ellipsis
      descent (design D5). All four sites move together; three clear no exclusion row and are fixed
      anyway because they are one question.
- [x] 4.4 Confirm the change is inert for empty and ordinary literals lists — no macro in the
      compiler's own sources names `_` or `...` as a literal, so emitted IR should not move at all.

## 5. Tests, written before the barrier

- [x] 5.1 `test/read-all-tests.ss`: the long booleans, the four R7RS control-character names, `#\xHH`,
      bare `#\x`, an unknown name reporting, `\a` / `\b`, and the line continuation.
- [x] 5.2 `test/numeric-conformance-tests.sh`: the case-insensitive non-finite tokens, and the flonum
      positional cases from 1.3 including the round trip at the range edges.
- [x] 5.3 `test/expander-tests.ss`: the `(_)`-literals case from the spec scenario, the
      ellipsis-as-literal case, and a control case with an empty literals list.
- [x] 5.4 Add `case` receiver coverage beside the existing `case` tests, including `(else => f)`, an
      ordinary-clause receiver, and the evaluate-the-key-once check.
- [x] 5.5 Iterate on 2–5 without regen via `chez --libdirs src --script src/compile.ss`, which
      `include`s the sources directly. Finish every compiler-source edit here.

## 6. The regen barrier

- [x] 6.1 Grep the tree once more for `#\<name>` occurrences that the new table would reject, now that
      the fallback is an error — the sweep behind design D8 found only `#\page`, but it should be rerun
      against the final table.
- [x] 6.2 `make regen` (~12 min). Run it to **convergence** — the reader and `case` are baked in as
      `*prelude-source*`, so the compiler that regenerates is not the compiler being generated, and
      this is the known two-pass condition. Do not kill it mid-flight: a mixed-source `bootstrap/` is
      recovered with `git checkout -- bootstrap/` on a clean tree.
- [x] 6.3 Make no further compiler-source edit until the suites have finished.

## 7. Retire the exclusions and verify

- [x] 7.1 Remove the 22 rows tagged `issue-74` (16), `issue-80` (1), `issue-81` (2), and `issue-86` (3)
      from `test/r7rs/exclusions.tsv`. Leave the four `issue-75` rows in place.
- [x] 7.2 `test/r7rs-suite-tests.sh` — it checks the manifest in both directions, so a row removed too
      early fails as a still-broken form and a row left behind fails as a stale exclusion. This is the
      definition of done for all four issues.
- [x] 7.3 `./run-all-tests.sh`.
- [x] 7.4 `./run-dev-tests.sh`. Its suites are independent, so run them individually if the batch
      outlives the command timeout (~1470s total). Watch `--dump parity vs chez` in particular: it
      compares Emit's dump against Chez's, and the flonum change should move parity toward agreement.
- [x] 7.5 Investigate any emitted-IR movement attributable to task 4 rather than accepting it — per
      4.4 the expander change should be inert. **Evidence**: every `syntax-rules` literals list in the
      compiler's own sources is one of `()` (19 uses), `(else =>)` (6), `(unquote)`, or `(else guard)`
      — none names `_` or `...`. (The lone `(syntax-rules (lit ...)` hit is a *comment* at
      `src/passes/expand.ss:37` describing the shape, not a literals list.) So `ellipsis-at?`'s guard
      is always true here and the literals-first reorder can only fire for a literal spelled `_` or
      `...`, which never occurs. Task 4 is inert by construction; all `bootstrap/` movement is
      attributable to tasks 2 and 3, which are baked into `(scheme base)`.

## 7b. Fallout the suite found (added during implementation)

- [x] 7b.1 `sym_needs_bars` (`src/runtime/runtime.c`) compared the three non-finite spellings
      case-**sensitively**, mirroring the old reader. Task 2.7 broke that mirror: `+NaN.0` now reads
      as a number, so `(write '|+NaN.0|)` emitted bare text that no longer read back. Made the
      comparison case-insensitive via a local `ci_streq` (design D10). Runtime-only, so plain `make`
      — the regen barrier is untouched.
- [x] 7b.2 Two further rows were stale that the tag-based sweep in 7.1 could not see: `"+NAN.0"` and
      `"-iNF.0"` were tagged `unimplemented`, not `issue-74`, and task 2.7 fixed them. Removed.
      Net: 386 → 363 exclusions.
- [x] 7b.3 `(write '|+NaN.0abc|)` differs from chibi, and checking R7RS 7.1.1 shows the bare spelling
      is a legal peculiar identifier that round-trips — so it is a `deliberate:` row with the grammar
      derivation in its note, NOT a filed defect (design D11).
- [x] 7b.4 `test/module-scaffold-baseline.sh` is a recorded-hash byte-identity guard and all 80 demo
      hashes moved. Classified before accepting, using the before/after method its own header
      documents (detached worktree at `ae08eff`, `make emit` from committed IR, split at
      `; ==EMIT-UNIT-BOUNDARY==`): the drift is confined to the three library units this change
      edits — `(emit internal)` +38257 B, `(scheme base)` +2161 B, `(scheme read)` +2075 B — and
      **every demo's own program module is byte-identical**, with all 80 stdouts unchanged.
      Regenerated the baseline and recorded the analysis in the script's header.

## 8. Record and close

- [x] 8.1 Update the reader-limitations paragraph in **`docs/PROJECTS.md`** ("Lexical syntax").
      NOT `docs/r7rs/*` as this task originally said — that directory is the R7RS report vendored
      verbatim, so it carries no claims of Emit's own to correct.
- [x] 8.2 Record the two user-visible behavior changes in the proposal's "For the first tag's
      release notes" section, which is where this repo collects them (there is no central notes
      file): an unknown character name now reports instead of yielding its first letter, and a round
      flonum prints `100.0` where it printed `1e+02`.
- [x] 8.3 Commit, then run `test/trust-check.sh` — it `[SKIP]`s while `bootstrap/` is dirty by design,
      so it is a post-commit check.
- [x] 8.4 The commit carries `Fixes #74 / #80 / #81 / #86`, so they close when the branch merges.
      #75 and #92 stay open. Filed the write-style follow-up from design D9 as **#94** (write emits
      a raw control byte where the reader now accepts a name). Not pushed — the branch
      `feat/r7rs-lexical-conformance` is local, awaiting review.
