(define-library (native dep)
  (export dep-value)
  (import (scheme base))
  (begin
    (define (dep-value) 40)))
