## Why

`display` is memory-unsafe on any non-string argument. `rt_display`
(`src/runtime/runtime.c`) reads its argument with `str_bytes`/`str_len`, which
dereference the value as a tag-EXT string header — so `(display 42)`,
`(display (cons 1 2))`, `(begin (display 42) 99)` all **segfault** (exit 139),
while `(display "hi")` works. `display` is currently a "write these string bytes
to stdout" primitive, not the R7RS `display` procedure. Shipping a segfault on a
valid-looking program is a footgun, and the README already lists `display` as a
procedure under *Not yet done*.

## What Changes

- **Generalize `display` to any datum, in R7RS display style.** `display` SHALL
  print any value — fixnums, booleans, `()`, pairs, symbols, characters,
  vectors, strings, closures/boxes/error objects — with strings printed as their
  raw contents (no surrounding `"`) and characters printed as the raw character
  (no `#\` prefix), recursing in display style through pairs and vectors. `write`
  style (quoted strings, `#\`-prefixed chars) is unchanged.
- **Make the value printer memory-safe.** The printer SHALL dispatch on the tag
  and never dereference a value as the wrong type; a non-string argument to
  `display` never segfaults.
- Refactor the runtime so `rt_write` (write style) and `rt_display` (display
  style) share one tag-walking printer parameterized by a write/display mode.
  `display` keeps returning the unspecified value so it still composes in
  `begin`.
- Behavior for strings is unchanged, so the self-hosted `schemec` filter
  (`(display (compile-source-string …))`) emits byte-identical output.

## Capabilities

### New Capabilities
- _(none)_

### Modified Capabilities
- `core-language`: add a requirement that `display` writes any datum in display
  style and is memory-safe for every value type (no crash on non-strings),
  distinct from the existing `write`-style value printing.

## Impact

- **Code:** `src/runtime/runtime.c` only — extract a shared printer used by both
  `rt_write` and `rt_display`. No change to emitted IR (`display` is already
  `declare i64 @rt_display(i64)`), so **no bootstrap IR regeneration** is needed;
  binaries just relink (runtime picked up via `build/runtime-host.o` and the AOT
  runtime link).
- **Tests:** add demo(s) exercising `(display …)` over a fixnum, pair, symbol,
  char, and nested structure (strings unquoted) with expected stdout to
  `demos/run-tests.sh` (runs under both `RUNNER=scheme-run` and `RUNNER=aot`),
  proving correct formatting and no segfault.
- **Non-goals:** `write` as a first-class procedure; ports/file I/O; any change
  to the emitted IR or calling convention. Pre-existing bug, independent of the
  archived `self-hosting-completion` change.
