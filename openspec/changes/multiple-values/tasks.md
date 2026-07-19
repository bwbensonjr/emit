## 1. Runtime: the multiple-values bundle

- [x] 1.1 In `src/runtime/runtime.c`, add an `mv` extended-object subtype in the
      tag-7 header family (alongside strings/vectors/records/hash tables), with a
      single traced `val` field holding the list of values.
- [x] 1.2 Add `val rt_list_to_mv(val list)` — allocate an `mv` object wrapping
      `list` and return it.
- [x] 1.3 Add `val rt_mv_p(val v)` — return the boolean whether `v` is an `mv`
      bundle (exact tag + subtype test).
- [x] 1.4 Add `val rt_mv_to_list(val v)` — return the bundle's list field.
      (Behavior on a non-`mv` argument is a compiler-internal invariant; it is
      only ever called after `%mv?`.)
- [x] 1.5 In `print_val` (`src/runtime/runtime.c`), add an `HDR_MV` case that
      renders a stray bundle safely as a fixed marker (`#<values>`) instead of
      falling through — so a bundle reaching the final-value printer never
      crashes or misprints.

## 2. Compiler wiring

- [x] 2.1 In `src/parse.ss`, add `%list->mv %mv? %mv->list` to the `*prims*` list
      (reserved internal ops — NOT `*integrable*`, never user-facing values).
- [x] 2.2 In `src/emit.ss` prim→runtime table, add `(%list->mv "rt_list_to_mv")`,
      `(%mv? "rt_mv_p")`, `(%mv->list "rt_mv_to_list")`.
- [x] 2.3 In `src/emit.ss` extern-declaration block, add
      `declare i64 @rt_list_to_mv(i64)`, `declare i64 @rt_mv_p(i64)`,
      `declare i64 @rt_mv_to_list(i64)`.

## 3. Staged bootstrap (new primcall heads)

- [x] 3.1 Run `make regen` and confirm the self-host fixed point converges (try a
      single direct regen first; if the fixed-point loop does not converge in 5
      iters, add a synonym-first stage per the `first-class-primitives` D3 lesson).
      — converged directly, **fixed point at iter 2** (no synonym stage needed).
- [ ] 3.2 Commit the regenerated `bootstrap/*.ll` at the stable stage.

## 4. Library: values / call-with-values in (scheme base)

- [x] 4.1 In `src/prelude.scm`, define `values` as a rest-arg procedure:
      `(values x)` → `x` (single-value identity); `(values)` / `(values a b …)` →
      `(%list->mv vs)` over the rest-arg list.
- [x] 4.2 In `src/prelude.scm`, define `call-with-values` as
      `(lambda (producer consumer) (let ((r (producer))) (if (%mv? r) (apply consumer (%mv->list r)) (consumer r))))`.
- [x] 4.3 Regen so `(scheme base)` / `bootstrap/scheme.base.ll` reflect the new
      definitions; confirm the fixed point and byte-identical backends hold.
- [x] 4.4 **Regenerate the Chez-host `(scheme base)` interface** —
      `chez --script tools/gen-scheme-base.ss` rebuilds `lib/scheme/base.sld` from
      `src/prelude.scm`. Required for the Chez-driven AOT path, which resolves
      `(scheme base)` imports from this generated `.sld` (NOT the baked-in prelude
      the embedded runner uses); `make regen` does not do this. Verified by the
      staleness guard `test/scheme-base-gen-check.sh`. (This task was missing from
      the original plan; the AOT backend failed to resolve `call-with-values`
      until the `.sld` was regenerated.)
      **Ordering matters:** regenerate `base.sld` BEFORE `make regen`, so the
      regenerated `bootstrap/scheme.base.ll` is consistent with the `.sld` — doing
      `make regen` first bakes a stale (scheme base) into the bootstrap and the
      self-host fixed-point check fails until a second `make regen`.

## 5. Demos and harness

- [x] 5.1 Add `demos/values.scm` covering the single-value identity and a spread
      — `(+ (call-with-values (lambda () (values 10 20 30)) +) (values 5))` → `65`
      — with a header comment per the demo convention.
- [x] 5.2 Add `demos/call-with-values.scm` covering zero values, a single ordinary
      value, and the variadic-`list` spread → `(none 49 (1 2 3 4))`.
- [x] 5.3 Register both demos in `demos/run-tests.sh` with exact expected stdout.

## 6. Verification

- [x] 6.1 Build `scheme-run` and run `demos/run-tests.sh` (default backend) — all
      demos pass, including the new ones. **63 passed, 0 failed.**
- [x] 6.2 Run `RUNNER=aot demos/run-tests.sh` — same expected values on the
      native-exe backend; output byte-identical to `scheme-run`. **63 passed, 0
      failed.**
- [x] 6.3 Confirm the self-host regen fixed point still converges and backends
      stay byte-identical. **Full `./run-dev-tests.sh`: 18 suites, 0 failed** —
      incl. self-hosting fixed point, backend equivalence, embedded-vs-AOT, and
      the anti-stale trust-check.
- [x] 6.4 Verify the disjoint-print scenario: a program whose top-level value is
      `(values 1 2)` prints a safe marker (`#<values>`) and does not crash. (Note:
      general `car`-of-non-pair safety is out of scope — the runtime is unchecked
      there for every type, not just bundles.) **Prints `#<values>`.**
- [x] 6.5 Verify `(values x)` is a true identity: `(+ 1 (values 42))` → `43`.

## 7. Spec sync + docs

- [ ] 7.1 After implementation and green tests, sync the delta in
      `specs/core-language/spec.md` into `openspec/specs/core-language/spec.md`
      (via the sync/archive workflow).
- [x] 7.2 Update the README: move `values`/`call-with-values` out of "Not yet
      done → Control (needs call/cc)" into "Accomplished → Language"; note in the
      control bullet that multiple values shipped independently of `call/cc`.
