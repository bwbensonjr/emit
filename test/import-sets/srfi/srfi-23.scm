;;; srfi-23.scm -- the behavior that justifies advertising srfi-23 (change:
;;; portable-library-surface, design D11).
(guard (e (#t (list (error-object-message e) (error-object-irritants e))))
  (error "bad thing:" 1 2))
