;;; prog-base-procs.scm -- prelude PROCEDURES via auto-imported (scheme base),
;;; with list extensions imported explicitly. => (4 16)
(import (emit list))
(map (lambda (x) (* x x))
     (filter (lambda (x) (> x 0)) (list -1 2 -3 4)))
