## 1. Reproduce and pin the failure

- [x] 1.1 Capture the current broken behavior as a baseline: `(define-record-type <point> (x y))` segfaults `repl-host` (exit 139), silently emits nothing under `scheme-run`, and exits non-zero under `schemec`.
- [x] 1.2 Enumerate the malformed variants to cover: empty `(define-record-type)`, missing predicate, non-list constructor spec, non-symbol names, and a field spec with no accessor `(x)`.

## 2. Frontend validation in src/parse.ss

- [x] 2.1 Add a shape-validation step for `define-record-type` (a helper like `check-record-type-form`, or `unless` guards mirroring `normalize-define`) that runs before any destructuring in `record-type-bindings`.
- [x] 2.2 Validate: type name present; constructor spec is a list `(<ctor> <field-tag> …)` with a symbol head; predicate present and a symbol; each field spec is a list `(<fld> <acc> [<mut>])` of symbols; each constructor field tag names a declared field.
- [x] 2.3 On any failure, raise `(error 'collect-toplevel "<specific message>" form)` naming the offending form — the recoverable channel the REPL already handles.
- [x] 2.4 Confirm `record-field-bindings` is only reached with well-formed specs (guarded by 2.2), so its `cadr`/`caddr` accesses are safe.

## 3. Tests

- [x] 3.1 Add negative regression cases for each malformed variant from 1.2 to the record test surface (`test/record-type-syntax-tests.sh`), asserting a compile-time error and no crash (exit code is not 139 / no segfault).
- [x] 3.2 Add cross-frontend assertions that `repl-host`, `scheme-run`, and `schemec` all report an error (rather than crash / silent no-output) on the same malformed form.
- [x] 3.3 Confirm the well-formed `records` demo still compiles and produces its expected result `(3 4 #t #f #f #t 9 #t #f)` (unchanged behavior).

## 4. Regenerate committed IR and verify

- [x] 4.1 Run `make regen` so `bootstrap/*.ll` carries the frontend fix, then confirm `git diff bootstrap/` reflects only the intended change and re-converges to the byte-identical fixed point (reached at iter 1; `scheme.base.ll` unchanged).
- [x] 4.2 Rebuild binaries (`make`) and manually verify `(define-record-type <point> (x y))` now prints an `error:` line and the REPL returns to the prompt (no segfault; exit 0, follow-up form evaluates).
- [x] 4.3 Run the full test suites: Chez-free `run-all-tests.sh` (7/7 suites pass) and the Chez-gated `run-dev-tests.sh` (17/17 suites pass). The anti-stale trust-check SKIPPED because `bootstrap/` has uncommitted changes (it compares regenerated vs committed IR); verified equivalently by idempotent regen — two `make regen` runs produce byte-identical IR (fixed point at iter 1), so the trust-check will pass once the IR is committed.

## 5. Documentation

- [x] 5.1 No `demos/` error demo added (the regression coverage lives in `test/record-type-syntax-tests.sh`); the malformed-record cases are unsuited to the value-comparison demo harness, which cannot distinguish a segfault from a clean error.
- [x] 5.2 Note in the change (proposal + design) that runtime-primitive hardening (`car`/`cdr` on non-pairs) remains a separate, deferred follow-up.
