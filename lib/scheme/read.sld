;;; read.sld -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss
;;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in
;;; src/prelude-surface.scm) and regenerate; guarded by
;;; test/scheme-base-gen-check.sh.
;;;
;;; One member of the prelude's partition: the definitions the declaration
;;; homes here, exporting the declared public ones.  Private helpers and the
;;; derived-form macros stay in the body, where the exported procedures still
;;; call them.  One export per line, so a surface change is a reviewable
;;; one-line diff.
(define-library (scheme read)
  (import (scheme base))
  (import (emit internal))
  (export
    read
    )
  (begin
    (define (%check-input-port p who) (if (not (input-port? p)) (error who "not an input port" p) (if (%record-ref p 5) (error who "port is closed" p) p)))
    (define (read p) (%check-input-port p (quote read)) (let* ((s (%port-buf p)) (n (string-length s)) (i (rd-skip-ws s n (%record-ref p 3)))) (if (>= i n) (begin (%record-set! p 3 n) (eof-object)) (let ((r (rd-datum s n i))) (%record-set! p 3 (cdr r)) (car r)))))
    ))
