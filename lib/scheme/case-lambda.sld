;;; case-lambda.sld -- the ordinary R7RS-small (scheme case-lambda) library.
(define-library (scheme case-lambda)
  (import (scheme base))
  (export case-lambda)
  (begin
    ;; Kept at library scope because Emit intentionally has no letrec-syntax yet.
    ;; Hygiene carries this private transformer into the public expansion.
    (define-syntax case-lambda-dispatch
      (syntax-rules ()
        ((_ args argc)
         (error 'case-lambda "no matching clause" argc))
        ((_ args argc ((formal ...) body ...) clause ...)
         (if (= argc (length '(formal ...)))
             (apply (lambda (formal ...) body ...) args)
             (case-lambda-dispatch args argc clause ...)))
        ((_ args argc ((formal ... . rest) body ...) clause ...)
         (if (>= argc (length '(formal ...)))
             (apply (lambda (formal ... . rest) body ...) args)
             (case-lambda-dispatch args argc clause ...)))
        ((_ args argc (rest body ...) clause ...)
         (apply (lambda rest body ...) args))))

    (define-syntax case-lambda
      (syntax-rules ()
        ((_ clause ...)
         (lambda args
           (let ((argc (length args)))
             (case-lambda-dispatch args argc clause ...))))))))
