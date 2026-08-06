;;; macro-helper-lib.sld -- an exported macro reaching PRIVATE names
;;; (change: library-macro-export, design D2/D3).  `twice` is the only export: its
;;; template calls the private procedure `helper` and uses the private macro `%inc`.
;;; Neither is exported, and after this change neither has to be -- the template's
;;; identifiers are resolved in THIS library before the transformer leaves it, so
;;; `helper` travels as @"macro.helper.lib:helper" and `%inc` travels hidden under a
;;; unit-qualified keyword.
;;;
;;; This is also the tree-shake fixture (design D6): `helper` is reachable only
;;; through the template, so nothing in the define->define reference graph mentions
;;; it, and a shake that nominates roots from the export list alone would prune it
;;; into a link-time undefined symbol.
(define-library (macro-helper-lib)
  (export twice)
  (begin
    (define (helper x) (* x 3))
    (define-syntax %inc
      (syntax-rules ()
        ((_ e) (+ e 1))))
    (define-syntax twice
      (syntax-rules ()
        ((_ e) (helper (%inc e)))))))
