;;; mutlib.sld -- a library that assigns its OWN top-level bindings (issue #14,
;;; change: library-toplevel-set).  R7RS 5.3.1: a definition introduces a mutable
;;; location, so a library may `set!` a name it defines.  What makes the shape worth
;;; a fixture is the soundness rule it forces: an assigned binding must NOT be
;;; advertised as direct-callable in the export table, or an importer would keep
;;; calling the code its slot held at link time (design D4 of cross-unit-direct-calls,
;;; as amended).
;;;
;;; Both orders are present on purpose.  `bump` is defined BEFORE the `f` it assigns,
;;; and `bump-h` AFTER the `h` it assigns, so the withholding cannot depend on the
;;; order the forms are lowered in (design D1).  `g` is the control: same fixed-arity
;;; shape, never assigned, so it keeps its call row.
(define-library (mutlib)
  (export f bump call-f h bump-h g)
  (begin
    (define (bump) (set! f (lambda (x) (+ x 100))))
    (define (f x) (+ x 1))

    (define (h x) (+ x 7))
    (define (bump-h) (set! h (lambda (x) (+ x 700))))

    ;; a call to the unit's OWN assigned binding: already indirect through the slot
    ;; (a unit's top-level procedures are not direct-called from inside the unit),
    ;; so it must observe the assignment too.
    (define (call-f x) (f x))

    (define (g x) (+ x 1000))))
