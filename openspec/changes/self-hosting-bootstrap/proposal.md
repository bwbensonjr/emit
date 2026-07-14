## Why

The capstone (roadmap step 6): once the prerequisite steps land, the compiler *core* should
be compilable by scheme-llvm itself. This change makes that real and proves it — the compiler
compiles its own core, and the result is stable (a fixed point). It also establishes the
pragmatic intermediate (path C: a compiled `schemec` the driver/host shells out to) before
any in-process embedding (path A). See `openspec/explorations/chez-free-repl.md`.

## What Changes

- **Gate check:** confirm the core's source is within the language scheme-llvm accepts (all
  prerequisites done): [[decompose-core-driver]], [[prelude-cxr-and-case]],
  [[integer-division-number-format]], [[multiple-values]], [[error-and-guard-conditions]],
  [[stdin-source-reader]], and the already-done `match`/syntax-rules and vectors work.
- **Stage-1 build:** use the Chez-hosted compiler to compile the core to native `schemec`
  (path C). The driver/host invokes `schemec` (text→IR) instead of `chez … compile.ss`.
- **Fixed-point (triple) test:** compile the core with `schemec` to produce stage-2 IR;
  require stage-1 and stage-2 IR to be **byte-identical**. That stability is the proof of
  self-hosting.
- **Bootstrap policy:** decide whether to check in a stage-0 artifact or always bootstrap
  from Chez until the language is fully self-sufficient.

## Capabilities

### New Capabilities
- `self-hosting`: The compiler core can compile its own source, producing a stable fixed
  point; a compiled `schemec` replaces Chez at compile time (path C), with in-process
  embedding (path A) as the end state.

### Modified Capabilities
<!-- none -->

## Impact

- **Code**: build scripting for `schemec`; driver/host wiring to call it; a fixed-point test
  harness. No new language features here — this change *consumes* the earlier steps.
- **Depends on**: all six prerequisite changes above. This proposal is the tracking umbrella;
  it should be applied last.
- **Scope note**: path A (in-process embedding of the compiled compiler in the REPL host) is
  the end state and may be split into its own follow-up once path C is stable.
