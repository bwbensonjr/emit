;;; b.sld -- a LIBRARY whose own imports use import sets (change:
;;; portable-library-surface).
(define-library (iset b)
  (import (scheme base) (only (scheme inexact) sqrt) (prefix (iset a) a:))
  (export greet-and-root)
  (begin
    (define (greet-and-root) (list (a:greet) (sqrt 16.0)))))
