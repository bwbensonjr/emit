;;; Malt hyperparameter adaptation. See ../LICENSE and ../PROVENANCE.md.
(define-library (malt learner hyperparameters)
  (import (scheme base))
  (export
    revs alpha batch-size mu beta declare-hyper declare-hypers with-hyper with-hypers
    grid-search hyper-value)
  (begin
    (define-syntax declare-hyper
      (syntax-rules ()
        ((_ name) (define name (make-parameter (list 'unset-hyper 'name))))))
    (define-syntax declare-hypers
      (syntax-rules () ((_ name ...) (begin (declare-hyper name) ...))))
    (declare-hypers revs alpha batch-size mu beta)
    (define (hyper-value name parameter)
      (let ((value (parameter)))
        (if (and (pair? value) (eq? (car value) 'unset-hyper))
            (error "malt: unset hyperparameter" name)
            value)))
    (define-syntax with-hypers
      (syntax-rules ()
        ((_ ((name value) ...) body ...) (parameterize ((name value) ...) body ...))))
    (define-syntax with-hyper
      (syntax-rules ()
        ((_ ((name value)) body ...) (with-hypers ((name value)) body ...))))
    (define (call-with-hyper-values parameters values thunk)
      (if (null? parameters)
          (thunk)
          (let ((parameter (car parameters)) (value (car values)))
            (parameterize ((parameter value))
              (call-with-hyper-values (cdr parameters) (cdr values) thunk)))))
    (define (products columns)
      (if (null? columns)
          (list '())
          (let ((tails (products (cdr columns))))
            (let loop ((values (car columns)))
              (if (null? values)
                  '()
                  (append (map (lambda (tail) (cons (car values) tail)) tails)
                          (loop (cdr values))))))))
    (define (search-hypers predicate parameters columns thunk)
      (let loop ((trials (products columns)))
        (if (null? trials)
            #f
            (let ((result (call-with-hyper-values parameters (car trials) thunk)))
              (if (predicate result) result (loop (cdr trials)))))))
    (define-syntax grid-search
      (syntax-rules ()
        ((_ predicate ((name value more ...) ...) body ...)
          (search-hypers predicate
                         (list name ...)
                         (list (list value more ...) ...)
                         (lambda () body ...)))))))
