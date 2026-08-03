;;; inexact.sld -- the (scheme inexact) standard library (change:
;;; numeric-conformance, design D5).  R7RS-small 6.2.6's inexact-only procedures:
;;; the non-finite predicates and the transcendental/root functions.
;;;
;;; HAND-WRITTEN, unlike (scheme base) -- which is generated from src/prelude.scm
;;; because it is the prelude re-homed as a module and auto-imported everywhere.
;;; This one is an ORDINARY library: resolved through the manifest, compiled to a
;;; unit artifact, linked like any other, and reached only by an explicit
;;; `(import (scheme inexact))`.  That is deliberate -- it makes Emit's second
;;; standard library a proof that the module system works rather than a second
;;; special case, and it keeps `sqrt`/`sin`/`log` OUT of the universal namespace,
;;; where R7RS does not put them.
;;;
;;; Every procedure here is a thin wrapper over a permanently-internal `%`-op whose
;;; runtime function is a libm call (src/runtime/runtime.c).  The `%`-ops accept an
;;; exact or inexact argument and always return a flonum, so every procedure below
;;; returns an inexact result -- including `(sqrt 4)`, which is 2.0 and NOT the exact
;;; 2.  The exact integer square root is `exact-integer-sqrt` in (scheme base).
;;;
;;; Out-of-domain arguments follow IEEE 754 rather than trapping: a mathematically
;;; undefined or complex result is a NaN, a divergent one an infinity.  Emit is
;;; real-only so no complex result is available, R7RS 6.2.3 permits the inexact
;;; non-finite answer, and a NaN stays testable with `nan?` here where an
;;; uncatchable trap would not be.
(define-library (scheme inexact)
  (export finite? infinite? nan? exp log sin cos tan asin acos atan sqrt)
  (begin
    ;; Classification.  `finite?` is true of every exact integer as well as a finite
    ;; flonum; `infinite?` is derived from the other two rather than given its own
    ;; primitive, since "not finite and not a NaN" is exactly an infinity.
    (define (finite? z) (%finite? z))
    (define (nan? z) (%nan? z))
    (define (infinite? z) (if (%finite? z) #f (if (%nan? z) #f #t)))

    (define (exp z) (%exp z))
    (define (sin z) (%sin z))
    (define (cos z) (%cos z))
    (define (tan z) (%tan z))
    (define (asin z) (%asin z))
    (define (acos z) (%acos z))
    (define (sqrt z) (%sqrt z))

    ;; `log` takes an optional base: (log z b) is (/ (log z) (log b)), which R7RS
    ;; 6.2.6 specifies directly.  `atan` takes an optional second argument, and the
    ;; two-argument form is NOT (atan (/ y x)) -- that loses the quadrant, so it
    ;; routes to atan2, which takes both signs into account.
    (define (log z . rest)
      (if (null? rest) (%log z) (%/ (%log z) (%log (%car rest)))))
    (define (atan y . rest)
      (if (null? rest) (%atan y) (%atan2 y (%car rest))))))
