;;; srfi-87.scm -- the behavior that justifies advertising srfi-87 (change:
;;; portable-library-surface, design D11).
(list (case 5 ((1 2) 'low) ((5) => (lambda (x) (* x 2))) (else 'other))
      (case 9 ((1) 'one) (else => (lambda (x) (+ x 1)))))
