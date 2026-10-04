;;; condbody.sld -- a body-level cond-expand inside a library `begin`.
(define-library (iset condbody)
  (import (scheme base))
  (export which)
  (begin
    (cond-expand
      (emit (define (which) 'emit))
      (else (define (which) 'other)))))
