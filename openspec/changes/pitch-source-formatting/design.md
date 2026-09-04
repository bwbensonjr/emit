## Context

See `proposal.md` — Why. This section records only the state and measurements the
approach rests on.

**Pitch's contract.** Pitch reflows from scratch, discarding prior line breaks and
indentation, and re-derives layout from a page width (default 88) and a per-form style
table. It declares an *empty* normalization list — bracket shape, radix notation,
character names, `#t`/`#true`, string escape spelling, and identifier spelling all survive
exactly — and it re-reads its own output through four safety layers (round-trip, token
equivalence, datum equivalence, idempotence) before returning it. Output that fails a
layer is withheld rather than written. Configuration is one inert versioned datum
declaring width, dialect, and per-form styles; it explicitly cannot disable a safety
check, add a normalization, reorder code, change token spelling or comment contents, or
alter terminal indentation. Pitch does not search for its configuration: the project must
name the file with `--config`, and every input in one invocation resolves the same
configuration.

**The measurement pass.** Pitch 0.1.0 was run over a copy of all 38 candidate Scheme files
(the 32 hand-authored files plus the 6 generated ones, to decide their exclusion on
evidence). Two figures per file: what `--check` costs, and how large the resulting diff is.

> **Both columns are superseded** by work that landed upstream the day after this change
> was written — see "What landed after this change was written" below. The `--check`
> seconds are pre-`reduce-formatting-cost` and are now roughly 6x too high; the changed-line
> counts are pre-#13 and are too high for the files dominated by quoted data. The table is
> kept as recorded because the decisions below were made on it and because it is the
> before-half of the comparison.

| file | lines before | lines after | changed lines | `--check` seconds |
|---|---|---|---|---|
| `src/emit.ss` | 1837 | 2176 | 2159 | 78 |
| `src/prelude.scm` | 2477 | 2428 | 1253 | 112 |
| `src/parse.ss` | 985 | 1145 | 958 | 21 |
| `src/repl-core.ss` | 1422 | 1461 | 881 | 32 |
| `src/compile.ss` | 962 | 1116 | 764 | 23 |
| `src/core.ss` | 1546 | 1600 | 738 | 52 |
| `src/prelude-surface.scm` | 563 | 784 | 553 | 2 |
| `src/passes/expand.ss` | 685 | 694 | 461 | 19 |
| `tools/r7rs-manifest.ss` | 456 | 518 | 364 | 15 |
| `tools/gen-unicode-tables.ss` | 314 | 328 | 252 | 5 |
| `src/passes/simplify.ss` | 264 | 262 | 214 | 10 |
| `lib/scheme/char.sld` | 112 | 112 | 204 | 2 |
| `src/passes/lower.ss` | 338 | 352 | 182 | 6 |
| `src/passes/convert-assignments.ss` | 193 | 203 | 178 | 15 |
| `tools/gen-scheme-base.ss` | 215 | 238 | 139 | 4 |
| `src/dump.ss` | 199 | 200 | 85 | 3 |
| `lib/emit/filesystem.sld` | 48 | 39 | 75 | 1 |
| `src/passes/convert-closures.ss` | 45 | 46 | 49 | 4 |
| `lib/scheme/case-lambda.sld` | 28 | 25 | 47 | 1 |
| `lib/scheme/inexact.sld` | 50 | 48 | 44 | 1 |
| `tools/gen-reader-bench.ss` | 88 | 90 | 34 | 0 |
| `lib/scheme/process-context.sld` | 19 | 17 | 32 | 0 |
| `lib/scheme/write.sld` | 17 | 13 | 26 | 0 |
| `emit-libs.scm` | 46 | 46 | 22 | 0 |
| `src/match.scm` | 41 | 37 | 22 | 1 |
| `src/util.scm` | 96 | 88 | 22 | 1 |
| `src/include-reader.ss` | 102 | 103 | 21 | 0 |
| `src/passes/recognize-let.ss` | 25 | 26 | 13 | 1 |
| `src/entry-embed.scm` | 19 | 20 | 3 | 0 |
| `src/entry-repl.scm` | 1 | 1 | 0 | 0 |
| `src/entry-schemec.scm` | 4 | 4 | 0 | 0 |
| `src/import-substrate.scm` | 32 | 32 | 0 | 0 |
| **covered set total** | **13229** | **14252** | **9795** | **~442 (≈7.4 min)** |

Excluded generated files, measured to confirm the exclusion: `lib/scheme/base.sld` (402
lines, 37 s), `lib/emit/internal.sld` (216 lines, 101 s), `lib/scheme/char-data.scm` (2397
lines, **191 s**), plus `cxr.sld`, `read.sld`, `file.sld`. All would reformat.

Three conclusions follow.

**Safety is not the problem.** Pitch refused nothing in 38 files. Because a refusal is how
a failed safety layer surfaces, zero refusals means token equivalence, datum equivalence,
and idempotence all held on the entire corpus — the strongest evidence available short of
running the compiler.

**Magnitude is large but bounded.** These are pitch's *defaults*; the second measurement
pass below takes the figure to 9,219 with the project configuration in place. 29 of 32
files change; 9,795 changed lines is ~74% of
the corpus; the tree grows 7.7%. Three files already conform
(`src/entry-repl.scm`, `src/entry-schemec.scm`, `src/import-substrate.scm`) — too few to
build an incremental allowlist on.

**Cost shapes the gate — as measured here, and no longer.** Pitch was single-threaded and
superlinear in file size: 112 s for 2,477 lines, 191 s for the 2,397-line Unicode table;
the covered set ~7.4 min sequentially, ~2.5 min at `-P4`. That was a suite-sized cost, not
a hook-sized one, and it is what D7 was decided against. `reduce-formatting-cost` has since
removed it — the covered set is now well inside a minute — so this conclusion no longer
holds and D7's justification is restated below.

**Four collisions with the house style**, in descending cost:

1. **Long quoted data lists explode to one item per line.** `src/prelude-surface.scm`
   563 → 784 and `src/emit.ss` 1837 → 2176 are almost entirely this. Pitch looks up a
   style only for a subform it classifies as *code*; a quoted list is data, so the `fill`
   terminal that `export` gets is unreachable for `'(a b c …)`, and the generic shape
   breaks all-or-nothing. Emit's private-name and unstable-name tables, and the emitter's
   opcode tables, are hand-grouped with interleaved comments — the grouping *is* the
   documentation, and exploding it costs more than it buys.
2. **372 column-aligned trailing comments collapse to a single space.** Counted across
   `src/**` and `tools/**`; against only 7 single-space trailing comments, so the aligned
   column is the house convention, not an accident. Comment placement is not a style
   entry, and the normalization list is closed, so no configuration reaches this.
3. **`define-library` bodies de-indent to column 0** — and this one is reachable from a
   project configuration, so it is not an upstream problem. The R7RS table's
   `define-library` style is `(_ d . body0)`; Emit's six authored `.sld` files indent
   bodies by 2, which `((define-library) (_ d . body))` in `pitch.scm` restores. Worth
   recording how this was nearly misdiagnosed: at width 88 the override looks inert,
   because a short library declaration fits on one line and no break is taken, so the
   indent never shows. It must be tested at a width that forces the break. A residual
   observation, not pursued here: a short `define-library` *does* collapse onto a single
   line, which is what `body`/`body0` being all-flat-or-fully-broken implies.
4. **Semantic line grouping is joined up to the width.** Multi-line `and`, `cond`, and
   `let*` forms collapse onto one line when they fit — the ordinary cost of a reflowing
   formatter, and the one collision this design accepts rather than escalates.

One further finding bears on what formatting can promise: 529 whole-line comments in the
covered set already exceed 88 columns, and pitch never rewrites comment contents. A
formatted tree still has 529 lines over the width. Formatting buys consistent *code*
layout; it does not buy a width-clean file.

**Second measurement pass, with the candidate configuration.** The covered set was
re-formatted under the `pitch.scm` of D4 — `((match) (_ e . dc*))` and
`((define-library) (_ d . body))` — to separate what configuration fixes from what only
pitch can:

| | changed lines | files changed |
|---|---|---|
| pitch defaults | 9,795 | 29 of 32 |
| with `pitch.scm` | **9,219** | 29 of 32 |

The 576-line improvement is concentrated exactly where the two entries apply:

| file | defaults | with config |
|---|---|---|
| `lib/scheme/char.sld` | 204 | 80 |
| `src/emit.ss` | 2159 | 2038 |
| `src/passes/convert-assignments.ss` | 178 | 103 |
| `src/passes/simplify.ss` | 214 | 168 |
| `lib/emit/filesystem.sld` | 75 | 31 |
| `lib/scheme/inexact.sld` | 44 | 6 |
| `lib/scheme/process-context.sld` | 32 | 8 |
| `lib/scheme/case-lambda.sld` | 47 | 25 |
| `lib/scheme/write.sld` | 26 | 8 |

All six authored `.sld` files improve, and every `match`-bearing pass improves. The files
dominated by collisions 1 and 2 — `src/prelude.scm` (1253), `src/prelude-surface.scm`
(553), `src/repl-core.ss` (881), `src/compile.ss` (764), `src/core.ss` (738),
`src/parse.ss` (931) — are unmoved to the line, which is what makes those two genuinely
upstream rather than unconfigured.

A negative result belongs in the record too, because it is the evidence for D9's first
blocker: adding

```scheme
(styles common ((quote) (_ . fill)))
```

produces output byte-identical to the default on an overflowing quoted list. The
configuration is demonstrably live — a `width 40` override reflows, and a bogus terminal
is rejected with exit 2 — so the entry is accepted and simply never consulted, exactly as
`docs/DESIGN.md`'s "data is never looked up" implies.

**What landed after this change was written (2026-09-01 to 09-02).** This change was
proposed on 2026-09-01 and filed its three pitch issues that day. Profiling #15 then found
five causes, and they split across both repos — which is the reason this section exists:
the tool being adopted and the compiler that builds it moved underneath the measurements
above.

Two causes were Emit's, not pitch's, and are fixed in `src/runtime/runtime.c`
(`53a238a`): `rt_intern` scanned its whole table on every evaluation of a quoted symbol
literal (`docs/PERFORMANCE.md` P19), and `string-set!` reallocated and copied the whole
string, making a character-at-a-time buffer fill quadratic (P20). A third is recorded open
as **P21** — an output string port is a libc `FILE`, and allocating one walks libc's stream
list — with a caller-side fix in pitch, which now closes the ports its reader shim and
`cst->text` own. Two were pitch's own: symbol literals in the hot loops of `(pitch doc)`
and `(pitch table)`.

Measured effect, from the results recorded on #15:

| | before | after |
|---|---|---|
| covered set, sequential | 480 s | **78 s** |
| covered set, `-P4` | 146 s | **32 s** |
| staging `src/prelude.scm` | 83 s | **8.8 s** |

Those before-figures are close to this design's 442 s and 150 s but are **not** the same
measurement — the upstream comparison could not reconstruct the exact 13,229-line set and
used a denser one. Read 480 → 78 as the real comparison, not 442 → 78. The `char-data.scm`
outlier that motivated #15's "per-form quadratic" hypothesis is gone: the generated table
is now the *cheapest* file per line rather than the most expensive. What remains is a
2,500-line file at 8.8 s — not save-time — caused by collector time scaling with the live
heap, so #15 stays open on a narrower claim than it was filed on.

**Collision 1 is largely resolved upstream.** `ebc01cd` on scheme-pitch main makes a
quoted position change the *fallback* shape, so an overflowing quoted data list is packed
rather than staircased, while a quoted compound whose head has a style entry keeps it.
Measured against a build reproducing #13's numbers exactly: `src/prelude-surface.scm`
784 → **553** lines (against 563 before formatting — the table effectively survives), and
`src/emit.ss` 2176 → **2094**. Two costs are recorded upstream rather than glossed: a data
position is now sensitive to the style table (two such sites in Emit's 13,229 lines,
neither visible at any real width), and grouping expressed by a bare line break is lost.

**This does not yet unblock the reformat**, for a reason that is itself a finding — see D6.
The fix is on `main` and unreleased; issue #13 is still open; and `pitch-version` is still
`"0.1.0"`, so the pin this change specifies cannot tell the two pitches apart. The covered
set has not been re-measured against post-#13 pitch, so the 9,219-line figure below is
still the best available number and is known to be too high.

## Goals / Non-Goals

**Goals**

- Land the covered-set declaration, the configuration, the doors, and the gate now, so the
  policy is reviewable and testable before 9,795 lines move.
- Keep the policy in exactly one place, so the gate and the doors cannot disagree.
- Make the eventual reformat *checkable* rather than merely reviewable, using the
  regenerated IR as the oracle.
- Keep the formatter strictly optional to build and test Emit.

**Non-Goals**

- Tuning pitch's cost objective against Emit as a corpus. Emit is a good corpus for that
  and pitch's README says the objective wants one, but that is pitch's design work.
- Fixing pitch's performance. It shapes this design; it belongs in pitch's backlog.
- Formatting comment *contents* to the page width, or introducing a comment-width rule.

## Decisions

**D1 — The covered set is stated as locations plus exclusions, not a file list.**
`tools/format.sh` resolves the set from `git ls-files` filtered by covered locations
(`src/*.{scm,ss}`, `src/passes/*.ss`, `lib/**/*.sld`, `tools/*.ss`, `emit-libs.scm`) minus
named exclusions. The exclusion test is evidence-based, not a hardcoded path list: a
generated file announces itself in its first two lines (`GENERATED from src/prelude.scm by
tools/gen-scheme-base.ss`, `GENERATED by tools/gen-unicode-tables.ss`), which
`test/scheme-base-gen-check.sh` already relies on to find orphans. Reusing that marker
means adding a partition member cannot silently pull a generated file into the covered set.
*Alternative rejected:* an explicit list of 32 paths — it goes stale the first time a pass
is added, and it makes "is this file covered?" a question about a list rather than about
the file.

**D2 — Generated Scheme is excluded, and this costs nothing.** `tools/gen-scheme-base.ss`
emits its libraries with `write` — one datum per line, comments dropped, lines well past
88 columns. Such a file can never satisfy `--check`, and its bytes are pinned by a
byte-identical guard. Crucially, `write` output depends only on the *datum*, so
reformatting `src/prelude.scm` leaves every generated `.sld` byte-identical and the guard
undisturbed. The runtime library still gets formatted — at its source of truth,
`src/prelude.scm`, which is in the covered set. *Alternative considered:* pipe the
generator's output through pitch, giving the whole tree one layout. Rejected for now: it
makes a Chez-hosted generator depend on a tool Emit compiles, inverting the bootstrap.

**D3 — Two dialect groups, assigned by declared group, never by extension.** The six
hand-authored `lib/**/*.sld` files are R7RS libraries and get `--dialect r7rs`. Everything
else in the covered set is host-dialect code compiled by Chez during bootstrap and gets
`--dialect common`. Pitch's own documentation is explicit that `.scm` and `.ss` are used by
both camps and a suffix is not evidence, which is why the group decides.

**D4 — `pitch.scm` at the repo root, passed explicitly with `--config`, carrying two
entries.** Pitch does not search, so there is no ambient-configuration hazard to guard
against.

```scheme
(pitch-config 1
  (width 88)
  (dialect common)
  (styles common
    ((match) (_ e . dc*)))
  (styles r7rs
    ((define-library) (_ d . body))))
```

`match` is `src/match.scm`'s macro and the shape of every compiler pass. Without an entry
it falls to the generic shape, which aligns the clauses at the *operator* column under
`match e` — measurably worse, and the cause of most of the diff in the pass files.
`dc*` rather than `ec*`: the two produce identical output on every measured file, but
`dc*` types each clause's head as *data*, which is what guarantees a pattern like
`(let ,binds ,body)` can never be laid out as a `let` form. Choosing the terminal that
makes the wrong layout unreachable is worth more than choosing the one that happens to
agree today.

`define-library` restores the 2-space body indent Emit's `.sld` files use, per collision 3.

The configuration stays this small deliberately. The second measurement pass shows no
other project macro laying out badly, and every additional entry is a rule someone must
later reconcile with pitch's own defaults.

**D5 — Width stays at pitch's default 88.** The covered set has 305 over-88 *code* lines
against 12,909 total, so 88 is close to the width the code was already written to.
Widening to accommodate the 443-column outlier in `src/compile.ss` would reflow the whole
tree looser to serve one line.

**D6 — The formatter version is pinned and checked, not floated.**

> **As filed, the pin does not work, and the events since have demonstrated it.**
> `pitch-version` is still `"0.1.0"` on scheme-pitch main after both the `ebc01cd` layout
> fix for #13 and the whole of `reduce-formatting-cost`. So the pin cannot distinguish the
> pitch this change was measured against from the pitch that resolves its blocker and runs
> six times faster — which is precisely the silent-invalidation this decision exists to
> prevent. A version pin is only a pin if the version moves. The mechanism is kept, because
> the fix belongs upstream and is cheap there: task 5.6 asks scheme-pitch to bump
> `pitch-version` on any layout-affecting change. Until that is answered, treat the pin as
> documentation of intent rather than as an enforced check, and confirm the formatter by
> commit rather than by `--version` when running task 6.1.

Pitch's README states
that its shipped cost objective is the reference implementation's rather than pitch's own
and wants a corpus to tune against, i.e. layout *will* change. `tools/format.sh` compares
`pitch --version` against a pinned value and reports a mismatch. A pitch upgrade then
becomes a deliberate act: bump the pin, reformat, regenerate. *Alternative rejected:*
vendoring or building pitch in-tree — it inverts the dependency, since Emit compiles pitch.

**D7 — The gate is a pre-commit hook over *staged* files, installed opt-in.** The covered
set costs minutes; a staged set costs seconds, except when `src/prelude.scm` (112 s) or
`src/core.ss` (52 s) is staged, which is both rare and proportionate.

> **The cost premise no longer holds.** `reduce-formatting-cost` took the covered set to
> ~78 s sequential and ~32 s at `-P4`, and staged `src/prelude.scm` to 8.8 s. A whole-tree
> gate is now affordable, which it was not when this was decided. The decision stands
> provisionally on a *scope* argument the cost argument was hiding — a commit gate should
> judge what is being committed, and a tree gate fails on drift the committer did not
> cause — but that argument was never the one made here, so it is not yet settled. See
> Open Questions; decide it when group 3 is built. The hook is installed
by `make install-hooks` rather than being present on clone, because `.git/hooks` is not
version-controlled and a hook nobody chose is a hook nobody trusts. It calls the same
`tools/format.sh` with a file list, so membership and dialect are decided once.

**D8 — The gate skips when pitch is absent, mirroring the `chez` gate.** Emit compiles
pitch; pitch requires Emit at or after `41c6f43`. If committing to Emit required pitch,
a clean environment could not fix a bug in the compiler that builds it. `run-dev-tests.sh`
already establishes this pattern by skipping wholesale without `chez`. This is also why
this change adds no formatting suite to either test runner and no CI: the project's
"does the source still build?" answer must not depend on a downstream tool.

**D9 — Upstream first, for collisions 1 and 2; configuration for 3; accept 4.** Two pitch
issues block *only* the reformat step:

- **[bwbensonjr/scheme-pitch#13](https://github.com/bwbensonjr/scheme-pitch/issues/13)** —
  an overflowing quoted data list is laid out by the generic shape, one element per line
  aligned under the second element, rather than filled. The substantive blocker: without
  it the emitter and surface tables get materially worse, and the measurement pass shows
  it is unreachable from configuration because a quoted list's head is never consulted.
  **Fixed on scheme-pitch main by `ebc01cd`, and still blocking.** A quoted position now
  changes the fallback shape, packing data while leaving quoted code alone; measured,
  `src/prelude-surface.scm` comes back to 553 lines against 563 before formatting. What
  remains is delivery, not design: the issue is open, there is no release carrying the fix,
  and per D6 the version pin cannot identify a pitch that has it.
- **[#14](https://github.com/bwbensonjr/scheme-pitch/issues/14)** — trailing-comment
  column alignment is not preserved. 372 sites against 7 single-space ones. Needs an
  addition to pitch's "Preserved formatting" list, which pitch's own `CLAUDE.md` requires
  be argued through an OpenSpec proposal — so this is a design decision upstream, not a
  patch. The issue proposes preserving the *fact* of alignment while re-deriving the
  column, which is how blank-line preservation already works, and names the acceptable
  alternative: a documented decision not to preserve it, so adopters can choose knowingly.

One issue does **not** block:

- **[#15](https://github.com/bwbensonjr/scheme-pitch/issues/15)** — formatting cost is
  superlinear in file size. D7 works around it; the measurements are filed so they are not
  lost, with the `char-data.scm` outlier (80 s per 1000 lines against 42 s for
  hand-written code of the same size) as the hint that this is a per-form quadratic rather
  than uniform slowness. **That hint was right and is resolved**: `reduce-formatting-cost`
  found five causes — two of them Emit runtime defects, now P19 and P20 — and took the
  covered set from 480 s to 78 s. `char-data.scm` is now the cheapest file per line rather
  than the most expensive, so the shape defect the issue opened on is gone. It stays open
  on a narrower claim: a 2,500-line file at 8.8 s is still not save-time, because collector
  time scales with the live heap. Still not blocking, and D7's premise is now its casualty
  rather than its beneficiary.

Collision 3 needed no issue: D4's `((define-library) (_ d . body))` resolves it.

Collision 4 is accepted: joining semantically grouped lines is what a reflowing formatter
does, and black's history says this is the argument not worth having.

**D10 — The reformat is one commit, and the regenerated IR is the oracle.**
`bootstrap/*.ll` contains no `!dbg` or `DILocation` metadata, so a layout-only change to
`CORE_FLAT` must produce byte-identical IR. `tools/regen.sh` bakes `src/prelude.scm`'s
*source text* into `build/prelude-source.scm` as the `*prelude-source*` string constant, so
`embed.ll` and `embed-repl.ll` change — and must change *only* inside that constant.
`scheme.base.ll` and `emit.internal.ll` are compiled from generated `.sld` files that D2
shows do not move, so they too must be byte-identical. That gives four checkable
assertions instead of a reviewer's judgment over 9,795 lines. *Alternative rejected:*
splitting the reformat into non-regen files first and `CORE_FLAT` second — two barrier
crossings, two regens (~44 min), and it forfeits the single clean before/after IR
comparison that makes the whole thing verifiable.

## Risks / Trade-offs

- **The upstream fixes may not land, leaving this change half-applied indefinitely.** →
  Everything except the reformat is independently useful: the config, the doors, and the
  pinned version make `make format-check` a working report on the tree's drift. The change
  is archivable in that state, with the reformat re-proposed when pitch is ready. This is
  a deliberate trade: a change that stops short of its most visible step, in exchange for
  not degrading 372 comment columns and every hand-grouped table.
- **A pitch release changes layout and the tree silently drifts.** → D6's version pin was
  the answer, and it has already failed once: pitch's layout changed under `ebc01cd` with
  `pitch-version` unmoved. Task 5.6 asks upstream to fix that; until it is answered this
  risk is *open*, not mitigated, and it is the reason 6.1 verifies the formatter by commit.
- **The hook makes committing slow when a large file is staged.** → Bounded by the staged
  set, and no longer a meaningful cost: `src/prelude.scm` is 8.8 s after
  `reduce-formatting-cost`, against the 112 s worst case this risk was written for. The
  hook is opt-in regardless.
- **A reformat mid-flight leaves `bootstrap/` mixed-source.** → The reformat is a
  `make regen` barrier crossing in exactly the sense `CLAUDE.md` describes. Recovery is the
  documented one (`git checkout -- bootstrap/`), which is why the reformat commit must
  contain nothing else.
- **`git blame` over the compiler becomes one commit deep.** → `.git-blame-ignore-revs`,
  and the commit contains nothing but layout so ignoring it loses nothing.
- **The IR oracle could pass while behavior changed.** → It cannot pass vacuously: identical
  IR is identical program. The residual risk is confined to the `embed*.ll` prelude string,
  which is where both test suites — and the REPL-vs-batch equivalence suite in particular —
  do their work.
- **529 over-width comment lines survive formatting.** → Accepted and documented, so nobody
  reads `make format-check` as a width guarantee.

## Migration Plan

1. Configuration, `tools/format.sh`, `make format` / `make format-check`, version pin,
   documentation. No source file moves; `make format-check` is expected to fail, and that
   failure is the honest report of the tree's state.
2. `make install-hooks` and the hook. It is correct but mostly inert until step 4, since
   almost any staged covered file fails.
3. Done: pitch issues #13, #14 (blocking) and #15 (not blocking) are filed. Nothing in
   Emit depends on them until step 4.
4. When #13 and #14 are resolved *and carried by an identifiable pitch*: update the pin,
   `make format`, commit the reformat alone with `.git-blame-ignore-revs`, then
   `make regen`, then `./run-all-tests.sh` and `./run-dev-tests.sh`, checking the four IR
   assertions. "Identifiable" is doing real work here — #13's fix is on main today with the
   version string unchanged, so this step cannot currently name the pitch it requires (D6).

Rollback: steps 1–3 are additive and removable without touching source. Step 4 is a single
revert plus a regen.

## Open Questions

- **Whether the gate should check the whole covered set rather than staged files.** D7 chose
  staged files because a whole-set check cost minutes; at ~32 s at `-P4` it no longer does.
  The remaining argument for staged files is scope rather than cost — a tree gate fails on
  drift the committer did not cause — but that argument was not the one D7 made, so it is
  unsettled. Decide it when task group 3 is built, not before.
- **Whether the covered set should be re-measured before group 6 is planned in detail.** The
  9,219-line figure predates #13's fix and is known to be too high; `src/prelude-surface.scm`
  alone accounts for ~230 of it. The reformat's scale is therefore not currently known to
  better than "smaller than 9,219", which is enough to keep the change gated but not enough
  to review the reformat against.
- Whether `pitch.scm` should declare styles beyond the two in D4. The second measurement
  pass shows no other project macro laying out badly, so this is answerable by reading the
  reformat when it happens, and it changes no requirement.
- Whether a short `define-library` collapsing onto one line (collision 3's residual) is
  worth raising upstream. It affects none of Emit's six authored `.sld` files at width 88
  today, so it is not on this change's path.
