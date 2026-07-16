;;; gen-scheme-base.ss -- generate lib/scheme/base.sld from src/prelude.scm
;;; (change: module-prelude-scheme-base, Stage 3).
;;;
;;; The prelude is the single source of truth.  `(scheme base)` is its RUNTIME
;;; half: a define-library exporting every prelude PROCEDURE, whose body is the
;;; whole prelude (procedures + the derived-form macros).  The macros are NOT
;;; exported (v0 is procedures-only in .exports) but they stay in the body so the
;;; library compiles -- prelude procedures use `cond`/`case`/... internally, and
;;; `collect-define-syntax` lifts the macros into the compile-time macro-env when
;;; the unit is compiled.  User programs get the same macros by filtering the
;;; prelude source at compile time (no separate baked constant).
;;;
;;; This file is GENERATED.  Edit src/prelude.scm, then run:
;;;   chez --script tools/gen-scheme-base.ss
;;; A guard (test/scheme-base-gen-check.sh) fails if the checked-in copy is stale.
;;;
;;; Usage:  chez --script tools/gen-scheme-base.ss [OUT]   (default lib/scheme/base.sld)

(import (chezscheme))

(define prelude-path "src/prelude.scm")
(define out-path
  (let ([a (command-line-arguments)]) (if (null? a) "lib/scheme/base.sld" (car a))))

(define (read-all p)
  (let loop ([acc '()])
    (let ([x (read p)]) (if (eof-object? x) (reverse acc) (loop (cons x acc))))))

(define forms (call-with-input-file prelude-path read-all))

;; the exported names: every top-level (define NAME ...) / (define (NAME . _) ...).
;; define-syntax forms are NOT exported (compile-time only).
(define (proc-name f)
  (and (pair? f) (eq? (car f) 'define)
       (let ([sig (cadr f)]) (if (pair? sig) (car sig) sig))))
(define export-names (filter (lambda (x) x) (map proc-name forms)))

(define o (open-output-file out-path 'replace))
(fprintf o ";;; base.sld -- the (scheme base) standard library (change:~n")
(fprintf o ";;; module-prelude-scheme-base, Stage 3).  GENERATED from src/prelude.scm by~n")
(fprintf o ";;; tools/gen-scheme-base.ss -- DO NOT EDIT BY HAND.  Edit src/prelude.scm and~n")
(fprintf o ";;; regenerate (guarded by test/scheme-base-gen-check.sh).~n")
(fprintf o ";;;~n")
(fprintf o ";;; The runtime half of the prelude: every prelude procedure is exported; the~n")
(fprintf o ";;; derived-form macros stay in the body (used by the procedures, not exported).~n")
(fprintf o "(define-library (scheme base)~n")
(fprintf o "  (export")
(for-each (lambda (n) (fprintf o " ~a" n)) export-names)
(fprintf o ")~n")
(fprintf o "  (begin~n")
(for-each
  (lambda (f)
    (parameterize ([print-graph #f] [print-gensym #f])
      (fprintf o "    ")
      (write f o)
      (newline o)))
  forms)
(fprintf o "    ))~n")
(close-port o)
(fprintf (current-error-port) "wrote ~a  (~a exports, ~a body forms)~n"
         out-path (length export-names) (length forms))
