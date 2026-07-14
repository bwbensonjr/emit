## Why

The self-hosting gate check ([[self-hosting-bootstrap]] task 1.2) found gap **G3**: a
standalone native `schemec` (the path-C intermediate) must read all of stdin as source text
and write the emitted IR string to stdout, but the language has no stdin reader and no raw
string output — the runtime only has `rt_write` (prints a *value*, quoted). The pure core is
deliberately I/O-free (text→text as Scheme values); turning it into a standalone filter needs
I/O at the edges. This change resolves the path-C-vs-path-A fork and provides the minimum
needed to proceed.

## What Changes

- **Decision (see design): take path C by growing two small I/O primitives** — matching
  [[self-hosting-bootstrap]] D1 ("path C before path A"):
  - `read-all-stdin` → returns all of standard input as a string (EOF-terminated).
  - `display` (a.k.a. `write-string`) → writes a string's bytes to stdout verbatim (no quotes,
    no trailing newline), the raw counterpart to the value-printing `rt_write`.
- With these, the assembled core + a thin `main` (`(display (compile-source-string
  (read-all-stdin)))`) compiles to a native `schemec` text filter — no filesystem or
  subprocess surface, just stdin→stdout.
- Explicitly keep **path A** (embedding the compiled core in the C++ host, which would do the
  I/O across the JIT boundary and need no language primitives) as the deferred end state — it
  becomes its own follow-up once path C is stable, as [[self-hosting-bootstrap]] already notes.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: Add minimal process I/O — `read-all-stdin` (stdin → string) and `display`
  (string → stdout, raw) — sufficient for a standalone text-filter program (the path-C
  `schemec`).

## Impact

- **Code**: `src/runtime/runtime.c` (two primitives over `stdin`/`stdout`), prim/keyword
  tables + declarations (`src/parse.ss`, `src/emit.ss`), and the REPL host runtime build.
- **Depends on**: nothing hard; unblocks [[self-hosting-bootstrap]] G3 and, with
  [[internal-defines]] (G1) and [[emit-cstring-in-language]] (G2), the whole stage-1 build.
- **Scope note**: this is the pragmatic path-C enabler; path A remains a separate future
  change.
