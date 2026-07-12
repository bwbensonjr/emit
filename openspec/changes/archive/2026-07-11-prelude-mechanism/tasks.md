## 1. Prelude file

- [x] 1.1 Create `src/prelude.scm` with `not`, `list` (variadic), `length`, `reverse`, `append`, `map`, `memq`, `assq`, written in Scheme over existing primitives
- [x] 1.2 Keep the starter names collision-free with current demo defines (no `list*`, `even?`, `odd?`)

## 2. Driver: prepend + shadowing

- [x] 2.1 `compile.ss`: read the prelude file's forms (like `read-program`) and prepend them to the user program's forms before `collect-toplevel`
- [x] 2.2 User-wins shadowing: drop any prelude `define` whose name is also defined at the user program's top level
- [x] 2.3 Add a `--no-prelude` flag that compiles the user program's forms alone
- [x] 2.4 Confirm all-lambda prelude defines join the top-level `letrec` (mutual visibility with user code)

## 3. Demos and tests

- [x] 3.1 Demo using prelude procedures: `(map (lambda (x) (* x x)) (list 1 2 3))` and `(reverse (list 1 2 3))`
- [x] 3.2 Add it to `demos/run-tests.sh` with the expected value
- [x] 3.3 (Optional) a `--no-prelude` sanity check on a demo that uses no prelude names

## 4. Verify

- [x] 4.1 Build and run the prelude demo; confirm correct values
- [x] 4.2 Run `demos/run-backends.sh`: the prelude demo agrees across AOT/JIT/bitcode
- [x] 4.3 Confirm all existing demos still pass unchanged (no collisions; prelude is additive)

## 5. Docs and spec sync

- [x] 5.1 Update `LLVM.md` / `docs/PIPELINE.md` to note the prelude step in program assembly
- [x] 5.2 Sync `compiler-pipeline` (added) and `core-language` (added) deltas into `openspec/specs/`
