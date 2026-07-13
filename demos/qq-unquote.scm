; quasiquote: `,x` splices the value of x into an otherwise-constant list.
; The expander rewrites `(a ,x b) into (cons 'a (cons x (cons 'b '()))).
(let ([x 2])
  `(a ,x b))                               ; => (a 2 b)
