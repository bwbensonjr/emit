;;; prog-macro-dup.scm -- imports two libraries whose exported macros each reach a
;;; private `helper` of the same spelling (change: library-macro-export, risk R3).
;;; ma(1) = 1+1 = 2; mb(1) = 1+100 = 101; sum 103.  A single shared resolution would
;;; give 4 or 202 -- a wrong answer, not a link error, which is why this is a value
;;; check.
(import (macro-dup-a))
(import (macro-dup-b))
(+ (ma 1) (mb 1))
