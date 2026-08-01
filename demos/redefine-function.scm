; `set!` on a letrec-bound name -- redefining a function -- must work (GitHub
; issue #8).  Every shape that lowers to a letrec is covered: a top-level define,
; an internal (body) define, and a mutually recursive pair where only ONE side is
; reassigned, so the binding group has to split -- the untouched half stays in the
; letrec (and stays a closure-block), the reassigned half gets boxed.
;
; Before the fix these compiled to `unbox`/`set-box!` against a binder that was
; never boxed, i.e. against the raw closure, and calling the function crashed.
(define (f) 1)

(define (inner)
  (define (h) 10)
  (let ((before (h)))
    (set! h (lambda () 20))
    (list before (h))))

(define (ev n) (if (= n 0) 100 (od (- n 1))))
(define (od n) (if (= n 0) 200 (ev (- n 1))))

(let ((f-before (f)))
  (set! f (lambda () 2))
  (let ((ev-before (ev 4)))                ; 4 -> od 3 -> ev 2 -> od 1 -> ev 0 = 100
    (set! od (lambda (n) 300))
    (list f-before (f) (inner) ev-before (od 3) (ev 1))))
