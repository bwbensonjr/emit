;;; prelude.scm -- standard library procedures prepended to every program.
;;;
;;; Pure Scheme over the core primitives + variadic lambda; the driver
;;; (src/compile.ss) prepends these top-level defines to each program, with
;;; user-wins shadowing (a user define of the same name drops the prelude's).
;;; See openspec prelude-mechanism.  memq/assq compare with eq? (the only
;;; equality available yet; member/assoc arrive with equal?).

(define (not x) (if x #f #t))

(define (list . xs) xs)

(define (length xs)
  (let loop ([xs xs] [n 0])
    (if (null? xs) n (loop (cdr xs) (+ n 1)))))

(define (reverse xs)
  (let loop ([xs xs] [acc (quote ())])
    (if (null? xs) acc (loop (cdr xs) (cons (car xs) acc)))))

(define (append a b)
  (if (null? a) b (cons (car a) (append (cdr a) b))))

(define (map f xs)
  (if (null? xs) (quote ()) (cons (f (car xs)) (map f (cdr xs)))))

(define (memq x xs)
  (if (null? xs) #f (if (eq? x (car xs)) xs (memq x (cdr xs)))))

(define (assq k xs)
  (if (null? xs) #f (if (eq? k (car (car xs))) (car xs) (assq k (cdr xs)))))
