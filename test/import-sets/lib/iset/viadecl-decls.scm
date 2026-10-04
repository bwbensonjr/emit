;;; viadecl-decls.scm -- declarations for viadecl.sld.
(cond-expand
  ((library (iset eight)) (begin (define (via) (quote has-eight))))
  (else (begin (define (via) (quote no-eight)))))
