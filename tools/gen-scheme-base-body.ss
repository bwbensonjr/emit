;;; gen-scheme-base-body.ss -- portable library construction and validation.
;;; Assembled with a selected surface declaration by tools/gen-scheme-base.sh.
;;; Host entries supply prelude-path, out-root, and gen-quiet?.

(define (out-file rel) (string-append out-root "/" rel))

;; Both hosts use this serializer, including escaping and number normalization.
(define (gen-hex n) (number->string n 16))
(define (gen-escape-string s o)
  (display "\"" o)
  (string-for-each (lambda (c)
                     (let ((n (char->integer c)))
                       (cond
                         ((= n 34) (display "\\\"" o))
                         ((= n 92) (display "\\\\" o))
                         ((= n 10) (display "\\n" o))
                         ((= n 9) (display "\\t" o))
                         ((= n 13) (display "\\r" o))
                         ((or (< n 32) (= n 127)) (display "\\x" o)
                                                  (display (gen-hex n) o)
                                                  (display ";" o))
                         (else (write-char c o)))))
                   s)
  (display "\"" o))

(define (gen-symbol-safe? s)
  (and (> (string-length s) 0)
       (not (string=? s "."))
       (not (string->number s))
       (let loop ((i 0))
         (or (= i (string-length s))
             (let* ((c (string-ref s i)) (n (char->integer c)))
               (and (or (and (>= n 65) (<= n 90))
                        (and (>= n 97) (<= n 122))
                        (and (> i 0) (>= n 48) (<= n 57))
                        (memv c
                              '(#\! #\$ #\% #\& #\* #\+ #\- #\. #\/ #\: #\< #\= #\> #\?
                                #\@ #\^ #\_ #\~)))
                    (loop (+ i 1))))))))

(define (gen-write-symbol x o)
  (let ((s (symbol->string x)))
    (if (gen-symbol-safe? s)
        (display s o)
        (begin
          (display "|" o)
          (string-for-each
            (lambda (c)
              (let ((n (char->integer c)))
                (cond
                  ((or (= n 92) (= n 124)) (display "\\" o) (write-char c o))
                  ((or (< n 32) (= n 127)) (display "\\x" o)
                                           (display (gen-hex n) o)
                                           (display ";" o))
                  (else (write-char c o)))))
            s)
          (display "|" o)))))

;; Normalize optional leading zero and exponent spelling without changing digits.
;; Both hosts supply shortest round-tripping decimal digits.
(define (gen-number-string x)
  (let ((s (number->string x)))
    (cond
      ((or (exact? x) (not (= x x)) (= x +inf.0) (= x -inf.0)) s)
      (else
        (let* ((negative (char=? (string-ref s 0) #\-))
               (start (if negative 1 0))
               (end (string-length s)))
          (let find ((i start))
            (if (or (= i end) (memv (string-ref s i) '(#\e #\E)))
                (let* ((mantissa (substring s start i))
                       (exponent
                         (if (= i end) 0 (string->number (substring s (+ i 1) end)))))
                  (let dot ((j 0))
                    (if (or (= j (string-length mantissa))
                            (char=? (string-ref mantissa j) #\.))
                        (let* ((digits (list->string
                                         (filter (lambda (c) (not (char=? c #\.)))
                                                 (string->list mantissa))))
                               (decimal (+ j exponent)))
                          (let trim ((k 0))
                            (if (and (< k (- (string-length digits) 1))
                                     (char=? (string-ref digits k) #\0))
                                (trim (+ k 1))
                                (let ((ds (substring digits k (string-length digits)))
                                      (d (- decimal k)))
                                  (if (and (>= d 1) (<= d 16))
                                      (string-append
                                        (if negative "-" "")
                                        (if (>= d (string-length ds))
                                            (string-append
                                              ds
                                              (make-string (- d (string-length ds)) #\0)
                                              ".0")
                                            (string-append
                                              (substring ds 0 d)
                                              "."
                                              (substring ds d (string-length ds)))))
                                      (if (and (<= d 0) (>= d -3))
                                          (string-append (if negative "-" "")
                                                         "0."
                                                         (make-string (- 0 d) #\0)
                                                         ds)
                                          (string-append
                                            (if negative "-" "")
                                            (substring ds 0 1)
                                            "."
                                            (if (= (string-length ds) 1)
                                                "0"
                                                (substring ds 1 (string-length ds)))
                                            "e"
                                            (number->string (- d 1)))))))))
                        (dot (+ j 1)))))
                (find (+ i 1)))))))))

(define (gen-write x o)
  (cond
    ((null? x) (display "()" o))
    ((pair? x) (display "(" o)
               (gen-write (car x) o)
               (let loop ((xs (cdr x)))
                 (cond
                   ((null? xs) (display ")" o))
                   ((pair? xs) (display " " o) (gen-write (car xs) o) (loop (cdr xs)))
                   (else (display " . " o) (gen-write xs o) (display ")" o)))))
    ((symbol? x) (gen-write-symbol x o))
    ((string? x) (gen-escape-string x o))
    ((char? x)
      (display "#\\" o)
      (let* ((n (char->integer x))
             (entry (assv n
                          '((0 . "nul") (7 . "alarm") (8 . "backspace") (9 . "tab")
                            (10 . "newline") (11 . "vtab") (12 . "page") (13 . "return")
                            (27 . "esc") (32 . "space") (127 . "delete")))))
        (cond
          (entry (display (cdr entry) o))
          ((or (< n 33) (> n 126)) (display "x" o) (display (gen-hex n) o))
          (else (write-char x o)))))
    ((boolean? x) (display (if x "#t" "#f") o))
    ((number? x) (display (gen-number-string x) o))
    ((vector? x) (display "#(" o)
                 (let loop ((i 0))
                   (unless (= i (vector-length x))
                     (unless (= i 0) (display " " o))
                     (gen-write (vector-ref x i) o)
                     (loop (+ i 1))))
                 (display ")" o))
    ((bytevector? x) (display "#u8(" o)
                     (let loop ((i 0))
                       (unless (= i (bytevector-length x))
                         (unless (= i 0) (display " " o))
                         (display (bytevector-u8-ref x i) o)
                         (loop (+ i 1))))
                     (display ")" o))
    (else (error "gen-scheme-base: unsupported datum" x))))

(define (read-all p)
  (let loop ([acc '()])
    (let ([x (read p)]) (if (eof-object? x) (reverse acc) (loop (cons x acc))))))

(define forms (call-with-input-file prelude-path read-all))

;; every top-level (define NAME ...) / (define (NAME . _) ...), in source order.
(define (proc-name f)
  (and (pair? f)
       (eq? (car f) 'define)
       (let ([sig (cadr f)]) (if (pair? sig) (car sig) sig))))
(define (syntax-name f) (and (pair? f) (eq? (car f) 'define-syntax) (cadr f)))

(define define-names (filter (lambda (x) x) (map proc-name forms)))
(define syntax-names (filter (lambda (x) x) (map syntax-name forms)))

;; Every name the prelude binds at top level, by EITHER form of definition, in source
;; order (change: library-body-macro-scope).  A transformer is a homed, exportable
;; binding now, so the partition, the export lists and the rot checks all range over this
;; list rather than over `define-names` alone.  Source order is preserved across both
;; kinds, which is what keeps the declaration's own arrangement from moving emitted IR.
(define (binding-name f) (or (proc-name f) (syntax-name f)))
(define binding-names (filter (lambda (x) x) (map binding-name forms)))

;; The declaration must describe THIS prelude.  A rotted declaration would silently
;; emit a different surface, so fail loudly instead (issue #29).
(define (die msg names)
  (display "gen-scheme-base: " (current-error-port))
  (display msg (current-error-port))
  (display ": " (current-error-port))
  (gen-write names (current-error-port))
  (newline (current-error-port))
  (exit 1))

;; the export list: defines in SOURCE ORDER kept when the partition assigns them to
;; this library (change: scheme-base-partition).  Order comes from the prelude, so the
;; arrangement of the declaration cannot move IR.
(define (library-export-names lib)
  (let* ([prelude-exports (filter (lambda (n) (prelude-exports? lib n)) binding-names)]
         [builtin-names (if (equal? lib '(scheme base))
                            (map car (library-builtin-surface lib))
                            '())])
    (append prelude-exports
            (filter (lambda (n) (not (memq n binding-names))) builtin-names))))
(define export-names (library-export-names '(scheme base)))

(let* ([surface (library-builtin-surface '(scheme base))]
       [names (map car surface)]
       [dups (let loop ([ns names] [seen '()] [out '()])
               (cond
                 [(null? ns) (reverse out)]
                 [(memq (car ns) seen) (loop (cdr ns) seen (cons (car ns) out))]
                 [else (loop (cdr ns) (cons (car ns) seen) out)]))]
       [raw (filter (lambda (n)
                      (and (symbol? n)
                           (> (string-length (symbol->string n)) 0)
                           (char=? (string-ref (symbol->string n) 0) #\%)))
                    names)]
       [malformed
         (filter (lambda (row)
                   (not (and (= (length row) 4)
                             (memq (cadr row) '(primitive core auxiliary))
                             (equal? (caddr row) (list 'builtin (cadr row) (car row)))
                             (eq? (cadddr row) (car row)))))
                 surface)]
       [bad-extensions (filter (lambda (n) (not (memq n *base-primitive-names*)))
                               *base-primitive-extension-names*)]
       [bad-write-owner (filter (lambda (n) (not (memq n *base-primitive-names*)))
                                *write-primitive-names*)]
       [write-duplicates
         (let loop ([ns *write-primitive-names*] [seen '()] [out '()])
           (cond
             [(null? ns) (reverse out)]
             [(memq (car ns) seen) (loop (cdr ns) seen (cons (car ns) out))]
             [else (loop (cdr ns) (cons (car ns) seen) out)]))]
       [expected-write-surface
         (map
           (lambda (name) (list name 'primitive (list 'builtin 'primitive name) name))
           *write-primitive-names*)]
       [actual-write-surface (library-builtin-surface '(scheme write))])
  (unless (null? dups) (die "duplicate builtin surface name" dups))
  (unless (null? raw) (die "raw primitive names cannot be exported" raw))
  (unless (null? malformed) (die "malformed builtin surface row" malformed))
  (unless (null? bad-extensions)
    (die "primitive extension is not a declared base primitive" bad-extensions))
  (unless (null? bad-write-owner)
    (die "(scheme write) primitive must alias a base builtin" bad-write-owner))
  (unless (null? write-duplicates)
    (die "duplicate (scheme write) primitive owner" write-duplicates))
  (unless (equal? expected-write-surface actual-write-surface)
    (die "(scheme write) must expose the declared base primitive identities"
         actual-write-surface)))

(let ([stale (filter (lambda (n) (not (memq n binding-names))) *scheme-base-private*)])
  (unless (null? stale)
    (die "private name not defined by the prelude (stale declaration)" stale)))
;; The check that used to sit here -- "define-syntax name listed as private (macros are
;; never exported)" -- is GONE (change: library-body-macro-scope).  Its premise was that a
;; transformer could never be exported, so naming one here had to be a mistake.  A macro is
;; an ordinary exportable binding now, and *scheme-base-private* is exactly where a
;; transformer (scheme base) does not publish belongs: the Chez-free surface guard
;; subtracts this list with text tools and cannot parse home specs, so privacy has to be
;; declared here rather than as a `((scheme base) private)` home.
;; every assignment must name a definition the prelude actually has, and every home must
;; name a real partition member -- see below.  (The `unstable` export tier's check used to
;; live here; the tier is retired, change: scheme-base-partition / issue #32.)
;; partition rot (change: scheme-base-partition): an assignment naming a definition the
;; prelude does not have, a name assigned twice, or an assignment to a library that is
;; not a partition member would each silently emit a different surface.
(let ([stale (filter (lambda (e) (not (memq (car e) binding-names)))
                     *prelude-assignments*)])
  (unless (null? stale)
    (die "assignment for a name the prelude does not define" (map car stale))))
(let ([dups (let loop ([es *prelude-assignments*] [seen '()] [d '()])
              (cond
                [(null? es) (reverse d)]
                [(memq (caar es) seen) (loop (cdr es) seen (cons (caar es) d))]
                [else (loop (cdr es) (cons (caar es) seen) d)]))])
  (unless (null? dups) (die "name assigned more than once" dups)))
(let* ([known (map car *prelude-libraries*)]
       [bad (filter (lambda (l) (not (member l known)))
                    ;; each home is a LIBRARY or a (LIBRARY private); compare libraries
                    (map home-library (apply append (map cdr *prelude-assignments*))))])
  (unless (null? bad)
    (die "assignment to a library that is not a partition member" bad)))
;; One library named twice in a name's home list would emit two definitions of it into
;; ONE unit -- a duplicate top-level define, whose cost is silent (issue #38).
(let ([twice (map car
                  (filter (lambda (e)
                            (let ([ls (map home-library (cdr e))])
                              (let loop ([ls ls])
                                (cond
                                  [(null? ls) #f]
                                  [(member (car ls) (cdr ls)) #t]
                                  [else (loop (cdr ls))]))))
                          *prelude-assignments*))])
  (unless (null? twice) (die "name assigned to the same library twice" twice)))

;; *scheme-base-elsewhere* is a derived convenience for the Chez-free surface guard, which
;; cannot parse home specs.  Recompute it here from the authoritative assignments -- a
;; prelude define that is neither private nor exported by (scheme base) -- and fail on any
;; disagreement, so it cannot drift into a second source of truth.
(let* ([actual (filter (lambda (n)
                         (and (not (memq n *scheme-base-private*))
                              (not (prelude-exports? '(scheme base) n))))
                       define-names)]
       [missing (filter (lambda (n) (not (memq n *scheme-base-elsewhere*))) actual)]
       [extra (filter (lambda (n) (not (memq n actual))) *scheme-base-elsewhere*)])
  (unless (null? missing)
    (die "not exported by (scheme base) but missing from *scheme-base-elsewhere*"
         missing))
  (unless (null? extra)
    (die
      "in *scheme-base-elsewhere* but (scheme base) still exports it (or the prelude does not define it)"
      extra)))

(let ([dups (let loop ([ns export-names] [seen '()] [d '()])
              (cond
                [(null? ns) (reverse d)]
                [(memq (car ns) seen) (loop (cdr ns) seen (cons (car ns) d))]
                [else (loop (cdr ns) (cons (car ns) seen) d)]))])
  ;; a duplicate export would emit two identical `external global` declarations into
  ;; every importing program module, which LLVM rejects.
  (unless (null? dups) (die "duplicate export" dups)))

;; Definitions and exports retain source order; private helpers stay in the body.
(define (write-library entry path)
  (let* ((lib (car entry))
         (imports (caddr entry))
         (exports (library-export-names lib))
         (body (filter (lambda (f)
                         (let ((n (binding-name f)))
                           (and n (member lib (prelude-homes-of n)))))
                       forms)))
    (when (file-exists? path) (delete-file path))
    (let ((o (open-output-file path)))
      (display ";;; " o)
      (display (let loop ((i (- (string-length path) 1)))
                 (cond
                   ((< i 0) path)
                   ((char=? (string-ref path i) #\/)
                     (substring path (+ i 1) (string-length path)))
                   (else (loop (- i 1)))))
               o)
      (display " -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss\n" o)
      (display
        ";;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in\n;;; src/prelude-surface.scm) and regenerate; guarded by\n;;; test/scheme-base-gen-check.sh.\n;;;\n;;; One member of the prelude's partition: the definitions the declaration\n;;; homes here, exporting the declared public ones.  Private helpers and the\n;;; derived-form macros stay in the body, where the exported procedures still\n;;; call them.  One export per line, so a surface change is a reviewable\n;;; one-line diff.\n"
        o)
      (display "(define-library " o)
      (gen-write lib o)
      (newline o)
      (for-each (lambda (l) (display "  (import " o) (gen-write l o) (display ")\n" o))
                imports)
      (display "  (export\n" o)
      (for-each (lambda (n) (display "    " o) (gen-write n o) (newline o)) exports)
      (display "    )\n  (begin\n" o)
      (for-each (lambda (f) (display "    " o) (gen-write f o) (newline o)) body)
      (display "    ))\n" o)
      (close-output-port o))
    (unless gen-quiet?
      (display "generate " (current-error-port))
      (gen-write lib (current-error-port))
      (display " -> " (current-error-port))
      (display path (current-error-port))
      (display " [" (current-error-port))
      (display (length exports) (current-error-port))
      (display " exports, " (current-error-port))
      (display (length body) (current-error-port))
      (display " body forms]\n" (current-error-port)))))

(if gen-plan?
    (for-each (lambda (e) (display (cadddr e)) (newline)) *prelude-libraries*)
    (for-each (lambda (e) (write-library e (out-file (cadddr e)))) *prelude-libraries*))
