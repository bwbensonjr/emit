## 1. The expand pass

- [ ] 1.1 Add `expand` (new `src/passes/expand.ss`, or a section of `src/parse.ss`) as a source→source pass recursing over the whole program expression
- [ ] 1.2 Expand `cond` (with `else`; require a body per clause) to nested `if`/`begin`
- [ ] 1.3 Expand `and` to short-circuit `if` chains (no temp needed)
- [ ] 1.4 Expand `or` to `(let ([t e]) (if t t <rest>))` using a fresh name for `t`
- [ ] 1.5 Expand `when` / `unless` to `if` + `begin`
- [ ] 1.6 Expand `let*` to nested `let` (empty bindings → `begin`)
- [ ] 1.7 Expand named `let` to `letrec` + immediate call, preserving tail position
- [ ] 1.8 Recurse into all subforms (bodies of `lambda`/`let`/`letrec`/`define`, arms of `if`, args of calls) so derived forms nest freely
- [ ] 1.9 Draw fresh names from the existing rename counter (reset per program)

## 2. Pipeline wiring and observability

- [ ] 2.1 Insert `expand` in `compile-file` between `collect-toplevel` and `parse`
- [ ] 2.2 Add the `expand` stage to `--dump`, after `collect-toplevel`
- [ ] 2.3 Confirm programs with no derived forms pass through `expand` unchanged

## 3. Demos and tests

- [ ] 3.1 Add a demo exercising `cond`, `and`/`or`, `when`/`unless`, `let*`, and a named-`let` loop, including a derived form inside a top-level `define` body
- [ ] 3.2 Add a tail-recursive named-`let` (or `cond`-in-tail) demo to confirm bounded stack
- [ ] 3.3 Add the demos to `demos/run-tests.sh` with expected values

## 4. Verify end to end

- [ ] 4.1 Build and run the demos; confirm correct values and short-circuit semantics
- [ ] 4.2 Run `--dump` and confirm `expand` prints after `collect-toplevel` and rewrites the derived forms to core
- [ ] 4.3 Confirm all existing M1/M2 demos still pass unchanged
- [ ] 4.4 Confirm no changes to `src/runtime/runtime.c`, `src/emit.ss`, or `src/passes/{recognize-let,convert-assignments,convert-closures,lower}.ss`

## 5. Spec sync

- [ ] 5.1 Sync the `core-language` (added requirement) and `aot-codegen` (modified stage-dump) deltas into `openspec/specs/`
