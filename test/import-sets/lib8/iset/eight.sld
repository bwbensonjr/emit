;;; eight.sld -- available only when the lib8 root is on the library path, so a
;;; (library (iset eight)) requirement can be made true or false per run.
(define-library (iset eight)
  (import (scheme base))
  (export eight-val)
  (begin (define (eight-val) 8)))
