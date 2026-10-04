;;; prog-overlap.scm -- two imports bind `f` and `m` (design D5).  The precedence rule
;;; this observes is documented in docs/MODULES.md.
(import (iset over1))
(import (iset over2))
(list (f) (m))
