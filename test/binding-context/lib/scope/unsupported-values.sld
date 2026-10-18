(define-library (scope unsupported-values)
  (import (scheme base))
  (export x)
  (begin
    (define-values (x y . z) (values 1 2 3 4))))
