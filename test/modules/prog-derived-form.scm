;;; a program using a library whose BODY uses derived forms (issue #55)
(import (derived-form-lib))
(+ (dfw 5)                                   ; 42
   (dfa 1)                                   ; 7
   (dfo #f)                                  ; 9
   (if (eq? (dfc 9) 'big) 1 0)               ; 1
   (if (eq? (dfc 3) 'mid) 2 0)               ; 2
   (if (eq? (dfc 0) 'small) 3 0)             ; 3
   (dfl 4))                                  ; 20  => 84
