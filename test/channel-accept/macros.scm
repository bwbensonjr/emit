;;; Installed acceptance: a program using the macros exported by (accept macros).
(import (scheme base) (scheme write) (accept macros))
(define x answer)
(define y 0)
(display (begin (swap! x y) (twice y)))
