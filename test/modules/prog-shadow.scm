;;; prog-shadow.scm -- own top-level `greet` shadows the import from (mylib). => 7
(import (mylib))
(define (greet) 7)
(greet)
