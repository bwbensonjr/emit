; unspecified-value: THE unspecified value is ONE distinguished immediate (change:
; unspecified-value).  Before this change Emit had TWO stand-ins split along the
; Scheme/C boundary -- #f from the syntactic forms and the prelude's `void`, '() from
; every side-effecting C primitive -- so this demo's job is to pin down that they now
; all agree, and that the value is distinct from both of its old spellings.
;
; The two leading writes show the non-readable rendering: `write` and `display` print
; the same text, because there is no reader syntax to round-trip and nothing rawer to
; show.  `(display "")` stands in for the I/O primitives in the list below since it is
; the only one that returns the unspecified value while emitting no bytes of its own.
(begin
  (write (if #f #f)) (display " ")
  (display (if #f #f)) (display " ")
  (list
    (eqv? (void) (if #f #f))                  ; #t -- the generator and the idiom agree
    (eqv? (void) #f)                          ; #f -- NOT the boolean false
    (eqv? (void) (quote ()))                  ; #f -- NOT the empty list
    (if (if #f #f) (quote t) (quote f))       ; t  -- truthy, being distinct from #f
    ;; every site R7RS leaves unspecified yields that same one value
    (eqv? (void) (when #f 1))                 ; untaken when
    (eqv? (void) (unless #t 1))               ; untaken unless
    (eqv? (void) (cond (#f 1)))               ; cond, no clause matched
    (eqv? (void) (case 9 ((1) 2)))            ; case, no key matched and no else
    (eqv? (void) (for-each car (quote ((1))))) ; for-each, normalized in the prelude
    (eqv? (void) (vector-set! (make-vector 1 0) 0 1))   ; rt_vector_set
    (eqv? (void) (string-set! (string-copy "abc") 0 #\z)) ; rt_string_set
    (eqv? (void) (display ""))                ; rt_display, writing nothing
    (let ((y 0)) (eqv? (void) (set! y 1)))))  ; rt_set_box (assignment-converted local)
