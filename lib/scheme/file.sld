;;; file.sld -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss
;;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in
;;; src/prelude-surface.scm) and regenerate; guarded by
;;; test/scheme-base-gen-check.sh.
;;;
;;; One member of the prelude's partition: the definitions the declaration
;;; homes here, exporting the declared public ones.  Private helpers and the
;;; derived-form macros stay in the body, where the exported procedures still
;;; call them.  One export per line, so a surface change is a reviewable
;;; one-line diff.
(define-library (scheme file)
  (import (scheme base))
  (import (emit internal))
  (export
    open-input-file
    open-output-file
    with-output-to-file
    with-input-from-file
    call-with-output-file
    call-with-input-file
    )
  (begin
    (define (open-input-file path) (let ((s (%read-file path))) (if s (%make-port #f #t s 0 #f #f) (error (quote open-input-file) "cannot open file for input" path))))
    (define (open-output-file path) (let ((h (%port-open-output-file path))) (if h (%make-port h #f #f 0 #f #f) (error (quote open-output-file) "cannot open file for output" path))))
    (define (with-output-to-file path thunk) (let ((p (open-output-file path)) (saved (current-output-port))) (dynamic-wind (lambda () (current-output-port p)) thunk (lambda () (current-output-port saved #f) (close-port p)))))
    (define (with-input-from-file path thunk) (let ((p (open-input-file path)) (saved (current-input-port))) (dynamic-wind (lambda () (current-input-port p)) thunk (lambda () (current-input-port saved #f) (close-port p)))))
    (define (call-with-output-file path proc) (call-with-port (open-output-file path) proc))
    (define (call-with-input-file path proc) (call-with-port (open-input-file path) proc))
    ))
