# Failing baseline, measured before any edit

`build/emit` at `6bcbfd6` (merge of `chez-free-unit-pipeline`), on the branch
`feat/binding-aware-expander` with no source changes applied. `chez` is the reference where
the form is portable. `emit run` output has the `resolve manifest` narration stripped.

| # | Form | emit (before) | want / chez |
|---|---|---|---|
| S1 | `(let ((when (lambda (x) x))) (when 5))` | `()` | `5` |
| S2 | `(define (when x) (* x 2))` then `(when 5)` | `()` | `10` |
| S3 | `(define (g n) (define when (lambda (x) (* x 3))) (when n))`, `(g 5)` | `()` | `15` |
| S4 | named let whose name is a macro keyword (`my-or`) | `expand: no matching syntax-rules pattern for macro use (my-or (+ j 1))` | `done` |
| S5 | `(let ((=> #f)) (cond (#t => 'ok)))` | `trap: call: not a procedure: got a symbol` | `ok` |
| S6 | `(let ((else #f)) (cond (else 'wrong) (#t 'right)))` | `right` — **already correct** | `right` |
| S7 | a `syntax-rules` template referencing a `define-record-type` constructor | `unbound variable mk.4` | `5` |
| S8 | `(let ((unless (lambda (x) (* x 7)))) (unless 6))` | `#<unspecified>` | `42` |
| S9 | `(let ((else #f)) (cond (else 'wrong)))` — single clause | `wrong` | unspecified |
| S10 | `(cond ((assv 2 '((1 a) (2 b))) => cadr) (else 'none))` — unshadowed | `b` | `b` |
| S11 | S7's forms entered at the REPL | `error: repl: unbound variable mk.13` | `5` |

Three of these are worth calling out.

**S1/S2/S3/S8 are silent.** No diagnostic, no trap — the shadowed macro accepts the argument
list, expands, and yields a value nobody asked for. `(when 5)` is a legal use of the macro with an
empty body, so it answers the unspecified value; `(unless 6)` likewise. This is why the defect is
worth a change rather than a naming rule: a program with a wrong answer and no error is the most
expensive failure mode available.

**S6 passes for the wrong reason, and S9 shows why.** With two clauses, `cond`'s
`((_ (else e ...)) ...)` rule cannot match — that rule requires `else` to be the *only* clause — so
the shadowed `else` falls through to the ordinary-clause rule by accident. Add or remove a clause
and the accident reverses: S9, the single-clause form, takes the `else` rule and answers `wrong`
where the standard says the clause is an ordinary test on a variable bound to `#f`. Any suite that
covered only S6 would have reported this area as working.

**S10 is the control.** The use-site test must narrow the shadowed case only; an unshadowed `=>`
must still be receiver syntax. It answers `b` before and must answer `b` after.

S7 has no Chez column: Chez's `define-record-type` rejects the R7RS constructor spec `(mk v)`, so
the reference answer is R7RS §5.5's, not a measurement.
