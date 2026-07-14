## 1. Add prelude procedures

- [ ] 1.1 List combinators: `andmap`, `memp`, `for-each` in `src/prelude.scm`.
- [ ] 1.2 List access/construction: `cadddr`, `list?`, `list-ref`, `list-tail`, `list-head`,
  `make-list`, `iota`.
- [ ] 1.3 Numeric/misc: `max`, `zero?`, `void`, and the character→string constructor `string`.

## 2. Verification

- [ ] 2.1 Spot tests with standard semantics: `(andmap odd? '(1 3 5))` → `#t`,
  `(memp even? '(1 2 3))` → `(2 3)`, `(list-ref '(a b c) 1)` → `b`, `(iota 3)` → `(0 1 2)`,
  `(max 2 5)` → `5`, `(string #\h #\i)` → `"hi"`, `(void)` → unspecified.
- [ ] 2.2 Confirm user-wins shadowing still holds (a program defining `for-each` shadows the
  prelude one).
- [ ] 2.3 Run `./run-all-tests.sh`; all suites pass.
- [ ] 2.4 Hand off to [[self-hosting-bootstrap]]: with G10 closed, the remaining unbound
  references in the assembled core resolve.
