;;; gen-unicode-tables.ss -- deterministic Unicode 17.0.0 table generator.
;;;
;;; Usage: chez --script tools/gen-unicode-tables.ss [OUTPUT]
;;; Narration goes to stderr; the generated Scheme include is the named output.

(import (chezscheme))

(define version "17.0.0")
(define root (string-append "vendor/unicode/" version "/"))
(define quiet?
  (let ([v (getenv "EMIT_VERBOSITY")])
    (and v (or (string=? v "quiet") (string=? v "q") (string=? v "0")))))
(define output
  (let ([args (command-line-arguments)])
    (if (null? args) "lib/scheme/char-data.scm" (car args))))
(define started (current-time 'time-monotonic))

(define (trim s)
  (let ([n (string-length s)])
    (let left ([a 0])
      (if (and (< a n) (char-whitespace? (string-ref s a)))
          (left (+ a 1))
          (let right ([b n])
            (if (and (> b a) (char-whitespace? (string-ref s (- b 1))))
                (right (- b 1))
                (substring s a b)))))))

;; Split without dropping empty fields; UnicodeData relies on their positions.
(define (split s ch)
  (let ([n (string-length s)])
    (let loop ([i 0] [start 0] [out '()])
      (cond
        [(= i n) (reverse (cons (substring s start i) out))]
        [(char=? (string-ref s i) ch)
         (loop (+ i 1) (+ i 1) (cons (substring s start i) out))]
        [else (loop (+ i 1) start out)]))))

(define (before-comment s)
  (let loop ([i 0])
    (cond [(= i (string-length s)) s]
          [(char=? (string-ref s i) #\#) (substring s 0 i)]
          [else (loop (+ i 1))])))

(define (file-lines path)
  (call-with-input-file path
    (lambda (p)
      (let loop ([out '()])
        (let ([line (get-line p)])
          (if (eof-object? line) (reverse out) (loop (cons line out))))))))

(define (hex s) (string->number (trim s) 16))
(define (hex-list s)
  (if (string=? (trim s) "") '()
      (map hex (filter (lambda (x) (not (string=? x ""))) (split (trim s) #\space)))))

(define (range-field s)
  (let ([parts (split (trim s) #\.)])
    (if (= (length parts) 1)
        (let ([x (hex (car parts))]) (cons x x))
        ;; A..B yields ("A" "" "B").
        (cons (hex (car parts)) (hex (caddr parts))))))

(define (property-ranges path wanted)
  (let loop ([lines (file-lines path)] [out '()])
    (if (null? lines) (reverse out)
        (let* ([line (trim (before-comment (car lines)))]
               [fields (if (string=? line "") '() (split line #\;))])
          (if (and (= (length fields) 2) (string=? (trim (cadr fields)) wanted))
              (loop (cdr lines) (cons (range-field (car fields)) out))
              (loop (cdr lines) out))))))

(define (merge-ranges ranges)
  (let loop ([in ranges] [out '()])
    (cond
      [(null? in) (reverse out)]
      [(and (pair? out) (<= (caar in) (+ (cdar out) 1)))
       (set-cdr! (car out) (max (cdar out) (cdar in)))
       (loop (cdr in) out)]
      [else (loop (cdr in) (cons (cons (caar in) (cdar in)) out))])))

(define simple-up (make-eqv-hashtable))
(define simple-down (make-eqv-hashtable))
(define full-up (make-eqv-hashtable))
(define full-down (make-eqv-hashtable))
(define simple-fold (make-eqv-hashtable))
(define full-fold (make-eqv-hashtable))
(define decimal-points '())
(define digit-zeroes '())

(define (put-map! table cp mapping)
  (unless (or (null? mapping) (and (= (length mapping) 1) (= cp (car mapping))))
    (hashtable-set! table cp mapping)))

;; UnicodeData supplies general category, decimal value, and default simple casing.
(for-each
  (lambda (line)
    (let ([f (split line #\;)])
      (when (>= (length f) 15)
        (let ([cp (hex (list-ref f 0))])
          (when (string=? (list-ref f 2) "Nd")
            (set! decimal-points (cons (cons cp cp) decimal-points))
            (when (string=? (list-ref f 6) "0")
              (set! digit-zeroes (cons cp digit-zeroes))))
          (unless (string=? (list-ref f 12) "")
            (let ([m (list (hex (list-ref f 12)))])
              (put-map! simple-up cp m) (put-map! full-up cp m)))
          (unless (string=? (list-ref f 13) "")
            (let ([m (list (hex (list-ref f 13)))])
              (put-map! simple-down cp m) (put-map! full-down cp m)))))))
  (file-lines (string-append root "UnicodeData.txt")))

;; Unconditional SpecialCasing entries replace the default full mappings.
(for-each
  (lambda (raw)
    (let* ([line (trim (before-comment raw))]
           [f (if (string=? line "") '() (split line #\;))])
      (when (and (>= (length f) 5) (string=? (trim (list-ref f 4)) ""))
        (let ([cp (hex (list-ref f 0))])
          (put-map! full-down cp (hex-list (list-ref f 1)))
          (put-map! full-up cp (hex-list (list-ref f 3)))))))
  (file-lines (string-append root "SpecialCasing.txt")))

;; C/S are simple folds; C/F are full folds.  Turkic mappings are locale-specific.
(for-each
  (lambda (raw)
    (let* ([line (trim (before-comment raw))]
           [f (if (string=? line "") '() (split line #\;))])
      (when (>= (length f) 3)
        (let ([cp (hex (list-ref f 0))]
              [status (trim (list-ref f 1))]
              [mapping (hex-list (list-ref f 2))])
          (when (or (string=? status "C") (string=? status "S"))
            (put-map! simple-fold cp mapping))
          (when (or (string=? status "C") (string=? status "F"))
            (put-map! full-fold cp mapping))))))
  (file-lines (string-append root "CaseFolding.txt")))

(define alphabetic (merge-ranges
  (property-ranges (string-append root "DerivedCoreProperties.txt") "Alphabetic")))
(define uppercase (merge-ranges
  (property-ranges (string-append root "DerivedCoreProperties.txt") "Uppercase")))
(define lowercase (merge-ranges
  (property-ranges (string-append root "DerivedCoreProperties.txt") "Lowercase")))
(define whitespace (merge-ranges
  (property-ranges (string-append root "PropList.txt") "White_Space")))
(define decimal (merge-ranges (sort (lambda (a b) (< (car a) (car b))) decimal-points)))
(set! digit-zeroes (sort < digit-zeroes))

(define (table-alist table)
  (sort (lambda (a b) (< (car a) (car b)))
        (map (lambda (k) (cons k (hashtable-ref table k #f)))
             (vector->list (hashtable-keys table)))))

(define (write-ranges o name ranges)
  (fprintf o "(define ~a '#(~n  " name)
  (let loop ([xs ranges] [column 0])
    (unless (null? xs)
      (fprintf o "~a ~a " (caar xs) (cdar xs))
      (if (= column 7) (fprintf o "~n  "))
      (loop (cdr xs) (if (= column 7) 0 (+ column 1)))))
  (fprintf o "))~n"))

(define (write-scalars o name xs)
  (fprintf o "(define ~a '#(~n  " name)
  (let loop ([xs xs] [column 0])
    (unless (null? xs)
      (fprintf o "~a " (car xs))
      (if (= column 15) (fprintf o "~n  "))
      (loop (cdr xs) (if (= column 15) 0 (+ column 1)))))
  (fprintf o "))~n"))

(define (write-map o name table)
  (fprintf o "(define ~a '#(~n  " name)
  (let loop ([xs (table-alist table)] [column 0])
    (unless (null? xs)
      (fprintf o "~a ~s " (caar xs) (cdar xs))
      (if (= column 5) (fprintf o "~n  "))
      (loop (cdr xs) (if (= column 5) 0 (+ column 1)))))
  (fprintf o "))~n"))

(let ([o (open-output-file output 'replace)])
  (fprintf o ";;; char-data.scm -- GENERATED by tools/gen-unicode-tables.ss~n")
  (fprintf o ";;; Unicode ~a; DO NOT EDIT BY HAND.~n" version)
  (fprintf o "(define %unicode-version ~s)~n" version)
  (write-ranges o "%unicode-alphabetic" alphabetic)
  (write-ranges o "%unicode-uppercase" uppercase)
  (write-ranges o "%unicode-lowercase" lowercase)
  (write-ranges o "%unicode-whitespace" whitespace)
  (write-ranges o "%unicode-decimal" decimal)
  (write-scalars o "%unicode-digit-zeroes" digit-zeroes)
  (write-map o "%unicode-simple-up" simple-up)
  (write-map o "%unicode-simple-down" simple-down)
  (write-map o "%unicode-simple-fold" simple-fold)
  (write-map o "%unicode-full-up" full-up)
  (write-map o "%unicode-full-down" full-down)
  (write-map o "%unicode-full-fold" full-fold)
  (close-output-port o))

(define elapsed
  (let ([ended (current-time 'time-monotonic)])
    (+ (- (time-second ended) (time-second started))
       (/ (- (time-nanosecond ended) (time-nanosecond started)) 1000000000.0))))
(define bytes
  (let ([p (open-file-input-port output)])
    (let ([n (file-length p)]) (close-port p) n)))
(unless quiet?
  (fprintf (current-error-port)
    "generate Unicode ~a ~a -> ~a  [~a property ranges, ~a mappings, ~a bytes, ~,2fs]~n"
    version root output
    (+ (length alphabetic) (length uppercase) (length lowercase)
       (length whitespace) (length decimal))
    (+ (hashtable-size simple-up) (hashtable-size simple-down)
       (hashtable-size simple-fold) (hashtable-size full-up)
       (hashtable-size full-down) (hashtable-size full-fold))
    bytes elapsed))
