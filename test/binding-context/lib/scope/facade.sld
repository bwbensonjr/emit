(define-library (scope facade)
  (import (scheme base) (rename (scope owner) (outer forwarded)))
  (export (rename forwarded outer) read-state bump! literal aliases token
          generated-state core-shadow-value))
