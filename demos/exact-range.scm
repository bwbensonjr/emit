; the exact-integer range (change: fixnum-overflow-trap).  Exact integers are
; fixnums with a 61-bit payload, so they run to +/-2^60 -- an implementation
; restriction R7RS 6.2.3 permits, provided a result that leaves the range is
; reported rather than silently wrapped.  This demo stays INSIDE the range: it
; shows that every representable result is still computed exactly, right up to
; both bounds, which is the half of the change a range test can most easily get
; wrong.  (The traps themselves are pinned by test/fixnum-overflow-tests.sh --
; a demo has to produce a value.)

(define max-fixnum 1152921504606846975)     ; 2^60 - 1
(define min-fixnum -1152921504606846976)    ; -2^60, one further out: the range is
                                            ; asymmetric, so a negative literal is
                                            ; accumulated downward, never negated

(define (round-trip n) (= n (read-from-string (number->string n))))

(list
  max-fixnum                                ; the bounds read and print exactly
  min-fixnum
  (+ max-fixnum -1)                         ; arithmetic that lands on the bound
  (- min-fixnum -1)
  (* 576460752303423487 2)                  ; a product just under the bound
  (quotient min-fixnum -2)                  ; division within range
  (modulo min-fixnum -1)                    ; always 0: in range for every input
  (round-trip max-fixnum)                   ; printer/reader agree at the edge
  (round-trip min-fixnum)
  (inexact->exact 1e18))                    ; a flonum conversion inside the range
