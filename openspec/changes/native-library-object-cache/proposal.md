# Proposal

## Why

Emit already caches separately compiled library LLVM IR, but every new `emit run` or `emit repl`
process must parse, optimize, and lower that IR to machine code again. A target-specific cache of
relocatable native objects can preserve LLVM IR as the portable and bootstrap representation while
removing repeated backend work from the interactive development loop.

## What Changes

- Add a locally derived cache tier containing relocatable native object code for full, open-world
  library units used by the ORC/LLJIT execution paths.
- Populate that tier from the same LLVM IR and per-session optimization profile currently handed to
  LLJIT, capturing LLVM's object output on a miss and admitting the cached object directly on a hit.
- Key native objects on every input that can affect their code or ABI, including the Emit executable,
  cache format, library source closure, target, LLVM identity, and JIT optimization profile.
- Keep LLVM IR and library metadata authoritative: an absent, stale, corrupt, incompatible, or
  unwritable native cache falls back to the existing IR path and may repopulate the cache.
- Preserve import-time initialization and the REPL's open-world symbol model while allowing a warm
  process to avoid IR parsing, optimization, and code generation for cached libraries.
- Retain the current portable installation contract: installs ship library source, not native
  objects; objects are derived in the user-writable cache on the installed machine.
- Keep `emit build` on its existing IR, tree-shaking, LTO, and static-link path so cached full-unit
  objects cannot increase standalone executable size or weaken closed-world optimization.
- Add narration, corruption/invalidation coverage, cold-versus-warm equivalence tests, and measured
  startup/import benchmarks for the new tier.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `artifact-cache`: Extend the cache contract with target-specific native object entries, complete
  compatibility keys, direct ORC admission, transparent fallback, and installed-machine derivation.
- `interactive-repl`: Permit imported library units to enter the persistent JIT as cached native
  objects while preserving optimization-profile, symbol-visibility, initialization, recovery, and
  dev-to-ship behavior.

## Impact

The main implementation surface is the ORC/LLJIT host and cache machinery in `src/emit.cpp`, with
focused tests in the artifact-cache, unit-pipeline, JIT-optimization, REPL-module, and install-layout
suites. Documentation in `docs/MODULES.md`, `docs/OUTPUT.md`, and `docs/PERFORMANCE.md` will describe
the two cache tiers and record measurements. The change uses LLVM's existing object compilation and
object-linking layers and adds no shipped runtime dependency or installed artifact.
