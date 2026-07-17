## Why

The README lists **bytevectors** under "Not yet done → Data." Bytevectors are the
fixed-length, byte-addressed aggregate that R7RS-small requires for binary data and the
UTF-8 bridge to strings; they are the value the reader's `#u8(...)` syntax denotes. The value
representation already anticipates new aggregates: heap types live under the extended-object
tag (tag 7) with a new header code, "without needing a new primary tag" — exactly as
`vectors` did.

## What Changes

- **Runtime — new data type** — a bytevector as a tag-7 extended heap object with a new
  header code `HDR_BYTEVECTOR`: layout `{HDR_BYTEVECTOR, length, packed-bytes…}`, storing
  `length` raw bytes (not tagged words). Add the operations `make-bytevector`,
  `bytevector-u8-ref`, `bytevector-u8-set!` (mutation), `bytevector-length`, and the
  `bytevector?` predicate, wired as reserved primitives.
- **Runtime — printer** — extend the tag-walking value printer to render a bytevector as
  `#u8(b0 b1 …)`.
- **Prelude** — `bytevector` (variadic constructor) built on `make-bytevector` +
  `bytevector-u8-set!`.
- **Reader** — extend `rd-hash` so `#u8(...)` reads its byte elements and builds a bytevector.
- **Equality (follow-on)** — extend `rt_equal` so two bytevectors are `equal?` iff same
  length and byte-wise equal.

## Capabilities

### New Capabilities
<!-- The bytevector type is modeled as a core-language addition; see Modified Capabilities. -->

### Modified Capabilities
- `core-language`: add the bytevector data type and its operations (`make-bytevector`,
  `bytevector`, `bytevector-u8-ref`, `bytevector-u8-set!`, `bytevector-length`,
  `bytevector?`) and the `#u8(...)` reader syntax.

## Impact

- **Code:**
  - `src/runtime/runtime.c` — `HDR_BYTEVECTOR`; `rt_make_bytevector`, `rt_bytevector_u8_ref`,
    `rt_bytevector_u8_set`, `rt_bytevector_length`, `rt_bytevector_p`; printer arm; a
    bytevector arm in `rt_equal`.
  - `src/parse.ss` — add the five primitives to `*prims*`.
  - `src/emit.ss` — add each to `prim-table` and emit its `declare` (arities 2,2,3,1,1).
  - `src/prelude.scm` — `bytevector` variadic constructor and the `#u8(...)` branch of `rd-hash`.
  - `demos/` — bytevector construction / ref / set! / length demos and a `#u8(...)` reader demo.
- **Verification:** `demos/run-tests.sh` and `demos/run-backends.sh` (3-way) with the new
  demos; existing demos unaffected.
- **Representation:** adds a header code under the existing tag-7 extended-object mechanism;
  the 8-tag scheme and the calling convention are unchanged, so `aot-codegen` is untouched.
  `LLVM.md` and `src/README.md` gain the `HDR_BYTEVECTOR` row.
- **Depends on:** nothing required (foundational). Composes with `vectors` (parallel data type)
  and reuses the same extended-object machinery.
- **Enables:** binary data; `#u8(...)` reader literals; a future `utf8->string` / `string->utf8`
  bridge; bytevector I/O when ports arrive.
