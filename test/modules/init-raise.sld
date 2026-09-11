;;; init-raise.sld -- a library whose BODY raises (change: defer-manifest-library-init).
;;; Importing it must report an error naming the library and leave `boom` UNBOUND: the
;;; host runs the __init before asking the core to merge, so a body that raised never
;;; reaches the merge.
;;;
;;; The raise goes through a procedure applied to a value the optimizer cannot see
;;; through, so it stays a RUNTIME error in the library's initializer rather than
;;; becoming a compile-time one the pass ladder could fold.
(define-library (init-raise)
  (export boom)
  (import (scheme base))
  (begin
    (define (empties) (list))
    (define detonator (car (empties)))
    (define (boom) detonator)))
