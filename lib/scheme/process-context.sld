;;; process-context.sld -- ordinary R7RS-small process context library.
(define-library (scheme process-context)
  (import (scheme base))
  (export command-line exit emergency-exit
          get-environment-variable get-environment-variables)
  (begin
    (define (command-line) (%command-line))
    (define (get-environment-variable name) (%get-environment-variable name))
    (define (get-environment-variables) (%get-environment-variables))
    (define (exit . status)
      (if (or (null? status) (null? (cdr status)))
          (begin
            (unwind-all!)
            (%process-exit (if (null? status) #t (car status))))
          (error 'exit "expected zero or one status argument")))
    (define (emergency-exit . status)
      (if (or (null? status) (null? (cdr status)))
          (%process-emergency-exit (if (null? status) #t (car status)))
          (error 'emergency-exit "expected zero or one status argument")))))
