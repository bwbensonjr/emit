# Design Principles

Emit is a small, readable Scheme compiler and runtime system that
leverages LLVM to provide efficient code, separate compilation, and
identical behavior across the JIT-based read-eval-print loop and the
generation of small, stand-alone executables.

## A simple, transparent compiler

- The compiler aims to be as simple and easy to understand as
  possible: clear control flow, separate stages, logging, and
  visibility into what each stage does.
- The frontend does only the top third of a classic Scheme compiler:
  read, expand, core, assignment conversion, closure conversion,
  lambda lifting, then emits textual LLVM IR.  Everything below that
  (calling conventions, instruction selection, register allocation) is
  left to LLVM (see [`PIPELINE.md`](PIPELINE.md)).
- We experimented with using the nifty
  [nanopass framework](https://nanopass.org/) for frontend
  transformation passes, but settled on hand-written passes for
  greater overall simplicity (see
  [`RESULTS.md`](../openspec/changes/archive/2026-07-10-spike-nanopass-translation/RESULTS.md)).

## Self-hosting with a verifiable fixed point

- The compiler is written in Scheme and was bootstrapped with
  [Chez Scheme](https://github.com/cisco/chezscheme). It now compiles
  its own source to a byte-identical fixed point.
- The resulting compiler is committed as LLVM IR under [`bootstrap/`](../bootstrap)
  and can be built and used on any system with a supported LLVM tool chain.
  No installed Scheme system is required.
- `make regen` is a deliberate step you run when you choose, not an automatic build
  step. Changes to the compiler are proven by comparing the generated IR, which is why
  reformatting commits are kept separate from other edits.

## Standalone executables come first

- Building small, clean, self-contained native executables is a defining goal.
- Binary size is a design concern. It favors compiling libraries separately over
  shipping a large prelude.
- The three backends (AOT, JIT, bitcode) are checked to agree byte for byte.

## The read-eval-print loop (REPL) uses the same compiler

- Code developed and debugged dynamically in the REPL must compile to
  an executable that behaves identically.
- To achieve this, the REPL and the batch compiler are the same.
- In the case of the REPL, the compiler is embedded in-process on a
  persistent LLVM ORC/LLJIT host.

## The module is the shared unit of compilation

- A module compiles as a library with an `.ll` LLVM IR file and an
  `.exports` file containing information about the exported globals
  and exported macro definitions, if any.
- That compiled library can either load into the REPL or be used to
  link into a static executable.
- Exported macros are made available to the compiler when imported and are expanded
  by the compiler 
- The module syntax follows R7RS-small (`define-library`, `import`, `export`). See
  [`MODULES.md`](MODULES.md).

## Tools report what they do

- Every tool, script and pipeline stage announces its action, names its inputs and
  outputs, and reports metrics such as sizes, durations and counts.
- Output is concise by default and controlled by `EMIT_VERBOSITY`. Narration goes to
  stderr and data to stdout (see [`OUTPUT.md`](OUTPUT.md)).

## Process rules that support the above

- **Planning:** OpenSpec holds designs and work being started (`openspec/`).
- **Bugs and performance debt:** correctness bugs go in GitHub Issues. Speed, memory
  and binary-size debt goes in [`PERFORMANCE.md`](PERFORMANCE.md) as design essays.
- **Formatting:** Scheme layout is applied by pitch, a formatter that Emit itself
  compiles.
- **Versioning:** every non-trivial change bumps the version under SemVer and adds a
  changelog entry, and merging to `main` releases it (see [`RELEASES.md`](RELEASES.md)).
