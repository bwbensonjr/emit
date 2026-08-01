;;; mutbad.sld -- a library that assigns an IMPORTED binding.  Expected to FAIL.
;;;
;;; Permitting a unit to assign its own top level (issue #14) does not permit it to
;;; assign another unit's: the exporter's table has already been published, so a
;;; foreign store could invalidate a direct-call label this unit never saw.  Issue #5
;;; settled that arm and library-toplevel-set leaves it alone; this pins it.
;;;
;;; `list-tail` and not `car`: `car` is an integrable primitive rather than a
;;; (scheme base) export, so assigning it reaches the "primitive" arm instead (see
;;; mutprim.sld).
(define-library (mutbad)
  (import (scheme base))
  (export clobber)
  (begin (define (clobber) (set! list-tail (lambda (ls k) 99)))))
