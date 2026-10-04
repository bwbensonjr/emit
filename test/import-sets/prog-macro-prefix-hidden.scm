;;; prog-macro-prefix-hidden.scm -- under prefix, swap! is not a keyword: an unbound application.
(import (prefix (iset a) k:))
(let ((x 1) (y 2)) (swap! x y) (list x y))
