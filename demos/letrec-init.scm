; `letrec` must accept any initializer, not only a lambda (GitHub issue #9).
; `lower` lowers a letrec group through the two-phase closure-block protocol,
; which only makes sense for lambdas; a non-lambda binding is given a location
; instead, filled in binding order.  Before the fix every shape below crashed the
; compiler with an internal `match: no matching clause`, even though each is
; legal R7RS.
;
; `probe` also pins the initialization ORDER: R7RS letrec* is left to right, so
; it must print "ab", never "ba".  Only one element here has a side effect, so the
; program's output does not depend on argument evaluation order (issue #6).
(define (probe)
  (letrec ((a (begin (display "a") 1))
           (b (begin (display "b") 2)))
    (+ a b)))

(list (letrec ((x (car (list 1 2)))) x)              ; non-lambda binding alone
      (letrec ((f (lambda () 1))
               (x (car (list 9))))
        (+ (f) x))                                    ; mixed group
      (letrec ((f (lambda () x)) (x 5)) (f))          ; lambda reads a later binding
      (letrec ((f (lambda () 7)) (x (f))) x)          ; initializer calls a lambda
      (probe)
      (letrec ((fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))))
        (fact 5)))                                    ; recursion: still a closure block
