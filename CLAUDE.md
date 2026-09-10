# Project Instructions 

## Design Goals 

- The compiler is written in Scheme, bootstrapped with Chez
  Scheme (invoked as `chez`) and is now self-hosting.
- The implementation has the goal to be as simple and easy-to-understand as
  possible with clear control flow, stages, logging, and transparency.
- Standalone executables are a first-class deliverable. Producing
  small, clean, self-contained native executables from Scheme is a
  defining goal of this implementation; the AOT path stays first-class
  and binary size/cleanliness is a design concern favoring separate
  compilation over an extensive library prelude.
- The REPL is the primary development loop, with dev→ship fidelity.
  Code developed, tested, and debugged interactively must compile to
  an executable with identical behavior. The REPL and the batch
  compiler share one compiler core. This is the core argument for
  in-process embedding of the compiler.
- A module is the shared unit of compilation. A library compiles
  once to an artifact (IR/object + a compile-time export interface) that
  is consumable identically in two contexts: loaded into the interactive
  REPL, and linked into a static executable. The prelude is "library
  zero." Macro exports require a phase-separated compile-time interface,
  not just IR. Target **R7RS-small** for the module surface
  (`define-library`, `import`, `export`).
- This project uses OpenSpec for tracking designs and tasks (see
  `openspec/specs` and `openspec/changes`).
- Correctness defects are tracked in **GitHub Issues** (`gh issue list`), not in a file.
  When you find a bug you are not fixing now, open an issue — symptom with a
  reproduction, cause with file references, a possible fix — rather than leaving it in
  conversation or an inline TODO. Reference it from the fixing commit (`Fixes #N`).
  Filing an issue touches no files, so it never muddies an in-flight change's diff.
  Note `gh` may have several accounts authenticated; check `gh auth status` and use
  `bwbensonjr` for this repo.
- Speed, memory, and binary-size debt goes in `docs/PERFORMANCE.md` instead. That file is a
  *design* backlog — entries are essays with measurements and cross-item sequencing
  rationale — which is why it stays a document rather than a ticket queue.
- An OpenSpec change is for work being started; issues and `PERFORMANCE.md` are for what is
  known but not yet scheduled.
- Tools narrate what they do. Every tool, script, and pipeline stage
  announces its action, names its inputs and outputs, and reports the
  relevant metrics (sizes, durations, counts) — concise by default,
  controllable via `EMIT_VERBOSITY`, with narration on stderr and data on
  stdout. Follow the convention in `docs/OUTPUT.md` when adding or editing a
  tool.

## Scheme code formatting 

- Most comments should occur before the code they are describing,
  rather than on the same line except for exceptionally brief notes.
- **Layout is mechanical.** The hand-authored Scheme sources are formatted by
  [pitch](https://github.com/bwbensonjr/scheme-pitch), which Emit itself compiles.
  Run `make format` before committing, or install the gate once with
  `make install-hooks` and let it check the files you stage. `make format-check`
  answers the same question without writing.
- **The covered set** is `src/*.{scm,ss}`, `src/passes/*.ss`, the hand-authored
  `lib/**/*.sld`, `tools/*.ss`, and `emit-libs.scm` — resolved by `tools/format.sh`,
  which is the one place the policy lives. A Scheme file announcing `GENERATED` in
  its first two lines is excluded: its generator owns its bytes, pinned by a
  byte-identical guard. `demos/`, `test/`, and `historical/` are outside the set.
- **The formatter is an optional developer tool.** Emit compiles pitch, so neither
  `run-all-tests.sh` nor `run-dev-tests.sh` calls it and a clean environment builds
  Emit without it. The gate skips and permits the commit when `pitch` is not on
  `PATH`, saying so.
- **The formatter is pinned**, in `tools/format.sh`: pitch `0.1.0` at scheme-pitch
  commit `9f57119`. The version string alone cannot identify a build — it has not
  moved across two layout changes (scheme-pitch #19) — so the pin is enforced by a
  layout probe, `tools/pitch-probe.scm` against `tools/pitch-probe.expected`.
  Moving the pin means regenerating that expectation in the same commit and
  reformatting the tree.
- **A whole-set reformat is a `make regen` barrier crossing.** The covered set
  includes `CORE_FLAT` and `src/prelude.scm`, so a reformat is a compiler-source
  edit in the sense the Build Workflow section defines: it lands as its own commit
  with nothing else in it, then `make regen`, then both suites. Never interleave a
  reformat with another compiler-source edit — a mixed commit makes the IR
  comparison that proves the reformat harmless unreadable.
- **Two things formatting does not promise.** Comment *contents* are never
  reflowed, so a formatted tree still has 529 whole-line comments past 88 columns;
  formatting buys consistent code layout, not a width-clean file. And generated
  Scheme is out of scope entirely — reformatting `src/prelude.scm` leaves every
  generated `.sld` byte-identical, because the generator writes from the datum.

## Build Workflow

**`make regen` is a barrier.** Finish every compiler-source edit before starting
it, and make no more until the test suites have finished. The files that matter
are the ones `tools/regen.sh` concatenates into the three programs it compiles: `CORE_FLAT`
(`src/match.scm`, `src/util.scm`, `src/parse.ss`, `src/passes/*.ss`,
`src/emit.ss`, `src/prelude-surface.scm`, `src/core.ss`, `src/dump.ss`,
`src/import-substrate.scm`), plus `src/repl-core.ss`, `src/prelude.scm` (baked in
as the `*prelude-source*` constant), and `src/entry-*.scm`. `src/emit.cpp` is host
C++ — it reaches the binaries through plain `make`, not regen.

Two things go wrong when that barrier is crossed, both expensive:

- `run-dev-tests.sh` ends with `test/trust-check.sh`, which regenerates and
  requires `git diff bootstrap/` to be empty. A source edit made after the last
  regen guarantees a failure ~14 minutes into a 23-suite run.
- Killing a regen mid-flight leaves `bootstrap/` **mixed-source** — one `.ll`
  from the new source, the others from the old. Recover with
  `git checkout -- bootstrap/` if the tree is committed, or by running regen to
  convergence if it is not.

So: edit → `make regen` (~4 min) → `./run-all-tests.sh` (~10 min) →
`./run-dev-tests.sh` (~14 min).

**Budget regen by its self-compile count, not by a wall-clock figure.** Nearly all of it is the
compiler compiling itself — one `--emit` over ~400 KB of assembled Scheme, currently **~57 s**
each on an 8-core M-series laptop — so the count is the part that does not drift with the machine:

| `make regen` | self-compiles | wall clock |
|---|---|---|
| no compiler-source change (converges at fixed-point iteration 1) | 4 | **~4 min** |
| **after a compiler-source edit** (converges at iteration 2) | 5 | ~5 min (derived) |

The first row is measured twice on 2026-09-10 — 221 s and 230 s — the second with per-stage
detail: 120 s for the fixed point's two self-compiles, 107 s for stage 3's two, which is where the
~57 s comes from. The second row is derived from that per-compile figure and is the row that
matters, since the barrier exists because you edited something: it was **6** self-compiles until
issue #99 was fixed, which removed the one the fixed point used to repeat per extra iteration. The
first row is unaffected by that fix — a run that converges immediately never repeats anything. One
kind of compiler-source edit still lands on the first row: a **layout-only** change, per the
formatting section above, converges at iteration 1 because the emitted IR is identical and the
fixed point has nothing to chase.

**This section said ~18 min until 2026-09-10, and that figure was not wrong when it was written.**
It was measured 2026-08-13, before three runtime quadratics were fixed: `rt_intern` scanning the
whole symbol table on every quoted symbol literal and `string-set!` reallocating the whole string
(`53a238a`, `docs/PERFORMANCE.md` P19 and P20, 2026-09-01), and an output string port being a libc
`FILE` (`3169264`, P21, 2026-09-04). A self-compile is a large Scheme program doing exactly that
work, and it went from ~268 s to ~57 s; the same three fixes took pitch's formatting of this repo
from 480 s to 78 s. Re-measure this table after a comparable runtime change rather than trusting
the row.

- **Iterate without regen** via `chez --libdirs src --script src/compile.ss`,
  which `include`s the source directly. Use it for the whole edit/test loop and
  regen once at the end.
- **`src/compile.ss` is exempt** — it is the Chez driver, not in `CORE_FLAT`, so
  it needs no regen. It does change the artifact-cache stamp, which merely forces
  `build/lib` to rebuild.
- **`test/trust-check.sh` is a post-commit check.** It `[SKIP]`s while
  `bootstrap/` is dirty, by design: it compares *regenerated* IR against
  *committed* IR. Commit first, then run it.
- Long suites can outlive an agent's command timeout. Run them individually
  rather than as one batch when that happens; `run-dev-tests.sh`'s suites are
  independent.
