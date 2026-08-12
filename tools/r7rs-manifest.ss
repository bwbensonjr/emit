;;; r7rs-manifest.ss -- generate test/r7rs/forms.tsv from the vendored R7RS suite
;;; (change: r7rs-conformance-suite, design D2).
;;;
;;; The suite (test/r7rs/r7rs-tests.scm) is vendored VERBATIM from chibi-scheme, and
;;; Emit compiles whole programs: one unsupported form aborts the whole compilation and
;;; every test in the file is lost.  So the runner cannot just hand the file to `emit`
;;; -- it assembles each section from the forms it is allowed to use.  This tool tells
;;; it where those forms are.
;;;
;;; WHY CHEZ, AND WHY A CHARACTER SCANNER
;;;
;;; Emit's own reader CANNOT read this suite: it contains #\alarm, #\x03BB, 1/3, #0=
;;; and #!fold-case, which are precisely the gaps being measured (GitHub issues #74,
;;; #75, #27).  So the tool that delimits the forms cannot be an Emit program, and must
;;; not wait on those defects being fixed.  Generation happens here, at vendor time,
;;; and the RUNNER consumes the committed output -- which is what keeps
;;; run-all-tests.sh Chez-free.
;;;
;;; It also never calls `read`.  It walks characters and counts delimiters, so it needs
;;; no support for the syntax it is delimiting: `#0=(1 . #0#)` is an extent to this
;;; tool, not a datum.  That keeps it independent of the HOST's reader extensions too
;;; (Chez has no R7RS datum labels either).
;;;
;;; WHAT IT GUARANTEES (the runner depends on all three)
;;;
;;;   1. The form extents TILE the file: between one form's end and the next form's
;;;      start there is only atmosphere (whitespace and comments).  Nothing is silently
;;;      dropped.
;;;   2. Every form starts on its own line, with only whitespace before it, and no two
;;;      forms share a line.  This is what makes `sed -n "S,Ep"` extraction exact.
;;;   3. Keys are content-derived, so an unrelated edit elsewhere in the suite does not
;;;      move a form's key and invalidate its exclusion (design D3).
;;;
;;; A violation of 1 or 2 is a hard error, not a warning: both would make the runner
;;; quietly report on the wrong text.
;;;
;;; Usage:  chez --script tools/r7rs-manifest.ss [SUITE] [OUT]
;;;         chez --script tools/r7rs-manifest.ss --help
;;;
;;; Defaults: SUITE = test/r7rs/r7rs-tests.scm, OUT = test/r7rs/forms.tsv.
;;; Regenerate after refreshing the suite, then update test/r7rs/r7rs-tests.sha256.

(import (chezscheme))

;;; --- narration (docs/OUTPUT.md): all on stderr, three levels from EMIT_VERBOSITY ---
(define verbosity
  (let ([v (getenv "EMIT_VERBOSITY")])
    (cond
      [(not v) 1]
      [(member v '("quiet" "q" "0")) 0]
      [(member v '("verbose" "v" "2")) 2]
      [else 1])))
(define (say fmt . args)
  (when (>= verbosity 1) (apply fprintf (current-error-port) fmt args)))
(define (vsay fmt . args)
  (when (>= verbosity 2) (apply fprintf (current-error-port) fmt args)))
(define (die fmt . args)
  (apply fprintf (current-error-port) fmt args)
  (exit 1))

(define usage
  (string-append
   "usage: chez --script tools/r7rs-manifest.ss [SUITE] [OUT]\n"
   "\n"
   "Generate the form manifest for the vendored R7RS suite.\n"
   "\n"
   "  SUITE   vendored suite (default test/r7rs/r7rs-tests.scm)\n"
   "  OUT     manifest to write (default test/r7rs/forms.tsv)\n"
   "\n"
   "Columns: key, section, start-line, end-line, excerpt (tab-separated).\n"))

(define args (command-line-arguments))
(when (or (member "--help" args) (member "-h" args))
  (display usage)                                  ; --help is asked-for output: stdout, exit 0
  (exit 0))

(define suite-path (if (>= (length args) 1) (list-ref args 0) "test/r7rs/r7rs-tests.scm"))
(define out-path   (if (>= (length args) 2) (list-ref args 1) "test/r7rs/forms.tsv"))

(unless (file-exists? suite-path)
  (die "r7rs-manifest: no such suite: ~a~n" suite-path))

(define src (call-with-input-file suite-path get-string-all))
(define n (string-length src))

;;; --- line numbering -------------------------------------------------------------
;;; line-of: index -> 1-based line.  Precomputed rather than counted per query, since
;;; every form asks twice and the file is 2500 lines.
(define line-of
  (let ([v (make-vector (+ n 1) 1)])
    (let loop ([i 0] [ln 1])
      (if (= i n)
          (vector-set! v i ln)
          (begin
            (vector-set! v i ln)
            (loop (+ i 1) (if (char=? (string-ref src i) #\newline) (+ ln 1) ln)))))
    (lambda (i) (vector-ref v (min i n)))))

;;; --- character classes ----------------------------------------------------------
(define (at? i str)                      ; does `str` occur at index i?
  (let ([k (string-length str)])
    (and (<= (+ i k) n) (string=? (substring src i (+ i k)) str))))
(define (ch i) (and (< i n) (string-ref src i)))
(define (ws? c) (and c (memv c '(#\space #\tab #\newline #\return #\page)) #t))
(define (delim? c)                       ; ends an unquoted atom
  (or (not c) (ws? c) (memv c '(#\( #\) #\[ #\] #\" #\;))))
(define (name-char? c)                   ; continues a #\<name> or a #<n> label
  (and c (or (char-alphabetic? c) (char-numeric? c) (char=? c #\-))))

;;; --- atmosphere: whitespace, ; line comments, #| nested |#, #; datum comments -----
;;; A datum comment must SKIP A DATUM, so this and scan-datum are mutually recursive:
;;; `#;(a b) c` hides the list, not the next three characters.
(define (skip-atmosphere i)
  (cond
    [(>= i n) n]
    [(ws? (ch i)) (skip-atmosphere (+ i 1))]
    [(char=? (ch i) #\;)
     (let loop ([j i])
       (cond [(>= j n) n]
             [(char=? (string-ref src j) #\newline) (skip-atmosphere (+ j 1))]
             [else (loop (+ j 1))]))]
    [(at? i "#|") (skip-atmosphere (skip-block (+ i 2) 1))]
    [(at? i "#;") (skip-atmosphere (scan-datum (skip-atmosphere (+ i 2))))]
    [else i]))

(define (skip-block i depth)             ; i just past an opening #| ; nesting counts
  (cond
    [(>= i n) (die "r7rs-manifest: unterminated #| block comment~n")]
    [(at? i "#|") (skip-block (+ i 2) (+ depth 1))]
    [(at? i "|#") (if (= depth 1) (+ i 2) (skip-block (+ i 2) (- depth 1)))]
    [else (skip-block (+ i 1) depth)]))

;;; --- datum extents --------------------------------------------------------------
;;; Each scanner takes the index of its first character and returns the index just
;;; PAST the construct.  No value is built; only the extent matters.

(define (scan-string i)                  ; i at the opening "
  (let loop ([j (+ i 1)])
    (cond
      [(>= j n) (die "r7rs-manifest: unterminated string at line ~a~n" (line-of i))]
      [(char=? (string-ref src j) #\\) (loop (+ j 2))]     ; \" \\ \x41; \<newline> ...
      [(char=? (string-ref src j) #\") (+ j 1)]
      [else (loop (+ j 1))])))

(define (scan-bar i)                     ; i at the opening | of a |symbol|
  (let loop ([j (+ i 1)])
    (cond
      [(>= j n) (die "r7rs-manifest: unterminated |symbol| at line ~a~n" (line-of i))]
      [(char=? (string-ref src j) #\\) (loop (+ j 2))]
      [(char=? (string-ref src j) #\|) (+ j 1)]
      [else (loop (+ j 1))])))

;;; #\<char>: consume ONE character unconditionally -- it may be #\( or #\; or a space
;;; -- then any name tail.  That single unconditional character is what keeps #\( from
;;; being counted as an open paren, which is the classic way this scan goes wrong.
(define (scan-char i)                    ; i at the # of #\x
  (let loop ([j (+ i 3)])                ; i+2 is the character itself
    (if (name-char? (ch j)) (loop (+ j 1)) j)))

(define (scan-atom i)
  (let loop ([j i]) (if (delim? (ch j)) j (loop (+ j 1)))))

(define (closer-for c) (if (char=? c #\[) #\] #\)))

(define (scan-list i)                    ; i at ( or [
  (let ([close (closer-for (ch i))])
    (let loop ([j (+ i 1)])
      (let ([j (skip-atmosphere j)])
        (cond
          [(>= j n) (die "r7rs-manifest: unterminated list opened at line ~a~n" (line-of i))]
          [(char=? (ch j) close) (+ j 1)]
          [(memv (ch j) '(#\) #\]))
           (die "r7rs-manifest: mismatched ~a at line ~a (list opened at line ~a)~n"
                (ch j) (line-of j) (line-of i))]
          [else (loop (scan-datum j))])))))

(define (scan-hash i)                    ; i at a # that is not a comment
  (let ([c (ch (+ i 1))])
    (cond
      [(eqv? c #\\) (scan-char i)]
      [(memv c '(#\( #\[)) (scan-list (+ i 1))]                  ; #(1 2) vector
      [(and (memv c '(#\u #\U)) (memv (ch (+ i 3)) '(#\( #\[)))   ; #u8(1 2) bytevector
       (scan-list (+ i 3))]
      [(and c (char-numeric? c))                                 ; #0=(...) / #0#
       (let loop ([j (+ i 1)])
         (cond [(and (ch j) (char-numeric? (ch j))) (loop (+ j 1))]
               [(eqv? (ch j) #\=) (scan-datum (skip-atmosphere (+ j 1)))]
               [(eqv? (ch j) #\|) (+ j 1)]        ; #0# -- the closing marker
               [else j]))]
      [else (scan-atom i)])))                                    ; #t #f #true #x1f #!fold-case

(define (scan-datum i)
  (let ([i (skip-atmosphere i)])
    (cond
      [(>= i n) n]
      ;; quote / quasiquote / unquote prefixes belong to the datum they introduce, so
      ;; '(1 2) is ONE form, not a quote and a list.
      [(memv (ch i) '(#\' #\`)) (scan-datum (+ i 1))]
      [(char=? (ch i) #\,) (scan-datum (+ i (if (eqv? (ch (+ i 1)) #\@) 2 1)))]
      [(memv (ch i) '(#\( #\[)) (scan-list i)]
      [(char=? (ch i) #\") (scan-string i)]
      [(char=? (ch i) #\|) (scan-bar i)]
      [(char=? (ch i) #\#) (scan-hash i)]
      [(memv (ch i) '(#\) #\]))
       (die "r7rs-manifest: unexpected ~a at line ~a~n" (ch i) (line-of i))]
      [else (scan-atom i)])))

;;; --- content key (design D3) ----------------------------------------------------
;;; FNV-1a over the form text with trailing whitespace stripped per line, printed as
;;; 16 hex digits.  Content-derived so an insertion elsewhere in the suite leaves this
;;; form's key alone; a change to the form ITSELF does move the key, which is correct --
;;; an exclusion is a claim about a particular piece of text.
(define fnv-offset 14695981039346656037)
(define fnv-prime  1099511628211)
(define mask64     (- (expt 2 64) 1))

(define (normalize s)                    ; strip trailing blanks per line; drop trailing newlines
  (let* ([lines (let loop ([i 0] [start 0] [acc '()])
                  (cond
                    [(= i (string-length s)) (reverse (cons (substring s start i) acc))]
                    [(char=? (string-ref s i) #\newline)
                     (loop (+ i 1) (+ i 1) (cons (substring s start i) acc))]
                    [else (loop (+ i 1) start acc)]))]
         [trim (lambda (l)
                 (let loop ([k (string-length l)])
                   (if (and (> k 0) (ws? (string-ref l (- k 1))))
                       (loop (- k 1))
                       (substring l 0 k))))]
         [ls (map trim lines)]
         [ls (let drop ([r (reverse ls)])   ; drop trailing empty lines
               (if (and (pair? r) (string=? (car r) "")) (drop (cdr r)) (reverse r)))])
    (let join ([ls ls] [acc '()])
      (if (null? ls)
          (apply string-append (reverse acc))
          (join (cdr ls) (cons (if (null? (cdr ls)) (car ls) (string-append (car ls) "\n"))
                               acc))))))

(define (content-key text)
  (let* ([s (normalize text)]
         [len (string-length s)])
    (let loop ([i 0] [h fnv-offset])
      (if (= i len)
          (let hex ([k 60] [acc '()])
            (if (< k 0)
                (apply string (reverse acc))
                (hex (- k 4)
                     (cons (string-ref "0123456789abcdef"
                                       (bitwise-and (bitwise-arithmetic-shift-right h k) 15))
                           acc))))
          ;; UTF-8 bytes, so the key does not depend on how the host stores characters
          (let* ([cp (char->integer (string-ref s i))]
                 [bs (cond [(< cp #x80) (list cp)]
                           [(< cp #x800)
                            (list (bitwise-ior #xC0 (bitwise-arithmetic-shift-right cp 6))
                                  (bitwise-ior #x80 (bitwise-and cp #x3F)))]
                           [(< cp #x10000)
                            (list (bitwise-ior #xE0 (bitwise-arithmetic-shift-right cp 12))
                                  (bitwise-ior #x80 (bitwise-and (bitwise-arithmetic-shift-right cp 6) #x3F))
                                  (bitwise-ior #x80 (bitwise-and cp #x3F)))]
                           [else
                            (list (bitwise-ior #xF0 (bitwise-arithmetic-shift-right cp 18))
                                  (bitwise-ior #x80 (bitwise-and (bitwise-arithmetic-shift-right cp 12) #x3F))
                                  (bitwise-ior #x80 (bitwise-and (bitwise-arithmetic-shift-right cp 6) #x3F))
                                  (bitwise-ior #x80 (bitwise-and cp #x3F)))])])
            (loop (+ i 1)
                  (fold-left (lambda (h b)
                               (bitwise-and (* (bitwise-xor h b) fnv-prime) mask64))
                             h bs)))))))

;;; --- collect the top-level forms ------------------------------------------------
(define-record-type form (fields key section start end sline eline text))

(define (form-head-name text)            ; "(test-begin \"6.4 Lists\")" -> ("test-begin" . "6.4 Lists")
  (let* ([len (string-length text)])
    (and (> len 1) (char=? (string-ref text 0) #\()
         (let* ([i (let loop ([i 1]) (if (or (>= i len) (ws? (string-ref text i))
                                             (char=? (string-ref text i) #\)))
                                          i (loop (+ i 1))))]
                [head (substring text 1 i)]
                [q (let loop ([j i]) (cond [(>= j len) #f]
                                           [(char=? (string-ref text j) #\") j]
                                           [else (loop (+ j 1))]))]
                [name (and q (let loop ([k (+ q 1)])
                               (cond [(>= k len) #f]
                                     [(char=? (string-ref text k) #\") (substring text (+ q 1) k)]
                                     [else (loop (+ k 1))])))])
           (cons head name)))))

(define forms-raw
  (let loop ([i (skip-atmosphere 0)] [stack '()] [acc '()])
    (if (>= i n)
        (reverse acc)
        (let* ([end (scan-datum i)]
               [text (substring src i end)]
               [hd (form-head-name text)]
               [head (and hd (car hd))]
               [nm (and hd (cdr hd))]
               ;; The section a form belongs to is the innermost OPEN test-begin that is
               ;; not the file-wide "R7RS" wrapper.  Only top-level test-begin/test-end
               ;; move the stack -- a test-begin nested inside a `let` is part of its
               ;; enclosing form, and never reaches here.
               [stack2 (cond [(and (equal? head "test-begin") nm) (cons nm stack)]
                             [(equal? head "test-end") (if (null? stack) '() (cdr stack))]
                             [else stack])]
               [section (let pick ([s (if (equal? head "test-begin") stack2 stack)])
                          (cond [(null? s) "R7RS"]
                                [(string=? (car s) "R7RS") (pick (cdr s))]
                                [else (car s)]))])
          (loop (skip-atmosphere end)
                stack2
                (cons (make-form (content-key text) section i end
                                 (line-of i) (line-of (- end 1)) text)
                      acc))))))

;;; Repeated text: the suite says the same thing more than once on purpose -- 16
;;; `(test-end)` markers, and four assertion pairs such as the two `(test "12" (f 12))`
;;; either side of a `parameterize`, which exist precisely to show the parameter did not
;;; stick.  Text alone therefore cannot identify a form, so a repeated text gets an
;;; occurrence suffix (`<hash>.1`, `<hash>.2`, in file order).  The 1016 texts that
;;; appear once keep a bare hash and are unaffected by edits anywhere else, which is the
;;; stability that matters: instability is confined to forms that are character-identical
;;; to another, where an exclusion would be the same claim either way.
(define forms
  (let ([counts (make-hashtable string-hash string=?)])
    (for-each (lambda (f) (hashtable-update! counts (form-key f) (lambda (v) (+ v 1)) 0))
              forms-raw)
    (let loop ([fs forms-raw] [seen (make-hashtable string-hash string=?)] [acc '()])
      (if (null? fs)
          (reverse acc)
          (let* ([f (car fs)] [k (form-key f)])
            (if (= (hashtable-ref counts k 0) 1)
                (loop (cdr fs) seen (cons f acc))
                (let ([m (+ 1 (hashtable-ref seen k 0))])
                  (hashtable-set! seen k m)
                  (loop (cdr fs) seen
                        (cons (make-form (format "~a.~a" k m)
                                         (form-section f) (form-start f) (form-end f)
                                         (form-sline f) (form-eline f) (form-text f))
                              acc)))))))))

;;; --- the guarantees -------------------------------------------------------------
;;; Checked, not assumed: a violation means the runner would assemble the wrong text.

;; 1. The extents tile the file: only atmosphere between them, and nothing left over.
(let loop ([fs forms] [prev 0])
  (cond
    [(null? fs)
     (unless (= (skip-atmosphere prev) n)
       (die "r7rs-manifest: trailing text after the last form at line ~a is not atmosphere~n"
            (line-of prev)))]
    [else
     (unless (= (skip-atmosphere prev) (form-start (car fs)))
       (die "r7rs-manifest: gap before line ~a is not atmosphere (tiling violated)~n"
            (form-sline (car fs))))
     (loop (cdr fs) (form-end (car fs)))]))

;; 2. One form per line, nothing but whitespace before a form on its opening line.
(let loop ([fs forms] [prev-eline 0])
  (unless (null? fs)
    (let* ([f (car fs)]
           [bol (let back ([j (form-start f)])
                  (if (or (= j 0) (char=? (string-ref src (- j 1)) #\newline)) j (back (- j 1))))]
           [prefix (substring src bol (form-start f))])
      (unless (<= prev-eline (- (form-sline f) 1))
        (die "r7rs-manifest: line ~a carries more than one top-level form~n" (form-sline f)))
      (unless (for-all ws? (string->list prefix))
        (die "r7rs-manifest: form at line ~a does not start its line (prefix ~s)~n"
             (form-sline f) prefix))
      (loop (cdr fs) (form-eline f)))))

;; 3. Keys are unique -- a collision would let one exclusion silently cover two forms.
(let ([seen (make-hashtable string-hash string=?)])
  (for-each
    (lambda (f)
      (let ([hit (hashtable-ref seen (form-key f) #f)])
        (when hit
          (die "r7rs-manifest: key collision ~a between lines ~a and ~a~n"
               (form-key f) hit (form-sline f)))
        (hashtable-set! seen (form-key f) (form-sline f))))
    forms))

;;; --- write the manifest ---------------------------------------------------------
(define (excerpt text)                   ; one line, tab-free, for human orientation only
  (let* ([s (let collapse ([i 0] [prev-ws #f] [acc '()])
              (if (= i (string-length text))
                  (list->string (reverse acc))
                  (let ([c (string-ref text i)])
                    (if (ws? c)
                        (collapse (+ i 1) #t (if prev-ws acc (cons #\space acc)))
                        (collapse (+ i 1) #f (cons c acc))))))]
         [s (if (and (> (string-length s) 0) (char=? (string-ref s 0) #\space))
                (substring s 1 (string-length s)) s)])
    (if (> (string-length s) 68) (string-append (substring s 0 65) "...") s)))

(define suite-sha
  ;; Recorded in the manifest so a stale pairing is visible in a diff, not only via the
  ;; runner's checksum gate.  Read from the committed .sha256 rather than recomputed: the
  ;; point is to show which checksum this manifest was generated ALONGSIDE.
  ;;
  ;; Keyed off the SUITE's path, not the output's: the freshness guard regenerates into a
  ;; temp tree, where an output-relative lookup would find no .sha256, record "unknown",
  ;; and report every manifest as stale.
  (let ([p (string-append (path-root suite-path) ".sha256")])
    (if (file-exists? p)
        (let ([l (call-with-input-file p get-line)])
          (car (let split ([cs (string->list l)] [cur '()] [acc '()])
                 (cond [(null? cs) (reverse (cons (list->string (reverse cur)) acc))]
                       [(char=? (car cs) #\space)
                        (reverse (cons (list->string (reverse cur)) acc))]
                       [else (split (cdr cs) (cons (car cs) cur) acc)]))))
        "unknown")))

(let ([o (open-output-file out-path 'replace)])
  (fprintf o "# forms.tsv -- GENERATED by tools/r7rs-manifest.ss.  DO NOT EDIT BY HAND.~n")
  (fprintf o "#~n")
  (fprintf o "# Every top-level form of the vendored R7RS suite, in file order.  The runner~n")
  (fprintf o "# (test/r7rs-suite-tests.sh) assembles each section from these line ranges,~n")
  (fprintf o "# skipping the keys named in exclusions.tsv.~n")
  (fprintf o "#~n")
  (fprintf o "# suite:  ~a~n" suite-path)
  (fprintf o "# sha256: ~a~n" suite-sha)
  (fprintf o "# forms:  ~a~n" (length forms))
  (fprintf o "#~n")
  (fprintf o "# key\tsection\tstart-line\tend-line\texcerpt~n")
  (fprintf o "# The key is FNV-1a over the form's text (trailing blanks stripped); it is the~n")
  (fprintf o "# identity an exclusion refers to.  The excerpt is orientation only -- never~n")
  (fprintf o "# match on it.~n")
  (for-each
    (lambda (f)
      (fprintf o "~a\t~a\t~a\t~a\t~a~n"
               (form-key f) (form-section f) (form-sline f) (form-eline f)
               (excerpt (form-text f))))
    forms)
  (close-port o))

;;; --- report ---------------------------------------------------------------------
(define sections
  (let loop ([fs forms] [acc '()])
    (cond [(null? fs) (reverse acc)]
          [(and (pair? acc) (string=? (car acc) (form-section (car fs)))) (loop (cdr fs) acc)]
          [(member (form-section (car fs)) acc) (loop (cdr fs) acc)]
          [else (loop (cdr fs) (cons (form-section (car fs)) acc))])))

(when (>= verbosity 2)
  (for-each
    (lambda (s)
      (let ([k (let count ([fs forms] [c 0])
                 (cond [(null? fs) c]
                       [(string=? (form-section (car fs)) s) (count (cdr fs) (+ c 1))]
                       [else (count (cdr fs) c)]))])
        (vsay "  section ~a  (~a forms)~n" s k)))
    sections))

(say "r7rs-manifest: ~a -> ~a~n" suite-path out-path)
(say "  ~a forms, ~a sections, ~a lines; extents tile the file, one form per line~n"
     (length forms) (length sections) (line-of (- n 1)))
