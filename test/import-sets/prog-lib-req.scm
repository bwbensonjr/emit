;;; prog-lib-req.scm -- a (library NAME) requirement at a program's top level.
(cond-expand ((library (iset eight)) (import (iset eight)))
             (else (define (eight-val) (quote fallback))))
(eight-val)
