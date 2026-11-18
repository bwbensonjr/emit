;;; Seeded 2-to-8-to-1 ReLU XOR, using the Malt learner backend.
;;; Run: build/emit run demos/malt-xor.scm
(import (scheme base) (scheme write) (srfi 27) (prefix (malt learner) m:))
(define network
  (m:stack-blocks
    (list (m:block m:relu '((8 2) (8)))
          (m:block m:relu '((1 8) (1))))))
(define xs (m:tensor (m:tensor 0.0 0.0) (m:tensor 0.0 1.0)
                     (m:tensor 1.0 0.0) (m:tensor 1.0 1.0)))
(define ys (m:tensor (m:tensor 0.0) (m:tensor 1.0)
                     (m:tensor 1.0) (m:tensor 0.0)))
(define source (make-random-source))
(random-source-pseudo-randomize! source 17 0)
(define theta
  (parameterize ((m:current-random-source source))
    (m:with-hypers ((m:alpha 0.01) (m:revs 4000) (m:batch-size 4))
      (m:naked-gradient-descent
        (m:sampling-obj (m:l2-loss (m:block-fn network)) xs ys)
        (m:init-theta (m:block-ls network))))))
(define predictor (m:model (m:block-fn network) theta))
(define predictions
  (map (lambda (x) (m:primal (m:tref (predictor x) 0))) (vector->list (m:tensor->vector xs))))
(define targets '(0.0 1.0 1.0 0.0))
(define squared-error
  (let loop ((actual predictions) (expected targets) (total 0.0))
    (if (null? actual) total
        (let ((difference (- (car actual) (car expected))))
          (if (>= (abs difference) 0.1)
              (error "XOR prediction outside acceptance threshold" predictions))
          (loop (cdr actual) (cdr expected) (+ total (* difference difference)))))))
(if (>= squared-error 0.04) (error "XOR loss outside acceptance threshold" squared-error))
(write (list 'xor predictions squared-error))
(newline)
