## 1. Runtime: bytevector data type and operations

- [x] 1.1 Add `HDR_BYTEVECTOR` (header code 1, reclaiming the retired `HDR_CHAR` slot); layout `{HDR_BYTEVECTOR, byte-length, uchar *bytes}` (separate `GC_MALLOC_ATOMIC` buffer, per the string precedent — see design D1)
- [x] 1.2 `rt_make_bytevector(k, fill)`: allocate a 3-word header + a `GC_MALLOC_ATOMIC` byte buffer, `memset` the buffer to `fill`
- [x] 1.3 `rt_bytevector_u8_ref(bv, i)`: read byte `i` (UNFIX index), return tagged fixnum
- [x] 1.4 `rt_bytevector_u8_set(bv, i, byte)`: store byte `i` in place (UNFIX index + byte); return unspecified
- [x] 1.5 `rt_bytevector_length(bv)`: return the count as a tagged fixnum
- [x] 1.6 `rt_bytevector_p(bv)`: `#t` iff `TAG_EXT` with `HDR_BYTEVECTOR` (guard the ext-header deref behind the `TAG_EXT` check)

## 2. Runtime: printer and equality

- [x] 2.1 Add a `TAG_EXT`/`HDR_BYTEVECTOR` printer arm rendering `#u8(b0 b1 …)` (bytes as decimals)
- [x] 2.2 Add a `HDR_BYTEVECTOR` arm to `rt_equal` (same length + byte-wise `memcmp`)

## 3. Frontend + codegen: wire the primitives

- [x] 3.1 `parse.ss`: add `make-bytevector bytevector-u8-ref bytevector-u8-set! bytevector-length bytevector?` to `*prims*`
- [x] 3.2 `emit.ss`: add each to `prim-table` (→ `rt_*`) and emit its `declare` (arities 2,2,3,1,1)
- [x] 3.3 Confirm the fixed-arity `primcall` path emits them unchanged (arity is taken from the call site + the declares; no arity table to touch)

## 4. Prelude: constructor and reader syntax

- [x] 4.1 `bytevector` (variadic constructor over `make-bytevector` + `bytevector-u8-set!` loop; plus a `list->bytevector` helper the reader reuses)
- [x] 4.2 `rd-hash`: `#u8(` branch — consume `u8`, read elements via `rd-list`, build via `list->bytevector`
- [x] 4.3 Regenerate `lib/scheme/base.sld` from `src/prelude.scm` (`chez --script tools/gen-scheme-base.ss`) — the `(scheme base)` library the Chez driver / AOT path compiles is generated, not hand-edited

## 5. Demos and tests

- [x] 5.1 Demo: `(bytevector 1 2 3)`, `bytevector-u8-ref`, `bytevector-length`
- [x] 5.2 Demo: `make-bytevector` + `bytevector-u8-set!` mutation, then read back
- [x] 5.3 Demo: `bytevector?` on a bytevector and a non-bytevector (e.g. a vector)
- [x] 5.4 Demo: reader `#u8(1 2 3)` round-trips (prints `#u8(1 2 3)`)
- [x] 5.5 Demo: `(equal? (bytevector 1 2 3) (bytevector 1 2 3))` => `#t`
- [x] 5.6 Add the demos to `demos/run-tests.sh` (and `demos/run-backends.sh`) with expected values

## 6. Verify

- [x] 6.1 Build and run the demos; confirm construction, indexing, mutation, printing, reading, equality (scheme-run + REPL)
- [x] 6.2 `demos/run-backends.sh`: the new demos agree across AOT/JIT/bitcode (GC: bytevectors survive) — 44/44
- [x] 6.3 Confirm existing demos unaffected (run-all-tests.sh 6/6; regenerated the byte-identity baseline for the ABI growth)

## 7. Docs and spec sync

- [x] 7.1 Add the `HDR_BYTEVECTOR` row to `LLVM.md` and `src/README.md`; update root `README.md` status
- [x] 7.2 Sync the `core-language` (modified) delta into `openspec/specs/` (done at archive time via `openspec archive`)
