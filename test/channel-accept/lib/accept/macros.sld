;;; Installed acceptance: a user library exporting syntax, compiled with emit lib.
(define-library (accept macros)
  (import (scheme base))
  (export swap! twice answer)
  (begin
    (define-syntax swap!
      (syntax-rules ()
        ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))
    (define-syntax twice
      (syntax-rules ()
        ((_ e) (+ e e))))
    (define answer 21)))
