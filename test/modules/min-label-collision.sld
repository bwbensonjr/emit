;;; A legal procedure name that matched the prototype's `.min` suffix used to
;;; collide with the generated minimum-arity entry for `foo`.
(define-library (min-label-collision)
  (export foo foo.min)
  (import (scheme base))
  (begin
    (define (foo x . rest) (cons x rest))
    (define (foo.min x) x)))
