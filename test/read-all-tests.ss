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
;;; The non-finite cases below compare through the host's number->string rather than
;;; equal?, because +nan.0 is not equal? to itself.  The prelude's own number->string
;;; would shadow it and routes flonums to %flonum->string, an Emit primitive absent here.
(define host-number->string number->string)
;;; The prelude's ONE load-time effect (change: catchable-errors-with-kinds): `*handlers*`
;;; arms the runtime's trap raiser in its own initializer, so `load`ing the prelude here
;;; CALLS an Emit primitive rather than merely mentioning one inside a body -- which is why
;;; this stand-in has to exist before the load, unlike %flo-truncate / %string->flonum
;;; below.  Nothing under Chez traps into a Scheme raiser, so discarding the thunk is the
;;; whole of the emulation.  A future prelude edit that adds another top-level effect will
;;; land here the same way.
(define (%set-trap-raiser! thunk) #f)
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
;;; rd-report no longer reports through `error`: it reports through `%read-error`, so that
;;; the object it raises answers `read-error?` (change: catchable-errors-with-kinds).  The
;;; redirect has to follow it, or every `caught` case below would run the prelude's real
;;; raiser and reach %make-error-object/kind, which does not exist here.  Same shape as the
;;; `error` stand-in above, so the expectations are unchanged.
(define (%read-error who . rest) (host-raise (cons 'read-report (cons who rest))))

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

;;; --- unterminated list, vector, bytevector and string (issue #66) ------------
;;; The same treatment, generalized to every construct with a closing delimiter.
;;; Closing one silently at end of input FABRICATES a datum the source does not
;;; contain, so a truncated file compiles as though complete.  The position named is
;;; where the construct OPENED, because that is where the mistake is -- end of input
;;; is merely where it was noticed.
(check 'list-unterminated
  (caught (lambda () (read-from-string "(a b")))
  '(read-report read "unterminated list ( opened at index" 0))
(check 'bracket-unterminated
  (caught (lambda () (read-from-string "[a b")))
  '(read-report read "unterminated list [ opened at index" 0))
(check 'vector-unterminated
  (caught (lambda () (read-from-string "#(1 2")))
  '(read-report read "unterminated vector #( opened at index" 0))
(check 'bytevector-unterminated
  (caught (lambda () (read-from-string "#u8(1 2")))
  '(read-report read "unterminated bytevector #u8( opened at index" 0))
(check 'string-unterminated
  (caught (lambda () (read-from-string "\"abc")))
  '(read-report read "unterminated string \" opened at index" 0))
;; The INNER construct is the one whose delimiter is missing, so it is the one named.
;; This is why the opening index travels DOWN into rd-list rather than being attached
;; by the caller on the way out (design D1).
(check 'nested-unterminated-names-inner
  (caught (lambda () (read-from-string "(a (b c")))
  '(read-report read "unterminated list ( opened at index" 3))
;; A whole-source read must not return the forms before the truncation instead
(check 'list-unterminated-drops-nothing
  (caught (lambda () (read-all-from-string "(display 1)\n(display (list 1 2 3)")))
  '(read-report read "unterminated list ( opened at index" 12))
(check 'read-all-truncated-list
  (caught (lambda () (read-all-from-string "(a b")))
  '(read-report read "unterminated list ( opened at index" 0))
;; A dangling escape must be reported rather than reading s[n] -- past the end of the
;; input (design D3).  Unchecked string-ref makes this invisible today (issue #70).
(check 'string-dangling-escape
  (caught (lambda () (read-from-string "\"abc\\")))
  '(read-report read "unterminated string \" opened at index" 0))
(check 'string-dangling-hex-escape
  (caught (lambda () (read-from-string "\"abc\\x41")))
  '(read-report read "unterminated string \" opened at index" 0))
;; ...and a COMPLETE escape at the very end of the string still reads
(check 'string-escape-at-end (read-from-string "\"a\\n\"") "a\n")
(check 'string-hex-escape-at-end (read-from-string "\"a\\x41;\"") "aA")
;; A `#;` with no datum after it was ALREADY reported (rd-datum's own eof arm), so this
;; pins behaviour rather than changing it -- the point is that coverage is uniform across
;; every construct that can be left unfinished, not that this one moved.
(check 'datum-comment-unterminated
  (caught (lambda () (read-all-from-string "(display 1)\n#;")))
  '(read-report read "end of input where a datum was expected, at index" 14))

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

;;; --- read-time case folding (change: reader-token-path, issue #61) -----------
;;; `include-ci` used to fold the forms the reader had already returned, which folded
;;; bar-quoted identifiers too -- by then `|MixedCase|` and `MixedCase` are one interned
;;; symbol.  The fold now runs during tokenization, and the mechanism is negative space:
;;; the CI flag reaches rd-atom and not rd-bar.  These check both halves, since a fold
;;; that reached the bars would pass every "does it fold?" test on its own.

(printf "\nread-time case folding (read-all-from-string-ci)\n")

(check 'ci-folds-unquoted
  (read-all-from-string-ci "(DEFINE (Greet) 1)")
  '((define (greet) 1)))
;; the whole point: bars survive the fold
(check 'ci-bar-is-literal
  (car (cdr (car (read-all-from-string-ci "(define (|MixedCase|) 1)"))))
  (list (string->symbol "MixedCase")))
(check 'ci-bar-not-folded
  (eq? (car (car (cdr (car (read-all-from-string-ci "(define (|MixedCase|) 1)")))))
       'mixedcase)
  #f)
;; ... and a folded name and a barred one stay two different symbols in one form
(check 'ci-bar-and-bare-differ
  (car (read-all-from-string-ci "(A |A|)"))
  (list 'a (string->symbol "A")))
;; the fold reaches every symbol the READ produces, including inside a vector literal --
;; which the old shape-walking fold-datum-case missed (it had no vector arm at all)
(check 'ci-reaches-quote-and-vector
  (car (read-all-from-string-ci "(quote (Alpha #(Beta |Gamma|)))"))
  (list 'quote (list 'alpha (vector 'beta (string->symbol "Gamma")))))
;; strings, characters and numbers are untouched: the fold is on rd-atom's SYMBOL arm,
;; after classification, so it can never reach the text a number is parsed from
(check 'ci-leaves-non-symbols
  (car (read-all-from-string-ci "(\"ABC\" #\\A 1E3 X)"))
  (list "ABC" #\A 1000.0 'x))
;; and the plain entry point still does not fold
(check 'plain-does-not-fold
  (read-all-from-string "(DEFINE (Greet) 1)")
  '((DEFINE (Greet) 1)))

;;; --- R7RS lexical forms (change: r7rs-lexical-conformance, issue #74) -------
;;; Every case below reads from a STRING rather than using the literal, so it is
;;; Emit's reader under test and not the host's.  That matters here in both
;;; directions: #\escape is R7RS but Chez rejects it, and #\page is Chez's but not
;;; R7RS -- a literal in this file would be read by Chez before Emit ever saw it.

;; #true / #false: dispatching on the single character `t` returned early and left
;; `rue` for the next read, so (list #true #false) reported `unbound variable rue`
(check 'boolean-long-spellings
  (list (read-from-string "#true") (read-from-string "#false"))
  '(#t #f))
(check 'boolean-long-consumes-whole-token
  (read-all-from-string "(list #true #false)")
  '((list #t #f)))
(check 'boolean-short-spellings-unchanged
  (list (read-from-string "#t") (read-from-string "#f"))
  '(#t #f))
;; a token that is neither spelling is REPORTED, not read as #t with a tail left over
(check 'boolean-bad-token-reports
  (caught (lambda () (read-from-string "#tfoo")))
  '(read-report read "not a boolean; write #t, #true, #f or #false" "#tfoo"))

;; the R7RS 6.6 names.  alarm/backspace/escape used to answer the FIRST CHARACTER of
;; the name (97/98/101), which is a valid-looking character no test could catch
(check 'char-names-r7rs
  (map (lambda (s) (char->integer (read-from-string s)))
       '("#\\alarm" "#\\backspace" "#\\delete" "#\\escape" "#\\newline"
         "#\\null" "#\\return" "#\\space" "#\\tab"))
  '(7 8 127 27 10 0 13 32 9))
;; the recorded extensions, `page` among them because Chez accepts it in source this
;; repo compiles and an error here would be a two-host divergence (design D8)
(check 'char-names-extensions
  (map (lambda (s) (char->integer (read-from-string s)))
       '("#\\nul" "#\\altmode" "#\\esc" "#\\page"))
  '(0 27 27 12))
;; an unknown name NAMES ITSELF instead of yielding its first character
(check 'char-name-unknown-reports
  (caught (lambda () (read-from-string "#\\alarmm")))
  '(read-report read "unknown character name" "#\\alarmm"))

;; #\xHH -- the string form "\x41;" already worked, which is what made the character
;; form's absence an inconsistency rather than a gap
(check 'char-hex
  (map (lambda (s) (char->integer (read-from-string s)))
       '("#\\x41" "#\\x03BB" "#\\x0" "#\\xFF"))
  '(65 955 0 255))
;; bare #\x is still the LETTER x: rd-char takes the single-character path first
(check 'char-hex-bare-x-is-the-letter
  (char->integer (read-from-string "#\\x"))
  120)
;; a name beginning with x that is not hex is a bad NAME, not a codepoint
(check 'char-hex-non-hex-tail-reports
  (caught (lambda () (read-from-string "#\\xyz")))
  '(read-report read "unknown character name" "#\\xyz"))

;; \a and \b joined \n \t \r; they used to return the escape letter itself
(check 'string-escapes-alarm-backspace
  (map char->integer (string->list (read-from-string "\"\\a\\b\"")))
  '(7 8))
(check 'string-escapes-unchanged
  (map char->integer (string->list (read-from-string "\"\\n\\t\\r\\\\\\\"\"")))
  '(10 9 13 92 34))
;; the R7RS 6.7 line continuation: backslash, intraline whitespace, a line ending,
;; intraline whitespace -- all of it contributing NOTHING to the string
(check 'string-line-continuation
  (read-from-string "\"line 1\\\n   continued\"")
  "line 1continued")
(check 'string-line-continuation-with-leading-space
  (read-from-string "\"a\\  \n  b\"")
  "ab")
(check 'string-line-continuation-crlf
  (read-from-string "\"a\\\r\n  b\"")
  "ab")
;; a backslash-newline is the ONLY way whitespace disappears: an ordinary newline
;; inside a literal is still part of the string
(check 'string-bare-newline-is-kept
  (string-length (read-from-string "\"a\nb\""))
  3)

;; the non-finite tokens are case-insensitive (R7RS 7.1.1 makes the numeric syntax
;; case-insensitive, and #X1F / 1E2 already read)
(check 'nonfinite-case-insensitive
  (map (lambda (s) (host-number->string (read-from-string s)))
       '("+INF.0" "-Inf.0" "+NaN.0" "+inf.0"))
  (map host-number->string (list +inf.0 -inf.0 +nan.0 +inf.0)))
;; ... and a token that merely LOOKS like one still interns as a symbol
(check 'nonfinite-near-miss-is-a-symbol
  (read-from-string "+inf.1")
  '|+inf.1|)

(printf "\n  ~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
