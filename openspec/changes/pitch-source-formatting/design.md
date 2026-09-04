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

**Cost shapes the gate.** Pitch is single-threaded and superlinear in file size: 112 s for
2,477 lines, 191 s for the 2,397-line Unicode table. The covered set costs ~7.4 min
sequentially, ~2.5 min at `-P4`. That is a suite-sized cost, not a hook-sized one.

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

**D6 — The formatter version is pinned and checked, not floated.** Pitch's README states
that its shipped cost objective is the reference implementation's rather than pitch's own
and wants a corpus to tune against, i.e. layout *will* change. `tools/format.sh` compares
`pitch --version` against a pinned value and reports a mismatch. A pitch upgrade then
becomes a deliberate act: bump the pin, reformat, regenerate. *Alternative rejected:*
vendoring or building pitch in-tree — it inverts the dependency, since Emit compiles pitch.

**D7 — The gate is a pre-commit hook over *staged* files, installed opt-in.** The covered
set costs minutes; a staged set costs seconds, except when `src/prelude.scm` (112 s) or
`src/core.ss` (52 s) is staged, which is both rare and proportionate. The hook is installed
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
  than uniform slowness.

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
- **A pitch release changes layout and the tree silently drifts.** → D6's version pin turns
  drift into a reported mismatch.
- **The hook makes committing slow when a large file is staged.** → Bounded by the staged
  set; 112 s worst case on `src/prelude.scm`, and the hook is opt-in, so the cost is
  chosen.
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
4. When #13 and #14 are resolved: bump the version pin, `make format`, commit the
   reformat alone with `.git-blame-ignore-revs`, then `make regen`, then
   `./run-all-tests.sh` and `./run-dev-tests.sh`, checking the four IR assertions.

Rollback: steps 1–3 are additive and removable without touching source. Step 4 is a single
revert plus a regen.

## Open Questions

- Whether `pitch.scm` should declare styles beyond the two in D4. The second measurement
  pass shows no other project macro laying out badly, so this is answerable by reading the
  reformat when it happens, and it changes no requirement.
- Whether a short `define-library` collapsing onto one line (collision 3's residual) is
  worth raising upstream. It affects none of Emit's six authored `.sld` files at width 88
  today, so it is not on this change's path.
