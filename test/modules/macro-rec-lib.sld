;;; macro-rec-lib.sld -- a RECURSIVE, variadic exported macro (change:
;;; library-macro-export).  The commonest real macro shape, and the end-to-end exercise of
;;; the "one macro travels under two keywords" rule (design D3): `my-max` is reached by the
;;; importer under its external keyword, while its own template's self-reference is
;;; rewritten to the unit-qualified `macro-rec-lib:my-max`, so the recursion cannot be
;;; captured by whatever the importer happens to bind `my-max` to.  Its template also calls
;;; the private `pick`, resolved to `macro-rec-lib:pick`.
(define-library (macro-rec-lib)
  (export my-max)
  (begin
    (define (pick a b) (if (< a b) b a))
    (define-syntax my-max
      (syntax-rules ()
        ((_ a) a)
        ((_ a b ...) (pick a (my-max b ...)))))))
