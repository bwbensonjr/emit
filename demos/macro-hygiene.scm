; hygiene: a macro's introduced identifier must not capture (or be captured by)
; a same-named user identifier.
;   swap! introduces `tmp`; the surrounding user code also binds `tmp`.
;   `or` introduces `t`; the surrounding user code also binds `t`.
; Both user bindings must survive untouched.
(define-syntax swap!
  (syntax-rules ()
    ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))

(let ((tmp 99) (a 1) (b 2))
  (swap! a b)                 ; a=2, b=1; user `tmp` (99) unaffected by swap!'s tmp
  (let ((t 5))
    (list a b tmp             ; 2 1 99
          (or #f t)           ; or's introduced t.N does not shadow user t -> 5
          t)))                ; 5  -> (2 1 99 5 5)
