(define-library (composition macro owner)
  (import (scheme base))
  (export seed)
  (begin
    (define private-runtime
      (let ((offset 5))
        (lambda (x) (+ x offset))))
    (define-syntax %private-step
      (syntax-rules ()
        ((_ done x) (private-runtime x))
        ((_ x) (%private-loop x))))
    (define-syntax %private-loop
      (syntax-rules ()
        ((_ x) (%private-step done x))))
    (define-syntax seed
      (syntax-rules ()
        ((_ x) (%private-step x))))))
