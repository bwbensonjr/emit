;;; prog-macro-except.scm -- except of swap! leaves dbl-swap!, written on top of it, working. => (2 3)
(import (except (iset a) swap!))
(let ((x 1) (y 2)) (dbl-swap! x y) (list x y))
