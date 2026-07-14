## 1. Fix the quasiquote expander

- [ ] 1.1 In `src/passes/expand.ss` `qq`, add `(pair? (cdr d))` to the `unquote`,
  `unquote-splicing`, and `quasiquote` head-check cond arms so a bare `(kw)` list-datum falls
  through to general-pair rebuilding.

## 2. Verification

- [ ] 2.1 Regression: `` `(list (quote unquote) ,(+ 1 2)) `` and `` `(a unquote b) `` compile
  and produce the correct literal structure (compare to Chez).
- [ ] 2.2 Confirm existing quasiquote output is byte-identical (no drift for well-formed input).
- [ ] 2.3 Run `./run-all-tests.sh`; all suites pass.
- [ ] 2.4 Hand off to [[self-hosting-bootstrap]]: with G6 closed, the assembled core clears the
  first compile blocker.
