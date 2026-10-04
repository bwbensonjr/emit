;;; srfi-16.scm -- the behavior that justifies advertising srfi-16 (change:
;;; portable-library-surface, design D11).
(import (scheme case-lambda))
(define plus (case-lambda (() 0) ((x) x) ((x y) (+ x y)) ((x y . z) (apply plus (+ x y) z))))
(list (plus) (plus 1) (plus 1 2) (plus 1 2 3 4))
