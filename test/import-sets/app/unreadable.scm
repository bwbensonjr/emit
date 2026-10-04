;;; unreadable.scm -- a body include naming a missing file names the file.
(define (z) (include "nope.scm"))
(z)
