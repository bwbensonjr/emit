;;; prog-base-bare.scm -- a bare (scheme base) import is the implicit view. => (2 3)
(import (scheme base))
(map (lambda (x) (+ x 1)) '(1 2))
