;;; smoke.scm -- a program using two snow-fort.org SRFI packages, compiled unmodified
;;; from test/snow/lib (change: portable-library-surface, design D12).  It reaches the
;;; macro-only libraries through an import set and uses cond-expand in expression
;;; position, as the packages' own test.scm files do.  The and-let* assertions are taken
;;; from packages/srfi-2-0.1.1/test.scm, which needs (srfi 64) and so cannot run as is.
;;; => (1 (2 3) 10 #f 2 1 #t "(a \"b\")")
(import (scheme write) (prefix (srfi 2) s2:) (srfi 8))

(define (written x)
  (cond-expand
    (r7rs (call-with-port (open-output-string)
                          (lambda (out) (write x out) (get-output-string out))))
    (else (quote no-r7rs))))

(receive (a . rest) (values 1 2 3)
  (list a
        rest
        (s2:and-let* ((x 5) ((> x 3)) (y (* x 2))) y)
        (s2:and-let* ((#f) (x 1)))
        (let ((x 1)) (s2:and-let* (x) (+ x 1)))
        (s2:and-let* ((x 1)))
        (s2:and-let* ())
        (written (list (quote a) "b"))))
