;;; srfi-9.scm -- the behavior that justifies advertising srfi-9 (change:
;;; portable-library-surface, design D11).
(define-record-type pare (kons x y) pare? (x kar set-kar!) (y kdr))
(let ([p (kons 1 2)]) (set-kar! p 3) (list (pare? p) (pare? 5) (kar p) (kdr p)))
