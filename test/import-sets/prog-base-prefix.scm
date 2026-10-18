;;; prog-base-prefix.scm -- a prefixed (scheme base), procedures and derived forms. => ((2 3) 1)
(import (prefix (scheme base) b:))
(b:list (b:map (b:lambda (x) (b:+ x 1)) (b:quote (1 2))) (b:cond (#f 0) (b:else 1)))
