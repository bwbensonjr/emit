(define value 10)
(define init-count 0)
(set! init-count (+ init-count 1))
(define (collect . args) args)
(define-syntax bonus
  (syntax-rules () ((_ x) (+ x value))))
