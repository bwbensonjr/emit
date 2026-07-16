;;; liba.sld -- no-collision fixture A (change: module-artifacts-vertical-slice).
;;; Defines an internal `helper` and a lifted closure of the SAME spelling as
;;; libb, to prove unit-qualified symbols do not collide at link.
(define-library (liba)
  (export a-val)
  (begin
    (define (helper x) (+ x 1))
    (define (make-adder n) (lambda (x) (+ x n)))
    (define (a-val) (helper ((make-adder 10) 5)))))   ; helper(15) = 16
