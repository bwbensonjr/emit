; n-ary comparisons: chained < = > <= >=, a false chain, trivial arity, and
; single evaluation of a middle operand (it sits in two adjacent pairs but must
; run once).  Chaining and the derived > <= >= all reduce to the binary < / =
; prims in `expand`.  Each true test contributes a distinct decimal digit so the
; final value pins down exactly which cases fired.
(let ([calls 0])
  (+ (if (< 1 2 3) 1 0)         ; ascending chain       ->        1
     (if (< 1 3 2) 10 0)        ; false chain           ->        0
     (if (= 4 4 4) 100 0)       ; equality chain        ->      100
     (if (> 3 2 1) 1000 0)      ; derived >             ->     1000
     (if (<= 1 1 2) 10000 0)    ; derived <= (equal ok) ->    10000
     (if (>= 3 3 2) 100000 0)   ; derived >=            ->   100000
     (if (< 5) 1000000 0)       ; trivial arity -> #t   ->  1000000
     ; single evaluation: the begin runs once even in two pairs, so calls = 1
     (if (< 0 (begin (set! calls (+ calls 1)) 5) 10) 0 0)
     (* calls 10000000)))       ; calls must be 1       -> 10000000
                                ; total                 -> 11111101
