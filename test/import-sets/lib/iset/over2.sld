;;; over2.sld -- the second library exporting `f` and `m` (see over1.sld).
(define-library (iset over2)
  (import (scheme base))
  (export f m)
  (begin
    (define (f) 2)
    (define-syntax m (syntax-rules () ((_) (quote two))))))
