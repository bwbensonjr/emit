;;; macro-dup-b.sld -- the other half of the same-spelling composition fixture
;;; (change: library-macro-export, risk R3).  See macro-dup-a.sld: same private
;;; spelling, different meaning.
(define-library (macro-dup-b)
  (export mb)
  (begin
    (define (helper x) (+ x 100))
    (define-syntax mb
      (syntax-rules ()
        ((_ e) (helper e))))))
