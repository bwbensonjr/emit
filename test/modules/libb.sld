;;; libb.sld -- no-collision fixture B (change: module-artifacts-vertical-slice).
;;; Same-spelled internal `helper` + lifted closure as liba; distinct values.
(define-library (libb)
  (export b-val)
  (begin
    (define (helper x) (+ x 2))
    (define (make-adder n) (lambda (x) (+ x n)))
    (define (b-val) (helper ((make-adder 20) 5)))))   ; helper(25) = 27
