;;; prog-macrolib.scm -- program using a library's exported macro AND its exported
;;; procedure (change: library-macro-export).  The macro's temporary is named `tmp`
;;; and so is a program binding, so a hygiene failure shows up as a wrong answer
;;; rather than a compile error.  swap! exchanges a and b => a=2 b=1 => 21; plus
;;; mval() = 11 => 32.
(import (macrolib))
(define a 1)
(define b 2)
(define tmp 900)
(swap! a b)
(+ (* a 10) b (mval) (- tmp 900))
