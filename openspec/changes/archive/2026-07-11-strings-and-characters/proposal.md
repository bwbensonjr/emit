## Why

`quote` and symbols landed, but two data types the reader needs are still missing: strings
and characters. A source `"foo"` or `#\a` dies in `parse` (neither is an integer, boolean,
`()`, symbol, or pair) and there is no runtime type to hold them. Strings and characters
are the last data prerequisite for the reader (which reads text into symbols, strings, and
chars) and for any real I/O. They also force the decision the tag budget has been deferring:
tags 0–6 are used (fixnum, bool, nil, pair, closure, box, symbol) and only tag 7 remains,
so a new type needs the **header-word scheme** the earlier design notes anticipated.

## What Changes

- **Runtime** — introduce a header-word heap scheme on the last pointer tag (7 = "extended"
  object whose first word is a small type code). Add **string** objects (length + bytes) and
  **character** values under it; `rt_write` prints strings (`"…"`) and chars (`#\x`).
- **Codegen** — string literals emit a private byte-array constant global plus a runtime
  materialization call (**reusing** the private string-constant emitter built for symbols);
  character literals emit a make-char call with the codepoint.
- **Frontend** — `parse-expr` gains `string?` / `char?` cases producing `(const d)` (string
  and char literals are self-evaluating, so unlike symbols they do not arrive via `quote`).
- Quoted structure composes: a quoted list may now contain strings and chars, materialized
  by the existing `rt_cons` recursion over the extended encoders.

## Capabilities

### New Capabilities
<!-- None: extends the existing data types and constant handling. -->

### Modified Capabilities
- `core-language`: add strings and characters as first-class data types with
  self-evaluating literals, printable by name/quotation.
- `aot-codegen`: the value-representation scenario is updated for the header-word scheme
  (tag 7 = extended objects) and runtime-materialized string/char literals.

## Impact

- **Code:**
  - `src/runtime/runtime.c` — tag 7 extended objects + header codes; `rt_make_string`,
    `rt_make_char`, `rt_write` cases; heap layout for strings and chars.
  - `src/emit.ss` — `encode-const` grows string and char cases; generalize the private
    byte-array constant emitter (from symbols) for string literals.
  - `src/parse.ss` — `string?` / `char?` → `(const d)`.
  - `demos/` — string literal, char literal, quoted list with strings/chars.
- **Verification:** `demos/run-backends.sh` (3-way) with the new string/char demos; existing
  demos unaffected.
- **Unaffected:** calling convention, closures, the other passes.
- **Deferred (noted):** the string/char operation library (`string-ref`, `string-length`,
  `string->symbol`, `char->integer`, `substring`, `string=?`, `char=?`), value-equality
  (`eqv?`) and char/string identity, and the reader itself — all follow-ons. This change adds
  the data types, their literals, and printing only.
- **Enables (future):** the reader (reads into symbols/strings/chars) and I/O.
