## Context

`strings-and-characters` added the string and character data types as tag-7 extended heap
objects: a string is `{HDR_STRING, byte-length, char *bytes}` holding UTF-8, and a
character is `{HDR_CHAR, codepoint}`. It added literals, printing, and quoted-structure
composition, but no operations, and it explicitly deferred the byte-vs-codepoint decision
for string length/indexing. Runtime primitives are C functions wired through a fixed-arity
`primcall` (`*prims*` in `parse.ss` → `prim-table` + `declare` in `emit.ss`), taking and
returning tagged `i64` values. This change adds the reader's foundational accessors that
way and settles the codepoint decision.

## Goals / Non-Goals

**Goals:**
- The minimal string/character accessors a Scheme reader needs: `char->integer`,
  `integer->char`, `string-length`, `string-ref`, `substring`, `string->symbol`.
- Correct Unicode behavior: codepoint-indexed strings that round-trip UTF-8 content.

**Non-Goals:**
- Comparison/other library procedures (`char=?`, `char<?`, `string=?`, `string-append`,
  `symbol->string`, `string->list`, `list->string`) — added when a consumer needs them; the
  reader compares via `char->integer` + the existing `=`/`<`.
- String mutation (`string-set!`, mutable strings).
- The prelude mechanism (arc step 2) and `read.ss` (arc step 3).
- Ports / stdin I/O.

## Decisions

### D1 — Codepoint-indexed strings (settles the deferred byte-vs-codepoint question)

`string-length`, `string-ref`, and `substring` count and index by **Unicode codepoint**,
decoding the stored UTF-8:

- `string-length` returns the number of codepoints (not bytes).
- `string-ref s i` returns the `i`-th codepoint as a character.
- `substring s a b` returns a new string of codepoints `[a, b)`, copying the underlying
  UTF-8 bytes for that codepoint range (so multibyte content is preserved intact).

This matches the `strings-and-characters` decision that "characters are Unicode codepoints"
and R7RS string semantics, and keeps `(string-ref "héllo" 1)` = `#\é` rather than a stray
continuation byte. Indexing is **O(n)** (a scan from the string start) because storage is
UTF-8; that is acceptable at this stage.

**Alternative considered — byte indexing.** Simpler and O(1) (length = byte count,
`string-ref` = a byte), but `string-ref` on a multibyte string would return a mid-codepoint
byte (not a character), and `string-length` would disagree with the character count. It
breaks the "characters are codepoints" model and R7RS, so it is rejected. A future
optimization can restore O(1) indexing by changing the *representation* (e.g. a codepoint
array or a cached byte-offset index) behind the same codepoint-indexed interface — noted,
not done here.

### D2 — Operations are runtime primitives (no new emitter concepts)

Each operation is a C function in `runtime.c` (`rt_char_to_integer`, `rt_integer_to_char`,
`rt_string_length`, `rt_string_ref`, `rt_substring`, `rt_string_to_symbol`) wired as a
reserved primitive: added to `*prims*` in `parse.ss` and to `prim-table` + the `declare`s
in `emit.ss`. They are fixed arity (1–3 args), all tagged `i64` in and out, so the existing
`primcall` path emits them with no change. Fixnum arguments (indices, codepoints) are
`UNFIX`ed in C and results `FIX`ed, exactly like the arithmetic primitives.

### D3 — `string->symbol` reuses interning

`string->symbol` reads the string's bytes and calls the existing `rt_intern`, so a symbol
produced from a string is `eq?` to the same-named symbol literal — the property the reader
needs to intern identifiers. (Source identifiers contain no embedded NULs, and the string
object already stores a trailing NUL, so passing its bytes to `rt_intern` is safe.)

### D4 — Frontend unchanged beyond the prim list

No new pass or IL node: the operations are ordinary primcalls. `parse` already lowers
`(op args …)` for `op ∈ *prims*` to `(primcall op …)`; adding the names is the only
frontend change.

## Risks / Trade-offs

- **O(n) codepoint indexing** → documented (D1); acceptable now, optimizable later behind
  the same interface without a semantic change.
- **UTF-8 decode correctness** → `string-ref`/`substring` must decode multibyte sequences
  correctly; covered by a non-ASCII demo (`(string-ref "héllo" 1)` = `#\é`, `substring`
  across a multibyte boundary) run across all three backends.
- **Bounds / domain errors** (index out of range, `integer->char` of a non-scalar value) →
  keep minimal: document that out-of-range indices are undefined for this subset (the reader
  stays in bounds); a checked-error variant can come with the broader error story. Note in
  the runtime.
- **`string->symbol` and embedded NUL** → safe for source identifiers (no NULs); a fully
  general `string->symbol` over arbitrary bytes would need length-aware interning, noted for
  when it matters.
- **Scope discipline** → deliberately smaller than a full string library; comparison and
  conversion procedures are added when a consumer (the reader, or later code) needs them,
  matching the project's incremental cadence.
