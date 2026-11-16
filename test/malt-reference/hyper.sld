;;; A consumer library proves generic hyperparameter declarations are exportable.
(define-library (malt-reference hyper)
  (import (scheme base) (prefix (malt learner hyperparameters) m:))
  (export custom-setting read-custom)
  (begin
    (m:declare-hyper custom-setting)
    (define (read-custom) (custom-setting))))
