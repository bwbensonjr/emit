; call-with-values: the consumer's arity matches the produced count.  Zero values
; feed a nullary consumer; one ordinary value feeds a unary consumer; many values
; spread into the variadic `list`.  This program collects the three sub-results
; into a list: (none 49 (1 2 3 4)) (change: multiple-values).
(list
  (call-with-values (lambda () (values)) (lambda () (quote none)))
  (call-with-values (lambda () 7) (lambda (x) (* x x)))
  (call-with-values (lambda () (values 1 2 3 4)) list))
