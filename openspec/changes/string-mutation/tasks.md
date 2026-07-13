## 1. Runtime: string mutation

- [ ] 1.1 `rt_string_set(s, i, ch)`: find codepoint `i`'s byte range, encode `ch`, rebuild the buffer (splice)
- [ ] 1.2 Update the string object's byte-length (word[1]) and bytes pointer (word[2]) in place (preserve identity)
- [ ] 1.3 `rt_string_copy(s)`: fresh object over a fresh copy of the bytes
- [ ] 1.4 Reuse the shared UTF-8 encode/decode helpers; ensure the new buffer is GC-reachable before dropping the old

## 2. Frontend + codegen: wire the primitives

- [ ] 2.1 `parse.ss`: add `string-set! string-copy` to `*prims*`
- [ ] 2.2 `emit.ss`: add each to `prim-table` (→ `rt_string_set` / `rt_string_copy`) and emit its `declare` (arities 3, 1)
- [ ] 2.3 Confirm the fixed-arity `primcall` path emits them unchanged

## 3. Demos and tests

- [ ] 3.1 Demo: `(let ((s (make-string 3 #\a))) (string-set! s 1 #\b) s)` → `"aba"`
- [ ] 3.2 Demo: byte-length change — replace an ASCII char with a multibyte one; re-check `string-length` (codepoints) and `string-ref`
- [ ] 3.3 Demo: aliasing — two bindings to one string; set via one, read the change via the other
- [ ] 3.4 Demo: `string-copy` — mutating the copy leaves the original unchanged
- [ ] 3.5 Add the demos to `demos/run-tests.sh` with expected values

## 4. Verify

- [ ] 4.1 Build and run the demos; confirm in-place mutation, byte-length change, aliasing, and copy independence
- [ ] 4.2 `demos/run-backends.sh`: the new demos agree across AOT/JIT/bitcode
- [ ] 4.3 Confirm existing demos unaffected (only runtime + parse `*prims*` + emit `prim-table` changed)

## 5. Docs and spec sync

- [ ] 5.1 Update `LLVM.md` runtime-primitive list and the root `README.md` status (strings now mutable)
- [ ] 5.2 Sync the `core-language` (added) delta into `openspec/specs/`
