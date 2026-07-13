## 1. Runtime: string construction and comparison primitives

- [ ] 1.1 `rt_string_eq(a, b)`: `#t` iff equal byte length and equal bytes
- [ ] 1.2 `rt_string_append(a, b)`: allocate a new string = a's bytes ++ b's bytes
- [ ] 1.3 `rt_symbol_to_string(sym)`: fresh string over the symbol's name bytes
- [ ] 1.4 `rt_list_to_string(lst)`: walk a char list, UTF-8-encode each codepoint, build the string
- [ ] 1.5 `rt_make_string_fill(k, ch)`: string of `k` copies of character `ch`
- [ ] 1.6 Add/confirm a shared UTF-8 *encode* helper (inverse of the existing decode helper)

## 2. Frontend + codegen: wire the primitives

- [ ] 2.1 `parse.ss`: add `string=? string-append symbol->string list->string make-string` to `*prims*`
- [ ] 2.2 `emit.ss`: add each to `prim-table` (→ `rt_*`) and emit its `declare` (arities: 2,2,1,1,2)
- [ ] 2.3 Confirm the fixed-arity `primcall` path emits them unchanged

## 3. Prelude: character comparisons and string->list

- [ ] 3.1 `char=?`, `char<?`, `char>?`, `char<=?`, `char>=?` — n-ary via `apply` over `char->integer` + numeric comparisons
- [ ] 3.2 `string->list` — loop `string-ref` from the end, consing characters

## 4. Demos and tests

- [ ] 4.1 Demo: character comparisons (`(char<? #\a #\b #\c)` → `#t`, out-of-order → `#f`)
- [ ] 4.2 Demo: `string=?`, `string-append`, `symbol->string`
- [ ] 4.3 Demo: `string->list` / `list->string` round-trip, incl. a non-ASCII string
- [ ] 4.4 Demo: `(make-string 3 #\x)` → `"xxx"`
- [ ] 4.5 Add the demos to `demos/run-tests.sh` with expected values

## 5. Verify

- [ ] 5.1 Build and run the demos; confirm comparison and construction results
- [ ] 5.2 `demos/run-backends.sh`: the new demos agree across AOT/JIT/bitcode
- [ ] 5.3 Confirm existing demos unaffected (only runtime + parse `*prims*` + emit `prim-table` + prelude changed)

## 6. Docs and spec sync

- [ ] 6.1 Update `LLVM.md` runtime-primitive list and the root `README.md` status
- [ ] 6.2 Sync the `core-language` (added) delta into `openspec/specs/`
