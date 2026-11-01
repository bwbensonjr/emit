# Design Principles

The core design principles of the Emit Scheme system, gathered from the project
`CLAUDE.md`, the top-level `README.md`, and [`PIPELINE.md`](PIPELINE.md). Those sources
remain authoritative; this page summarizes them in one place.

The common thread: Emit is a small, readable compiler where the same code produces the
same result whether you run it in the REPL or as a shipped executable.

## 1. A simple, transparent compiler

- The compiler aims to be as simple and easy to understand as possible: clear control
  flow, separate stages, logging, and visibility into what each stage does.
- The frontend does only the top third of a classic Scheme compiler: read, expand, core,
  assignment conversion, closure conversion, lambda lifting, then emit textual LLVM IR.
  Everything below that (calling conventions, instruction selection, register
  allocation) is left to LLVM (see [`PIPELINE.md`](PIPELINE.md)).
- The passes are hand-written. The project tried the nanopass framework against
  hand-written passes and recorded the comparison in the archived OpenSpec change
  `spike-nanopass-translation`.

## 2. Self-hosting with a verifiable fixed point

- The compiler is written in Scheme and was first built with Chez Scheme. It now
  compiles its own source to a byte-identical fixed point.
- Day-to-day work needs only LLVM and libgc. Chez is kept only to verify: the
  independent-host re-derivation of the fixed point and the trust check against stale
  bootstrap files.
- `make regen` is a deliberate step you run when you choose, not an automatic build
  step. Changes to the compiler are proven by comparing the generated IR, which is why
  reformatting commits are kept separate from other edits.

## 3. Standalone executables come first

- Building small, clean, self-contained native executables is a defining goal.
- Binary size is a design concern. It favors compiling libraries separately over
  shipping a large prelude.
- The three backends (AOT, JIT, bitcode) are checked to agree byte for byte.

## 4. The REPL is the main development loop, and it matches the shipped build

- Code you develop and debug in the REPL must compile to an executable that behaves
  identically.
- The REPL and the batch compiler share one compiler core, embedded in-process on a
  persistent LLVM ORC/LLJIT host. That shared core is the main argument for embedding
  the compiler.

## 5. The module is the shared unit of compilation

- A library compiles once to an artifact: IR or object code plus a compile-time export
  interface.
- That same artifact loads into the REPL and links into a static executable.
- The prelude is treated as "library zero."
- Exporting macros requires a compile-time interface kept separate by phase, not just
  IR.
- The module syntax follows R7RS-small (`define-library`, `import`, `export`). See
  [`MODULES.md`](MODULES.md).

## 6. Tools report what they do

- Every tool, script and pipeline stage announces its action, names its inputs and
  outputs, and reports metrics such as sizes, durations and counts.
- Output is concise by default and controlled by `EMIT_VERBOSITY`. Narration goes to
  stderr and data to stdout (see [`OUTPUT.md`](OUTPUT.md)).

## 7. Process rules that support the above

- **Planning:** OpenSpec holds designs and work being started (`openspec/`).
- **Bugs and performance debt:** correctness bugs go in GitHub Issues. Speed, memory
  and binary-size debt goes in [`PERFORMANCE.md`](PERFORMANCE.md) as design essays.
- **Formatting:** Scheme layout is applied by pitch, a formatter that Emit itself
  compiles.
- **Versioning:** every non-trivial change bumps the version under SemVer and adds a
  changelog entry, and merging to `main` releases it (see [`RELEASES.md`](RELEASES.md)).
