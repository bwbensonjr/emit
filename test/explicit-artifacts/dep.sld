(define-library (artifact dep)
  (export value collect bonus init-count selected)
  (import (scheme base))
  (cond-expand
    ((library (feature optional)) (begin (define selected 1)))
    (else (begin (define selected 0))))
  (include "dep-body.scm"))
