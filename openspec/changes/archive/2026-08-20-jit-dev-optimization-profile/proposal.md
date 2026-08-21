## Why

`emit run` and `emit repl` hand each LLVM module to ORC/LLJIT without an optimization
pipeline, so the primary development doors pay call and allocation overhead that the
`-O2 -flto` ship path removes.  On the reproducible reader workload this leaves the JITted
program about 28% slower than the delivered executable after startup is excluded, and it
turns reader structure that is free under AOT into the separate P12 performance item.

## What Changes

- Give the shipped `emit run` and `emit repl` ORC hosts a standard LLVM per-module
  optimization pipeline before each module is materialized.
- Add `-O0`, `-O1`, and `-O2` to both doors.  The development default becomes `-O1`;
  `-O0` preserves the current unoptimized path for diagnosis and comparison, while `-O2`
  permits an explicit execution-speed-over-JIT-latency choice.
- Apply the selected profile uniformly to baked libraries, manifest libraries, whole-program
  modules, and incremental REPL form modules.  The REPL remains open-world: optimization may
  not internalize externally visible definitions, merge forms, or assume that no later form
  will refer to an earlier binding.
- Keep compiler-produced IR and its observation channels unchanged.  `emit run --emit`
  continues to print the pre-backend modular IR used by regen and byte-identity checks; because
  it does not start a JIT, combining `-O` with `--emit` or the non-executing
  `--resolve-program` mode is reported as a usage error rather than silently ignoring the
  request.
- Re-baseline JIT compilation/materialization time and execution time separately, then measure
  `-O0`/`-O1`/`-O2` on the token-reader workload and representative short, call-heavy, and
  allocation-heavy programs.  Re-measure P12 after the default profile is enabled.
- Leave AOT optimization, the Chez driver's `--backend jit`, cross-module LTO, the Scheme
  compiler's own optimizing passes, and emitted calling conventions unchanged.

## Capabilities

### New Capabilities

<!-- None. -->

### Modified Capabilities

- `emit-cli`: `emit run` gains the JIT optimization-level options, defaults to `-O1`, and
  defines their interaction with the compile-only `--emit` path.
- `interactive-repl`: every module admitted to the persistent ORC session uses the selected
  optimization profile without weakening incremental/open-world semantics, and `emit repl`
  gains the same optimization-level options and default.

## Impact

- **Host code:** `src/emit.cpp` gains one shared LLVM new-pass-manager transform used by both
  LLJIT instances and option parsing for the two JIT doors.  This is host C++, not compiler
  source, so it does not require `make regen` and must not change `bootstrap/*.ll`.
- **LLVM API surface:** add the PassBuilder/new-pass-manager headers and analysis-manager setup
  already supplied by the supported LLVM installation; no new third-party dependency.
- **CLI:** additive `-O0`/`-O1`/`-O2` options on `run` and `repl`; their help text and invalid
  option/combination diagnostics are covered by the existing CLI conventions.
- **Observability:** verbose narration identifies the selected profile and reports optimization
  time separately from program execution; stdout data and `--dump` output remain unchanged.
- **Tests and measurements:** extend CLI, run-door, REPL persistence/redefinition, backend-value
  equivalence, and output-channel tests; use `tools/gen-reader-bench.ss` for the P12/P13 before
  and after; update `docs/PERFORMANCE.md`, `docs/PROJECTS.md`, and `docs/PIPELINE.md` with the
  measured result and the frontend/backend boundary.
