## 1. Runtime: vector data type and operations

- [ ] 1.1 Add `HDR_VECTOR` (header code 2); layout `{HDR_VECTOR, length, elem…}`
- [ ] 1.2 `rt_make_vector(k, fill)`: allocate `length+2` words, write header + count, fill element slots
- [ ] 1.3 `rt_vector_ref(v, i)`: return element `i` (UNFIX the index)
- [ ] 1.4 `rt_vector_set(v, i, x)`: store `x` at element `i` in place; return an unspecified value
- [ ] 1.5 `rt_vector_length(v)`: return the count as a tagged fixnum
- [ ] 1.6 `rt_vector_p(v)`: `#t` iff `TAG_EXT` with `HDR_VECTOR`

## 2. Runtime: printer

- [ ] 2.1 Add a `TAG_EXT`/`HDR_VECTOR` arm printing `#(e0 e1 …)` (recurse on elements)

## 3. Frontend + codegen: wire the primitives

- [ ] 3.1 `parse.ss`: add `make-vector vector-ref vector-set! vector-length vector?` to `*prims*`
- [ ] 3.2 `emit.ss`: add each to `prim-table` (→ `rt_*`) and emit its `declare` (arities 2,2,3,1,1)
- [ ] 3.3 Confirm the fixed-arity `primcall` path emits them unchanged

## 4. Prelude: constructor, conversion, reader syntax

- [ ] 4.1 `list->vector` (make-vector + loop of vector-set!)
- [ ] 4.2 `vector` (variadic constructor over `list->vector`)
- [ ] 4.3 `rd-hash`: `#(` branch — read elements via `rd-list`, convert with `list->vector`

## 5. Equality follow-on (conditional)

- [ ] 5.1 If `equal?` exists, add a vector arm to `rt_equal` (same length + element-wise `equal?`); else defer to that change

## 6. Demos and tests

- [ ] 6.1 Demo: `(vector 1 2 3)`, `vector-ref`, `vector-length`
- [ ] 6.2 Demo: `make-vector` + `vector-set!` mutation, then read back
- [ ] 6.3 Demo: `vector?` on a vector and a non-vector
- [ ] 6.4 Demo: reader `#(1 2 3)` round-trips (prints `#(1 2 3)`)
- [ ] 6.5 Add the demos to `demos/run-tests.sh` with expected values

## 7. Verify

- [ ] 7.1 Build and run the demos; confirm construction, indexing, mutation, printing, reading
- [ ] 7.2 `demos/run-backends.sh`: the new demos agree across AOT/JIT/bitcode (GC: vectors survive)
- [ ] 7.3 Confirm existing demos unaffected

## 8. Docs and spec sync

- [ ] 8.1 Add the `HDR_VECTOR` row to `LLVM.md` and `src/README.md`; update root `README.md` status
- [ ] 8.2 Sync the `core-language` (added) delta into `openspec/specs/`
