## Context

Values are tagged i64 words; the 3-bit tag currently assigns 0 fixnum, 1 bool, 2 nil,
3 pair, 4 closure, 5 box, 6 symbol — leaving only tag **7**. `parse-expr` produces
`(const d)` for integers, booleans, `()`, symbols (via `quote`), and pairs; a string or
char literal reaches the `else` and errors. `encode-const` (in `emit.ss`) already emits
private string-constant globals with correct length + escaping for symbol names, and
materializes quoted pairs with `rt_cons`. This change adds strings and chars by consuming
the last tag with a header-word scheme and extending `encode-const` + `parse`.

## Goals / Non-Goals

**Goals:**
- String and character data types: heap-represented, printable, usable inside quoted
  structure.
- Self-evaluating string/char literals (`"foo"`, `#\a`) accepted by the frontend.
- Unicode-capable from the start: characters are full Unicode codepoints and strings are
  UTF-8 byte sequences, both stored and printed faithfully (see D7).
- A header-word heap scheme that the last tag can host and that future heap types
  (vectors, …) extend without needing a new primary tag.

**Non-Goals:**
- String/char operations (`string-ref`, `string-length`, `string->symbol`,
  `char->integer`, `substring`, `string=?`, `char=?`) — a follow-on library, which also
  owns the byte-vs-codepoint length/indexing decision (D7).
- `eqv?` and guaranteed string/char identity (only symbols are interned; see D4).
- The reader / any I/O.
- Named-char printing beyond a minimal set (see D5).

## Decisions

### D1 — Tag 7 as a header-word "extended" object; strings and chars both live there

Only one primary tag remains, but two new types are needed, so tag 7 becomes a generic
**extended heap object** whose first word is a small type code (`HDR_STRING`, `HDR_CHAR`).
Both strings and chars are allocated under tag 7 and discriminated by that header word.
This is the header-word scheme the value-representation notes anticipated; a later type
(vector, bytevector, flonum-box) adds a new header code with no tag change.

- **String** object: `{ header = HDR_STRING, length, char *bytes }` (bytes in
  `GC_MALLOC_ATOMIC` storage; explicit length so embedded NULs are fine).
- **Char** object: `{ header = HDR_CHAR, codepoint }`.

**Alternative considered — char as an immediate.** Cheapest for chars (no allocation) and
would give `eq?` on equal chars for free, but there is no spare tag for a new immediate
(tag 7 is spent on the extended scheme, which strings *require*), and sub-tagging the
boolean/nil immediate space is fiddly and collision-prone. Rejected for now; an
immediate-char representation is a noted future optimization once value-equality and a
char-heavy workload justify it.

### D2 — String literal emission (reuse the symbol constant emitter)

A string literal is self-evaluating, so `parse` yields `(const "…")`. `encode-const` emits
a private byte-array constant global (`@.str.lit.N = private … c"…\00"`) via the same
length/escaping helper already used for symbol names, then a materialization call
`call i64 @rt_make_string(ptr @.str.lit.N, i64 <byte-length>)`. The trailing NUL is emitted
for C-friendliness; the explicit byte length is authoritative.

### D3 — Char literal emission

`(const #\a)` → `call i64 @rt_make_char(i64 <codepoint>)`, the codepoint taken with
`char->integer` at emit time (an inline immediate). No global needed.

### D4 — Identity / equality deferred

Strings and chars created by this change are **not interned**, so two literals are not
`eq?` (as with quoted-list literals from the symbols change; only symbols are interned).
Value-equality (`eqv?`, `char=?`, `string=?`) is out of scope and arrives with the
operations follow-on. Nothing in this change relies on string/char identity.

### D5 — Printing (UTF-8 aware)

`rt_write` is the pragmatic program-value printer. Strings print write-style with
surrounding double quotes (`"hello"`), emitting their stored UTF-8 bytes verbatim so
non-ASCII contents render correctly on a UTF-8 terminal. A character prints `#\` followed
by the character itself: because a char holds a Unicode codepoint (D1/D7), `rt_write`
**UTF-8-encodes the codepoint** back into bytes (1–4 bytes) rather than assuming a single
ASCII byte, so `#\λ` prints as `#\λ`. A minimal named-char set (`#\space`, `#\newline`) is
handled specially; all other codepoints print as `#\` + their UTF-8 bytes. Symbols still
print bare (unchanged).

### D6 — Frontend unchanged except two `parse` cases; no new pass

`parse-expr` gains `[(string? e) (const ,e)]` and `[(char? e) (const ,e)]`; `rename`
leaves consts alone (unchanged). No new pass or stage — the change is `parse` +
`emit` + `runtime`, mirroring symbols-and-quote plus the two literal cases symbols did not
need.

### D7 — Unicode

The data types are Unicode-capable from the start:

- **Characters are Unicode codepoints.** A char holds the full Unicode scalar value
  (0–#x10FFFF); the emitter derives it with Chez's `char->integer` and passes it to
  `rt_make_char(i64)`. Chez's `read` already parses non-ASCII literals like `#\λ`, so no
  frontend work is needed beyond the `char?` case. Printing UTF-8-encodes the codepoint
  (D5).
- **Strings are UTF-8 byte sequences with an explicit byte length.** A literal is emitted
  through the same `string->utf8`-based helper the symbol names use, so `"日本語"` is stored
  as its UTF-8 bytes and the recorded length is the **byte** count. Printing emits those
  bytes verbatim.

**Deliberately deferred to the operations library:** whether string *length* and *indexing*
are measured in bytes or codepoints (e.g. `(string-length "日本語")` = 9 bytes vs. 3
codepoints), and `string-ref`/`substring` semantics. This change stores and round-trips
Unicode faithfully but adds no such operations, so it does not yet commit to that choice —
it is flagged here so the follow-on decides it deliberately rather than backing into a
byte-oriented answer. A Unicode demo (a non-ASCII string and a non-ASCII char literal)
locks the storage/print round-trip across all three backends.

## Risks / Trade-offs

- **Header-word scheme correctness** → tag-7 objects must always be read header-first;
  `rt_write` and any future consumer dispatch on the header. Covered by string/char/nested
  demos across all three backends.
- **String-constant escaping/length** → reuses the symbol emitter's `c"…"` byte escaping and
  length (incl. trailing NUL); covered by string demos with varied contents.
- **Char boxing cost / identity** → documented (D1, D4); acceptable for a print-only
  milestone, with immediate-char and interning noted as future work.
- **Cross-backend behavior** → `rt_make_string` / `rt_make_char` materialization must agree
  under AOT/JIT/bitcode; the 3-backend harness with the new demos is the gate.
- **Tag budget exhausted** → after this, all 8 primary tags are assigned (0–6 direct, 7 =
  extended/header); further heap types are header codes under tag 7, documented in `LLVM.md`.
