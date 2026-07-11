(letrec ([len (lambda (xs) (if (null? xs) 0 (+ 1 (len (cdr xs)))))])
  (len (cons 1 (cons 2 (cons 3 (quote ()))))))
