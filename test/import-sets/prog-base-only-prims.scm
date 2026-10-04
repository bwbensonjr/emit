;;; prog-base-only-prims.scm -- an `only` over (scheme base) may name core keywords and
;;; integrated primitives, as portable code does. => (1 2)
(import (only (scheme base) define if car cdr list map))
(define (f p) (if (pair? p) (list (car p) (car (cdr p))) 0))
(f (map (lambda (x) x) '(1 2)))
