;;; process.sld -- run host programs with an argument vector (change: emit-pkg).
;;; No shell is involved: the program name is searched for on PATH when it has no
;;; slash, and each argument reaches the child exactly as given.  The child inherits
;;; the environment, the working directory, and the standard streams, except that
;;; program-output captures standard output.  A later, fuller process library can
;;; add process objects under the process- prefix without renaming these two.
(define-library (emit process)
  (import (scheme base))
  (export run-program program-output)
  (begin
    (define (check-arguments who program args)
      (unless (string? program)
        (error (string-append (symbol->string who) ": program must be a string")
               program))
      (let loop ((rest args))
        (cond
          ((null? rest) #t)
          ((and (pair? rest) (string? (car rest))) (loop (cdr rest)))
          (else (error (string-append (symbol->string who)
                                      ": arguments must be a list of strings")
                       args)))))

    ;; A failed start comes back as the host errno; it becomes a FILE error naming
    ;; the program, so a missing executable is caught like a missing file.
    (define (spawn who program args capture?)
      (check-arguments who program args)
      (let ((child (%process-spawn program args capture?)))
        (if (pair? child)
            child
            (raise (%make-error-object/kind
                     (string-append (symbol->string who) ": cannot start " program)
                     (list program child)
                     'file)))))

    (define (wait who program pid)
      (let ((status (%process-wait pid)))
        (if status
            status
            (error (string-append (symbol->string who) ": cannot wait for program")
                   program))))

    (define (run-program program args)
      (let ((child (spawn 'run-program program args #f)))
        (wait 'run-program program (car child))))

    ;; Read to end of file before waiting: a child that fills the pipe would
    ;; otherwise block forever on a parent that is waiting for it to exit.
    (define (program-output program args)
      (let* ((child (spawn 'program-output program args #t))
             (text (%process-read-all (cdr child)))
             (status (wait 'program-output program (car child))))
        (if text
            (values status text)
            (error "program-output: cannot read program output" program))))))
