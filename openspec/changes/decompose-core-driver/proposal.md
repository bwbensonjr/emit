## Why

Self-hosting is far smaller if we don't have to self-host the *whole* driver. Today
`src/compile.ss` mixes two concerns: a **pure core** (source forms → LLVM IR text: reader,
expander, passes, emit) and a **driver** (file I/O, `process`/clang subprocess, ports,
argument parsing). The pure core needs only lists/symbols/strings/vectors; the driver needs
the filesystem and subprocess surface — the hardest thing to bring into the language.
Separating them lets self-hosting target just the core (text in → IR text out), leaving the
driver in Chez/bash indefinitely. This is roadmap step 0 (see
`openspec/explorations/chez-free-repl.md`) and the highest-leverage structural move: it
shrinks what every later step must cover.

## What Changes

- Factor `src/compile.ss` into:
  - a **core** entry point — a pure function `(compile-forms forms) -> ir-text` (and/or
    `(compile-source-string str) -> ir-text`) with **no** file/subprocess/port use; and
  - a thin **driver** that reads the source, calls the core, writes the `.ll`, and invokes
    clang / the JIT / bitcode backends.
- Keep all existing behavior and CLI flags identical; the driver just delegates the
  forms→IR step to the core.
- Establish the core's I/O contract as **stdin source text → stdout IR text** (reusing the
  existing REPL-host framing style), so a future self-hosted core is a text filter.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `compiler-pipeline`: Add a requirement that the compiler separates a pure forms→IR core
  from the I/O/subprocess driver, and that the core performs no file, subprocess, or port
  I/O — so the self-hosting target is the core alone.

## Impact

- **Code**: `src/compile.ss` refactor (extract the pure pipeline; driver delegates). No
  change to passes, emit, runtime, or emitted IR — the full suite is the regression oracle.
- **Enables**: every later self-hosting step targets the smaller core surface; the driver's
  filesystem/subprocess needs never have to be self-hosted.
- **Foundational for**: [[integer-division-number-format]], [[multiple-values]],
  [[error-and-guard-conditions]], [[stdin-source-reader]], [[self-hosting-bootstrap]].
