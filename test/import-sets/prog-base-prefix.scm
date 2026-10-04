;;; prog-base-prefix.scm -- a prefixed (scheme base), procedures and derived forms. => ((2 3) 1)
(import (prefix (scheme base) b:))
(b:list (b:map (lambda (x) (+ x 1)) '(1 2)) (b:cond (#f 0) (else 1)))
