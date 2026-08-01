;;; reclib.sld -- a library that declares a RECORD TYPE in its body (change:
;;; library-body-declarations, issue #16).  Before this change a library could not
;;; declare one at all: `define-record-type` is not a `define`, so the body filter
;;; dropped it, and the failure surfaced either as "export of a name the library
;;; does not define" (exported) or "unbound variable" (used internally).
;;;
;;; Exercises both halves at once -- `pt-x` is used by a sibling procedure INSIDE
;;; the unit and `make-pt`/`pt-x` are exported, so the group's names must be
;;; registered in the unit's phase-1 pass under their PLAIN names.
;;;
;;; The `(import (scheme base))` is REQUIRED, not decoration: the constructor the
;;; declaration lowers to builds its field vector with `(list ...)`, and a library
;;; does not auto-import the prelude the way a program does.  Without it the unit
;;; fails with `unbound variable list`.
(define-library (reclib)
  (import (scheme base))
  (export make-pt pt-x pt-y point? sum-fields)
  (begin
    (define-record-type point (make-pt x y) point? (x pt-x) (y pt-y))
    (define (sum-fields p) (%+ (pt-x p) (pt-y p)))))
