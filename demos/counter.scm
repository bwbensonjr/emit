; set! on a captured variable: make-counter returns a closure over a boxed c
(letrec ([make-counter (lambda ()
                         (let ([c 0])
                           (lambda () (set! c (+ c 1)) c)))])
  (let ([f (make-counter)])
    (+ (f) (f))))
