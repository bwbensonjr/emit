;;; inc.sld -- a library whose body comes from inc/body.scm, which includes inc/more.scm
;;; at its top level; more.scm includes inc/deep.scm from inside a procedure body.
(define-library (iset inc)
  (import (scheme base))
  (export inc-val deep)
  (include "inc/body.scm"))
