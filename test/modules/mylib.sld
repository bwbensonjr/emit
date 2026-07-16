;;; mylib.sld -- Stage 1 vertical-slice library (change: module-artifacts-vertical-slice).
;;; A trivial library exporting one procedure.  Primitives/core only (Stage 1
;;; libraries do not share the prelude -- that is Stage 3, (scheme base)).
(define-library (mylib)
  (export greet)
  (begin
    ;; an internal helper (not exported) plus a lifted closure, so the unit has a
    ;; @"mylib:helper" internal global and a @"mylib:code_N" lifted code block.
    (define (helper x) (+ x 100))
    (define (make-adder n) (lambda (x) (+ x n)))
    (define (greet) (helper ((make-adder 5) 37)))))   ; helper(42) = 142
