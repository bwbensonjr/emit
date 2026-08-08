;;; gen-reader-bench.ss -- the token-dense source docs/PERFORMANCE.md P12 is measured on.
;;;
;;; P12's number ("3.65 s -> 4.37 s over 1.6 MB / ~200k tokens") came from a generated file.
;;; Describing a benchmark input is not the same as being able to regenerate it, so the
;;; generator lives here: any later reader-speed measurement compares against the same
;;; bytes rather than against a similar-sounding file.
;;;
;;; The mix is deliberate -- 50k symbols, 50k integers, 50k decimals, 50k strings -- because
;;; the reader's cost is per token per CLASSIFIER, so a file of only one token kind measures
;;; one arm of the dispatch and flatters or maligns the whole.  Strings are in the mix as the
;;; control: they never reach the numeric classifiers at all.
;;;
;;; Deterministic: the shuffle is a fixed-seed LCG, so two runs on two machines produce
;;; byte-identical output.  No (random), no timestamp, nothing from the environment.
;;;
;;;   chez --script tools/gen-reader-bench.ss [OUTFILE]      (default: reader-bench.scm)

(define out-path
  (let ([args (command-line-arguments)])
    (if (null? args) "reader-bench.scm" (car args))))

(define per-kind 50000)                  ; tokens of each of the four kinds
(define per-form 8)                      ; tokens per top-level form

;;; A fixed-seed LCG (Numerical Recipes constants), so the interleaving of the four token
;;; kinds is arbitrary but reproducible.  Only used to pick a kind, never a value.
(define seed 12345)
(define (next-random!)
  (set! seed (modulo (+ (* 1664525 seed) 1013904223) 4294967296))
  seed)

;;; The four token kinds, each written to exercise a different arm of the token dispatch:
;;;   symbol   -- first character is not a digit/sign/dot: no numeric classifier can match
;;;   integer  -- signed and unsigned, the all-digits arm
;;;   decimal  -- a dot, and every fourth one an exponent, the flonum arm
;;;   string   -- never reaches the token path at all (the control)
(define (token kind i)
  (cond
    [(= kind 0) (string-append "sym-" (number->string i))]
    [(= kind 1) (if (even? i)
                    (number->string i)
                    (string-append "-" (number->string i)))]
    [(= kind 2) (if (= 0 (modulo i 4))
                    (string-append (number->string i) ".5e2")
                    (string-append (number->string i) "." (number->string (modulo i 100))))]
    [else (string-append "\"str-" (number->string i) "\"")]))

;;; Emit exactly PER-KIND of each kind, choosing the next kind at random among those that
;;; still have tokens left -- so the file is shuffled but the mix is exact, not approximate.
(define (generate port)
  (let ([left (vector per-kind per-kind per-kind per-kind)]
        [used (vector 0 0 0 0)])
    (define (remaining) (+ (vector-ref left 0) (vector-ref left 1)
                           (vector-ref left 2) (vector-ref left 3)))
    (define (pick)                       ; a kind that still has tokens left
      (let loop ([k (modulo (next-random!) 4)] [tries 0])
        (if (and (< tries 4) (= 0 (vector-ref left k)))
            (loop (modulo (+ k 1) 4) (+ tries 1))
            k)))
    (let form-loop ()
      (when (> (remaining) 0)
        (display "(f" port)
        (let tok-loop ([n 0])
          (when (and (< n per-form) (> (remaining) 0))
            (let* ([k (pick)] [i (vector-ref used k)])
              (vector-set! left k (- (vector-ref left k) 1))
              (vector-set! used k (+ i 1))
              (display " " port)
              (display (token k i) port))
            (tok-loop (+ n 1))))
        (display ")\n" port)
        (form-loop)))))

(define (main)
  (fprintf (console-error-port) "gen reader bench -> ~a  [~a tokens]\n"
           out-path (* 4 per-kind))
  (when (file-exists? out-path) (delete-file out-path))
  (let ([port (open-output-file out-path)])
    (generate port)
    (close-port port))
  (let* ([p (open-input-file out-path)] [n (file-length p)])
    (close-port p)
    (fprintf (console-error-port) "  wrote ~a  [~a bytes]\n" out-path n)))

(main)
