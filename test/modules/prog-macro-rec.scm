;;; prog-macro-rec.scm -- a recursive variadic imported macro, used at a width that forces
;;; three levels of self-recursion (change: library-macro-export).  The program also binds
;;; `pick` to something wrong: if the template's call resolved in the importer rather than
;;; the exporter, this would return 3 instead of 17.
(import (macro-rec-lib))
(define (pick a b) 3)
(my-max 3 17 8 12)
