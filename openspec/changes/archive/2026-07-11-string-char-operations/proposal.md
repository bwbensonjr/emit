## Why

Strings and characters exist as data (literals, printing, quoted structure), but there is
no way to *take them apart* — no `string-ref`, `string-length`, `char->integer`, or
`string->symbol`. Those accessors are the foundation of the next arc: a **Scheme
self-hosting reader**, which must scan source text character by character and build data
(symbols, strings, numbers, lists). That arc is three sequenced changes:

1. **this change** — the string/character operation primitives the reader stands on;
2. a **prelude / library mechanism** — somewhere for reusable Scheme code (like the reader)
   to live, since today a program is a single compiled unit;
3. **`read.ss`** — the reader itself, written in Scheme.

This first step also settles the **byte-vs-codepoint** string-indexing question that
`strings-and-characters` deliberately deferred.

## What Changes

- **Runtime** — add UTF-8/codepoint-aware operations on the existing tag-7 string and
  character objects: `char->integer`, `integer->char`, `string-length` (codepoint count),
  `string-ref` (nth codepoint → char), `substring` (codepoint range → new string), and
  `string->symbol` (intern a string's bytes, reusing `rt_intern`).
- **Frontend / codegen** — wire each as a reserved primitive: add the names to `*prims*`
  in `parse.ss` and to `prim-table` + the runtime declarations in `emit.ss`. They flow
  through the existing fixed-arity `primcall` machinery (1–3 tagged-`i64` args in/out), so
  no new emitter concepts.
- **Decision settled** — `string-length` / `string-ref` / `substring` are **codepoint**
  indexed (decode the stored UTF-8), matching "characters are Unicode codepoints" and R7RS
  string semantics (see design D1).

## Capabilities

### New Capabilities
<!-- None: extends the existing string/char data types with operations. -->

### Modified Capabilities
- `core-language`: add string and character operation procedures (`char->integer`,
  `integer->char`, `string-length`, `string-ref`, `substring`, `string->symbol`) with
  codepoint-indexed string semantics.

## Impact

- **Code:**
  - `src/runtime/runtime.c` — the six operations, UTF-8 aware (codepoint scan for indexing).
  - `src/parse.ss` — add the names to `*prims*`.
  - `src/emit.ss` — add to `prim-table` and emit the `declare`s.
  - `demos/` — accessor demos incl. a non-ASCII case proving codepoint indexing.
- **Verification:** `demos/run-backends.sh` (3-way) with the new demos; existing demos
  unaffected.
- **Unaffected:** value representation and the calling convention are unchanged (only new
  primitives), so **`aot-codegen` is untouched** — this is a `core-language` capability
  addition.
- **Deferred (noted):** `char=?`/`char<?`, `string=?`/`string-append`/`symbol->string`/
  `string->list`/`list->string` (add when a consumer needs them — the reader classifies and
  compares via `char->integer` + the existing `=`/`<`), string mutation (`string-set!`),
  the prelude mechanism (arc step 2), `read.ss` (arc step 3), and ports / stdin I/O.
- **Enables (next):** arc step 2 (prelude) and step 3 (the Scheme reader).
