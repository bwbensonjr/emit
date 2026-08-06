;;; macrolib.sld -- the simplest macro-exporting library (change: library-macro-export).
;;; Exports a macro alongside a procedure.  `swap!`'s template mentions only
;;; universally-known names (`let`, `set!`, `begin` are core forms) and introduces one
;;; temporary, `tmp` -- so this fixture exercises the export/import path without
;;; needing the template-resolution pass to resolve anything at all.  Core/primitives
;;; only: no (scheme base) import, so a failure here is the module boundary, not the
;;; prelude.
(define-library (macrolib)
  (export swap! mval)
  (begin
    (define-syntax swap!
      (syntax-rules ()
        ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))
    (define (mval) 11)))
