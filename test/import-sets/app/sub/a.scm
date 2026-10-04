;;; a.scm -- defines fa, whose body is the contents of b.scm (resolved beside this file).
(define (fa) (include "b.scm"))
