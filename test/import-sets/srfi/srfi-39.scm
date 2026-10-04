;;; srfi-39.scm -- the behavior that justifies advertising srfi-39 (change:
;;; portable-library-surface, design D11).
(define p (make-parameter 10 (lambda (x) (* x 2))))
(list (p) (parameterize ((p 3)) (p)) (p))
