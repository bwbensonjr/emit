;;; prog-lib-base.scm -- a baked library is always available. => yes
(cond-expand ((library (scheme base)) (quote yes)) (else (quote no)))
