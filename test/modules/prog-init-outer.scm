;;; prog-init-outer.scm -- the emit run command's half of the path-agreement case (change:
;;; defer-manifest-library-init, design D4).  Prints 1 only if (init-count) was
;;; initialized before (init-outer), which is the same observable the REPL's
;;; (import (init-outer)) produces.
(import (init-outer))
(display (outer-ticks))
