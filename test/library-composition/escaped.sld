(define-library (composition escaped)
  (export escaped-message shared-message)
  (import (scheme base))
  (begin
    (define-syntax escaped-message
      (syntax-rules ()
        ((_) "\"\\\n\t\r\x0;\x1;\x7f;")))
    (define-syntax shared-message
      (syntax-rules ()
        ((_) (quote (#0="a\"b\\c" #0#)))))))
