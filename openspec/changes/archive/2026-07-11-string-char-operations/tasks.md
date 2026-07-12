## 1. Runtime: string/char operations (UTF-8 / codepoint aware)

- [x] 1.1 `rt_char_to_integer` (char → fixnum codepoint) and `rt_integer_to_char` (fixnum → char)
- [x] 1.2 `rt_string_length`: codepoint count of a string's UTF-8 bytes (decode, not byte length)
- [x] 1.3 `rt_string_ref`: return the nth codepoint of a string as a character (scan UTF-8)
- [x] 1.4 `rt_substring`: new string of codepoints `[start, end)`, copying the underlying UTF-8 bytes
- [x] 1.5 `rt_string_to_symbol`: intern the string's bytes via `rt_intern` (eq? to the symbol literal)
- [x] 1.6 Add a small shared UTF-8 decode helper (advance one codepoint / index by codepoint)

## 2. Frontend + codegen: wire the primitives

- [x] 2.1 `parse.ss`: add `char->integer integer->char string-length string-ref substring string->symbol` to `*prims*`
- [x] 2.2 `emit.ss`: add each to `prim-table` (op → `rt_*`) and emit its `declare` (correct arity)
- [x] 2.3 Confirm the fixed-arity `primcall` path emits them unchanged (1–3 tagged-i64 args)

## 3. Demos and tests

- [x] 3.1 Demos: `char->integer`/`integer->char`, `string-length`/`string-ref`, `substring`, and `string->symbol` with `eq?` on the interned result
- [x] 3.2 Non-ASCII demo: `(string-length "héllo")` = 5 and `(string-ref "héllo" 1)` = `#\é` (codepoint indexing)
- [x] 3.3 Add them to `demos/run-tests.sh` with expected values

## 4. Verify

- [x] 4.1 Build and run the demos; confirm accessor results and codepoint indexing
- [x] 4.2 Run `demos/run-backends.sh`: the new demos agree across AOT/JIT/bitcode
- [x] 4.3 Confirm existing demos unaffected (only runtime + parse `*prims*` + emit `prim-table` changed)

## 5. Docs and spec sync

- [x] 5.1 Update `LLVM.md` runtime-primitive list if needed (no value-representation change)
- [x] 5.2 Sync the `core-language` (added) delta into `openspec/specs/`
