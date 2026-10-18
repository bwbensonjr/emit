(define-library (scope owner)
  (import (scheme base) (only (rename (scheme base) (+ add)) add))
  (export outer read-state bump! literal aliases (rename state token)
          generated-state core-shadow-value)
  (begin
    (define state 1)
    (define (read-state) state)
    (define (bump!) (set! state (+ state 1)))
    (define (if x y z) (+ x y z))
    (define (core-shadow-value) (if 1 2 3))
    (define-syntax generate-state
      (syntax-rules ()
        ((_ public)
         (begin
           (define state 40)
           (define-syntax public (syntax-rules () ((_) state)))))))
    (generate-state generated-state)
    (define-syntax private
      (syntax-rules () ((_ value) (car value))))
    (define-syntax outer
      (syntax-rules () ((_ value) (+ state (private value)))))
    (define-syntax literal
      (syntax-rules (state) ((_ state) 'same) ((_ other) 'different)))
    (define-syntax aliases
      (syntax-rules () ((_) (+ 1 (add 2 3)))))))
