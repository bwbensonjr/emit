## Context

`openspec/explorations/r7rs-conformance-suite.md` records the measurement this change productizes:
chibi-scheme's `tests/r7rs-tests.scm` run against `emit run` by a throwaway Python driver, giving
506 passing assertions, 19 wrong answers, 438 non-executing forms, and nine new defect issues
(#74-#82). This change turns that one-off into a committed gate and closes the cheapest tier of what
it exposed.

Three constraints shape every decision below.

**Emit compiles whole programs.** An interpreter runs the suite form by form, so an unsupported form
costs one test. Emit parses, expands and links the whole file before running any of it, so one
unsupported form costs *every* test in the file — the first attempt died on line 50 (`'#(a b c)`) with
nothing measured. The exclusion manifest is therefore load-bearing infrastructure, not triage
bookkeeping.

**Emit's reader cannot read the suite.** It contains `#\alarm`, `#\x03BB`, `1/3`, `#0=` and
`#!fold-case` — the very gaps being measured (#74, #75, #27). Anything that must parse the suite
cannot be an Emit program, and must not wait on those defects being fixed.

**`run-all-tests.sh` is Chez-free by design** (its header states the split: shipped binaries there,
Chez-bound suites in `run-dev-tests.sh`). A new suite must not break that.

## Goals / Non-Goals

**Goals:**

- The suite runs in `run-all-tests.sh`, Chez-free, in seconds rather than minutes.
- Every form Emit cannot run is declared with a reason, making the manifest the living form of #33's
  inventory.
- Closing a gap announces itself: the manifest is checked for staleness, not only for regression.
- The vendored suite stays byte-identical to upstream, so its verdicts are not quietly softened.
- The cheap tier is closed: self-evaluating literals, ~30 prelude procedures, the arity gaps.

**Non-Goals:**

- Passing the whole suite. Bignums, exact rationals and complex numbers are permanently absent
  (#27); those forms stay excluded forever.
- Re-implementing `(chibi test)`. The harness is the subset the suite actually uses.
- Fixing #74-#75 and #77-#82 here. Each is separately filed with a reproduction, and each shows up as
  a named exclusion, which is the point.
- Deciding the flonum print convention (`(display 1000.0)` → `1e+03`). Conformant, unmeasured, and
  its own question — see Open Questions.

## Decisions

### D1: Vendor verbatim, adapt only in the harness and the manifest

**Decision.** The suite goes in byte-for-byte, with upstream's BSD-3 notice and the vendored revision
recorded. All local accommodation lives in the harness and the exclusion manifest.

**Attribution follows from verbatim.** Emit is MIT-licensed (`LICENSE`); chibi-scheme is
BSD-3-clause, whose condition 1 requires a source redistribution to retain the copyright notice, the
conditions and the disclaimer. The usual mechanism — a license header on the file — is unavailable
here precisely *because* of this decision: a header would make the file differ from upstream and
defeat the checksum guard. So chibi's `COPYING` text is committed beside the suite as
`test/r7rs/LICENSE.chibi-scheme`, `test/r7rs/README.md` names it and the vendored revision, and the
root README's License section points at the convention. This is the first third-party code in the
tree, so the convention is established here rather than inherited.

**Why.** The alternative — a patched copy that quotes its vector literals, widens its float
expectations and drops what Emit cannot compile — would run far more of the suite today and would
destroy the reason to have it. A suite edited to fit the implementation stops being independent
evidence. Verbatim also keeps `diff` against a refreshed upstream reviewable, which is what makes
periodic refresh practical.

**Cost accepted.** More forms are excluded than would be under a patched copy, and the exclusion
manifest is large (~438 entries initially). That size is information, not debt.

### D2: A Chez-hosted generator emits a committed manifest; the runner consumes it

**Decision.** `tools/r7rs-manifest.ss` (Chez) scans the suite and writes a committed manifest of form
extents and sections. `test/r7rs-suite-tests.sh` reads only committed artifacts.

**Why.** This is the pattern the repo already uses twice: `tools/gen-scheme-base.ss` generates
committed `lib/**/*.sld` guarded by `test/scheme-base-gen-check.sh`, and
`test/module-scaffold-baseline.sha256` pins a generated baseline. It resolves the reader constraint
(Chez reads what Emit cannot) while keeping `run-all-tests.sh` Chez-free, because generation happens
at vendor time, not at test time.

**Alternatives rejected.**

- *Splitter in Emit's Scheme.* Impossible today (the reader constraint) and wrong in principle: the
  runner would depend on the defects it reports.
- *Splitter in Python.* Works — the measurement used one — but adds a language to a bash+Scheme+C++
  repo for one script, and the repo's own tooling convention already covers this shape.
- *Split at runtime by the shell.* A paren-, string-, char-literal- and block-comment-aware scanner
  in bash is exactly the kind of thing that is subtly wrong forever.

**Scan, do not `read`.** The generator tracks strings, character literals, block comments, datum
comments and bar-quoted symbols, and never calls `read`. That keeps it independent of Chez's own
datum extensions (Chez has no R7RS datum labels either) and means it needs no support for the syntax
it is delimiting.

### D3: Key exclusions by form content, not by line number

**Decision.** A form's manifest key is derived from its content (a hash of the normalized form text)
plus its section, not its line number.

**Why.** Exclusions are hand-maintained and long-lived; the suite gets refreshed. Line numbers shift
when anything above them changes, which would invalidate the entire manifest on any upstream edit and
make the diff unreadable. A content key survives unrelated edits, and a *changed* form correctly
loses its exclusion — the exclusion was a claim about that text.

**Trade-off.** A content key is opaque in a diff, so each entry also carries the form's line number
and a text excerpt as commentary — informative but not authoritative. The alternative, keying by
`(section, ordinal)`, is readable but shifts whenever a form is inserted mid-section.

### D4: The manifest is a ratchet, checked in both directions

**Decision.** Not-excluded-but-broken fails (regression). Excluded-but-now-passing fails too (stale
exclusion), reported by form.

**Why.** A one-directional check rots: gaps get closed and nobody re-measures, so the manifest slowly
becomes a work of fiction that also suppresses real regressions. Two-directional means fixing #76
lights up ~44 stale exclusions in the same run, and the fixing commit deletes them — the scoreboard
maintains itself. `deliberate` entries are checked the same way, deliberately: if a form excluded as
"needs bignums" starts passing, either the exclusion or the reasoning behind it was wrong, and both
are worth knowing.

**Trade-off.** A change that closes a gap must also edit the manifest, or its own test run fails.
That is the intent — the manifest edit *is* the record — but it does mean an unrelated change that
incidentally fixes something sees a failure it did not expect. The diagnostic names the forms and
says to delete the entries, so the fix is mechanical.

### D5: Approximate comparison for inexact results, exact for everything else

**Decision.** The harness compares two inexact numbers to the precision the expectation was written
at; everything else compares with `equal?`.

**Why.** The suite writes `(sqrt 2)` as `1.4142135623731` because `(chibi test)` compares
approximately. Comparing with `equal?` produced 13 failures in section 6.2 where Emit's doubles are
correctly rounded and the suite's literals are truncated. Those 13 were not defects, and a gate that
reports them as defects will be ignored.

**Where the line is.** The one genuine 6.2 failure — `(= 9007199254740992.0 9007199254740993)` → `#t`
(#77) — is a boolean result, so it is unaffected by any float tolerance. That is the reassuring case:
the tolerance applies to *values being compared*, not to the truth of a predicate the suite is
testing.

### D6: Close the cheap tier in the same regen cycle

**Decision.** #76, the ~30 prelude procedures and the arity widenings land in this change, not in
follow-ons.

**Why.** `src/parse.ss` and `src/prelude.scm` are both in `CORE_FLAT`, so each of these separately
would cost its own ~12-minute `make regen` plus two full suite runs, and `make regen` is a barrier
that serializes everything. Three changes touching the same two files is three barriers for one
edit's worth of risk. They are also the tier with no design content — the standard specifies the
behaviour and the primitives already exist.

**What stays out and why.** Binary ports and bytevector I/O (~12 names) need a port-representation
decision. `(scheme char)` needs the Unicode-table decision the repo has already recorded as a limit.
`(scheme lazy)`, `let-values`, `let*-values` and `(scheme case-lambda)` are all prelude macros *once
#79 is fixed* — probing showed `let-values`, `let*-values` and `case-lambda` write cleanly as
`syntax-rules` macros today, while `delay`/`force` cannot, because its template must name a
`define-record-type` constructor and hygiene renames it. Sequencing them behind #79 turns four
compiler changes into one hygiene fix plus a prelude addition.

### D7: Arity widening goes through `*integrable*`, one entry per accepted arity

**Decision.** `make-string`, `make-vector`, `string-copy` and `string->list` gain their optional
forms as additional `*integrable*` entries, following the pattern the port-directed output
procedures already established (`(display %display 1) (display %display-port 2)`).

**Why.** That mechanism exists and is documented in `src/parse.ss`: an integrable may carry more than
one entry, and a direct call selects by argument count, so the common form keeps its bare-primcall
codegen and emits byte-identical IR. The base arity must stay first, because value-position use etas
the first entry — `(map make-string ks)` should remain the one-argument procedure.

For the n-ary comparisons (`string=?` and the new `string<?` family), the frontend rewrite that
already reduces n-ary `<`/`=` to binary form (`expand-compare`) is the model, so `(string=? a b c)`
becomes chained binary calls rather than a variadic runtime procedure.

## Risks / Trade-offs

- **[The exclusion manifest is enormous at birth (~438 entries) and could read as failure.]** →
  Group it by section with the reason tag prominent, and have the runner print a one-line summary per
  reason class. "20 forms excluded: needs exact rationals (#27)" is a design statement; 20 anonymous
  lines are not.

- **[Third-party code enters the tree for the first time, and the convention for it is invented
  here.]** → Emit is MIT-licensed, so the BSD-3 combination is unproblematic; the risk is procedural,
  not legal — a later vendoring that forgets the notice would have no pattern to copy. Mitigated by
  making the notice file a spec requirement rather than a task comment, and by naming the convention
  in the root README where the next person will look.

- **[The generator and the runner can disagree about form extents, silently reporting on the wrong
  text.]** → The checksum guard ties the manifest to the suite, and the generator asserts that its
  extents tile the file with no gaps or overlaps. A tiling assertion is cheap and catches the whole
  class.

- **[Widening an integrable's arity risks changing emitted IR for existing programs.]** → The base
  arity stays the first entry, so existing call sites keep their current lowering.
  `test/self-emit-equiv.sh` and the committed-IR trust check will catch any drift, and drift here
  would be a real defect rather than an acceptable difference.

- **[The suite adds ~30s to `run-all-tests.sh`, and 18 compilations is 18 chances to hang.]** →
  Section programs are independent, so a per-section timeout bounds the damage and names the section
  that hung.

- **[Fixing #76 changes what `parse-expr` accepts, which could mask a real "bad expression" report.]**
  → The new arm accepts only vector and bytevector objects; every other datum still reaches the
  existing `else`.

## Migration Plan

No user-visible migration. Sequence within the change:

1. Vendor + notice + generator + manifests + runner, with today's exclusions. Nothing improves; the
   scoreboard exists.
2. The cheap tier, in one `make regen` cycle, deleting the exclusions it makes stale.

Step 1 before step 2 deliberately: the manifest deltas in step 2 are the evidence that the tier
closed what it claimed to.

The license prerequisite that originally gated step 1 is **settled** — Emit is MIT-licensed as of
this change's planning (`LICENSE` at the repo root), so vendoring is unblocked.

## Open Questions

- **Flonum print convention.** `(display 1000.0)` prints `1e+03`. This is conformant (R7RS requires
  only that `write` output read back as the same number) and is arguably the literal "shortest
  round-trippable decimal" the `numeric-conformance` change targeted, since `1e+03` is shorter than
  `1000.0`. No other implementation prints it that way, and the suite's *Numeric syntax* section
  tests write output against a list of accepted spellings. That section is unmeasured — the
  throwaway splitter dropped the file's tail — so the first regeneration will reveal the real cost.
  Whether to match convention or record a divergence is a policy question for its own change.
- **Immutable literals.** R7RS 4.1.2 makes altering a constant an error. Emit lets `vector-set!`
  mutate a quoted vector literal today, and #76 adds a second spelling of the same constant while
  #82 would add the same question for quoted lists. One decision should cover all three.
- **Suite refresh cadence.** Nothing forces a refresh. A dated note in `test/r7rs/` recording the
  vendored revision is the minimum; whether refreshing is anyone's routine is unresolved.
