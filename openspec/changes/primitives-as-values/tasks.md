## 1. Prelude wrappers

- [ ] 1.1 Add `(define (car x) (car x))` and `(define (cons a b) (cons a b))` to
  `src/prelude.scm` (bodies are call-position primcalls; only value-position refs use them).
- [ ] 1.2 Replace/define a variadic `(define (string-append . args) …)` in `src/prelude.scm`
  that folds the binary `string-append` primitive over `args`, seeded with `""` (2-arg body
  calls stay primcalls). Zero args → `""`.

## 2. Verification

- [ ] 2.1 `(map car (list (cons 1 2) (cons 3 4)))` and `(apply string-append (list "a" "b" "c"))`
  compile and run correctly.
- [ ] 2.2 Confirm direct calls `(car x)`, `(cons a b)`, `(string-append a b)` still lower to the
  primitive (IR unchanged at those sites).
- [ ] 2.3 Run `./run-all-tests.sh`; all suites pass.
- [ ] 2.4 Hand off to [[self-hosting-bootstrap]]: with G8 closed (subsuming G4), the core's
  `(map car …)` / `(apply string-append …)` sites resolve.
