## 1. Chain comparisons in the expand pass

- [x] 1.1 In `src/passes/expand.ss`, add `= < > <= >=` to the `case (car e)` dispatch, routing to a new `expand-compare` helper (expand operands first)
- [x] 1.2 Bind each operand to a `fresh-name` temp via nested single-binding `let`s (`bind-temps`, mirroring `expand-or`) so operands evaluate left-to-right exactly once
- [x] 1.3 Emit the pairwise conjunction (`compare-chain` + `and-core`) as a short-circuiting `if` chain over adjacent temps
- [x] 1.4 Reduce each pairwise `cmp` to the `<` / `=` primitives (`cmp-pair`): `=`→`(= x y)`, `<`→`(< x y)`, `>`→`(< y x)`, `<=`→`(if (< x y) #t (= x y))`, `>=`→`(if (< y x) #t (= x y))`
- [x] 1.5 Arity edge cases: `(op)` and `(op a)` expand to `#t`
- [x] 1.6 Confirm the two-operand cases still emit exactly one binary `<` / `=` primcall (via the temps) and that `>`/`<=`/`>=` never reach `parse` as unknown operators

## 2. Demos and tests

- [x] 2.1 Add a demo (`demos/nary-compare.scm`) exercising chained `< = > <= >=`, a false chain, trivial arity, single-evaluation of a `set!`-counter middle operand, and a comparison nested in another form
- [x] 2.2 Add it to `demos/run-tests.sh` with the expected value (`11111101`)
- [x] 2.3 Add it to `demos/run-backends.sh` for the cross-backend regression check

## 3. Verify

- [x] 3.1 Build and run the demo; confirm correct value (`11111101`) and that the `set!` counter increments exactly once (`calls = 1`)
- [x] 3.2 Run `demos/run-tests.sh` and `demos/run-backends.sh`: all 30 demos agree across AOT/JIT/bitcode
- [x] 3.3 Confirm all existing demos still pass unchanged (existing binary `<` / `=` calls unaffected)
- [x] 3.4 Emitter fix: chained comparisons surfaced a latent `ev-if` phi bug (nested `if` in a value arm captured the wrong predecessor block); fixed with `let*` in `src/emit.ss`. No changes to `src/parse.ss` `*prims*`, `src/runtime/runtime.c`, or the other passes.

## 4. Spec sync

- [x] 4.1 Sync the `core-language` "N-ary comparison operators" added requirement into `openspec/specs/`
