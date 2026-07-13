; quasiquote: `,@ys` splices the ELEMENTS of the list ys into the enclosing list.
; The expander lowers splicing to append: (append ys (cons '3 '())) between the
; constant segments, so the result is a flat list, not a nested one.
(let ([ys (list 1 2)])
  `(0 ,@ys 3))                             ; => (0 1 2 3)
