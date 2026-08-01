; A compile-time fold must never disagree with the runtime primitive it replaced
; (change: simplify-known-calls).  `m` and `p` are each called more than once, so
; `simplify` cannot inline them and their arithmetic really happens at run time;
; the bare expressions beside them are folded at compile time.  Each pair must
; agree -- including at the very edge of the fold window, where the folded literal
; is the largest one the emitter can still encode (see GitHub issue #7).
(define (m a b) (* a b))
(define (p a b) (+ a b))

(list (= (*  268435455 268435455) (m  268435455 268435455))   ; largest in-window product
      (= (* -268435455 268435455) (m -268435455 268435455))   ; and its negation
      (= (+  268435455 268435455) (p  268435455 268435455))
      (= (* 1073741823 1073741823) (m 1073741823 1073741823)) ; past the window: not folded
      (= (m 6 7) (p 20 22)))
