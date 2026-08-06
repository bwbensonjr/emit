;;; prog-macro-rename-bad.scm -- the INTERNAL keyword of a renamed macro export must
;;; not be visible to an importer (change: library-macro-export).  %swap is not a
;;; macro here, so this is an application of an unbound variable and the build must
;;; fail.
(import (macro-rename-lib))
(define a 1)
(define b 2)
(%swap a b)
a
