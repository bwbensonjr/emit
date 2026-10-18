(define-library (composition runtime shadow)
  (import (only (scheme base) define +)
          (composition runtime owner))
  (export fixed)
  (begin
    (define (fixed x) (+ x 100))))
