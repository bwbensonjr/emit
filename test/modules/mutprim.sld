;;; mutprim.sld -- a library that assigns a PRIMITIVE.  Expected to FAIL.
;;; There is no slot to store into: `car` is inlined as a primcall, not held in a
;;; global.  The third arm of `assign-global`, unchanged by library-toplevel-set.
(define-library (mutprim)
  (import (scheme base))
  (export clobber)
  (begin (define (clobber) (set! car (lambda (p) 99)))))
