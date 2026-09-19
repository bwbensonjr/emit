(define-library (native top)
  (export top-value)
  (import (scheme base) (native dep))
  (begin
    (define (top-value) (+ (dep-value) 2))))
