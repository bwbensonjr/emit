(define-library (composition runtime shadow)
  (import (composition runtime owner))
  (export fixed)
  (begin
    (define (fixed x) (+ x 100))))
