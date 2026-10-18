(define-library (scope qualified)
  (import (scheme base)
          (rename (only (scope owner) token) (token imported-x)))
  (export scope.owner:state value source:macro)
  (begin
    (define scope.owner:state 99)
    (define (value) (list imported-x scope.owner:state))
    (define-syntax source:macro
      (syntax-rules () ((_) scope.owner:state)))))
