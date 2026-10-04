;;; body-include.scm -- an included file supplies a procedure body's internal
;;; definitions. => 10
(define (g)
  (include "helpers.scm")
  (helper2 1))
(g)
