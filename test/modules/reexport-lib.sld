;;; reexport-lib.sld -- a library RE-EXPORTING a macro it imports (change:
;;; library-body-macro-scope).  Rejected before this change with `compile-library: export
;;; of a name the library does not define: twice`, which is why (scheme base) could not
;;; pass on the transformers homed in (emit internal).
;;;
;;; `twice` is not defined here.  It arrives from (macro-helper-lib) and travels on with
;;; its resolution intact, so the expansion in a program two hops away still reaches
;;; macro-helper-lib's PRIVATE `helper` and PRIVATE macro `%inc`.
(define-library (reexport-lib)
  (import (macro-helper-lib))
  (export twice (rename twice thrice))
  (begin
    (define (rl-marker) 1)))
