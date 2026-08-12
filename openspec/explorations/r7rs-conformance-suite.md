# Exploration: the chibi R7RS test suite as an Emit conformance gate

Status: exploration (the vendoring step becomes its own change)
Related: GitHub issues #33 (the `(scheme base)` surface audit this measures) and #27 (the numeric
inventory, which decides what stays permanently excluded); the nine defects the measurement found,
#74-#82; `docs/r7rs/` (R7RS-small in markdown, the authority used for the export-list diff);
`test/numeric-conformance-tests.sh` (the closest existing suite in shape and intent);
`docs/OUTPUT.md` (the narration convention a new runner must follow).
Artifacts: `r7rs-conformance-suite/` beside this file holds the measurement tools and the recorded
run — `results.json` is the per-form record that seeds the change's exclusion manifest, and that
directory's README records the tools' known limits, which the numbers below inherit. The suite
itself is deliberately not vendored there — the vendored copy belongs in `test/r7rs/` with its
license notice and checksum — so that README carries the fetch command and the checksum of the
revision measured.
Captured: 2026-08-11

## The framing

`tests/r7rs-tests.scm` from chibi-scheme is 2516 lines and ~1035 top-level forms covering, in its
own words, "all procedures and syntax in the small language except `delete-file`". Two questions,
and they are separable:

1. **Can it run against Emit at all?** Not as written, and the reason is structural rather than a
   matter of missing names. This is the interesting half.
2. **What does it say about conformance?** Measured below: 506 assertions pass, 19 give a wrong
   answer, and 438 of 999 forms do not execute.

### Why an AOT compiler cannot just run the suite

The suite is written for an interpreter, where an unsupported form fails one test and the run
continues. Emit compiles a whole program before running any of it, so **one unsupported form
anywhere in the file kills every test in the file**:

```
   interpreter                          Emit
   ───────────                          ────
   read form 1 → eval → PASS            read all 1035 forms
   read form 2 → eval → FAIL            → parse → expand → passes → IR → link
   read form 3 → eval → PASS               ↑
   …                                       └── one bad form here: nothing runs at all
   1033 results, 2 failures                0 results
```

The first attempt made this concrete: `(test #(a b c) '#(a b c))` on line 50 aborts the entire
compilation with `parse: bad expression #(a b c)`, and nothing after it is measured. So the
question "which forms does Emit support" cannot be answered by running the suite — it has to be
answered *in order to* run the suite. That inverts the usual test-suite relationship and is the
single fact that shapes the whole design: **the exclusion manifest is architecturally required,
not a convenience for triage.**

## Method

A `(chibi test)` substitute (~40 lines, written in the subset Emit accepts: top-level
`define-syntax`, `guard`, `call-with-values`) providing `test`, `test-assert`, `test-begin`,
`test-end`, `test-error` and `test-values`. The suite's other helpers — `test-numeric-syntax`,
`test-write-syntax`, `test-precision`, `test-round-trip`, `test-read-error` and the
`test-exception-handler-N` procedures — are defined inside the suite itself and need nothing.

Then a **growing-prefix scan**, per section: start with an empty program, add forms in file order
in doubling chunks, and on failure halve the chunk until a single form is isolated. That form is
recorded with its error and skipped; the scan resumes. The acceptance criterion is "the program
compiles *and* runs to completion", which folds compile errors and runtime aborts into one
mechanism — `(test-error (apply + 3))` aborting the process is exactly as fatal as a parse error,
and needs the same treatment.

Working in file order matters: a form's dependencies are the forms before it, so the growing
prefix is precisely the context each form needs. Bisecting a section into independent halves
instead would report spurious `unbound variable` failures for every form whose helper `define`
landed in the other half.

Sections are the unit of parallelism (18 of them, run 8-way), which keeps each program small.
895 `emit run` invocations, about 12 minutes wall-clock.

## The measured baseline (2026-08-11, `build/emit` at 9b5875c)

| Section | forms | ran | excluded | pass | fail |
|---|---|---|---|---|---|
| 4.1 Primitive expressions | 29 | 27 | 2 | 25 | 0 |
| 4.2 Derived expressions | 80 | 32 | 48 | 29 | 0 |
| 4.3 Macros | 39 | 19 | 20 | 8 | 1 |
| 5 Program structure | 18 | 11 | 7 | 8 | 0 |
| 6.1 Equivalence | 27 | 27 | 0 | 25 | 0 |
| 6.2 Numbers | 212 | 170 | 42 | 155 | 1 (+13 harness) |
| 6.3 Booleans | 18 | 13 | 5 | 13 | 0 |
| 6.4 Lists | 55 | 43 | 12 | 44 | 0 |
| 6.5 Symbols | 17 | 13 | 4 | 13 | 0 |
| 6.6 Characters | 79 | 20 | 59 | 20 | 0 |
| 6.7 Strings | 130 | 37 | 93 | 37 | 0 |
| 6.8 Vectors | 43 | **3** | 40 | 3 | 0 |
| 6.9 Bytevectors | 39 | **6** | 33 | 6 | 0 |
| 6.10 Control | 36 | 17 | 19 | 12 | 3 |
| 6.11 Exceptions | 31 | 23 | 8 | 20 | 1 |
| 6.12 Environments | 4 | 0 | 4 | 0 | 0 |
| 6.13 Input/output | 60 | 34 | 26 | 37 | 0 |
| Read syntax | 82 | 66 | 16 | 51 | 13 |

Two honest caveats on those numbers:

- **13 of the 32 raw failures are the harness, not Emit.** The suite writes expected floats to 15
  digits (`(sqrt 2)` → `1.4142135623731`) because `(chibi test)` compares floats approximately.
  My harness used `equal?`. Emit's `1.4142135623730951` is the correct double. The real failure
  count is 19; a vendored harness must compare inexact results approximately, and the suite's own
  `test-precision` is the intended mechanism.
- **Coverage stops at line 2267.** The quick form-splitter written for the measurement does not
  handle `|bar-quoted symbols|`, so it swallowed the file's tail into one form. The *Numeric
  syntax* section (110 `test-numeric-syntax` cases) and *6.14 System interface* are unmeasured.
  Emit's reader handles bar-quoted symbols fine — this is a limitation of the throwaway Python
  splitter, and it is the first thing the real one must get right.

## After the change (2026-08-11)

`r7rs-conformance-suite` landed the suite and the cheap tier. It is now a gate in
`run-all-tests.sh` rather than a number in a document, and it reports **779 assertions passing, 0
failing, 791 of 1180 forms running, 389 excluded**.

Three sets of numbers get confused easily, so: the measurement recorded further down this document
covered **999** forms and found 506 passing, because the throwaway splitter dropped the file's tail.
The real gate, over all **1180** forms, read 635 passing / 529 excluded immediately before the
change and 779 / 389 immediately after. Compare the last two; the 506 is not comparable to
either.

What moved: self-evaluating literals (#76) freed 96 forms and took 6.8 Vectors from 3 of 43 forms
to all 43; the 27 added `(scheme base)` procedures and the optional/n-ary arities freed the rest of
the 140 the suite reported as stale exclusions the moment the fixes landed. Three names in the
"cheap tier" turned out not to be cheap: `procedure?` needed a primitive (added), while
`read-error?`/`file-error?` need a kind on the error object (#85) and `list-set!` needs mutable
pairs (#82).

Two defects the suite found only once it was running as a gate: accessors segfault on a
wrong-typed argument (#84) and the flonum print convention (#86).

## What the exclusions are made of

438 excluded forms, by cause:

| Cause | Forms | Disposition |
|---|---|---|
| Unbound name (81 distinct) | 278 | Mostly #33's inventory; ~35 are cascade (a helper `define` was itself excluded) |
| Bare `#(…)` / `#u8(…)` literal | 44 | One fix, #76 |
| Arity: an optional argument Emit requires or omits | 19 | #33's second table |
| Exact rationals, bignums, complex | ~20 | **Permanent**, per #27 |
| Non-top-level `define` / `define-syntax` | 11 | Expander scope |
| Datum labels, `#!fold-case` | 4 | #75 |

The **highest-leverage single fix is #76**, self-evaluating vector and bytevector literals: 44
forms, and the reason 6.8 Vectors runs 3 of 43 and 6.9 Bytevectors 6 of 39. The reader already
produces the right object — `'#(1 2 3)` works — so it is an arm in `parse-expr`, not new
machinery.

The cascade count matters for reading the table honestly: `any-arity`, `rest-arity`,
`dead-clause`, `head`, `sequence1`… are not gaps, they are references to helpers defined by an
excluded form. A vendored manifest should mark these as *blocked-by* rather than *unsupported*, or
the inventory will overstate itself.

## Defects found (all reproduced standalone, all filed)

The measurement's real yield. None of these were known:

| # | Defect |
|---|---|
| #74 | Reader: `#true`/`#false`, `#\alarm`/`#\backspace`/`#\escape`, `#\xHH`, string `\a`/`\b`, `\`-newline continuation |
| #75 | Reader: datum labels `#0=`/`#0#` and `#!fold-case` |
| #76 | `#(…)`/`#u8(…)` are not self-evaluating (44 forms) |
| #77 | `=` and `<` coerce an exact integer to `double`, wrong above 2^53 — inside the range Emit claims to represent exactly |
| #78 | `apply` accepts a non-list final argument and drops it silently |
| #79 | A `syntax-rules` template cannot reference a `define-record-type` binding |
| #80 | `_` in a `syntax-rules` literals list is still treated as a wildcard |
| #81 | `case` has no `=>` receiver clause |
| #82 | Pairs are immutable: no `set-car!`/`set-cdr!` |

#79 is the load-bearing one for planning. Probing whether the missing derived syntax could be
prelude macros rather than compiler work: `let-values`, `let*-values` and `case-lambda` all wrote
cleanly as `syntax-rules` macros in a test program. `delay`/`force` did not — a promise wants to be
a record, `delay`'s template must name the record's constructor, and that is exactly what #79
breaks. So one hygiene fix converts `(scheme lazy)` from compiler work into a prelude addition.

## Design for vendoring

### The bootstrap problem

The obvious implementation — write the splitter in Scheme and run it with Emit — does not work:
**Emit's reader cannot read the suite.** It contains `#\alarm`, `#\x03BB`, `1/3`, `#0=` and
`#!fold-case`, which is the very thing being measured. Nor should the runner depend on the
defects being fixed first, since its whole job is to report on them.

The resolution follows a pattern the repo already uses (`tools/gen-scheme-base.ss` →
committed `lib/**/*.sld`, guarded by `test/scheme-base-gen-check.sh`; and
`test/module-scaffold-baseline.sha256`): **a Chez-hosted generator produces a committed manifest,
and the runner consumes the manifest.** Chez reads the suite's lexical syntax without trouble, and
the generator scans characters rather than calling `read`, so it needs no datum-label support of
its own.

```
  tools/r7rs-manifest.ss   (Chez; scans chars, not read)
        │  emits line ranges per form + section
        ▼
  test/r7rs/forms.tsv          committed
  test/r7rs/exclusions.tsv     committed, hand-maintained: form -> reason
  test/r7rs/r7rs-tests.sha256  guards the manifest against a suite update
        │
        ▼
  test/r7rs-suite-tests.sh   (Chez-free; sed line ranges -> 18 programs -> emit run)
```

`run-all-tests.sh` stays Chez-free because it only reads committed artifacts, matching the split
that file's header already describes. 18 compilations is roughly 30 seconds, which is suite-sized
rather than the 12 minutes the discovery scan took.

### The exclusion manifest earns its keep twice

Each entry carries a reason tag — `deliberate` (with #27), `issue-NN`, `unimplemented`,
`blocked-by-<line>`. That makes the manifest the living form of #33's inventory. And checking it
in both directions turns it into a ratchet:

- a form that no longer runs but is not excluded → **failure** (ordinary regression)
- a form that is excluded but now *passes* → **stale exclusion**, reported by line

The second is what makes closing a gap self-announcing: fixing #76 should light up ~44 stale
exclusions at once, and the fixing commit deletes them.

### Chez as the value oracle

Where the suite's expectation is ambiguous or is implementation latitude rather than a
requirement, Chez decides. Two known cases:

- **Inexact results.** Rather than hardcoding the suite's 15-digit expectations, compare
  approximately (as `(chibi test)` does) and use Chez to confirm the reference value where a
  difference looks real rather than cosmetic.
- **Write conventions.** Emit prints `1000.0` as `1e+03` (`(display 1000.0)` → `1e+03`). This is
  *conformant* — R7RS only requires that `write` output read back as the same number, and
  `1e+03` does — and it is even the literal "shortest round-trippable decimal" the
  `numeric-conformance` change aimed at, since `1e+03` is shorter than `1000.0`. But the suite's
  *Numeric syntax* section tests write output against a list of accepted strings, and no other
  implementation prints this. Whether to match the convention or to record a divergence is an
  open policy question, not a defect — and it is unmeasured, since it lives in the section the
  splitter dropped.

## Sequencing

The order below is chosen so each step unblocks the next, not by size:

1. **Vendor the suite plus the manifest machinery** with today's exclusions. Nothing improves, but
   the baseline stops being a point-in-time number in a conversation and every later step gets a
   scoreboard.
2. **#76 (self-evaluating literals)** — one `parse-expr` arm, ~44 forms, and it is what makes the
   vector and bytevector sections mean anything.
3. **The cheap surface tier** — the ~30 ordinary prelude procedures and the arity table from #33.
   Mechanical, and the largest block of remaining exclusions.
4. **#74 (reader tables)** — mostly missing entries in three `cond`s, and it clears most of the
   19 real *Read syntax* failures.
5. **#79 (hygiene + `define-record-type`)** — then `(scheme lazy)`, `let-values`, `let*-values`
   and `(scheme case-lambda)` land as prelude macros rather than compiler changes.
6. **`(scheme char)`, ASCII subset** — 22 names, and the repo has already recorded that the
   substrate carries no Unicode tables, so the honest first cut is ASCII with the limit documented.
7. **#77, #78, #80, #81, #82** — small, independent, each with a standalone repro.

Deliberately not sequenced: binary ports and bytevector I/O (a coherent chunk of ~12 names that
wants its own change), `(scheme eval)`, and anything requiring bignums or exact rationals.

## Open questions

- **Licensing — settled 2026-08-11.** Emit is **MIT-licensed** (`LICENSE` at the repo root).
  chibi-scheme is BSD-3-clause, which MIT-licensed work may carry provided the notice, conditions
  and disclaimer travel with the file. Since the suite is vendored byte-for-byte, they cannot travel
  in a header, so the license text is committed beside it — the convention is recorded in the root
  README and made normative in the change's `r7rs-conformance` spec.
- **Vendor verbatim or patched?** Verbatim plus an exclusion manifest keeps upstream diffs
  reviewable and is what the manifest design assumes. The alternative — a patched copy that
  quotes its vector literals and pre-truncates its floats — would run more of the suite today
  but would silently absorb the very gaps this is meant to report.
- **Suite updates.** The sha256 guard forces manifest regeneration when the suite is refreshed,
  but exclusion *lines* shift. Keying exclusions by form index rather than line number is more
  stable; keying by a hash of the form text is more stable still and self-documenting in diffs.
- **Immutable literals.** R7RS 4.1.2 makes altering a constant an error. Emit lets `vector-set!`
  mutate a quoted vector literal today, and #76 and #82 both touch this. Worth one decision
  covering quoted vectors, bare vector literals and quoted lists rather than three.
