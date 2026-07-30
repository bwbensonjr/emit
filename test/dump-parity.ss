;;; dump-parity.ss -- compare two stage dumps STRUCTURALLY (change: emit-dump-stages,
;;; design D5).  Usage: chez --script test/dump-parity.ss REFERENCE.err SHIPPED.err
;;;
;;; The Chez driver's dumper (pretty-print) and the shipped binary's in-language dumper
;;; are deliberately INDEPENDENT implementations, so the shipped one can be checked
;;; against a reference rather than against itself.  They are therefore NOT expected to
;;; agree byte-for-byte: Chez prints `let` bindings with brackets and breaks lines by its
;;; own rules.  What must agree is the content -- the stage names, their order, and the
;;; intermediate form at each stage -- so this reads both streams back into data and
;;; compares with `equal?`.  Chez reads both sides, which is what makes whitespace and
;;; bracket style irrelevant.
(import (chezscheme))

(define header-prefix ";; ==== after ")
(define header-suffix " ====")

;; ";; ==== after STAGE ====" -> "STAGE", else #f.
(define (header-stage line)
  (let ([np (string-length header-prefix)]
        [ns (string-length header-suffix)]
        [n  (string-length line)])
    (and (> n (+ np ns))
         (string=? (substring line 0 np) header-prefix)
         (string=? (substring line (- n ns) n) header-suffix)
         (substring line np (- n ns)))))

;; A dump stream -> list of (stage-name . list-of-forms), in order.  Text before the
;; first header is ignored (a REPL prompt, a banner); anything a section cannot read
;; back is a hard error, since it means the dump is not valid data.
(define (read-sections path)
  (let ([p (open-input-file path)])
    (let loop ([line (get-line p)] [stage #f] [text '()] [acc '()])
      (define (close-section)
        (if stage
            (cons (cons stage (parse-forms stage (apply string-append (reverse text)))) acc)
            acc))
      (cond
        [(eof-object? line) (close-port p) (reverse (close-section))]
        [(header-stage line)
         => (lambda (s) (loop (get-line p) s '() (close-section)))]
        [else (loop (get-line p) stage
                    (if stage (cons (string-append line "\n") text) text)
                    acc)]))))

(define (parse-forms stage text)
  (let ([p (open-input-string text)])
    (let loop ([acc '()])
      (let ([d (guard (e (#t (error 'dump-parity "unreadable dump section" stage)))
                 (read p))])
        (if (eof-object? d) (reverse acc) (loop (cons d acc)))))))

(define (fail fmt . args)
  (apply printf fmt args)
  (exit 1))

(let* ([args (command-line-arguments)]
       [ref  (read-sections (car args))]
       [got  (read-sections (cadr args))])
  (when (null? ref) (fail "  [FAIL] reference dump has no stages\n"))
  (unless (equal? (map car ref) (map car got))
    (fail "  [FAIL] stage names/order differ\n         reference: ~s\n         shipped:   ~s\n"
          (map car ref) (map car got)))
  (for-each
    (lambda (r g)
      (unless (equal? (cdr r) (cdr g))
        (fail "  [FAIL] stage ~a: the intermediate forms differ\n" (car r))))
    ref got)
  (printf "  [OK  ] ~a stages agree with the Chez reference: ~a\n"
          (length ref)
          (let loop ([ss (map car ref)] [acc ""])
            (if (null? ss) acc
                (loop (cdr ss) (if (string=? acc "") (car ss)
                                   (string-append acc " " (car ss)))))))
  (exit 0))
