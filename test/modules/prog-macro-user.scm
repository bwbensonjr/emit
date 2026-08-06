;;; prog-macro-user.scm -- the program only calls a procedure; the MACRO crossed a
;;; library-to-library boundary one level down (change: library-macro-export).
;;; dbl(4) = ma(4) + ma(4) = 5 + 5 = 10.
(import (macro-user-lib))
(dbl 4)
