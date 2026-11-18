;;; Synchronous recording adaptation. See ../LICENSE and ../PROVENANCE.md.
(define-library (malt learner recording)
  (import (scheme base) (only (malt learner tensors) primal dual? tensor-object? tmap))
  (export record with-recording current-record-handler)
  (begin
    (define current-record-handler (make-parameter (lambda (name value) (if #f #f))))
    (define (primal-copy value)
      (cond
        ((dual? value) (primal value))
        ((tensor-object? value) (tmap primal-copy value))
        ((vector? value) (vector-map primal-copy value))
        ((pair? value) (cons (primal-copy (car value)) (primal-copy (cdr value))))
        (else value)))
    (define (record name value)
      ((current-record-handler) name (primal-copy value))
      value)
    (define-syntax with-recording
      (syntax-rules ()
        ((_ handler body ...)
          (parameterize ((current-record-handler handler)) body ...))))))
