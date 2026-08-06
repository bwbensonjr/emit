;;; prog-macro-rename.scm -- uses a renamed macro export under its EXTERNAL keyword
;;; (change: library-macro-export).  swap! exchanges a and b => 21.
(import (macro-rename-lib))
(define a 1)
(define b 2)
(swap! a b)
(+ (* a 10) b)
