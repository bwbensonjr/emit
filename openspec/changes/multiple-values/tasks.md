## 1. Runtime: the multiple-values bundle

- [ ] 1.1 In `src/runtime/runtime.c`, add an `mv` extended-object subtype in the
      tag-7 header family (alongside strings/vectors/records/hash tables), with a
      single traced `val` field holding the list of values.
- [ ] 1.2 Add `val rt_list_to_mv(val list)` — allocate an `mv` object wrapping
      `list` and return it.
- [ ] 1.3 Add `val rt_mv_p(val v)` — return the boolean whether `v` is an `mv`
      bundle (exact tag + subtype test).
- [ ] 1.4 Add `val rt_mv_to_list(val v)` — return the bundle's list field.
      (Behavior on a non-`mv` argument is a compiler-internal invariant; it is
      only ever called after `%mv?`.)

## 2. Compiler wiring

- [ ] 2.1 In `src/parse.ss`, add `%list->mv %mv? %mv->list` to the `*prims*` list
      (reserved internal ops — NOT `*integrable*`, never user-facing values).
- [ ] 2.2 In `src/emit.ss` prim→runtime table, add `(%list->mv "rt_list_to_mv")`,
      `(%mv? "rt_mv_p")`, `(%mv->list "rt_mv_to_list")`.
- [ ] 2.3 In `src/emit.ss` extern-declaration block, add
      `declare i64 @rt_list_to_mv(i64)`, `declare i64 @rt_mv_p(i64)`,
      `declare i64 @rt_mv_to_list(i64)`.

## 3. Staged bootstrap (new primcall heads)

- [ ] 3.1 Run `make regen` and confirm the self-host fixed point converges (try a
      single direct regen first; if the fixed-point loop does not converge in 5
      iters, add a synonym-first stage per the `first-class-primitives` D3 lesson).
- [ ] 3.2 Commit the regenerated `bootstrap/*.ll` at the stable stage.

## 4. Library: values / call-with-values in (scheme base)

- [ ] 4.1 In `src/prelude.scm`, define `values` as a rest-arg procedure:
      `(values x)` → `x` (single-value identity); `(values)` / `(values a b …)` →
      `(%list->mv vs)` over the rest-arg list.
- [ ] 4.2 In `src/prelude.scm`, define `call-with-values` as
      `(lambda (producer consumer) (let ((r (producer))) (if (%mv? r) (apply consumer (%mv->list r)) (consumer r))))`.
- [ ] 4.3 Regen so `(scheme base)` / `bootstrap/scheme.base.ll` reflect the new
      definitions; confirm the fixed point and byte-identical backends hold.

## 5. Demos and harness

- [ ] 5.1 Add `demos/values.scm` covering the single-value identity and a
      spread — e.g. `(call-with-values (lambda () (values 1 2 3)) (lambda (a b c) (+ a b c)))`
      → `6` — with a header comment per the demo convention.
- [ ] 5.2 Add `demos/call-with-values.scm` covering zero values, a single
      ordinary value, and the variadic-`list` spread.
- [ ] 5.3 Register both demos in `demos/run-tests.sh` with exact expected stdout.

## 6. Verification

- [ ] 6.1 Build `scheme-run` and run `demos/run-tests.sh` (default backend) — all
      demos pass, including the new ones.
- [ ] 6.2 Run `RUNNER=aot demos/run-tests.sh` — same expected values on the
      native-exe backend; confirm output is byte-identical to `scheme-run`.
- [ ] 6.3 Confirm the self-host regen fixed point still converges and backends
      stay byte-identical.
- [ ] 6.4 Verify the memory-safety scenario: a stray bundle used as an ordinary
      value (`(car (values 1 2))`) fails safely — no segfault.
- [ ] 6.5 Verify `(values x)` is a true identity: `(+ 1 (values 42))` → `43`.

## 7. Spec sync + docs

- [ ] 7.1 After implementation and green tests, sync the delta in
      `specs/core-language/spec.md` into `openspec/specs/core-language/spec.md`
      (via the sync/archive workflow).
- [ ] 7.2 Update the README: move `values`/`call-with-values` out of "Not yet
      done → Control (needs call/cc)" into "Accomplished → Language"; note in the
      control bullet that multiple values shipped independently of `call/cc`.
