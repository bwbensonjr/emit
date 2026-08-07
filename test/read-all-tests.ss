;;; Unit tests for read-all-from-string (change: stdin-source-reader).
;;;
;;; The in-language reader in src/prelude.scm is written in the common subset, so
;;; it loads and runs directly under Chez.  We check the whole-program read on
;;; the spec scenarios (multi-form source, comments/whitespace, empty input) and
;;; cross-check its form list against Chez's own `read` over a sample file.
;;; Run from the repo root: chez --script test/read-all-tests.ss
;;;
;;; The prelude now defines its own port procedures (change: scheme-io-library),
;;; which SHADOW the host's once it is loaded -- and the prelude's are written over
;;; Emit primitives that do not exist under Chez.  The cross-check below needs the
;;; HOST's reader to compare against, so bind those aliases before the load.
(define host-open-input-file open-input-file)
(define host-read read)
(define host-read-char read-char)
(define host-eof-object? eof-object?)
(define host-close-port close-port)
;;; Two more aliases for the lexical-conformance cases (change:
;;; reader-lexical-conformance).  The reader now REPORTS -- an unterminated block
;;; comment, a rational literal, invalid number syntax -- and the prelude's `error`
;;; builds its object with Emit runtime primitives that do not exist here, so the
;;; report is redirected to a host `raise` of a plain list that `caught` can compare.
;;; `truncate`/`string->number` are captured because the prelude defines both, and the
;;; stand-ins for the two primitives below would otherwise call back into them.
(define host-raise raise)
(define host-truncate truncate)
(define host-string->number string->number)
(define (caught thunk)                   ; -> the report as a list, or the value
  (guard (e (#t (if (and (pair? e) (eq? (car e) 'read-report)) e (list 'host-error e))))
    (thunk)))

(load "src/prelude.scm")

;;; The two Emit primitives the reader's numeric paths reach, as Chez stand-ins.
(define (%flo-truncate x) (host-truncate x))
(define (%string->flonum s)
  (cond [(string=? s "inf") +inf.0]
        [(string=? s "-inf") -inf.0]
        [(string=? s "nan") +nan.0]
        [else (host-string->number s)]))
;;; and the prelude's `error`, redirected as described above.
(define (error who . rest) (host-raise (cons 'read-report (cons who rest))))

(define pass 0)
(define fail 0)
(define (check name got want)
  (if (equal? got want)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n         got:  ~s\n         want: ~s\n" name got want))))

(printf "read-all-from-string tests\n")

;; multi-form source: defines + a trailing expression
(check 'multi-form
  (read-all-from-string "(define x 1) (define y 2) (+ x y)")
  '((define x 1) (define y 2) (+ x y)))

;; comments and whitespace between and after forms
(check 'comments-and-ws
  (read-all-from-string "; lead\n(define a 1) ; mid\n\n(b c)\n; trailing comment\n")
  '((define a 1) (b c)))

;; empty / whitespace-only / comment-only input -> no forms
(check 'empty        (read-all-from-string "")                    '())
(check 'ws-only      (read-all-from-string "   \n\t  ")           '())
(check 'comment-only (read-all-from-string "  ; just a comment\n") '())

;; cross-check: same form list as Chez `read` over a sample source file
(define (chez-read-all path)
  (let ([p (host-open-input-file path)])
    (let loop ([acc '()])
      (let ([f (host-read p)])
        (if (host-eof-object? f)
            (begin (host-close-port p) (reverse acc))
            (loop (cons f acc)))))))
(define (file->string path)
  (let ([p (host-open-input-file path)])
    (let loop ([acc '()])
      (let ([c (host-read-char p)])
        (if (host-eof-object? c)
            (begin (host-close-port p) (list->string (reverse acc)))
            (loop (cons c acc)))))))

(let ([sample "test/read-all-sample.scm"])
  (check 'cross-check-vs-chez-read
    (read-all-from-string (file->string sample))
    (chez-read-all sample)))

;;; --- R7RS 7.1.2 comments (change: reader-lexical-conformance, issue #59) -----
;;; A block comment is WHITESPACE, so it is checked in each position whitespace may
;;; appear; `#;` is a datum dispatch, so it is checked wherever a datum may.

(printf "\nblock and datum comments\n")

(check 'block-leading   (read-from-string "#| skip me |# (a #| and me |# b)") '(a b))
(check 'block-nested    (read-from-string "#| outer #| inner |# still outer |# 42") 42)
(check 'block-deep      (read-from-string "#|#|#|x|#|#|# 7") 7)
(check 'block-after-quote (read-from-string "'#| c |# x") ''x)
(check 'block-in-dotted (read-from-string "(a . #| c |# b)") '(a . b))
(check 'block-between-forms
  (read-all-from-string "(display 1)\n#| a\n   multi-line\n   comment |#\n(display 2)")
  '((display 1) (display 2)))
(check 'block-only      (read-all-from-string " #| nothing but a comment |# ") '())
;; a comment opener inside a STRING is string content, not a comment
(check 'comment-in-string (read-from-string "\"a #| b ; c #; d\"") "a #| b ; c #; d")

(check 'datum-comment-mid   (read-from-string "(1 #;2 3)") '(1 3))
(check 'datum-comment-last  (read-from-string "(1 2 #;3)") '(1 2))
(check 'datum-comment-first (read-from-string "(#;1 2 3)") '(2 3))
(check 'datum-comment-top   (read-from-string "#;(a b) c") 'c)
(check 'datum-comment-list  (read-from-string "(a #;(b c) d)") '(a d))
(check 'datum-comment-stack (read-from-string "(list #;#;1 2 3)") '(list 3))
(check 'datum-comment-only-form (read-all-from-string "#;(a) (b)") '((b)))

;; unterminated: reported, naming where it opened -- NOT read as end of input, which
;; would silently drop every form after the opening delimiter (issue #59)
(check 'block-unterminated
  (caught (lambda () (read-from-string "#| never closed")))
  '(read-report read "unterminated block comment #| opened at index" 0))
(check 'block-unterminated-drops-nothing
  (caught (lambda () (read-all-from-string "(display 1)\n#| oops\n(display 2)")))
  '(read-report read "unterminated block comment #| opened at index" 12))

;;; --- R7RS 6.2.5 prefixes and 6.2.3 rational literals (issue #25) ------------

(printf "\nnumber prefixes and rational literals\n")

(check 'radix-x (read-from-string "#x1f") 31)
(check 'radix-b (read-from-string "#b1010") 10)
(check 'radix-o (read-from-string "#o17") 15)
(check 'radix-d (read-from-string "#d99") 99)
(check 'radix-case (read-from-string "#X1F") 31)
(check 'radix-sign (read-from-string "#x-1f") -31)
(check 'exactness-i (read-from-string "#i42") 42.0)
(check 'exactness-e (read-from-string "#e1.0") 1)
(check 'both-orders (list (read-from-string "#x#e1f") (read-from-string "#e#x1f")) '(31 31))
(check 'radix-round-trip
  (read-from-string (string-append "#x" (number->string 255 16))) 255)
;; a decimal point is radix-10 syntax; under another radix it is invalid, not a symbol
(check 'radix-dot-rejected
  (caught (lambda () (read-from-string "#x1.8")))
  '(read-report read "unrecognized syntax" "#x1.8"))
(check 'unknown-hash-rejected
  (caught (lambda () (read-from-string "#q1")))
  '(read-report read "unrecognized syntax" "#q1"))

;; Every n/m is reported -- including the ones whose VALUE is representable.  The
;; refusal is of the syntax (design D4): partial support would advertise a notation
;; this implementation does not have.
(define rational-msg
  "rational literal syntax is not supported -- Emit has no exact rationals; write 0.5, or (/ 1 2)")
(check 'rational-half
  (caught (lambda () (read-from-string "1/2")))  `(read-report read ,rational-msg "1/2"))
(check 'rational-integral
  (caught (lambda () (read-from-string "4/2")))  `(read-report read ,rational-msg "4/2"))
(check 'rational-inexact-prefix
  (caught (lambda () (read-from-string "#i1/2"))) `(read-report read ,rational-msg "#i1/2"))
(check 'exact-non-integral
  (caught (lambda () (read-from-string "#e0.5"))) `(read-report read ,rational-msg "#e0.5"))
;; ... and a symbol that merely CONTAINS a slash is untouched
(check 'slash-symbol (read-from-string "call/cc") 'call/cc)

;;; string->number shares that one grammar, and answers #f exactly where the reader
;;; reports (R7RS 6.2.6).
(printf "\nstring->number over the shared grammar\n")
(check 'sn-prefixes
  (list (string->number "#x1f") (string->number "#b1010") (string->number "#i42"))
  '(31 10 42.0))
(check 'sn-prefix-beats-radix (string->number "#x10" 10) 16)
(check 'sn-radix-argument
  (list (string->number "ff" 16) (string->number "1010" 2) (string->number "ff" 10))
  '(255 10 #f))
(check 'sn-reported-is-false
  (list (string->number "1/2") (string->number "4/2") (string->number "#x1.8"))
  '(#f #f #f))
(check 'sn-plain
  (list (string->number "42") (string->number "-2.5") (string->number "abc")
        (string->number ""))
  '(42 -2.5 #f #f))

;;; --- R7RS 7.1.1 bar-quoted identifiers (design D7) --------------------------

(printf "\nbar-quoted identifiers\n")

(check 'bar-name (symbol->string (read-from-string "|foo bar|")) "foo bar")
(check 'bar-not-a-new-type (eq? (read-from-string "|foo|") 'foo) #t)
(check 'bar-interned (eq? (read-from-string "|foo bar|") (string->symbol "foo bar")) #t)
(check 'bar-escape-bar (symbol->string (read-from-string "|a\\|b|")) "a|b")
(check 'bar-escape-hex (symbol->string (read-from-string "|a\\x41;b|")) "aAb")
(check 'bar-in-list (read-from-string "(a |b c| d)") (list 'a (string->symbol "b c") 'd))
(check 'bar-unterminated
  (caught (lambda () (read-from-string "|nope")))
  '(read-report read "unterminated |identifier| opened at index" 0))

(printf "\n  ~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
