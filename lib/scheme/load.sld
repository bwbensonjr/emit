;;; load.sld -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss
;;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in
;;; src/prelude-surface.scm) and regenerate; guarded by
;;; test/scheme-base-gen-check.sh.
;;;
;;; One member of the prelude's partition: the definitions the declaration
;;; homes here, exporting the declared public ones.  Private helpers and the
;;; derived-form macros stay in the body, where the exported procedures still
;;; call them.  One export per line, so a surface change is a reviewable
;;; one-line diff.
(define-library (scheme load)
  (import (scheme base))
  (import (scheme read))
  (import (scheme file))
  (export
    load
    )
  (begin
    (define %load-path "")
    (define (%load-resolve filename) (if (or (string=? filename "") (char=? (string-ref filename 0) #\/)) filename (let loop ((i (- (string-length %load-path) 1))) (cond ((< i 0) filename) ((char=? (string-ref %load-path i) #\/) (string-append (substring %load-path 0 (+ i 1)) filename)) (else (loop (- i 1)))))))
    (define (%load-check result path) (if (eq? (car result) (quote error)) (error (quote load) (string-append path ": " (cdr result))) (cdr result)))
    (define (%load-render form) (let ((out (open-output-string))) (call-with-port out (lambda (p) (write form p) (get-output-string p)))))
    (define (%load-result result text path) (let ((status (car result))) (cond ((eq? status (quote ok)) (%load-invoke (cdr result)) (if #f #f)) ((eq? status (quote syntax)) (if #f #f)) ((eq? status (quote import)) (for-each (lambda (entry) (%load-check (%load-request 3 (car entry) path) path) (%load-invoke (cdr entry))) (cdr result)) (%load-check (%load-request 2 text path) path) (if #f #f)) ((eq? status (quote splice)) (let drain () (let ((next (%load-request 4 "" path))) (if (eq? (car next) (quote done)) (if #f #f) (begin (if (eq? (car next) (quote text)) (%load-evaluate (cdr next) path) (%load-result next "" path)) (drain)))))) (else (%load-check result path) (if #f #f)))))
    (define (%load-evaluate text path) (%load-result (%load-request 1 text path) text path))
    (define (%load-reraise path obj) (raise (if (error-object? obj) (%make-error-object/kind (string-append "load: " path ": " (error-object-message obj)) (error-object-irritants obj) (%error-object-kind obj)) obj)))
    (define (load . args) (if (not (= (length args) 1)) (error (quote load) "expected one filename; environment argument unsupported") (if (not (string? (car args))) (error (quote load) "filename must be a string" (car args)) (let ((path (%load-resolve (car args))) (saved-path %load-path) (port #f)) (guard (obj (else (%load-reraise path obj))) (dynamic-wind (lambda () (%load-check (%load-request 0 "" path) path) (set! %load-path path)) (lambda () (set! port (open-input-file path)) (let loop () (let ((form (read port))) (if (eof-object? form) (if #f #f) (begin (%load-evaluate (%load-render form) path) (loop)))))) (lambda () (if port (close-input-port port)) (set! %load-path saved-path) (%load-check (%load-request 5 "" path) path))))))))
    ))
