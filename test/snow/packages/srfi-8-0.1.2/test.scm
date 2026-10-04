(import (scheme base) (scheme char) (scheme inexact) (scheme read) (scheme write) (scheme process-context) (scheme file) (scheme cxr) (srfi 8) (srfi 64))

(define (list-sort less? xs) (if (null? xs) (quote ()) (let insert ((x (car xs)) (xs (list-sort less? (cdr xs)))) (if (null? xs) (list x) (let ((y (car xs)) (ys (cdr xs))) (if (less? x y) (cons x xs) (cons y (insert x ys))))))))

(define (written x) (cond-expand (r7rs (call-with-port (open-output-string) (lambda (out) (write x out) (get-output-string out)))) (else (call-with-output-string (lambda (out) (write x out))))))

(define (symbol<? a b) (string<? (symbol->string a) (symbol->string b)))

(define (call-with-false-on-error proc) (guard (_ (else #f)) (proc)))

(test-begin "srfi-8")

(receive (a b) (values 1 2) (begin (test-equal "1" a 1) (test-equal "2" b 2)))

(test-end "srfi-8")

(exit 0)
