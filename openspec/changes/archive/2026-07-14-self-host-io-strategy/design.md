## Context

The core is `text → IR text` as Scheme values (`compile-source-string`); all I/O lives in the
Chez driver (`emit-ir-filter` reads `(current-input-port)`, `display`s to
`(current-output-port)`). Path C makes a *native* `schemec` do that same filtering, so the I/O
the Chez driver performs must become available as compiled-language primitives. The runtime
already prints the program's final value via `rt_write` (with a trailing newline, and quoting
strings), but there is no way to (a) pull stdin into a string or (b) emit a string's bytes
raw. Both are one small C function each over the C stdio the runtime already uses.

## Goals / Non-Goals

**Goals:** resolve the G3 fork; add the two smallest primitives that let a standalone
`schemec` read source from stdin and write IR to stdout; keep them generally useful (not
self-hosting-only).

**Non-Goals:** a general port/stream abstraction, file I/O, `read`/reader on a live port
(the reader is already in-language via `read-all-from-string`), formatted output, path A
embedding (deferred).

## Decisions

### D1: Path C, via two primitives (resolves the fork)

Choose **path C** over path A now, consistent with [[self-hosting-bootstrap]] D1. Path A
(host does the I/O, calls the compiled core in-process across the JIT boundary) needs zero
language primitives but much more host integration and is the end state; path C reaches a
Chez-free compile step with far less work and is the documented stepping stone. The cost is
exactly two primitives:

- `read-all-stdin` : `() → string` — read standard input to EOF into a freshly allocated
  scheme string (UTF-8 bytes as-is; the in-language reader already handles the text).
- `display` : `string → unspecified` — write the string's bytes to stdout verbatim (no
  surrounding quotes, no added newline), i.e. `fwrite(str_bytes, 1, str_len, stdout)`. This is
  the raw sibling of `rt_write`; naming it `display` matches Scheme convention and is useful to
  ordinary programs, not just the compiler.

Register both like the existing string primitives (prim table + `*prims*` + `rt-declarations`);
`display` returns an unspecified value (e.g. NIL) so it composes in a `begin`.

### D2: The standalone `schemec` main

Once G1/G2 are closed and the core is assembled into one subset program, its entry becomes
`(display (compile-source-string (read-all-stdin)))` (prelude prepended by the build, header/
toolchain still the driver's job). That native filter is stage-1 `schemec`;
[[self-hosting-bootstrap]] task 2.x wires the driver/host to invoke it in place of
`chez … compile.ss`.

## Risks / Trade-offs

- **Growing the language surface the core/driver split tried to avoid** → limited to two edge
  primitives that only the thin `main` uses; the core proper stays pure (it still takes/returns
  strings). Accepted as the price of a standalone `schemec`; path A later removes even these.
- **`display` vs value printing** → keep `rt_write` (the final-value printer) unchanged;
  `display` is distinct (raw bytes, no newline) so existing program output is unaffected.
- **Large stdin** → read in a growable buffer; compiler-sized inputs are small.
