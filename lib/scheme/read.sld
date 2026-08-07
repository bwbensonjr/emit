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
    (define (rd-report s n r) (let ((why (car r)) (p (rd-fail-pos (cdr r)))) (cond ((eq? why (quote rd-block-comment)) (error (quote read) "unterminated block comment #| opened at index" p)) ((eq? why (quote rd-bar)) (error (quote read) "unterminated |identifier| opened at index" p)) ((eq? why (quote rd-eof)) (error (quote read) "end of input where a datum was expected, at index" p)) ((eq? why (quote rd-unexpected)) (error (quote read) "no datum here, at index" p)) ((eq? why (quote rd-rational)) (error (quote read) (string-append "rational literal syntax is not supported -- Emit has no " "exact rationals; write 0.5, or (/ 1 2)") (rd-token-at s n p))) (else (error (quote read) "unrecognized syntax" (rd-token-at s n p))))))
    (define (%check-input-port p who) (if (not (input-port? p)) (error who "not an input port" p) (if (%record-ref p 5) (error who "port is closed" p) p)))
    (define (read p) (%check-input-port p (quote read)) (let* ((s (%port-buf p)) (n (string-length s)) (i (rd-skip-ws s n (%record-ref p 3)))) (cond ((rd-fail? i) (rd-report s n (cons (quote rd-block-comment) i))) ((>= i n) (%record-set! p 3 n) (eof-object)) (else (let ((r (rd-datum s n i))) (if (rd-fail? (cdr r)) (rd-report s n r) (begin (%record-set! p 3 (cdr r)) (car r))))))))
    ))
