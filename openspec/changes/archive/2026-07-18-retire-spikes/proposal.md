## Why

The `spike/` tree was scaffolding for decisions that are now settled and recorded in the
specs and archived changes. It is ~20,003 LOC — 8.7% of the whole tree — dominated by the
vendored nanopass copy (18,487 LOC) kept only while the front-end pass framework was
undecided. That question is resolved (hand-rolled `match` passes; see `compiler-pipeline`),
so the vendored dependency and the prototypes are now dead weight the complexity catalogue
correctly surfaces. Every spike's decision lives in a live spec and its rationale/numbers in
the corresponding archived change, so the prototypes can go without losing the record.

## What Changes

- Remove the entire `spike/` tree: the vendored nanopass copy plus the five first-party
  prototypes (`nanopass/`, `calling-convention/`, `flatten/`, `form-complete/`, `guard/`).
- Before deletion, relocate the empirical findings still cited from live docs so nothing is
  lost and no reference dangles:
  - `LLVM.md` cites `spike/calling-convention/RESULTS.md` — its numbers are already stated
    inline; reword the trailing pointer to the archived `calling-convention-spike` /
    `argc-overflow-calling-convention` changes.
  - `docs/PIPELINE.md` cites `spike/nanopass/` in three places — its findings are summarized
    inline; reword the pointers to the archived `spike-nanopass-translation` /
    `select-syntax-rules-matcher` changes and drop the "kept as the worked reference" note.
- Fix the remaining in-tree references to spike paths: provenance comments in
  `src/passes/recognize-let.ss`, `src/repl-core.ss`, and `src/runtime/runtime.c`, and the
  `.gitignore` entry for `spike/calling-convention/spike`.
- Regenerate `docs/COMPLEXITY.md` (`make catalogue`) so the catalogue reflects the removal.

## Capabilities

### New Capabilities
<!-- None. This is repository cleanup; it introduces no capability. -->

### Modified Capabilities
- `complexity-catalogue`: The requirement that separates roles cites *the vendored nanopass
  tree under `spike/`* as its concrete example of `vendored`, and a scenario asserts that
  tree is classified `vendored`. Deleting `spike/` removes the only vendored code in the
  tree, so that example and scenario are updated to be example-agnostic (the `vendored` and
  `spike` roles remain in the taxonomy but may legitimately have zero members). No other
  requirement changes: no spec asserts spike retention.

## Impact

- **Removed**: `spike/` (all of it) — ~20,003 LOC across 78 files (55 vendored nanopass +
  23 first-party).
- **Modified**: `LLVM.md`, `docs/PIPELINE.md` (reference rewording); provenance comments in
  `src/passes/recognize-let.ss`, `src/repl-core.ss`, `src/runtime/runtime.c`; `.gitignore`;
  `docs/COMPLEXITY.md` (regenerated).
- **No effect** on the compiler, runtime, build, or any shipped artifact — nothing under
  `spike/` is on any build path (verified: no `Makefile`/`tools`/`src` build rule includes
  it). The archived changes and live specs remain the record of the decisions.
