;;; macro-rename-lib.sld -- a RENAMED macro export (change: library-macro-export).
;;; The internal keyword %swap is exported under the external keyword swap!.  Before
;;; this change the module-system spec prohibited (rename ...) for a name a template
;;; mentions, because the template travelled verbatim and the importer resolved the
;;; internal spelling.  Pre-resolution (design D2) is what makes this safe: the
;;; template's own references no longer depend on any spelling the importer sees, so
;;; only the KEYWORD is renamed.  The internal keyword must not be usable in an
;;; importer.
(define-library (macro-rename-lib)
  (export (rename %swap swap!))
  (begin
    (define-syntax %swap
      (syntax-rules ()
        ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))))
