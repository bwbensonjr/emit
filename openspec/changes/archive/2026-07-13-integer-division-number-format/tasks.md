## 1. Integer division primitives

- [x] 1.1 Add `rt_quotient` and `rt_remainder` to `src/runtime/runtime.c` (truncating toward zero over tagged i64; divide-by-zero traps via `rt_trap`).
- [x] 1.2 Register `quotient`/`remainder` in the primitive table (`src/parse.ss`) and add their `declare` + primcall lowering in `src/emit.ss`.
- [x] 1.3 Verify with a small AOT program (`(quotient 17 5)`, negatives).

## 2. number->string

- [x] 2.1 Implement `(number->string n)` in `src/prelude.scm` (sign + digit peeling via `quotient`/`remainder`, `integer->char`, `list->string`).
- [x] 2.2 Test round-trip against the reader: `(read-from-string (number->string n)) = n`.

## 3. Verification

- [x] 3.1 Rebuild the REPL host (make-based; new rt_* present) and run `./run-all-tests.sh`; all suites pass.
- [x] 3.2 Decide + document most-negative-fixnum behavior.
