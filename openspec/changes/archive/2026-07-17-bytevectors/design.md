## Context

The value representation is one 64-bit tagged word; the low 3 bits are the tag. Tags 0–6 are
assigned (fixnum, boolean, nil, pair, closure, box, symbol) and tag 7 (`TAG_EXT`) is an
*extended heap object* whose first word is a header code discriminating its type. Header codes
in use are `HDR_STRING` (0), `HDR_VECTOR` (2), and `HDR_ERROR` (3); code 1 is free (the former
`HDR_CHAR` was retired when characters became immediate, change `immediate-characters`). The
runtime comment states the intent directly: "Further heap types (vectors, …) add header codes
without needing a new primary tag." Runtime primitives are C functions wired through the
fixed-arity `primcall` path; heap allocation is `rt_alloc_words` / `GC_MALLOC` under Boehm GC.
The tag-walking printer in `runtime.c` renders values and already handles pairs, strings,
vectors, characters, etc. This change follows the `vectors` template closely, differing only
in that elements are packed bytes rather than tagged words.

## Goals / Non-Goals

**Goals:**
- A mutable, fixed-length bytevector type: `{HDR_BYTEVECTOR, length, packed-bytes…}`.
- Operations: `make-bytevector`, `bytevector-u8-ref`, `bytevector-u8-set!`,
  `bytevector-length`, `bytevector?`; the `bytevector` constructor (prelude).
- Printing as `#u8(…)` and reading `#u8(…)`.
- An `rt_equal` arm for byte-wise bytevector equality.

**Non-Goals:**
- `utf8->string` / `string->utf8` — the string↔bytes bridge is a natural follow-on but
  depends on string internals; deferred until a consumer needs it.
- `bytevector-copy`, `bytevector-copy!`, `bytevector-append`, `bytevector->list` /
  `list->bytevector` — add when a consumer needs them (constructor + ref/set!/length are core).
- Bytevector I/O (`read-u8`/`write-u8`, byte ports) — arrives with the I/O/ports work.
- Bytevector quasiquote — out of scope.

## Decisions

### D1 — Bytevectors are tag-7 extended objects with `HDR_BYTEVECTOR`

A bytevector is `TAG_EXT` with first word `HDR_BYTEVECTOR` — **header code 1**, reclaiming the
retired `HDR_CHAR` slot (characters became immediate in `immediate-characters`), recorded in the
runtime and `LLVM.md`. The second word is the byte **count** (a raw `intptr_t`, matching how
`HDR_STRING`/`HDR_VECTOR` store their length), and the third word is a pointer to a separate
packed-byte buffer:

```
{ HDR_BYTEVECTOR, byte-length, unsigned char *bytes }   ; bytes in a separate GC_MALLOC_ATOMIC buffer
```

**Layout refined during implementation.** This sketch originally proposed packing the bytes
*inline* in the object (`ceil(length/8)` trailing words). The implementation instead follows the
existing `HDR_STRING` precedent exactly: the bytes live in a **separate `GC_MALLOC_ATOMIC`
buffer** the object points at. This preserves the intent — compact packed bytes, one byte per
byte, not one tagged word per byte — while being simpler (ref/set are a plain `bytes[i]`
load/store with no bit arithmetic) and GC-clean (the atomic buffer holds no pointers, so the
collector need not scan it, resolving the "should we use `GC_MALLOC_ATOMIC`" open question in the
affirmative). `rt_make_bytevector(k, fill)` allocates a 3-word header plus the byte buffer and
`memset`s the buffer to `fill`. This reuses the extended-object mechanism with no change to the
primary tag scheme, so the calling convention and `aot-codegen` are untouched.

### D2 — Operations are runtime primitives; the constructor is prelude

The indexed/allocating operations are C primitives (fixed arity, tagged-`i64` in/out):
`rt_make_bytevector(k, fill)`, `rt_bytevector_u8_ref(bv, i)` (reads one byte, returns a tagged
fixnum), `rt_bytevector_u8_set(bv, i, byte)` (`UNFIX`es index and byte, stores one byte in
place, returns unspecified), `rt_bytevector_length(bv)` (returns a tagged fixnum), and
`rt_bytevector_p(bv)` (`TAG_EXT` with `HDR_BYTEVECTOR`, guarded behind the `TAG_EXT` check like
`vector?`). Index/byte arguments are `UNFIX`ed; out-of-range is undefined for this subset,
documented in the runtime.

The variadic constructor is prelude Scheme, expressible over the primitives:

```scheme
(define (bytevector . bs)
  (let ([bv (make-bytevector (length bs) 0)])
    (let loop ([bs bs] [i 0])
      (if (null? bs) bv (begin (bytevector-u8-set! bv i (car bs)) (loop (cdr bs) (+ i 1)))))))
```

### D3 — Printer renders `#u8(b0 b1 …)`

The tag-walking printer gains a `TAG_EXT`/`HDR_BYTEVECTOR` arm: print `#u8(`, then each byte as
a decimal integer separated by spaces, then `)`. This mirrors the vector arm and is the inverse
of the reader syntax.

### D4 — Reader `#u8(...)` builds a bytevector

`rd-hash` currently dispatches on the character just past `#` (`t`, `f`, `\`, `(`). Add a `u`
branch: on `#u8(`, consume `u8`, read the parenthesized elements with the existing `rd-list`
machinery to get a list of byte integers, then convert with a small helper (`make-bytevector` +
a `bytevector-u8-set!` loop, i.e. the same body as the `bytevector` constructor applied to a
list). This keeps the reader change tiny and reuses list reading. (Reader lives in
`prelude.scm`, so the constructor from this same change is available.)

### D5 — `equal?` gains a bytevector arm

`rt_equal` gains a `HDR_BYTEVECTOR` arm: two bytevectors are `equal?` iff same length and
byte-wise equal (a `memcmp` over the payload). `equal?` already exists, so this arm lands with
this change (unlike the conditional arm in `vectors`).

## Risks / Trade-offs

- **Packed bytes vs GC** → the payload holds raw bytes, not tagged words; Boehm GC will scan
  them conservatively but they contain no pointers, so this is safe (an atomic allocation via
  `GC_MALLOC_ATOMIC` is a possible optimization, noted but not required).
- **Odd lengths / trailing padding** → `ceil(length/8)` words means the last word has unused
  high bytes; the count word bounds all access, so padding is never read as data.
- **Out-of-range indices / byte values undefined** → consistent with `vector-ref`/`string-ref`;
  a checked-error variant comes with the broader error story. Noted in the runtime.
- **Count stored raw (not a fixnum)** → matches `HDR_STRING`/`HDR_VECTOR`; `bytevector-length`
  tags it on the way out.
- **Header-code collision with a sibling data-type change** → `hash-tables` and `records` also
  claim header codes. Codes are assigned at implementation time; whichever lands first takes the
  lower number and the others shift up. Recorded so the changes compose regardless of order.

## Open Questions

- ~~Should `GC_MALLOC_ATOMIC` be used for the pointer-free payload?~~ **Resolved (yes)** — the
  implementation stores the bytes in a separate `GC_MALLOC_ATOMIC` buffer (D1), matching the
  `HDR_STRING` precedent; the collector skips scanning it.
