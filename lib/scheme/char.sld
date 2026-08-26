;;; char.sld -- Unicode-aware R7RS-small (scheme char), Unicode 17.0.0.
(define-library (scheme char)
  (import (scheme base))
  (export char-alphabetic? char-numeric? char-whitespace?
          char-upper-case? char-lower-case? digit-value char-general-category
          char-upcase char-downcase char-foldcase
          char-ci=? char-ci<? char-ci>? char-ci<=? char-ci>=?
          string-upcase string-downcase string-foldcase
          string-ci=? string-ci<? string-ci>? string-ci<=? string-ci>=?)
  (include "char-data.scm")
  (begin
    ;; Flat vectors keep generated source compact.  These searches use entry indexes,
    ;; not raw vector indexes, so every midpoint is aligned to an entry boundary.
    (define (uc-in-ranges? table cp)
      (let loop ((lo 0) (hi (- (quotient (vector-length table) 2) 1)))
        (if (> lo hi) #f
            (let* ((mid (quotient (+ lo hi) 2))
                   (i (* mid 2))
                   (a (vector-ref table i))
                   (b (vector-ref table (+ i 1))))
              (cond ((< cp a) (loop lo (- mid 1)))
                    ((> cp b) (loop (+ mid 1) hi))
                    (else #t))))))

    (define (uc-map table cp fallback)
      (let loop ((lo 0) (hi (- (quotient (vector-length table) 2) 1)))
        (if (> lo hi) fallback
            (let* ((mid (quotient (+ lo hi) 2))
                   (i (* mid 2))
                   (key (vector-ref table i)))
              (cond ((< cp key) (loop lo (- mid 1)))
                    ((> cp key) (loop (+ mid 1) hi))
                    (else (vector-ref table (+ i 1))))))))

    (define (char-general-category ch)
      (let ((cp (char->integer ch)))
        (let loop ((lo 0)
                   (hi (- (quotient (vector-length %unicode-general-category) 3) 1)))
          (if (> lo hi) 'Cn
              (let* ((mid (quotient (+ lo hi) 2))
                     (i (* mid 3))
                     (a (vector-ref %unicode-general-category i))
                     (b (vector-ref %unicode-general-category (+ i 1))))
                (cond ((< cp a) (loop lo (- mid 1)))
                      ((> cp b) (loop (+ mid 1) hi))
                      (else (vector-ref %unicode-general-category (+ i 2)))))))))

    (define (char-alphabetic? ch)
      (uc-in-ranges? %unicode-alphabetic (char->integer ch)))
    (define (char-numeric? ch)
      (uc-in-ranges? %unicode-decimal (char->integer ch)))
    (define (char-whitespace? ch)
      (uc-in-ranges? %unicode-whitespace (char->integer ch)))
    (define (char-upper-case? ch)
      (uc-in-ranges? %unicode-uppercase (char->integer ch)))
    (define (char-lower-case? ch)
      (uc-in-ranges? %unicode-lowercase (char->integer ch)))

    (define (digit-value ch)
      (let ((cp (char->integer ch)))
        (let loop ((lo 0) (hi (- (vector-length %unicode-digit-zeroes) 1)))
          (if (> lo hi) #f
              (let* ((mid (quotient (+ lo hi) 2))
                     (zero (vector-ref %unicode-digit-zeroes mid)))
                (cond ((< cp zero) (loop lo (- mid 1)))
                      ((> cp (+ zero 9)) (loop (+ mid 1) hi))
                      (else (- cp zero))))))))

    (define (uc-simple table ch)
      (let* ((cp (char->integer ch)) (m (uc-map table cp #f)))
        (if m (integer->char (car m)) ch)))
    (define (char-upcase ch) (uc-simple %unicode-simple-up ch))
    (define (char-downcase ch) (uc-simple %unicode-simple-down ch))
    (define (char-foldcase ch) (uc-simple %unicode-simple-fold ch))

    (define (uc-char-chain op a b rest)
      (let ((fa (char->integer (char-foldcase a)))
            (fb (char->integer (char-foldcase b))))
        (if (not (op fa fb)) #f
            (if (null? rest) #t
                (uc-char-chain op b (car rest) (cdr rest))))))
    (define (char-ci=? a b . rest) (uc-char-chain = a b rest))
    (define (char-ci<? a b . rest) (uc-char-chain < a b rest))
    (define (char-ci>? a b . rest) (uc-char-chain > a b rest))
    (define (char-ci<=? a b . rest) (uc-char-chain <= a b rest))
    (define (char-ci>=? a b . rest) (uc-char-chain >= a b rest))

    ;; Prepend one forward mapping to a reverse accumulator.  Each output scalar is
    ;; consed exactly once; the final reverse/list->string makes construction linear.
    (define (uc-prepend-reversed xs acc)
      (if (null? xs) acc
          (uc-prepend-reversed (cdr xs) (cons (integer->char (car xs)) acc))))
    (define (uc-string-map table s)
      (let loop ((i 0) (acc '()))
        (if (= i (string-length s))
            (list->string (reverse acc))
            (let* ((cp (char->integer (string-ref s i)))
                   (mapping (uc-map table cp (list cp))))
              (loop (+ i 1) (uc-prepend-reversed mapping acc))))))
    (define (string-upcase s) (uc-string-map %unicode-full-up s))
    (define (string-downcase s) (uc-string-map %unicode-full-down s))
    (define (string-foldcase s) (uc-string-map %unicode-full-fold s))

    (define (uc-string-chain op a b rest)
      (if (not (op (string-foldcase a) (string-foldcase b))) #f
          (if (null? rest) #t
              (uc-string-chain op b (car rest) (cdr rest)))))
    (define (string-ci=? a b . rest) (uc-string-chain string=? a b rest))
    (define (string-ci<? a b . rest) (uc-string-chain string<? a b rest))
    (define (string-ci>? a b . rest) (uc-string-chain string>? a b rest))
    (define (string-ci<=? a b . rest) (uc-string-chain string<=? a b rest))
    (define (string-ci>=? a b . rest) (uc-string-chain string>=? a b rest))))
