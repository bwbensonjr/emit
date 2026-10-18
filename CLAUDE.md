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

## Terminology

- Prefer the concrete command or component name. Use **command** for `emit run`,
  `emit repl`, `emit build`, or `emit lib`, and **verb** only for the selector
  (`run`, `repl`, `build`, or `lib`).
- Use **compilation path** for a way source reaches the shared compiler core,
  **execution path** for a way compiled code runs, **host** for the component
  supplying I/O or process integration, and **workflow** for a broader developer
  activity.
- Do not use **door** as a generic metaphor. Preserve it only inside an exact
  historical identifier such as `run-door-user-libraries` or an accurate
  quotation.

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

**`make regen` is an explicit barrier, not an automatic build step.** Finish
compiler-source edits before regenerating, and do not edit those inputs again
until their validation finishes. `bash tools/compiler-inputs.sh --list` is the
authoritative ordered assembly/generator inventory shared by regeneration,
classification, source fingerprints, and independent-host verification. It
includes the flat core, entry programs, REPL core, baked prelude, partition
declaration, generated partition members, and assembly/generation scripts.
`src/emit.cpp` is native host C++; it reaches binaries through plain `make`, not
regen. `src/compile.ss` is the Chez driver, not an assembled compiler input;
editing it requires source units/reference checks, not native IR regeneration.

Choose validation by the changed inputs, not an unconditional whole-developer
suite after every edit:

- During compiler iteration, `bash tools/test.sh units` exercises current source
  directly under Chez before regeneration. `chez --libdirs src --script
  src/compile.ss` also remains available for the direct source edit/test loop.
- `bash tools/test.sh dev --changed BASE` provides focused native feedback. It
  is not comprehensive, and native feedback alone never proves an edited Scheme
  compiler was regenerated. Inspect the plan and its current-source label.
- After compiler/partition/assembly changes, explicitly run `make regen`, full
  native regression (`bash tools/test.sh full`), source units, the classified
  targeted reference suites, and `bash tools/test.sh source`. Compiler acceptance
  requires the source check even when a local fingerprint matches.
- Host/runtime/library changes need their classified native checks and CI gates;
  they do not require compiler regeneration unless they also change an assembly
  input. Documentation-only changes use lightweight validation, not LLVM builds.
- `bash tools/test.sh reference` retains complete independent-host verification.
  It runs once for releases and weekly/manual validation, rather than per LLVM
  matrix cell. `./run-dev-tests.sh` remains the explicit aggregate of units,
  source consistency, and complete reference verification. Explicit Chez-based
  requests fail if Chez is missing; native and source profiles need no Chez.

The source profile and its legacy `test/trust-check.sh` entry point regenerate
an isolated git-clean snapshot of the current working-tree inputs, including
uncommitted edits and deletions, and compare every declared bootstrap module.
They never rewrite the developer checkout and never turn dirty bootstrap files
into a success skip. A matching uncommitted source/IR pair can be verified before
commit. Missing, extra, or stale modules fail.

A successful explicit regeneration records `build/source-fingerprint.json`.
`python3 tools/source-fingerprint.py --status` reports content-bound source,
bootstrap, and toolchain/options digests. Missing or mismatched hints label
native results as unverified for current compiler source; they do not trigger
regen automatically or replace the source comparison. Proof outputs may be
reused only within one validated invocation with matching inputs, toolchain,
and options; source consistency and independent-host proof are distinct.

Killing explicit regeneration mid-flight can leave `bootstrap/` mixed-source.
Recover by running it to convergence before accepting native feedback. The
isolated source check instead retains failure diagnostics in its temporary
workspace without modifying the original bootstrap files.

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

Long suites can outlive an agent's command timeout. Select stable suite IDs with
`bash tools/test.sh --suite ID`, preserve their reports, and poll long-running
commands rather than weakening coverage or treating timeouts as passes.
