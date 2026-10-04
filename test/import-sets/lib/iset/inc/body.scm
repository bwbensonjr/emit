;;; body.scm -- spliced into (iset inc); its own include resolves beside this file.
(define (inc-val) (+ (more-val) 1))
(include "more.scm")
