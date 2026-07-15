## Context

The runtime has two output paths for values:

- `rt_write` (`src/runtime/runtime.c`) — the full tag-walking value printer used
  by the standalone/JIT `main` to print a program's final value (WRITE style:
  strings in `"…"`, chars as `#\a`/`#\space`/…, recurses through pairs/vectors).
- `rt_display` — a one-liner that `fwrite`s a string's bytes raw. It assumes a
  string and calls `str_bytes`/`str_len`, which cast the value to a heap pointer
  and read a header. On a fixnum/pair/symbol/etc. that reads arbitrary memory and
  **segfaults**.

`display` is a reserved primitive (`src/parse.ss` `*prims*`), emitted as a call
to `@rt_display` (`src/emit.ss`). In the compiler's own source `display` is only
ever applied to a string (the `schemec` filter entry
`(display (compile-source-string …))`), which is why the bug never surfaced in
self-hosting or the demos. The README lists `display`/`write` as procedures under
*Not yet done*, i.e. a general `display` is a real, wanted capability.

The value representation and tag set are documented in `LLVM.md`; the printer
already knows how to render every tag (via `rt_write`).

## Goals / Non-Goals

**Goals:**
- `display` prints ANY datum in R7RS display style (strings unquoted, chars raw),
  recursing in display style through compound structure.
- The value printer is **memory-safe**: it dispatches on the tag and never
  dereferences a value as the wrong type. `(display <non-string>)` never crashes.
- Behavior for strings is byte-for-byte unchanged (self-hosting output preserved).
- `write` style (final-value printing) is unchanged.

**Non-Goals:**
- `write` as a first-class Scheme procedure; `newline`, ports, or file I/O.
- Any change to the emitted IR, the `@rt_display` signature, or the calling
  convention (this is a runtime-only fix).
- A configurable/pretty printer, cycle detection, or datum labels.

## Decisions

### D1: One shared printer parameterized by a write/display mode

Extract a single recursive `print_val(val v, int display)` and reimplement both
entry points on top of it:

- `void rt_write(val v)   { print_val(v, /*display=*/0); }`
- `val  rt_display(val v) { print_val(v, /*display=*/1); return NIL_V; }`

Mode differences (the ONLY differences):

| Tag | write | display |
|---|---|---|
| `HDR_STRING` | `"` + bytes + `"` | bytes only |
| `HDR_CHAR` | `#\a` / `#\space` / `#\newline` / `#\<utf8>` | the raw character |
| everything else (fixnum, bool, nil, pair, symbol, vector, closure, box, error, unknown) | identical | identical |

Compound structures recurse **in the same mode** (R7RS: `(display (list "a" #\b))`
prints `(a b)`), so `print_val` threads `display` through the pair and vector
loops.

*Alternative — a standalone display printer duplicating the tag walk:* rejected;
it would drift from `rt_write` and re-introduce the very bug class (two printers,
one forgotten tag). One printer, two thin wrappers, keeps them in lockstep.

`rt_display` keeps returning `NIL_V` (unspecified) so `(begin (display x) …)`
still composes, exactly as today.

### D2: Memory safety comes from tag dispatch, not string assumptions

The crash is a category error: `rt_display` assumed "string" without checking the
tag. `print_val` already `switch`es on `tag_of(v)` and, for `TAG_EXT`, on
`ext_hdr(v)`, with a `default` arm (`#<ext:…>` / `#<unknown:…>`). Routing
`display` through it makes every value type safe by construction — there is no
tag for which the printer dereferences the wrong shape. No separate "is it a
string?" guard or trap is needed; the existing `default` arms are the graceful
fallback for any unexpected tag (so the "clean trap" fallback from the proposal is
subsumed — the printer simply never has an unhandled, unsafe path).

### D3: Runtime-only change; no IR regeneration

`display` is already `declare i64 @rt_display(i64)` in the emitted IR (`emit.ss`),
and the C signature is unchanged. So the committed `bootstrap/*.ll` do not change
and need no `make regen`. Rebuilding relinks `build/runtime-host.o` into
`scheme-run`/`repl-host` and recompiles `runtime.c` for AOT — `make` handles both.
The trust-check stays green (bootstrap IR untouched).

## Risks / Trade-offs

- **A stray reliance on the old string-only behavior** (e.g. code that expected
  `(display <string>)` semantics) → none exists: display of a string is
  byte-identical before/after; only previously-crashing calls change behavior
  (crash → correct output). Confirmed the sole in-tree caller passes strings.
- **write/display divergence bugs** (a tag handled in one mode but not the other)
  → eliminated by construction: one printer, mode only gates strings/chars.
- **Nested display mode surprises** (someone expecting inner strings quoted) →
  this is exactly R7RS `display` semantics; documented in the spec scenarios.

## Migration Plan

Runtime-only, no data/format migration. Steps: refactor `runtime.c`, `make`
(relink), run `./run-all-tests.sh` (Chez-free) and `./run-dev-tests.sh` (backends
+ trust-check). Rollback is reverting the single-file change; committed IR is
untouched throughout.

## Open Questions

- None blocking. (`newline`/`write` as procedures are deliberately deferred to a
  future change; this one only makes `display` total and safe.)
