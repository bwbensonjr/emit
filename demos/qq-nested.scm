; Nested quasiquote: the inner ` raises the level, so the inner ,(+ 1 2) is NOT
; evaluated at the outer level -- it stays as literal (unquote (+ 1 2)) data.
; Only a level-matching unquote splices; here nothing at the outer level does,
; so the whole thing is constant and (car ...) is just the symbol a.
(car `(a `(b ,(+ 1 2))))                   ; => a
