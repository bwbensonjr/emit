(define-library (scope primitive-shadow)
  (import (scheme base) (only (scope owner) outer))
  (export car value)
  (begin
    (define (car x) 88)
    (define (value) (list (outer '(41)) (car '(41))))))
