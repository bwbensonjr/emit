(define-library (composition repro macro source)
  (import (only (scheme base) define-syntax syntax-rules)
          (scheme case-lambda))
  (export with-case-lambda)
  (begin
    (define-syntax with-case-lambda
      (syntax-rules ()
        ((_ args body ...)
         (case-lambda args body ...))))))
