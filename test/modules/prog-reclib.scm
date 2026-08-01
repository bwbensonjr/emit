;;; prog-reclib.scm -- an importer constructs and reads (reclib)'s record type.
;;; => (7 8 #t 15)  -- the last from a procedure INSIDE the library that uses the
;;; accessors, which is the half that fails with "unbound variable" today.
(import (reclib))
(define p (make-pt 7 8))
(list (pt-x p) (pt-y p) (point? p) (sum-fields p))
