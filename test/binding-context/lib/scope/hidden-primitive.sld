(define-library (scope hidden-primitive)
  (import (only (scheme base) define))
  (export result)
  (begin (define result (car 1))))
