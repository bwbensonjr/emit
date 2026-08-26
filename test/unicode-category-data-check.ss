;;; Verify the generated general-category table against every Unicode 17.0.0
;;; code-point position, using UnicodeData.txt as the independent expected source.
(import (chezscheme))

(load "lib/scheme/char-data.scm")

(define (split s ch)
  (let ([n (string-length s)])
    (let loop ([i 0] [start 0] [out '()])
      (cond
        [(= i n) (reverse (cons (substring s start i) out))]
        [(char=? (string-ref s i) ch)
         (loop (+ i 1) (+ i 1) (cons (substring s start i) out))]
        [else (loop (+ i 1) start out)]))))

(define (file-lines path)
  (call-with-input-file path
    (lambda (p)
      (let loop ([out '()])
        (let ([line (get-line p)])
          (if (eof-object? line) (reverse out) (loop (cons line out))))))))

(define (string-suffix? suffix s)
  (let ([sn (string-length s)] [xn (string-length suffix)])
    (and (>= sn xn) (string=? (substring s (- sn xn) sn) suffix))))

(define (expected-ranges lines)
  (let loop ([lines lines] [pending #f] [out '()])
    (if (null? lines)
        (reverse out)
        (let* ([fields (split (car lines) #\;)]
               [cp (string->number (list-ref fields 0) 16)]
               [name (list-ref fields 1)]
               [category (string->symbol (list-ref fields 2))])
          (cond
            [(string-suffix? ", First>" name)
             (loop (cdr lines) (cons cp category) out)]
            [(string-suffix? ", Last>" name)
             (loop (cdr lines) #f
                   (cons (list (car pending) cp category) out))]
            [else
             (loop (cdr lines) #f (cons (list cp cp category) out))])))))

(define (generated-ranges table)
  (let loop ([i 0] [out '()])
    (if (= i (vector-length table))
        (reverse out)
        (loop (+ i 3)
              (cons (list (vector-ref table i)
                          (vector-ref table (+ i 1))
                          (vector-ref table (+ i 2)))
                    out)))))

(define (active-ranges cp ranges)
  (if (and (pair? ranges) (> cp (cadar ranges)))
      (active-ranges cp (cdr ranges))
      ranges))

(define (range-category cp ranges)
  (if (and (pair? ranges)
           (<= (caar ranges) cp)
           (<= cp (cadar ranges)))
      (caddar ranges)
      'Cn))

(define generated (generated-ranges %unicode-general-category))
(define generated-count (length generated))
(let validate ([ranges generated] [previous #f])
  (unless (null? ranges)
    (let ([current (car ranges)])
      (unless (and (integer? (car current))
                   (integer? (cadr current))
                   (symbol? (caddr current))
                   (<= (car current) (cadr current))
                   (or (not previous)
                       (and (< (cadr previous) (car current))
                            (not (and (= (+ (cadr previous) 1) (car current))
                                      (eq? (caddr previous) (caddr current)))))))
        (error 'unicode-category-data-check
               "malformed or uncoalesced generated category range"
               previous current))
      (validate (cdr ranges) current))))

(define expected
  (expected-ranges
    (file-lines "vendor/unicode/17.0.0/UnicodeData.txt")))
(let loop ([cp 0] [expected expected] [generated generated])
  (if (> cp 1114111)
      (printf "unicode general categories: ok (~a generated ranges)~n"
              generated-count)
      (let* ([expected (active-ranges cp expected)]
             [generated (active-ranges cp generated)]
             [want (range-category cp expected)]
             [got (range-category cp generated)])
        (unless (eq? got want)
          (error 'unicode-category-data-check
                 "generated category mismatch" cp got want))
        (loop (+ cp 1) expected generated))))
