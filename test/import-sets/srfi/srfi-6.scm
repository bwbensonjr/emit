;;; srfi-6.scm -- the behavior that justifies advertising srfi-6 (change:
;;; portable-library-surface, design D11).
(let ([o (open-output-string)])
  (write 'abc o)
  (display " " o)
  (let ([i (open-input-string "xy")])
    (write-char (read-char i) o)
    (list (get-output-string o) (read-char i) (eof-object? (read-char i)))))
