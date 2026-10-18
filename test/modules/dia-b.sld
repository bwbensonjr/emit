;;; dia-b.sld -- diamond right arm (change: module-generalize).
(define-library (dia-b)
  (import (scheme base))
  (import (dia-c))
  (export b-val)
  (begin
    (define (b-val) (* (c-val) 3))))    ; 7 * 3 = 21
