(import (composition macro facade))
(define-syntax %private-step
  (syntax-rules () ((_ x) 900)))
(write (outer 7))
(newline)
