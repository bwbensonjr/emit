## 1. Runtime: structural equality

- [ ] 1.1 `rt_equal(a, b)`: return `TRUE_V`/`FALSE_V`; fast-path `eqv?`-style identity/immediate equality
- [ ] 1.2 Pair arm: both pairs → recurse `equal?` on cars and cdrs
- [ ] 1.3 String arm: both strings → equal codepoint content (compare stored UTF-8 bytes: equal length + equal bytes)
- [ ] 1.4 Default arm: otherwise `#f`

## 2. Frontend + codegen: wire the primitive

- [ ] 2.1 `parse.ss`: add `equal?` to `*prims*`
- [ ] 2.2 `emit.ss`: add `equal?` to `prim-table` (→ `rt_equal`) and emit its `declare` (arity 2)
- [ ] 2.3 Confirm the binary `primcall` path emits it unchanged

## 3. Prelude: list library

- [ ] 3.1 `member` (structural analogue of `memq`, using `equal?`)
- [ ] 3.2 `assoc` (structural analogue of `assq`, using `equal?`)
- [ ] 3.3 `filter`
- [ ] 3.4 `fold-left` (tail-recursive) and `fold-right` (non-tail), single-list, R6RS argument order
- [ ] 3.5 Update the prelude comment noting member/assoc now exist

## 4. Demos and tests

- [ ] 4.1 Demo: `(equal? (list 1 (list 2 3)) (quote (1 (2 3))))` → `#t`; unequal case → `#f`
- [ ] 4.2 Demo: `equal?` on two separately-constructed equal strings → `#t` (content, not identity)
- [ ] 4.3 Demo: `member`/`assoc` finding by value; `filter`; `fold-left`/`fold-right`
- [ ] 4.4 Add the demo(s) to `demos/run-tests.sh` with expected values

## 5. Verify

- [ ] 5.1 Build and run the demos; confirm structural equality and list results
- [ ] 5.2 `demos/run-backends.sh`: the new demo agrees across AOT/JIT/bitcode
- [ ] 5.3 Confirm existing demos unaffected (only runtime + parse `*prims*` + emit `prim-table` + prelude changed)

## 6. Docs and spec sync

- [ ] 6.1 Update `LLVM.md` runtime-primitive list (`rt_equal`) and the root `README.md` status
- [ ] 6.2 Sync the `core-language` (added) delta into `openspec/specs/`
