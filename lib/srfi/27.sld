;; SRFI 27, MRG32k3a. Adapted from Sebastian Egner's 2002 reference.
;; Reference revision a547c5508d648c61e73bebed2bcd2283fba5abaa.
;; Adaptations: records, versioned copied state, 61-bit integer rejection,
;; 53-bit open-interval reals, and explicit operating-system entropy.
;; Copyright and permission notice: 27-LICENSE.txt. See docs/RANDOM.md.
(define-library (srfi 27)
  (import (scheme base))
  (export
    random-integer random-real default-random-source make-random-source random-source?
    random-source-state-ref random-source-state-set! random-source-randomize!
    random-source-pseudo-randomize! random-source-make-integers
    random-source-make-reals)
  (begin
    (define m1 4294967087)
    (define m2 4294944443)
    (define max-integer 1152921504606846975)
    (define initial-state
      '#(1062452522 2961816100 342112271 2854655037 3321940838 3542344109))
    (define-record-type <random-source> (make-source state) random-source?
      (state source-state source-state-set!))

    (define (copy-vector v) (list->vector (vector->list v)))
    (define (make-random-source) (make-source (copy-vector initial-state)))
    (define (require-source who s)
      (if (random-source? s) s (error who "expected a random source" s)))
    (define (exact-nonnegative? x) (and (integer? x) (exact? x) (<= 0 x max-integer)))

    (define (random-source-state-ref s)
      (cons 'emit-srfi-27
            (cons 'mrg32k3a-v1
                  (vector->list (source-state (require-source 'random-source-state-ref
                                                              s))))))
    (define (random-source-state-set! s datum)
      (require-source 'random-source-state-set! s)
      (if (not (and (list? datum)
                    (= (length datum) 8)
                    (eq? (car datum) 'emit-srfi-27)
                    (eq? (car (cdr datum)) 'mrg32k3a-v1)))
          (error 'random-source-state-set! "malformed or unsupported state" datum)
          (let ((v (list->vector (cdr (cdr datum)))))
            (let loop ((i 0))
              (if (< i 6)
                  (let ((x (vector-ref v i)) (m (if (< i 3) m1 m2)))
                    (if (and (exact-nonnegative? x) (< x m))
                        (loop (+ i 1))
                        (error 'random-source-state-set! "invalid state word" x)))))
            (if (or (= 0 (+ (vector-ref v 0) (vector-ref v 1) (vector-ref v 2)))
                    (= 0 (+ (vector-ref v 3) (vector-ref v 4) (vector-ref v 5))))
                (error 'random-source-state-set! "degenerate state" datum)
                (source-state-set! s v)))))

    ;; Each recurrence product is below 2^53, safely inside the exact range.
    (define (core s)
      (let* ((v (source-state s))
             (a (vector-ref v 0))
             (b (vector-ref v 1))
             (c (vector-ref v 2))
             (d (vector-ref v 3))
             (e (vector-ref v 4))
             (f (vector-ref v 5))
             (x (modulo (- (* 1403580 b) (* 810728 c)) m1))
             (y (modulo (- (* 527612 d) (* 1370589 f)) m2)))
        (vector-set! v 0 x)
        (vector-set! v 1 a)
        (vector-set! v 2 b)
        (vector-set! v 3 y)
        (vector-set! v 4 d)
        (vector-set! v 5 e)
        (modulo (- x y) m1)))

    ;; Split 32-bit factors into 16-bit limbs. The largest intermediate is
    ;; below 2^50, including the second modulus's 22853 remainder.
    (define (mod-product a b m)
      (let* ((ah (quotient a 65536))
             (al (modulo a 65536))
             (bh (quotient b 65536))
             (bl (modulo b 65536))
             (reduction (if (= m m1) 209 22853)))
        (modulo (+ (* (* ah bh) reduction) (* (+ (* ah bl) (* al bh)) 65536) (* al bl))
                m)))
    (define identity-matrices '#(1 0 0 0 1 0 0 0 1 1 0 0 0 1 0 0 0 1))
    ;; A^(2^127), A^(2^76), independently computed in reference.py.
    (define jump-stream
      '#(1230515664 986791581 1988835001 3580155704 1230515664 226153695 949770784
         3580155704 2427906178 2093834863 32183930 2824425944 1022607788 1464411153
         32183930 1610723613 277697599 1464411153))
    (define jump-substream
      '#(69195019 3528743235 3672091415 1871391091 69195019 3672831523 4127413238
         1871391091 82758667 3708466080 4292754251 3859662829 3889917532 1511326704
         4292754251 1610795712 3759209742 1511326704))
    (define (matrix-product a b)
      (let ((out (make-vector 18 0)))
        (let loop ((i 0))
          (if (= i 18)
              out
              (let* ((offset (if (< i 9) 0 9))
                     (m (if (< i 9) m1 m2))
                     (r (quotient (- i offset) 3))
                     (c (modulo (- i offset) 3))
                     (row (+ offset (* r 3))))
                (vector-set!
                  out
                  i
                  (modulo
                    (+ (mod-product (vector-ref a row) (vector-ref b (+ offset c)) m)
                       (mod-product (vector-ref a (+ row 1))
                                    (vector-ref b (+ offset 3 c))
                                    m)
                       (mod-product (vector-ref a (+ row 2))
                                    (vector-ref b (+ offset 6 c))
                                    m))
                    m))
                (loop (+ i 1)))))))
    (define (matrix-power a e)
      (let loop ((a a) (e e) (out identity-matrices))
        (if (= e 0)
            out
            (loop (matrix-product a a)
                  (quotient e 2)
                  (if (odd? e) (matrix-product out a) out)))))
    (define (random-source-pseudo-randomize! s i j)
      (require-source 'random-source-pseudo-randomize! s)
      (if (not (and (exact-nonnegative? i) (exact-nonnegative? j)))
          (error 'random-source-pseudo-randomize!
                 "indices must be nonnegative exact integers"
                 i
                 j)
          (let* ((a (matrix-product (matrix-power jump-stream (modulo i 268435456))
                                    (matrix-power jump-substream (modulo j 268435456))))
                 (v (make-vector 6 0)))
            (let loop ((k 0))
              (if (= k 6)
                  (source-state-set! s v)
                  (let* ((offset (if (< k 3) 0 9))
                         (start (if (< k 3) 0 3))
                         (m (if (< k 3) m1 m2))
                         (row (+ offset (* (modulo k 3) 3))))
                    (vector-set!
                      v
                      k
                      (modulo (+ (mod-product (vector-ref a row)
                                              (vector-ref initial-state start)
                                              m)
                                 (mod-product (vector-ref a (+ row 1))
                                              (vector-ref initial-state (+ start 1))
                                              m)
                                 (mod-product (vector-ref a (+ row 2))
                                              (vector-ref initial-state (+ start 2))
                                              m))
                              m))
                    (loop (+ k 1))))))))

    (define (power-of-two n)
      (let loop ((n n) (x 1)) (if (= n 0) x (loop (- n 1) (* 2 x)))))
    (define (bits s count)
      (let loop ((remaining count) (out 0))
        (if (= remaining 0)
            out
            (let* ((width (min remaining 30))
                   (bound (power-of-two width))
                   (q (quotient m1 bound))
                   (limit (* q bound)))
              (let draw ((x (core s)))
                (if (< x limit)
                    (loop (- remaining width) (+ (* out bound) (quotient x q)))
                    (draw (core s))))))))
    (define (bit-length n)
      (let loop ((n n) (count 0)) (if (= n 0) count (loop (quotient n 2) (+ count 1)))))
    (define (draw-integer s n)
      (if (not (and (exact-nonnegative? n) (> n 0)))
          (error 'random-integer "bound must be a positive exact integer" n)
          (if (= n 1)
              (begin (core s) 0)
              (let ((width (bit-length (- n 1))))
                (let loop ((x (bits s width))) (if (< x n) x (loop (bits s width))))))))
    (define (random-source-make-integers s)
      (require-source 'random-source-make-integers s)
      (lambda (n) (draw-integer s n)))
    (define (draw-real s)
      (let loop ((x (bits s 53)))
        (if (= x 0) (loop (bits s 53)) (* (inexact x) 1.1102230246251565e-16))))
    (define (random-source-make-reals s . unit)
      (require-source 'random-source-make-reals s)
      (if (not (or (null? unit)
                   (and (null? (cdr unit))
                        (real? (car unit))
                        (inexact? (car unit))
                        (<= 1.1102230246251565e-16 (car unit))
                        (< (car unit) 1.0))))
          (error 'random-source-make-reals
                 "unsupported unit; require flonum in [2^-53,1)"
                 unit)
          (lambda () (draw-real s))))

    (define (random-source-randomize! s)
      (require-source 'random-source-randomize! s)
      (let ((bytes (%random-entropy 24)))
        (if (not (and (bytevector? bytes) (= (bytevector-length bytes) 24)))
            (error 'random-source-randomize! "operating-system entropy unavailable")
            (let ((v (make-vector 6 0)))
              (let loop ((i 0))
                (if (= i 6)
                    (source-state-set! s v)
                    (let* ((offset (* i 4))
                           (word (+ (* (bytevector-u8-ref bytes offset) 16777216)
                                    (* (bytevector-u8-ref bytes (+ offset 1)) 65536)
                                    (* (bytevector-u8-ref bytes (+ offset 2)) 256)
                                    (bytevector-u8-ref bytes (+ offset 3))))
                           (m (if (< i 3) m1 m2)))
                      (vector-set! v
                                   i
                                   (if (= (modulo i 3) 0)
                                       (+ 1 (modulo word (- m 1)))
                                       (modulo word m)))
                      (loop (+ i 1)))))))))
    (define default-random-source (make-random-source))
    (define random-integer (random-source-make-integers default-random-source))
    (define random-real (random-source-make-reals default-random-source))))
