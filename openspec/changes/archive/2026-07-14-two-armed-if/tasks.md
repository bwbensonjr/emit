## 1. Parse two-armed if

- [x] 1.1 In `src/parse.ss` `parse-expr`, add a `(if ,a ,b)` clause (alongside the three-armed
  clause, before the application fallthrough) that produces core IL `(if a b UNSPEC)`, where
  `UNSPEC` is the unspecified value the emitter already yields for a not-taken arm / `(if #f #f)`.

## 2. Verification

- [x] 2.1 `(if #f 1)` and `(if #t 1)` compile and run (false arm yields the unspecified value,
  matching `(if #f #f)`).
- [x] 2.2 A `(case k ((1) 'a))` with no matching key and no `else` compiles and runs (the macro
  default `(if #f #f)` now parses).
- [x] 2.3 Confirm three-armed `if` IR is byte-identical (no drift).
- [x] 2.4 Run `./run-all-tests.sh`; all suites pass.
- [x] 2.5 Hand off to [[self-hosting-bootstrap]]: with G7 closed, the assembled core's `case`
  uses and `(if #f #f)` idiom parse.
