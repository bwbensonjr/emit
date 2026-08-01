; A compile-time fold must never disagree with the runtime primitive it replaced
; (change: simplify-known-calls).  `m` and `p` are each called more than once, so
; `simplify` cannot inline them and their arithmetic really happens at run time;
; the bare expressions beside them are folded at compile time.  Each pair must
; agree -- including at the very edge of the fold window, where the folded literal
; is a value the emitter once could not encode at all (GitHub issue #7): the
; fourth pair folds to 1152921502459363329, well past the old 2^57 cliff.
(define (m a b) (* a b))
(define (p a b) (+ a b))

(list (= (*  268435455 268435455) (m  268435455 268435455))   ; largest in-window product
      (= (* -268435455 268435455) (m -268435455 268435455))   ; and its negation
      (= (+  268435455 268435455) (p  268435455 268435455))
      (= (* 1073741823 1073741823) (m 1073741823 1073741823)) ; folds to 2^60-ish: the issue #7 case
      (= (m 6 7) (p 20 22)))
