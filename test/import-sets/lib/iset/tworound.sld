;;; tworound.sld -- the second requirement is only asked once the first is answered
;;; true, so a host that answers in one round would get it wrong.
(define-library (iset tworound)
  (import (scheme base))
  (export r)
  (cond-expand
    ((library (iset eight))
     (cond-expand
       ((library (iset nine)) (begin (define (r) (quote both))))
       (else (begin (define (r) (quote eight-only))))))
    (else (begin (define (r) (quote none))))))
