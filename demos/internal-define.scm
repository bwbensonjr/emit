; internal (body-level) defines with letrec* semantics (change: internal-defines).
; Exercises a value define + a procedure define in one body, mutual/forward
; reference between two internal procedures, and an internal define in a let body.
; The program's value is the list of the three results.
(define (f x)                 ; value define (z) + procedure define (g) in a body
  (define (g y) (* y y))
  (define z (+ x 1))
  (+ (g z) z))                ; => 30 for x=4
(define (classify n)          ; mutual/forward reference within a body
  (define (even? k) (if (= k 0) #t (odd? (- k 1))))
  (define (odd? k) (if (= k 0) #f (even? (- k 1))))
  (if (even? n) 100 200))     ; => 100 for n=8
(define (in-let x)
  (let ([y 10])
    (define w (* y y))        ; internal define in a let body
    (+ w x)))                 ; => 105 for x=5
(list (f 4) (classify 8) (in-let 5))
