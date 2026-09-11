;;; init-count.sld -- a library whose BODY has an observable effect, so a session can
;;; count how many times it was initialized (change: defer-manifest-library-init).
;;;
;;; `ticks` reports how often the body ran.  The effect is a counter rather than a
;;; `display` so the test reads it as a value on stdout at a moment of its choosing,
;;; instead of depending on where init output interleaves with the prompt.
(define-library (init-count)
  (export ticks)
  (begin
    (define n 0)
    (define (bump!) (set! n (+ n 1)))
    ;; A definition whose INITIALIZER has the effect: this is the library body running.
    (define counted (bump!))
    (define (ticks) n)))
