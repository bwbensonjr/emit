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
  regen guarantees a failure ~25 minutes into a 20-suite run.
- Killing a regen mid-flight leaves `bootstrap/` **mixed-source** — one `.ll`
  from the new source, the others from the old. Recover with
  `git checkout -- bootstrap/` if the tree is committed, or by running regen to
  convergence if it is not.

So: edit → `make regen` (~12 min) → `./run-all-tests.sh` → `./run-dev-tests.sh`.

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
