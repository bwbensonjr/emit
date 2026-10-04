;;; prog-macro-prefix.scm -- a prefixed macro export expands, reaching its private helper. => (3 1)
(import (prefix (iset a) k:))
(let ((x 1) (y 2)) (k:swap! x y) (list x y))
