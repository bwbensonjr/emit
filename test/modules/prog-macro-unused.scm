;;; prog-macro-unused.scm -- imports a macro-exporting library but never uses the
;;; macro (change: library-macro-export, design D6).  The shake must still prune the
;;; private `helper` its template would have reached: the candidate root set grows,
;;; but the "does the program's IR actually mention it" gate does not move.  Value is
;;; the program's own, so this doubles as a check that importing a macro costs a
;;; program nothing.
(import (macro-helper-lib))
(+ 20 2)
