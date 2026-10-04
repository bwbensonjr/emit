;;; nine.sld -- available only when the lib9 root is on the library path.
(define-library (iset nine)
  (import (scheme base))
  (export nine-val)
  (begin (define (nine-val) 9)))
