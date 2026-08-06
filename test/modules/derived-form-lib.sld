;;; derived-form-lib.sld -- a library body USING the derived forms (change:
;;; library-body-macro-scope, issue #55).  Before this change every one of these
;;; reported `unbound variable when` even with the (import (scheme base)) below: the
;;; baked macro set was merged into the PROGRAM path only, so a library body saw core
;;; forms and named `let` and nothing else.
;;;
;;; `and` and `or` are here deliberately.  The issue listed when/cond/case/let*, but they
;;; are ordinary prelude `syntax-rules` macros too and failed the same way -- which most
;;; Scheme authors do not expect, since both read as core syntax.
(define-library (derived-form-lib)
  (import (scheme base))
  (export dfw dfa dfo dfc dfl)
  (begin
    (define (dfw x) (when (> x 1) 42))
    (define (dfa x) (and x 7))
    (define (dfo x) (or x 9))
    (define (dfc x) (cond ((> x 5) 'big) ((> x 2) 'mid) (else 'small)))
    (define (dfl x) (let* ((a x) (b (+ a 1))) (* a b)))))
