;;; init-outer.sld -- imports (init-count), so importing THIS library must initialize
;;; (init-count) first (change: defer-manifest-library-init).  The pair is the
;;; closure-order case: deepest dependency initialized before the library that needs it.
(define-library (init-outer)
  (import (init-count))
  (export outer-ticks)
  (begin
    ;; Reads the imported library's state at OUTER's init time.  If (init-count) had not
    ;; been initialized first, this would read the uninitialized counter.
    (define seen (ticks))
    (define (outer-ticks) seen)))
