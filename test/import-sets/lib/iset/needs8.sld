;;; needs8.sld -- imports (iset eight) when it is available, else defines a fallback:
;;; the portable-package idiom (library NAME) exists for.
(define-library (iset needs8)
  (import (scheme base))
  (export got)
  (cond-expand
    ((library (iset eight)) (import (iset eight)))
    (else (begin (define (eight-val) (quote fallback)))))
  (begin (define (got) (eight-val))))
