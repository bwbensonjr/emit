;;; prog-varlib.scm -- exercises (varlib)'s variadic exports. => (2 15)
(import (varlib))
(list (car (tail-of 1 2 3)) (pass-through 1 2 3 4 5))
