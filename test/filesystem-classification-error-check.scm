;;; A permission-denied classification is an error, not a false predicate answer.
(import (scheme base)
        (scheme process-context)
        (emit filesystem))

(define path (car (cdr (command-line))))
(display
  (file-error?
    (guard (condition (else condition))
      (file-directory? path))))
(newline)
