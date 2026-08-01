## Why

Emit programs can write to standard output and read nothing. `display`, `write`, `newline`, and
`write-char` all target stdout implicitly; the only input in the language is `%read-all-stdin`, which
slurps the whole stream. There is no port object, no way to open a file, no `read-char`/`read-line`,
no `read`, and no `eof-object`. A program that wants to process a file cannot be written.

That is the largest remaining hole in the language surface, and it was left deliberately: the
`io-output-primitives` change (archived) states its non-goals as "ports / `current-output-port`,
`write-string`, `write-char`, and any input-side primitives … This change is output-only and
port-implicit." This change is the deferred half.

It is also much smaller than it looks, because three pieces of the design are already in place:

- **The runtime printer is already port-parameterized.** `print_val(FILE *out, val v, int display)`
  is shared by `rt_display`, `rt_write`, and `rt_stderr_write`, which differ only in the `FILE *`
  they pass. Directing output at a port is choosing that argument.
- **The reader is already incremental.** `rd-datum s n i` returns `(datum . next-index)` — a single
  datum plus the position after it, which is exactly one `read` step against a port. `read` is not
  new code; it is the existing reader given a cursor that persists.
- **The object model already reserved the eof object.** `runtime.c`: tag 001 is a misc-immediate
  family whose 5-bit subtype has `SUB_BOOL 0`, `SUB_CHAR 1`, `SUB_UNSPEC 2`, and the comment says
  "further singletons (eof-object) can take new subtypes without needing a new primary tag."

## What Changes

- **Port objects**, represented as records over the existing record layer (tag 7), so `port?`,
  `input-port?`, `output-port?`, and `textual-port?` come from the record predicate rather than a
  new heap type.
- **Input ports are a string plus a cursor.** `open-input-file` slurps the file at open time, which
  makes a file input port and a **string port** (`open-input-string`) the same object, and makes
  `read-char`, `peek-char`, `read-line`, `read-string`, and `read` pure Scheme over the reader that
  already exists. Consistent with `%read-all-stdin`, which already slurps.
- **Output ports carry a runtime handle** — a small integer index into a `FILE *` table owned by the
  runtime, so no C pointer is ever stored in a Scheme value. `open-output-file`, `close-port`, and
  `flush-output-port` manage the table; `open-output-string` / `get-output-string` accumulate in
  Scheme instead.
- **The output procedures gain an optional port argument**: `(display x)` and `(display x port)`,
  likewise `write`, `newline`, `write-char`, and a new `write-string`. With the argument omitted they
  behave exactly as now, so every existing program is unaffected.
- **`read`, `read-char`, `peek-char`, `read-line`, `read-string`, `char-ready?`**, and
  **`eof-object`** / **`eof-object?`**, with the eof object as misc-immediate subtype 3.
- **`current-output-port`, `current-input-port`, `current-error-port`** as procedures returning fixed
  ports. **Not** parameter objects — there is no `make-parameter`, `parameterize`, or `dynamic-wind`
  in the implementation, so `with-output-to-file` and friends are out of scope (see Non-Goals).
- New primitives, all thin wrappers over what `runtime.c` already does: file open/close/flush, a
  write-string-to-handle, and a read-file-to-string sibling of `rt_read_all_stdin`.

## Capabilities

### New Capabilities

- `io-ports`: port objects, their predicates and lifecycle; opening and closing textual file and
  string ports; the input operations (`read-char`, `peek-char`, `read-line`, `read-string`, `read`)
  and the eof object; port-directed output.

### Modified Capabilities

- `core-language`: the existing `display` / `write` / `newline` / `write-char` requirements gain an
  optional port argument, with the no-argument behaviour unchanged.

`primitive-layer` needs no delta: its requirements govern how *any* primitive behaves — universally
available, first-class, shadowable, bare-primcall for a direct call — and the new file and
port-handle primitives inherit all four without changing what those requirements say.

## Impact

- `src/runtime/runtime.c` — a `FILE *` handle table with open/close/flush/write-string entry points;
  `rt_read_file` (the `rt_read_all_stdin` slurp with `fopen`); `print_val` reached through a handle
  rather than only `stdout`/`stderr`; `SUB_EOF` as misc-immediate subtype 3, and `print_val` teaching
  for it.
- `src/parse.ss` — the new names in `*prims*`; `src/emit.ss` — their prim→runtime mapping and externs.
- `src/prelude.scm` → `lib/scheme/base.sld` — the port record type and every procedure above;
  `read` reuses `rd-datum`, which is already written. Regenerated via `tools/gen-scheme-base.ss`.
- `docs/PRIMITIVES.md`, `docs/r7rs/` conformance notes, and demos exercising a round-trip.
- `bootstrap/*.ll` — regenerated. **`(scheme base)` grows**, so unlike the last two changes this one
  does move `bootstrap/scheme.base.ll` and every program's binary; size is a first-class concern here
  (see design D5).
- Unblocks issue #18's `include` family, which needs a compile-time file read — though the compiler
  core stays I/O-free and would still take an injected reader.
