;; Adapted from Malt, copyright 2021 Anurag Mendhekar and Daniel P. Friedman.
;; MIT license; see ../LICENSE. Scalar rules retain the upstream learner order.
(define-library (malt learner operations)
  (import (scheme base) (scheme inexact) (malt learner tensors) (malt learner autodiff))
  (export
    (rename d+ +) (rename d- -) (rename d* *) (rename d/ /) (rename d-exp exp)
    (rename d-log log) (rename d-expt expt) (rename d-sqrt sqrt) (rename d-sqr sqr)
    (rename d-sum sum) (rename d-abs abs) (rename d*-2-1 *-2-1) (rename d-argmax argmax)
    (rename d-max max) (rename d-sum-cols sum-cols) (rename d-correlate correlate)
    rectify flatten concat concat-n +-primal --primal *-primal /-primal rectify-primal
    exp-primal log-primal expt-primal sqrt-primal sqr-primal zeroes-primal sum-primal
    abs-primal *-2-1-primal argmax-primal max-primal sum-cols-primal correlate-primal
    flatten-primal concat-primal +-0-0 --0-0 *-0-0 /-0-0 expt-0-0 exp-0 log-0 abs-0
    rectify-0 sqrt-0 sum-1 argmax-1 max-1 flatten-2 concat-1-1 =-0-0 <-0-0 <=-0-0 >-0-0
    >=-0-0 =-1 <-1 >-1 <=-1 >=-1 !=-1)
  (begin
    (define (add1 x) (+ x 1))
    (define (sub1 x) (- x 1))
    (define drop list-tail)
    ;; Adapted from A-scalar-ops.rkt.
    (define +-0-0 (prim2 + (lambda (a b z) (values z z))))

    (define --0-0 (prim2 - (lambda (a b z) (values z (- z)))))

    (define *-0-0 (prim2 * (lambda (a b z) (values (* b z) (* a z)))))

    (define /-0-0
      (prim2 / (lambda (a b z) (values (* z (/ 1 b)) (* z (/ (- a) (* b b)))))))

    (define expt-0-0
      (prim2 expt
             (lambda (a b z)
               (values (* z (* b (expt a (- b 1)))) (* z (* (expt a b) (log a)))))))

    (define exp-0 (prim1 exp (lambda (a z) (* z (exp a)))))

    (define log-0 (prim1 log (lambda (a z) (* z (/ 1 a)))))

    (define abs-0 (prim1 abs (lambda (x z) (cond ((< x 0) (- z)) (else z)))))

    (define sqrt-0 (prim1 sqrt (lambda (x z) (/ z (* 2 (sqrt x))))))

    (define d* (ext2 *-0-0 0 0))

    (define d+ (ext2 +-0-0 0 0))

    (define d- (ext2 --0-0 0 0))

    (define d/ (ext2 /-0-0 0 0))

    (define d-expt (ext2 expt-0-0 0 0))

    (define d-exp (ext1 exp-0 0))

    (define d-log (ext1 log-0 0))

    (define d-abs (ext1 abs-0 0))

    (define d-sqrt (ext1 sqrt-0 0))

    (define d-sqr (lambda (x) (d* x x)))

    ;; Adapted from B-comparators.rkt.
    (define comparator (lambda (f) (lambda (da db) (f (primal da) (primal db)))))

    (define =-0-0 (comparator =))

    (define <-0-0 (comparator <))

    (define <=-0-0 (comparator <=))

    (define >-0-0 (comparator >))

    (define >=-0-0 (comparator >=))

    (define comparator-primal
      (lambda (f) (lambda (da db) (cond ((f (primal da) (primal db)) 1.0) (else 0.0)))))

    (define extended-comparator (lambda (f) (ext2 (comparator-primal f) 0 0)))

    (define =-1 (extended-comparator =))

    (define <-1 (extended-comparator <))

    (define >-1 (extended-comparator >))

    (define <=-1 (extended-comparator <=))

    (define >=-1 (extended-comparator >=))

    (define != (lambda (a b) (not (= a b))))

    (define !=-1 (extended-comparator !=))

    ;; Adapted from C-star-2-1.rkt.
    (define d*-1-1 (ext2 d* 1 1))

    (define d*-2-1 (ext2 d*-1-1 2 1))

    ;; Adapted from D-sum.rkt.
    (define sum-1 (lambda (t) (summed t (sub1 (tlen t)) 0.0)))

    (define summed
      (lambda (t i a)
        (let ((next-a (d+ a (tref t i))))
          (cond ((zero? i) next-a) (else (summed t (sub1 i) next-a))))))

    (define d-sum (ext1 sum-1 1))

    (define d-sum-cols (ext1 sum-1 2))

    ;; Adapted from E-argmax.rkt.
    (define argmax-1 (lambda (t) (let ((i (sub1 (tlen t)))) (argmaxed t i i))))

    (define argmaxed
      (lambda (t i a)
        (let ((a-hat (next-argmax t i a)))
          (cond ((zero? i) a-hat) (else (argmaxed t (sub1 i) a-hat))))))

    (define next-argmax
      (lambda (t i a) (cond ((>-0-0 (tref t i) (tref t a)) i) (else a))))

    (define d-argmax (ext1 argmax-1 1))

    ;; Adapted from F-max.rkt.
    (define max-1 (lambda (t) (let ((i (sub1 (tlen t)))) (maxed t i (tref t i)))))

    (define maxed
      (lambda (t i a)
        (let ((a-hat (next-max t i a)))
          (cond ((zero? i) a-hat) (else (maxed t (sub1 i) a-hat))))))

    (define next-max (lambda (t i a) (cond ((>-0-0 (tref t i) a) (tref t i)) (else a))))

    (define d-max (ext1 max-1 1))

    ;; Adapted from G-correlate.rkt.
    (define correlate-3-2
      (lambda (bank signal)
        (build-tensor (list (tlen signal) (tlen bank))
                      (lambda (idx)
                        (let ((segment (ref idx 0)) (filter (tref bank (ref idx 1))))
                          (correlate-overlap filter signal segment))))))

    (define correlate-overlap
      (lambda (filter signal segment)
        (let ((q (/ (- (tlen filter) 1) 2)))
          (let ((from (- segment q)) (to (+ segment q)))
            (sum-dp filter signal from (sub1 (tlen filter)) 0.0)))))

    (define sum-dp
      (lambda (filter signal from i a)
        (let ((si (+ from i)))
          (let ((a-hat (cond
                         ((and (>= si 0) (< si (tlen signal)))
                           (+-0-0 a (dot-product (tref signal si) (tref filter i))))
                         (else a))))
            (cond
              ((zero? i) a-hat)
              (else (sum-dp filter signal from (sub1 i) a-hat)))))))

    (define dot-product (lambda (t u) (dotted-product t u (sub1 (tlen t)) 0.0)))

    (define dotted-product
      (lambda (t u i a)
        (let ((a-hat (+-0-0 a (*-0-0 (tref t i) (tref u i)))))
          (cond ((zero? i) a-hat) (else (dotted-product t u (sub1 i) a-hat))))))

    (define d-correlate (ext2 correlate-3-2 3 2))

    ;; Adapted from H-rectify.rkt.
    (define rectify-0 (lambda (x) (cond ((<-0-0 x 0.0) 0.0) (else x))))

    (define rectify (ext1 rectify-0 0))

    ;; Adapted from I-flatten.rkt.
    (define flatten-2
      (lambda (t)
        (let ((s (shape t)))
          (let ((rows (ref s 0)) (cols (ref s 1)))
            (build-vector
              (* rows cols)
              (lambda (i) (tref (tref t (quotient i cols)) (remainder i cols))))))))

    (define flatten (ext1 flatten-2 2))

    ;; Adapted from J-nd-ops.rkt.
    (define *-primal (ext2 * 0 0))

    (define +-primal (ext2 + 0 0))

    (define --primal (ext2 - 0 0))

    (define /-primal (ext2 / 0 0))

    (define expt-primal (ext2 expt 0 0))

    (define exp-primal (ext1 exp 0))

    (define log-primal (ext1 log 0))

    (define abs-primal (ext1 abs 0))

    (define sqrt-primal (lambda (a) (expt-primal a 0.5)))

    (define sqr-primal (lambda (x) (*-primal x x)))

    (define zeroes-primal (ext1 (lambda (_) 0.0) 0))

    (define *-2-1-primal (ext2 *-primal 2 1))

    (define sum-1-primal (lambda (t) (summed-primal t (sub1 (tlen t)) 0.0)))

    (define summed-primal
      (lambda (t i a)
        (let ((next-a (+-primal a (tref t i))))
          (cond ((zero? i) next-a) (else (summed-primal t (sub1 i) next-a))))))

    (define sum-primal (ext1 sum-1-primal 1))

    (define sum-cols-primal (ext1 sum-1-primal 2))

    (define argmax-primal (ext1 argmax-1 1))

    (define max-primal (ext1 max-1 1))

    (define correlate-3-2-primal
      (lambda (bank signal)
        (build-tensor (list (tlen signal) (tlen bank))
                      (lambda (idx)
                        (let ((segment (ref idx 0)) (filter (tref bank (ref idx 1))))
                          (correlate-overlap-primal filter signal segment))))))

    (define correlate-overlap-primal
      (lambda (filter signal segment)
        (let ((q (/ (- (tlen filter) 1) 2)))
          (let ((from (- segment q)) (to (+ segment q)))
            (sum-dp-primal filter signal from (sub1 (tlen filter)) 0.0)))))

    (define sum-dp-primal
      (lambda (filter signal from i a)
        (let ((si (+ from i)))
          (let ((a-hat (cond
                         ((and (>= si 0) (< si (tlen signal)))
                           (+ a (dot-product-primal (tref signal si) (tref filter i))))
                         (else a))))
            (cond
              ((zero? i) a-hat)
              (else (sum-dp-primal filter signal from (sub1 i) a-hat)))))))

    (define dot-product-primal
      (lambda (t u) (dotted-product-primal t u (sub1 (tlen t)) 0.0)))

    (define dotted-product-primal
      (lambda (t u i a)
        (let ((a-hat (+ a (* (tref t i) (tref u i)))))
          (cond ((zero? i) a-hat) (else (dotted-product-primal t u (sub1 i) a-hat))))))

    (define correlate-primal (ext2 correlate-3-2-primal 3 2))

    (define rectify-primal (ext1 rectify-0 0))

    (define flatten-primal (ext1 flatten-2 2))

    ;; Adapted from K-concat.rkt.
    (define concat-base
      (lambda (t u)
        (let ((nt (tlen t)) (nu (tlen u)))
          (build-vector
            (+ nt nu)
            (lambda (i) (cond ((< i nt) (tref t i)) (else (tref u (- i nt)))))))))

    (define concat-n
      (lambda (n)
        (lambda (t u)
          (let ((st (shape t)) (su (shape u)))
            (ensure-compatible-shapes n st su)
            ((ext2 concat-base n n) t u)))))

    (define concat-1-1 concat-base)

    (define concat (concat-n 1))

    (define ensure-compatible-shapes
      (lambda (n st su)
        (let ((rt (len st)) (ru (len su)))

          (when (not (equal? (drop st (+ 1 (- rt n))) (drop su (+ 1 (- ru n)))))
            (error 'concat
                   "Incompatible concat shapes: ~a and ~a at last ~a dimensions"
                   st
                   su
                   n)))))
    (define concat-primal concat)
    (define concat-n-primal concat-n)))
