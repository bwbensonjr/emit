## Context

`src/compile.ss` is both the pure compiler and its shell. The pure part (reader/expander/
passes/emit) is already effectively a function of the forms; the impure part is
`host-target-header` (`process`), file reads/writes, `system`/clang, and CLI parsing. The
REPL path already demonstrates the split in spirit: it frames IR text over a pipe to the
host. This change makes the split explicit and names the core's contract.

## Goals / Non-Goals

**Goals:**
- A pure `compile-forms`/`compile-source-string` with no I/O or subprocess use.
- The driver retains today's behavior and flags (AOT/JIT/bitcode, `--dump`, `--no-prelude`,
  `--repl`).
- Define the core's self-hosting-facing contract: stdin text → stdout IR text.

**Non-Goals:**
- Growing the language/runtime (later steps).
- Making the core self-compilable yet (that is [[self-hosting-bootstrap]]).
- Changing emitted IR or any observable result.

## Decisions

### D1: Core is a string/forms→string function; driver owns all effects

`compile-source-string : string -> string` reads forms with the in-language reader path and
returns IR text. The target-triple header (today via `process` calling clang) is an *effect*
and moves to the driver, which prepends it to the core's output before writing `.ll` — so
the core stays pure and host-agnostic.

### D2: stdin→stdout as the core's boundary

Provide a driver mode that reads all of stdin as source and writes IR to stdout, matching
the REPL host's text orientation. This is the shape a self-hosted core will run in (the
driver/host supplies the header and calls clang), so the filesystem/subprocess surface never
enters the self-hosting target.

## Risks / Trade-offs

- **Hidden effect leakage** (a "pure" function that still touches a port) → assert purity by
  running the core with no filesystem access in a test; keep the target header strictly in
  the driver.
- **Behavior drift during refactor** → the full suite (AOT + REPL + backends) must stay
  byte-identical; this is a pure restructuring.

## Migration Plan

1. Extract the pure pipeline into `compile-forms`/`compile-source-string`.
2. Reduce the driver to: read → (prepend header) → call core → write/clang/JIT.
3. Add the stdin→stdout core mode.
4. Full suite green; emitted IR unchanged.

## Open Questions

- Does the core live in `compile.ss` (as exported functions) or a new `src/core.ss` the
  driver includes? Prefer a new file if it clarifies the boundary.
- Should `--repl` route through the same core entry point (it nearly does already)?
