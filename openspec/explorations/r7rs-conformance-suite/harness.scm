(import (scheme base) (scheme inexact) (scheme file) (scheme read) (scheme cxr))
;;; Minimal (chibi test) subset, written in the subset of R7RS emit supports.
(define *pass* 0)
(define *fail* 0)
(define *section* "")

(define (report-fail expr expected got)
  (set! *fail* (+ *fail* 1))
  (display "FAIL [") (display *section*) (display "] ")
  (write expr) (display ": expected ") (write expected)
  (display " but got ") (write got) (newline))

(define (check expr expected got)
  (if (equal? expected got)
      (set! *pass* (+ *pass* 1))
      (report-fail expr expected got)))

(define-syntax test
  (syntax-rules ()
    ((test expected expr) (check 'expr expected expr))
    ((test name expected expr) (check 'expr expected expr))))

(define-syntax test-assert
  (syntax-rules ()
    ((test-assert expr) (check 'expr #t (if expr #t #f)))))

(define-syntax test-begin
  (syntax-rules ()
    ((test-begin name) (set! *section* name))
    ((test-begin) (set! *section* "?"))))

(define-syntax test-end
  (syntax-rules ()
    ((test-end . x) (values))))

(define (test-summary)
  (display "pass=") (display *pass*)
  (display " fail=") (display *fail*) (newline))

(define-syntax test-values
  (syntax-rules ()
    ((test-values expected expr)
     (check 'expr
            (call-with-values (lambda () expected) list)
            (call-with-values (lambda () expr) list)))))

(define-syntax test-error
  (syntax-rules ()
    ((test-error expr) (check 'expr #t (guard (e (#t #t)) expr #f)))
    ((test-error x expr) (check 'expr #t (guard (e (#t #t)) expr #f)))))
