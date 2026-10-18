;;; mylib.sld -- Stage 1 vertical-slice library (change: module-artifacts-vertical-slice).
;;; A trivial library exporting one procedure.  Its primitives and core forms come
;;; from the explicit (scheme base) import.
(define-library (mylib)
  (import (scheme base))
  (export greet)
  (begin
    ;; an internal helper (not exported) plus a lifted closure, so the unit has a
    ;; @"mylib:helper" internal global and a @"mylib:code_N" lifted code block.
    (define (helper x) (+ x 100))
    (define (make-adder n) (lambda (x) (+ x n)))
    (define (greet) (helper ((make-adder 5) 37)))))   ; helper(42) = 142
