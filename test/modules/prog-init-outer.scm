;;; prog-init-outer.scm -- the run door's half of the door-agreement case (change:
;;; defer-manifest-library-init, design D4).  Prints 1 only if (init-count) was
;;; initialized before (init-outer), which is the same observable the REPL door's
;;; (import (init-outer)) produces.
(import (init-outer))
(display (outer-ticks))
