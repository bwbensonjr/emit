## 1. Runtime primitives

- [x] 1.1 In `src/runtime/runtime.c`, add `val rt_eqv_p(val a, val b) { return truthy(a == b); }` with a comment that `==` suffices while all eqv?-relevant types are immediate/interned
- [x] 1.2 In `src/runtime/runtime.c`, add `val rt_not(val x) { return truthy(x == FALSE_V); }`

## 2. Emitter and parser wiring

- [x] 2.1 In `src/emit.ss`, add `(eqv? "rt_eqv_p")` and `(not "rt_not")` to `prim-table`
- [x] 2.2 In `src/emit.ss`, add the `declare i64 @rt_eqv_p(i64, i64)` and `declare i64 @rt_not(i64)` lines alongside the other prim declares
- [x] 2.3 In `src/parse.ss`, add `eqv?` and `not` to `*prims*` (`eq?` already present)

## 3. N-ary chaining in the expand pass

- [x] 3.1 In `src/passes/expand.ss`, add `eq?` and `eqv?` to the `case (car e)` clause that routes to `expand-compare`
- [x] 3.2 Add `eq?`→`(eq? x y)` and `eqv?`→`(eqv? x y)` cases to `cmp-pair` (symmetric, no swap/combine)
- [x] 3.3 Confirm `not` needs no expand handling — `(not x)` parses directly as a primcall

## 4. Prelude

- [x] 4.1 In `src/prelude.scm`, remove `(define (not x) (if x #f #t))` and update the nearby comment that references it

## 5. Demos and tests

- [x] 5.1 Add a demo (`demos/eq-not.scm`, expected `1100110101`) exercising chained `eq?`/`eqv?` (true and false chains), `eqv?` on fixnums/symbols, `not` on `#f`/`#t`/non-boolean, trivial arity, and single-evaluation of a `set!`-counter middle operand. NOTE: discovered during impl that chars are boxed/non-interned, so `(eqv? #\a #\a)` is `#f`; demo tests fixnums/symbols only and the proposal/design/spec were corrected accordingly (char eqv? is a deferred follow-on)
- [x] 5.2 Add it to `demos/run-tests.sh` with the expected value
- [x] 5.3 Add it to `demos/run-backends.sh` for the cross-backend regression check

## 6. Verify

- [x] 6.1 Build and run the demo; confirm correct value and that the `set!` counter increments exactly once
- [x] 6.2 Run `demos/run-tests.sh` and `demos/run-backends.sh`: all demos agree across AOT/JIT/bitcode (including `string-unicode`, which uses the now-primitive `not`)
- [x] 6.3 Confirm existing `eq?`-using demos still pass (symbol-eq, prelude memq/assq)

## 7. Spec sync

- [x] 7.1 Sync the `core-language` added requirements (n-ary identity predicates, `eqv?`, `not`) into `openspec/specs/`
