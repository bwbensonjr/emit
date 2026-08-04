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
    (define-syntax and (syntax-rules () ((_) #t) ((_ e) e) ((_ e1 e2 ...) (if e1 (and e2 ...) #f))))
    (define-syntax or (syntax-rules () ((_) #f) ((_ e) e) ((_ e1 e2 ...) (let ((t e1)) (if t t (or e2 ...))))))
    (define-syntax when (syntax-rules () ((_ test e ...) (if test (begin e ...)))))
    (define-syntax unless (syntax-rules () ((_ test e ...) (if test (if #f #f) (begin e ...)))))
    (define-syntax let* (syntax-rules () ((_ () body ...) (begin body ...)) ((_ ((x v) rest ...) body ...) (let ((x v)) (let* (rest ...) body ...)))))
    (define-syntax cond (syntax-rules (else =>) ((_) (if #f #f)) ((_ (else e ...)) (begin e ...)) ((_ (test => proc) rest ...) (let ((t test)) (if t (proc t) (cond rest ...)))) ((_ (test) rest ...) (let ((t test)) (if t t (cond rest ...)))) ((_ (test e ...) rest ...) (if test (begin e ...) (cond rest ...)))))
    (define-syntax case (syntax-rules (else) ((_ (key ...) clause ...) (let ((k (key ...))) (case k clause ...))) ((_ k) (if #f #f)) ((_ k (else e ...)) (begin e ...)) ((_ k ((d ...) e ...) clause ...) (if (memv k (quote (d ...))) (begin e ...) (case k clause ...)))))
    (define-syntax %do-step (syntax-rules () ((_ x) x) ((_ x s) s)))
    (define-syntax do (syntax-rules () ((_ ((var init step ...) ...) (test result ...) command ...) (letrec ((loop (lambda (var ...) (if test (begin (if #f #f) result ...) (begin command ... (loop (%do-step var step ...) ...)))))) (loop init ...)))))
    (define-syntax guard (syntax-rules () ((_ (var clause ...) body ...) (let ((%gres (call-with-current-continuation (lambda (%gk) (with-exception-handler (lambda (%gobj) (%gk (cons #t %gobj))) (lambda () (cons #f (begin body ...)))))))) (if (car %gres) (let ((var (cdr %gres))) (%guard-clauses var clause ...)) (cdr %gres))))))
    (define-syntax %guard-clauses (syntax-rules (else =>) ((_ v) (raise v)) ((_ v (else e ...)) (begin e ...)) ((_ v (test => proc) rest ...) (let ((gt test)) (if gt (proc gt) (%guard-clauses v rest ...)))) ((_ v (test) rest ...) (let ((gt test)) (if gt gt (%guard-clauses v rest ...)))) ((_ v (test e ...) rest ...) (if test (begin e ...) (%guard-clauses v rest ...)))))
    (define-syntax parameterize (syntax-rules () ((_ ((p v) ...) body ...) (with-parameters (list p ...) (list v ...) (lambda () body ...)))))
    (define (open-input-file path) (let ((s (%read-file path))) (if s (%make-port #f #t s 0 #f #f) (error (quote open-input-file) "cannot open file for input" path))))
    (define (open-output-file path) (let ((h (%port-open-output-file path))) (if h (%make-port h #f #f 0 #f #f) (error (quote open-output-file) "cannot open file for output" path))))
    (define (with-output-to-file path thunk) (let ((p (open-output-file path)) (saved (current-output-port))) (dynamic-wind (lambda () (current-output-port p)) thunk (lambda () (current-output-port saved #f) (close-port p)))))
    (define (with-input-from-file path thunk) (let ((p (open-input-file path)) (saved (current-input-port))) (dynamic-wind (lambda () (current-input-port p)) thunk (lambda () (current-input-port saved #f) (close-port p)))))
    (define (call-with-output-file path proc) (call-with-port (open-output-file path) proc))
    (define (call-with-input-file path proc) (call-with-port (open-input-file path) proc))
    ))
