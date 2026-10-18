;;; macrolib.sld -- the simplest macro-exporting library (change: library-macro-export).
;;; Exports a macro alongside a procedure.  `swap!`'s template mentions only
;;; names from the explicit (scheme base) import (`let`, `set!`, `begin`) and introduces
;;; one temporary, `tmp` -- so this fixture exercises the export/import path without
;;; needing the template-resolution pass to resolve anything at all.
(define-library (macrolib)
  (import (scheme base))
  (export swap! mval)
  (begin
    (define-syntax swap!
      (syntax-rules ()
        ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))
    (define (mval) 11)))
