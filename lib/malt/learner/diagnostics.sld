;; Adapted from Malt, copyright 2021 Anurag Mendhekar and Daniel P. Friedman.
;; MIT license; see ../LICENSE. Explicit rendering replaces custom writer hooks.
(define-library (malt learner diagnostics)
  (import (scheme base) (scheme inexact) (malt learner tensors) (malt learner autodiff))
  (export
    tolerance trace-print check-dual-equal? check-primal-gradient
    max-tensor-print-length make-printable)
  (begin
    (define tolerance (make-parameter 0.0001))
    (define max-tensor-print-length (make-parameter 5))
    (define (equal-with-tolerance? a b)
      (let ((a (primal a)) (b (primal b)))
        (cond
          ((and (number? a) (number? b)) (or (= a b) (< (abs (- a b)) (tolerance))))
          ((and (vector? a) (vector? b) (= (vector-length a) (vector-length b)))
            (let loop ((i 0))
              (or (= i (vector-length a))
                  (and (equal-with-tolerance? (vector-ref a i) (vector-ref b i))
                       (loop (+ i 1))))))
          ((and (pair? a) (pair? b)) (and (equal-with-tolerance? (car a) (car b))
                                          (equal-with-tolerance? (cdr a) (cdr b))))
          (else (equal? a b)))))
    (define (check-dual-equal? actual expected)
      (if
        (equal-with-tolerance? actual expected)
        #t
        (error "check-dual-equal?: values differ" (make-printable actual 0) expected)))
    (define (check-call fn args answer gradients)
      (check-dual-equal? (apply fn args) answer)
      (check-dual-equal? (apply (gradient1 fn) args) gradients))
    (define-syntax check-primal-gradient
      (syntax-rules ()
        ((_ (fn args ...) answer gradients)
          (check-call fn (list args ...) answer gradients))))
    (define (make-printable value . limits)
      (let ((limit (if (null? limits) (max-tensor-print-length) (car limits)))
            (value (primal value)))
        (if (not (and (exact-integer? limit) (>= limit 0)))
            (error "make-printable: expected a nonnegative integer limit" limit)
            (cond
              ((vector? value)
                (cons 'tensor
                      (let loop ((i 0))
                        (cond
                          ((= i (vector-length value)) '())
                          ((and (> limit 0) (= i limit)) (list '...))
                          (else (cons (make-printable (vector-ref value i) limit)
                                      (loop (+ i 1))))))))
              ((list? value) (map (lambda (x) (make-printable x limit)) value))
              (else value)))))
    (define (trace-print value port)
      (write (make-printable value) port)
      (newline port))))
