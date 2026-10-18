(define-library (scope malformed-syntax)
  (import (scheme base))
  (export result)
  (begin
    (define result (letrec-syntax ((m)) (m)))))
