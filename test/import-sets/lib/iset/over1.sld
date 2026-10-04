;;; over1.sld -- one of two libraries exporting the same names (change:
;;; portable-library-surface, design D5).  Pairs with over2.sld.
(define-library (iset over1)
  (import (scheme base))
  (export f m)
  (begin
    (define (f) 1)
    (define-syntax m (syntax-rules () ((_) (quote one))))))
