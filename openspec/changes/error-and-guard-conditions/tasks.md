## 1. error primitive over rt_trap

- [ ] 1.1 Add `rt_error` in `src/runtime/runtime.c` (format who/message/irritants into `rt_trap_msg`, `longjmp` via `rt_trap`; null-hook path `exit(1)`s), modeled on `rt_arity_error`.
- [ ] 1.2 Register `error` and lower it in `src/emit.ss`; format the message in-language using string primitives + `number->string`.
- [ ] 1.3 Verify: `(error 'who "msg" x)` reports + survives under the REPL host; aborts a standalone program.

## 2. guard (only if the core needs it)

- [ ] 2.1 After [[decompose-core-driver]], determine whether the pure core needs any `guard` (vs. recovery living in the driver/host).
- [ ] 2.2 If needed, add a single-level `guard` desugar backed by the trap hook; otherwise record that no in-language `guard` is required and drop that part of the spec delta.

## 3. Verification

- [ ] 3.1 Rebuild the REPL host; run `./run-all-tests.sh`; all suites pass.
- [ ] 3.2 Add a demo/test asserting `error` behavior (report+survive in REPL; abort standalone).
