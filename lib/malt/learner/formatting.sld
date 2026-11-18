;;; Shared tensor-formatting state; no dependency on tensor implementation.
(define-library (malt learner formatting)
  (import (scheme base))
  (export max-tensor-print-length)
  (begin (define max-tensor-print-length (make-parameter 5))))
