;;; gen-scheme-base.ss -- generate lib/scheme/base.sld from src/prelude.scm
;;; (change: module-prelude-scheme-base, Stage 3).
;;;
;;; The prelude is the single source of truth for what `(scheme base)` CONTAINS;
;;; src/prelude-surface.scm declares what it EXPORTS (change:
;;; scheme-base-declared-surface, issue #29).  `(scheme base)` is the prelude's
;;; RUNTIME half: a define-library whose body is the whole prelude (procedures + the
;;; derived-form macros) and whose export list is the prelude's top-level defines in
;;; SOURCE ORDER minus *scheme-base-private* -- so a private helper still exists for
;;; the exported procedures that call it, it is just not in scope in a program that
;;; imports the library.  The macros are NOT exported (v0 is procedures-only in
;;; .exports) but they stay in the body so the library compiles -- prelude procedures
;;; use `cond`/`case`/... internally, and `collect-define-syntax` lifts the macros
;;; into the compile-time macro-env when the unit is compiled.  User programs get the
;;; same macros by filtering the prelude source at compile time (no separate baked
;;; constant).
;;;
;;; The portable derivation (scheme-base-export-names, src/core.ss) reads the SAME two
;;; files, so the driver's and the run door's export lists cannot disagree.
;;;
;;; This file is GENERATED.  Edit src/prelude.scm (or the surface declaration), then:
;;;   chez --script tools/gen-scheme-base.ss
;;; Two guards fail if the checked-in copy is stale: test/scheme-base-gen-check.sh
;;; (Chez, whole-file) and test/scheme-base-surface-check.sh (Chez-free, the export
;;; list and the surface invariants).
;;;
;;; Usage:  chez --script tools/gen-scheme-base.ss [OUT]   (default lib/scheme/base.sld)

(import (chezscheme))

(define prelude-path "src/prelude.scm")
(define out-path
  (let ([a (command-line-arguments)]) (if (null? a) "lib/scheme/base.sld" (car a))))

;; the declared surface: *scheme-base-private* / *scheme-base-unstable*
(load "src/prelude-surface.scm")

(define (read-all p)
  (let loop ([acc '()])
    (let ([x (read p)]) (if (eof-object? x) (reverse acc) (loop (cons x acc))))))

(define forms (call-with-input-file prelude-path read-all))

;; every top-level (define NAME ...) / (define (NAME . _) ...), in source order.
(define (proc-name f)
  (and (pair? f) (eq? (car f) 'define)
       (let ([sig (cadr f)]) (if (pair? sig) (car sig) sig))))
(define (syntax-name f)
  (and (pair? f) (eq? (car f) 'define-syntax) (cadr f)))

(define define-names (filter (lambda (x) x) (map proc-name forms)))
(define syntax-names (filter (lambda (x) x) (map syntax-name forms)))

;; the export list: defines in SOURCE ORDER minus the declared private set.  Order
;; comes from the prelude, so the arrangement of the declaration cannot move IR.
(define export-names
  (filter (lambda (n) (not (memq n *scheme-base-private*))) define-names))

;; The declaration must describe THIS prelude.  A rotted declaration would silently
;; emit a different surface, so fail loudly instead (issue #29).
(define (die msg names)
  (fprintf (current-error-port) "gen-scheme-base: ~a: ~s~n" msg names)
  (exit 1))

(let ([stale (filter (lambda (n) (not (memq n define-names))) *scheme-base-private*)])
  (unless (null? stale)
    (die "private name not defined by the prelude (stale declaration)" stale)))
(let ([macros (filter (lambda (n) (memq n syntax-names)) *scheme-base-private*)])
  (unless (null? macros)
    (die "define-syntax name listed as private (macros are never exported)" macros)))
(let ([bad (filter (lambda (n) (not (memq n export-names))) *scheme-base-unstable*)])
  (unless (null? bad)
    (die "unstable name is not exported (it is private, or not defined)" bad)))
(let ([dups (let loop ([ns export-names] [seen '()] [d '()])
              (cond
                [(null? ns) (reverse d)]
                [(memq (car ns) seen) (loop (cdr ns) seen (cons (car ns) d))]
                [else (loop (cdr ns) (cons (car ns) seen) d)]))])
  ;; a duplicate export would emit two identical `external global` declarations into
  ;; every importing program module, which LLVM rejects.
  (unless (null? dups) (die "duplicate export" dups)))

(define o (open-output-file out-path 'replace))
(fprintf o ";;; base.sld -- the (scheme base) standard library (change:~n")
(fprintf o ";;; module-prelude-scheme-base, Stage 3).  GENERATED from src/prelude.scm by~n")
(fprintf o ";;; tools/gen-scheme-base.ss -- DO NOT EDIT BY HAND.  Edit src/prelude.scm and~n")
(fprintf o ";;; regenerate (guarded by test/scheme-base-gen-check.sh).~n")
(fprintf o ";;;~n")
(fprintf o ";;; The runtime half of the prelude: the DECLARED public surface is exported~n")
(fprintf o ";;; (src/prelude-surface.scm -- every top-level define minus the private set);~n")
(fprintf o ";;; the private helpers and the derived-form macros stay in the body, where the~n")
(fprintf o ";;; exported procedures still call them.  One export per line, so a change to~n")
(fprintf o ";;; the public surface is a reviewable one-line diff.~n")
(fprintf o "(define-library (scheme base)~n")
(fprintf o "  (export~n")
(for-each (lambda (n) (fprintf o "    ~a~n" n)) export-names)
(fprintf o "    )~n")
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
(fprintf (current-error-port)
         "wrote ~a  (~a exports of ~a defines, ~a private, ~a unstable, ~a body forms)~n"
         out-path (length export-names) (length define-names)
         (length *scheme-base-private*) (length *scheme-base-unstable*) (length forms))
