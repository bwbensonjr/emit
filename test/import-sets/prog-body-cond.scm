;;; prog-body-cond.scm -- a body cond-expand contributes definitions. => 1
(define (h) (cond-expand (emit (define x 1)) (else (define x 2))) x)
(h)
