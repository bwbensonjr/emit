;;; viadecl.sld -- a (library NAME) requirement arriving through
;;; include-library-declarations is answered like one written in place.
(define-library (iset viadecl)
  (import (scheme base))
  (export via)
  (include-library-declarations "viadecl-decls.scm"))
