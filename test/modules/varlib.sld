;;; varlib.sld -- a library whose exports are VARIADIC (issue #11).
;;; The cross-door byte-identity check below was blind to this shape for a long
;;; time: mylib defines only fixed-arity procedures, so it never reached the
;;; emitter's rest-list path (emit-build-rest) or its `apply` path, both of which
;;; diverged between the Chez-hosted driver and the shipped self-hosted doors.
;;; Keep at least one variadic export here, and one that uses `apply`.
(define-library (varlib)
  (export tail-of pass-through collect)
  (begin
    (define (tail-of . xs) (cdr xs))              ; rest params -> emit-build-rest
    (define (sum5 a b c d e) (+ a b c d e))
    (define (pass-through . xs) (apply sum5 xs))   ; apply -> the K-slot spill

    ;; Required arguments plus a rest parameter exercise the minimum-arity half
    ;; of the exported call descriptor (change: cross-unit-variadic-direct-calls).
    (define (collect a b . xs)
      (cons a (cons b (cons xs (quote ())))))))
