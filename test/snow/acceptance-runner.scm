;;; Included by the generated upstream driver before the unmodified package test.
;;; Results use a dedicated file; the upstream (exit 0) is not a success witness.
(define acceptance-results
  (open-output-file (get-environment-variable "EMIT_SNOW_RESULTS")))
(define acceptance-errors 0)

(define (make-acceptance-runner)
  (let ((runner (test-runner-null)))
    (test-runner-on-group-begin! runner
      (lambda (r name count)
        (when (and (null? (test-runner-group-stack r))
                   (not (equal? name acceptance-suite)))
          (set! acceptance-errors (+ acceptance-errors 1)))))
    (test-runner-on-bad-count! runner
      (lambda args (set! acceptance-errors (+ acceptance-errors 1))))
    (test-runner-on-bad-end-name! runner
      (lambda args (set! acceptance-errors (+ acceptance-errors 1))))
    (test-runner-on-test-end! runner
      (lambda (r)
        (when (memq (test-result-kind r) '(fail xpass))
          (write (list 'assertion (test-runner-test-name r) (test-result-alist r))
                 (current-error-port))
          (newline (current-error-port)))))
    (test-runner-on-final! runner
      (lambda (r)
        (write (list 'complete acceptance-suite
                     (test-runner-pass-count r)
                     (test-runner-fail-count r)
                     (test-runner-xpass-count r)
                     (test-runner-xfail-count r)
                     (test-runner-skip-count r)
                     acceptance-errors)
               acceptance-results)
        (newline acceptance-results)
        (close-output-port acceptance-results)))
    runner))

;; The SRFI 64 self-test asserts that the default factory is test-runner-simple.
;; For the other packages exercise factory customization and install its runner
;; explicitly: the pinned upstream default installer bypasses the factory.
(if (string=? acceptance-suite "srfi-64")
    (test-runner-current (make-acceptance-runner))
    (begin
      (test-runner-factory make-acceptance-runner)
      (test-runner-current (test-runner-create))))
