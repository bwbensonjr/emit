;;; Per-record-type textual rendering through the shared native printer.
(define-library (emit write)
  (import (scheme base) (only (emit internal) %make-port))
  (export set-record-type-writer!)
  (begin
    (define (set-record-type-writer! exemplar writer)
      (if (not (or (procedure? writer) (eq? writer #f)))
          (error "set-record-type-writer!: expected a procedure or #f" writer)
          (%set-record-type-writer!
            exemplar
            (if writer
                (lambda (object port mode context)
                  (writer object
                          port
                          mode
                          (lambda (child) (%custom-write-recur context child))))
                #f)
            (%make-port #f #f #f 0 #f #f))))))
