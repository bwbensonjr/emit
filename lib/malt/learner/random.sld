;;; Malt initialization with SRFI 27 and uncached Box-Muller normals.
;;; See ../LICENSE and ../PROVENANCE.md.
(define-library (malt learner random)
  (import
    (scheme base)
    (prefix (scheme inexact) math:)
    (srfi 27)
    (only (malt learner tensors) primal build-tensor))
  (export
    random-normal random-standard-normal random-tensor init-theta init-shape zero-tensor
    current-random-source sample-indices)
  (begin
    (define current-random-source
      (make-parameter default-random-source
                      (lambda (source)
                        (if (random-source? source)
                            source
                            (error "malt: expected a random source" source)))))
    (define pi (* 4.0 (math:atan 1.0)))
    (define (random-standard-normal)
      (let* ((draw (random-source-make-reals (current-random-source)))
             (u1 (draw))
             (u2 (draw)))
        (* (math:sqrt (* -2.0 (math:log u1))) (math:cos (* 2.0 pi u2)))))
    (define (nonnegative-finite who value)
      (if (and (number? value) (math:finite? value) (>= value 0))
          value
          (error who "expected a finite nonnegative value" value)))
    (define (random-normal mean standard-deviation)
      (let ((mean (primal mean)) (sigma (primal standard-deviation)))
        (if (not (and (number? mean) (math:finite? mean)))
            (error "random-normal: expected a finite mean" mean))
        (nonnegative-finite "random-normal" sigma)
        (+ mean (* sigma (random-standard-normal)))))
    (define (random-tensor mean variance shape)
      (let ((sigma (math:sqrt (nonnegative-finite "random-tensor" (primal variance)))))
        (build-tensor shape (lambda (index) (random-normal mean sigma)))))
    (define (zero-tensor shape) (build-tensor shape (lambda (index) 0.0)))
    (define (init-shape shape)
      (cond
        ((= (length shape) 1) (zero-tensor shape))
        ((= (length shape) 2) (random-tensor 0.0 (/ 2.0 (cadr shape)) shape))
        ((= (length shape) 3)
          (random-tensor 0.0 (/ 2.0 (* (cadr shape) (car (cddr shape)))) shape))
        (else (error "init-shape: expected rank one, two, or three" shape))))
    (define (init-theta shapes)
      (if (null? shapes)
          '()
          (let* ((first (init-shape (car shapes))) (rest (init-theta (cdr shapes))))
            (cons first rest))))
    (define (sample-indices n count)
      (if (not (and (exact-integer? n) (> n 0)))
          (error "samples: expected a positive population size" n))
      (if (not (and (exact-integer? count) (>= count 0)))
          (error "samples: expected a nonnegative sample count" count))
      (let ((draw (random-source-make-integers (current-random-source))))
        (let loop ((remaining count) (result '()))
          (if (= remaining 0)
              result
              (let ((index (draw n))) (loop (- remaining 1) (cons index result)))))))))
