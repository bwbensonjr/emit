;;; a.sld -- the import-set fixture library (change: portable-library-surface).
;;; Exports two procedures and two macros: `swap!` reaches a PRIVATE helper, and
;;; `dbl-swap!` is written on top of `swap!`, so hiding or renaming `swap!` in an
;;; importer must not break `dbl-swap!`.
(define-library (iset a)
  (import (scheme base))
  (export greet helper swap! dbl-swap!)
  (begin
    (define (helper) 5)
    (define (greet) (+ (helper) 37))
    (define (%bump x) (+ x 1))
    (define-syntax swap!
      (syntax-rules ()
        ((_ a b) (let ((tmp a)) (set! a (%bump b)) (set! b tmp)))))
    (define-syntax dbl-swap!
      (syntax-rules ()
        ((_ a b) (begin (swap! a b) (swap! a b)))))))
