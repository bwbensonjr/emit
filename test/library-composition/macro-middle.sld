(define-library (composition macro middle)
  (import (prefix
            (rename (only (composition macro owner) seed) (seed seeded))
            m:))
  (export outer (rename m:seeded seeded))
  (begin
    (define-syntax outer
      (syntax-rules ()
        ((_ x) (m:seeded x))))))
