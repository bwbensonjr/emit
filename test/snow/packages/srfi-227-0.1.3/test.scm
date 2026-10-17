(import (scheme base) (scheme char) (scheme inexact) (scheme read) (scheme write) (scheme process-context) (scheme file) (scheme cxr) (srfi 227) (srfi 64))

(define (list-sort less? xs) (if (null? xs) (quote ()) (let insert ((x (car xs)) (xs (list-sort less? (cdr xs)))) (if (null? xs) (list x) (let ((y (car xs)) (ys (cdr xs))) (if (less? x y) (cons x xs) (cons y (insert x ys))))))))

(define (written x) (cond-expand (r7rs (call-with-port (open-output-string) (lambda (out) (write x out) (get-output-string out)))) (else (call-with-output-string (lambda (out) (write x out))))))

(define (symbol<? a b) (string<? (symbol->string a) (symbol->string b)))

(define (call-with-false-on-error proc) (guard (_ (else #f)) (proc)))

(test-begin "srfi-227")

(define f (opt-lambda (a b (c 1) (d 2) . r) (list a b c d r)))

(test-equal (f 1 2) (quote (1 2 1 2 ())))

(test-equal (f 1 2 3) (quote (1 2 3 2 ())))

(test-equal (f 1 2 3 4) (quote (1 2 3 4 ())))

(test-equal (f 1 2 3 4 5) (quote (1 2 3 4 (5))))

(define n 1)

(define g (opt-lambda (n (m (* n 2))) (list n m)))

(test-equal (g 2) (quote (2 2)))

(test-equal (g 2 3) (quote (2 3)))

(set! n 2)

(test-equal (g 1) (quote (1 4)))

(test-equal (g 1 2) (quote (1 2)))

(define g* (opt*-lambda (n (m (* n 2))) (list n m)))

(set! n 1)

(test-equal (g* 2) (quote (2 4)))

(test-equal (g* 2 3) (quote (2 3)))

(test-equal (let-optionals (quote (1 2)) (x . y) (list x y)) (quote (1 (2))))

(test-equal (let-optionals (quote (1)) (x (y 2) (z 3)) (list x y z)) (quote (1 2 3)))

(test-equal (let-optionals* (quote (1 3)) (x (y 2) (z (+ x y))) (list x y z)) (quote (1 3 4)))

(test-end "srfi-227")

(exit 0)
