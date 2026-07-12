## 1. Widen the emitted prototype

- [x] 1.1 In `emit-code-def`, change the `define` to `tailcc i64 @label(i64 %self, i64 %argc, i64 %a0 … i64 %a{K-1}, ptr %overflow)` (add `%argc` after `%self` and `%overflow` after the positional slots)
- [x] 1.2 Leave param→`%aI` binding, `%self`, and body emission unchanged; `%argc`/`%overflow` are unused for now

## 2. Update call sites

- [x] 2.1 In `emit-app`, build the call argument list as `i64 <fop>, i64 <argc>, i64 <a0..a{K-1} padded>, ptr null`, where `<argc>` is `(length aops)` (actual arg count) as a constant
- [x] 2.2 Confirm both paths — `musttail call tailcc` (tail) and plain `call tailcc` (non-tail, from `@scheme_entry`) — emit the new shape
- [x] 2.3 Leave `*arity*`/`max-arity` (`K`), `pad-args` positional padding, closure/free-var loads, and `rt-declarations` unchanged

## 3. Verify musttail and prototype

- [x] 3.1 Inspect emitted IR for a demo: confirm the widened `define` prototype and `argc`/`ptr null` at call sites
- [x] 3.2 Confirm caller/callee prototypes still match so `musttail` compiles with no LLVM error
- [x] 3.3 Confirm the 10M `countdown` and named-`let` loop run in bounded stack under the new prototype

## 4. Verify behavior preserved (the acceptance gate)

- [x] 4.1 Run `demos/run-tests.sh` (AOT): all demos produce their existing values
- [x] 4.2 Run `demos/run-backends.sh`: all demos byte-identical across AOT, JIT, and bitcode
- [x] 4.3 Confirm no changes to `src/runtime/runtime.c`, `src/parse.ss`, or `src/passes/**`

## 5. Docs and spec sync

- [x] 5.1 Update `LLVM.md`'s Calling convention section to note the convention is now emitted (no longer "decided but not implemented")
- [x] 5.2 Sync the `aot-codegen` added-requirement delta into `openspec/specs/`
