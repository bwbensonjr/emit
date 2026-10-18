;;; cyc-b.sld -- cycle fixture B (change: module-generalize).  (cyc-b) <-> (cyc-a).
(define-library (cyc-b)
  (import (scheme base))
  (import (cyc-a))
  (export b)
  (begin
    (define (b) 2)))
