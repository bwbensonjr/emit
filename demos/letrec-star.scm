; `letrec*` (R7RS-small 4.2.2).  Like `letrec`, every binding is in scope in every
; initializer; unlike `letrec`, the initializers are evaluated LEFT TO RIGHT, so a
; later one may read an earlier one.
;
; It shares the compiler's `letrec` lowering, because that lowering already has
; letrec*'s ordering: `convert-assignments` boxes every non-lambda binding and
; fills the boxes in binding order (GitHub issue #9), and the lambdas that stay in
; the closure block are pure to create, so hoisting them cannot be observed.
; `parse` therefore maps both forms onto the one `letrec` IL node -- the stage
; dump after `expand` still shows whichever the program wrote.
(define (order)
  (letrec* ((a (begin (display "a") 1))
            (b (begin (display "b") 2)))
    (+ a b)))

(list (letrec* ((x (car (list 1 2)))) x)             ; non-lambda binding
      (letrec* ((a 3) (b (+ a 4))) b)                ; later init reads an earlier one
      (letrec* ((ev? (lambda (n) (if (= n 0) #t (od? (- n 1)))))
                (od? (lambda (n) (if (= n 0) #f (ev? (- n 1))))))
        (ev? 10))                                     ; mutual recursion
      (order)                                         ; prints "ab" first
      (letrec* ((x 1)) (begin (set! x 9) x)))         ; assigned binding
