(define-library (scope malformed-case-lambda)
  (import (scheme base) (scheme case-lambda))
  (export result)
  (begin
    (define result (case-lambda bad-clause))))
