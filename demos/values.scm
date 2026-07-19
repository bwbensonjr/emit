; multiple values: `(values x)` is the identity (single-value code is unaffected),
; and call-with-values spreads a multi-value producer into its consumer -- here the
; n-ary `+`.  This program sums 10+20+30 via a spread, then adds the identity value
; 5, giving 65 (change: multiple-values).
(+ (call-with-values (lambda () (values 10 20 30)) +)
   (values 5))
