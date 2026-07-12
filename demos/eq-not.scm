; n-ary identity predicates (eq? eqv?, chained like the comparisons) and the
; promoted boolean primitive `not`.  eqv? is rt_eqv_p (identity, == today); not
; is rt_not.  eqv?/eq? hold on fixnums (immediate) and interned symbols; chars
; are boxed and not interned, so eqv? does not yet distinguish them by value
; (that needs char interning -- a separate change).  Each true test lights a
; distinct decimal digit so the total pins down which cases fired.
(let ([calls 0])
  (+ (if (eq? 'a 'a 'a) 1 0)        ; chained eq? (all same)   ->          1
     (if (eq? 'a 'a 'b) 10 0)       ; false chain              ->          0
     (if (eqv? 3 3 3) 100 0)        ; chained eqv? on fixnums  ->        100
     (if (eqv? 3 4) 1000 0)         ; distinct fixnums         ->          0
     (if (eqv? 'x 'x) 10000 0)      ; interned symbols         ->      10000
     (if (not #f) 100000 0)         ; not of #f                ->     100000
     (if (not #t) 1000000 0)        ; not of #t                ->          0
     (if (not 0) 10000000 0)        ; only #f is false         ->          0
     (if (eqv? 5) 100000000 0)      ; trivial arity -> #t      ->  100000000
     ; single evaluation: the begin runs once even across two pairs, calls = 1
     (if (eq? 1 (begin (set! calls (+ calls 1)) 1) 1) 0 0)
     (* calls 1000000000)))         ; calls must be 1          -> 1000000000
                                    ; total                    -> 1100110101
