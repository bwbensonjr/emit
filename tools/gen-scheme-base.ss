;;; gen-scheme-base.ss -- generate lib/scheme/base.sld from src/prelude.scm
;;; (change: module-prelude-scheme-base, Stage 3).
;;;
;;; The prelude is the single source of truth for what `(scheme base)` CONTAINS;
;;; src/prelude-surface.scm declares what it EXPORTS (change:
;;; scheme-base-declared-surface, issue #29).  `(scheme base)` is the prelude's
;;; RUNTIME half: a define-library whose body is the whole prelude (procedures + the
;;; derived-form macros) and whose export list is the prelude's top-level defines in
;;; SOURCE ORDER minus *scheme-base-private* -- so a private helper still exists for
;;; the exported procedures that call it, it is just not in scope in a program that
;;; imports the library.  The macros are NOT exported (v0 is procedures-only in
;;; .exports) but they stay in the body so the library compiles -- prelude procedures
;;; use `cond`/`case`/... internally, and `collect-define-syntax` lifts the macros
;;; into the compile-time macro-env when the unit is compiled.  User programs get the
;;; same macros by filtering the prelude source at compile time (no separate baked
;;; constant).
;;;
;;; The portable derivation (scheme-base-export-names, src/core.ss) reads the SAME two
;;; files, so the driver's and the run door's export lists cannot disagree.
;;;
;;; This file is GENERATED.  Edit src/prelude.scm (or the surface declaration), then:
;;;   chez --script tools/gen-scheme-base.ss
;;; Two guards fail if the checked-in copy is stale: test/scheme-base-gen-check.sh
;;; (Chez, whole-file) and test/scheme-base-surface-check.sh (Chez-free, the export
;;; list and the surface invariants).
;;;
;;; Usage:  chez --script tools/gen-scheme-base.ss [OUT-ROOT]
;;;
;;; Every partition member goes to the path its entry in *prelude-libraries* declares,
;;; resolved against OUT-ROOT (default "."), so the whole set can be regenerated into a
;;; temp tree and diffed against the committed one -- which is what
;;; test/scheme-base-gen-check.sh does.  It is a ROOT rather than a file because the
;;; partition writes N files and only the declaration knows their names.

(import (chezscheme))

(define prelude-path "src/prelude.scm")
(define out-root
  (let ([a (command-line-arguments)]) (if (null? a) "." (car a))))

;; OUT-ROOT/REL, creating REL's directories.  Chez's mkdir is one level at a time, so walk
;; the prefixes -- "lib/emit/internal.sld" needs both lib and lib/emit to exist.
(define (out-file rel)
  (let loop ([i 0] [dir out-root])
    (cond
      [(= i (string-length rel)) (string-append dir "/" rel)]
      [(char=? (string-ref rel i) #\/)
       (let ([d (string-append out-root "/" (substring rel 0 i))])
         (unless (file-directory? d) (mkdir d))
         (loop (+ i 1) dir))]
      [else (loop (+ i 1) dir)])))

;; the declared surface: *scheme-base-private* and the partition (*prelude-libraries* /
;; *prelude-assignments*, with prelude-exports? / prelude-homes-of over them)
(load "src/prelude-surface.scm")

(define (read-all p)
  (let loop ([acc '()])
    (let ([x (read p)]) (if (eof-object? x) (reverse acc) (loop (cons x acc))))))

(define forms (call-with-input-file prelude-path read-all))

;; every top-level (define NAME ...) / (define (NAME . _) ...), in source order.
(define (proc-name f)
  (and (pair? f) (eq? (car f) 'define)
       (let ([sig (cadr f)]) (if (pair? sig) (car sig) sig))))
(define (syntax-name f)
  (and (pair? f) (eq? (car f) 'define-syntax) (cadr f)))

(define define-names (filter (lambda (x) x) (map proc-name forms)))
(define syntax-names (filter (lambda (x) x) (map syntax-name forms)))

;; the export list: defines in SOURCE ORDER kept when the partition assigns them to
;; this library (change: scheme-base-partition).  Order comes from the prelude, so the
;; arrangement of the declaration cannot move IR.  Mirrors library-export-names in
;; src/core.ss, which reads the same declaration.
(define export-names
  (filter (lambda (n) (prelude-exports? '(scheme base) n)) define-names))

;; The declaration must describe THIS prelude.  A rotted declaration would silently
;; emit a different surface, so fail loudly instead (issue #29).
(define (die msg names)
  (fprintf (current-error-port) "gen-scheme-base: ~a: ~s~n" msg names)
  (exit 1))

(let ([stale (filter (lambda (n) (not (memq n define-names))) *scheme-base-private*)])
  (unless (null? stale)
    (die "private name not defined by the prelude (stale declaration)" stale)))
(let ([macros (filter (lambda (n) (memq n syntax-names)) *scheme-base-private*)])
  (unless (null? macros)
    (die "define-syntax name listed as private (macros are never exported)" macros)))
;; every assignment must name a definition the prelude actually has, and every home must
;; name a real partition member -- see below.  (The `unstable` export tier's check used to
;; live here; the tier is retired, change: scheme-base-partition / issue #32.)
;; partition rot (change: scheme-base-partition): an assignment naming a definition the
;; prelude does not have, a name assigned twice, or an assignment to a library that is
;; not a partition member would each silently emit a different surface.
(let ([stale (filter (lambda (e) (not (memq (car e) define-names))) *prelude-assignments*)])
  (unless (null? stale)
    (die "assignment for a name the prelude does not define" (map car stale))))
(let ([dups (let loop ([es *prelude-assignments*] [seen '()] [d '()])
              (cond
                [(null? es) (reverse d)]
                [(memq (caar es) seen) (loop (cdr es) seen (cons (caar es) d))]
                [else (loop (cdr es) (cons (caar es) seen) d)]))])
  (unless (null? dups) (die "name assigned more than once" dups)))
(let* ([known (map car *prelude-libraries*)]
       [bad   (filter (lambda (l) (not (member l known)))
                      ;; each home is a LIBRARY or a (LIBRARY private); compare libraries
                      (map home-library (apply append (map cdr *prelude-assignments*))))])
  (unless (null? bad) (die "assignment to a library that is not a partition member" bad)))
;; One library named twice in a name's home list would emit two definitions of it into
;; ONE unit -- a duplicate top-level define, whose cost is silent (issue #38).
(let ([twice (map car
               (filter (lambda (e)
                         (let ([ls (map home-library (cdr e))])
                           (let loop ([ls ls])
                             (cond [(null? ls) #f]
                                   [(member (car ls) (cdr ls)) #t]
                                   [else (loop (cdr ls))]))))
                       *prelude-assignments*))])
  (unless (null? twice) (die "name assigned to the same library twice" twice)))

(let ([dups (let loop ([ns export-names] [seen '()] [d '()])
              (cond
                [(null? ns) (reverse d)]
                [(memq (car ns) seen) (loop (cdr ns) seen (cons (car ns) d))]
                [else (loop (cdr ns) (cons (car ns) seen) d)]))])
  ;; a duplicate export would emit two identical `external global` declarations into
  ;; every importing program module, which LLVM rejects.
  (unless (null? dups) (die "duplicate export" dups)))

;; Emit ONE partition member's .sld (change: scheme-base-partition).  Mirrors
;; partition-library-form in src/core.ss: the same declaration decides the same export
;; list and the same body, so the committed files and the baked derivation cannot
;; disagree.  Macros go into EVERY member's body -- they are the prelude's compile-time
;; half, lifted out before anything is lowered, so they cost no emitted code and a
;; member whose procedures use `cond`/`case` internally can compile at all.
(define (write-library entry path)
  (let* ([lib      (car entry)]
         [imports  (caddr entry)]
         [exports  (filter (lambda (n) (prelude-exports? lib n)) define-names)]
         [body     (filter (lambda (f)
                             (let ([n (proc-name f)])
                               (if n (member lib (prelude-homes-of n)) (syntax-name f))))
                           forms)]
         [o        (open-output-file path 'replace)])
    (fprintf o ";;; ~a -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss~n"
             (let loop ([i (- (string-length path) 1)])
               (cond [(< i 0) path]
                     [(char=? (string-ref path i) #\/) (substring path (+ i 1) (string-length path))]
                     [else (loop (- i 1))])))
    (fprintf o ";;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in~n")
    (fprintf o ";;; src/prelude-surface.scm) and regenerate; guarded by~n")
    (fprintf o ";;; test/scheme-base-gen-check.sh.~n")
    (fprintf o ";;;~n")
    (fprintf o ";;; One member of the prelude's partition: the definitions the declaration~n")
    (fprintf o ";;; homes here, exporting the declared public ones.  Private helpers and the~n")
    (fprintf o ";;; derived-form macros stay in the body, where the exported procedures still~n")
    (fprintf o ";;; call them.  One export per line, so a surface change is a reviewable~n")
    (fprintf o ";;; one-line diff.~n")
    (fprintf o "(define-library ~a~n" lib)
    (unless (null? imports)
      (for-each (lambda (l) (fprintf o "  (import ~a)~n" l)) imports))
    (fprintf o "  (export~n")
    (for-each (lambda (n) (fprintf o "    ~a~n" n)) exports)
    (fprintf o "    )~n")
    (fprintf o "  (begin~n")
    (for-each
      (lambda (f)
        (parameterize ([print-graph #f] [print-gensym #f])
          (fprintf o "    ")
          (write f o)
          (newline o)))
      body)
    (fprintf o "    ))~n")
    (close-port o)
    (fprintf (current-error-port) "wrote ~a  (~a exports, ~a body forms)~n"
             path (length exports) (length body))))

;; Each member to the path its partition entry declares, under OUT-ROOT.
(for-each (lambda (e) (write-library e (out-file (cadddr e)))) *prelude-libraries*)
(fprintf (current-error-port)
         "partition: ~a librar~a, ~a (scheme base) exports of ~a defines, ~a private, ~a assigned, ~a forms~n"
         (length *prelude-libraries*)
         (if (null? (cdr *prelude-libraries*)) "y" "ies")
         (length export-names) (length define-names)
         (length *scheme-base-private*) (length *prelude-assignments*) (length forms))
