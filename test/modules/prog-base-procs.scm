;;; prog-base-procs.scm -- prelude PROCEDURES via auto-imported (scheme base),
;;; no explicit import (change: module-prelude-scheme-base). => (4 16)
(map (lambda (x) (* x x))
     (filter (lambda (x) (> x 0)) (list -1 2 -3 4)))
