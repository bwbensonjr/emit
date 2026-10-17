(import (scheme base) (artifact facade) (composition escaped))
(unless (let ((xs (shared-message))) (eq? (car xs) (cadr xs)))
  (error "shared escaped string identity was lost"))
(write (list value (bonus 1) (collect 1 2) init-count selected
             (map char->integer (string->list (escaped-message)))))
(newline)
