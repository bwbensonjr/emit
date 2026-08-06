;;; dump.ss -- the compiler's own per-pass stage dumper (change: emit-dump-stages).
;;;
;;; This is the Chez-free half of `--dump`: it builds the `dump` procedure the pure
;;; core already takes as a parameter (core.ss's `dump` side-channel), so the shipped
;;; binary can show its stages with no Chez present.  Two runtime primitives make it
;;; possible -- `(%dump-level)`, the host-forwarded EMIT_DUMP_LEVEL probe, and
;;; `(%stderr-write v display?)`, the narration channel (stdout is reserved for a
;;; door's IR payload, so narration cannot go there).
;;;
;;; NOT in `compile.ss`'s (include ...) block, and so not in src/util.scm: those files
;;; are EVALUATED by Chez, where the two %-ops are unbound identifiers.  This file is
;;; only ever *compiled* (it rides $CORE_FLAT in tools/regen.sh and
;;; test/self-host-fixpoint.sh), which is also what keeps the Chez driver's own
;;; `pretty-print` dumper an INDEPENDENT implementation -- the reference the parity
;;; check measures this one against (design D5/D10).
;;;
;;; Levels (design D1): 0 = off, 1 = stage names only, 2 = full per-pass IL dump,
;;; 3 = full dump including library units.

;; --- output ---------------------------------------------------------------
;; Two spellings of the one narration primitive: raw bytes for the dumper's own
;; punctuation/indentation, and the runtime's WRITE style for a datum (so a string
;; inside the IL shows quoted, as Chez's pretty-print renders it).
(define (pp-emit s)  (%stderr-write s #t))
(define (pp-write d) (%stderr-write d #f))
(define (pp-indent n) (if (> n 0) (pp-emit (make-string n #\space)) #f))

;; --- printed width, without building the string ---------------------------
;; (Not shareable with core.ss's `render-datum`: that one is specialized for export
;; tables and front-end diagnostics -- symbols/strings/numbers/lists only, everything
;; else renders "?" -- and it BUILDS a string, which the layout rule below must not do.)
;; The layout rule below needs to know how wide a datum WOULD print; measuring it
;; directly keeps the runtime as the only actual printer (design D2) and allocates
;; nothing -- which is also why dumping cannot perturb the gensym counter.
;; Every arm mirrors print_val's write-style output in src/runtime/runtime.c: a
;; string is its characters plus two quotes plus one column per escaped character, a
;; character is `#\x` except for the two named ones, an unknown value prints as an
;; opaque `#<...>` whose exact width does not matter (it never fits a line budget
;; anyway).
(define *pp-width* 78)

;; Characters print_val escapes in write style, each costing one extra column.  Keep in
;; sync with runtime.c's HDR_STRING write arm.
(define (string-escape-count s)
  (let ([n (string-length s)])
    (let loop ([i 0] [k 0])
      (if (= i n)
          k
          (let ([c (string-ref s i)])
            (loop (+ i 1)
                  (if (or (eq? c #\") (eq? c #\\)
                          (eq? c #\newline)
                          (eq? c (integer->char 9))     ; tab
                          (eq? c (integer->char 13)))   ; return
                      (+ k 1)
                      k)))))))

(define (char-write-width c)
  (cond [(eq? c #\space)   7]        ; #\space
        [(eq? c #\newline) 9]        ; #\newline
        [else              3]))      ; #\x -- one column for any single character

(define (datum-width d)
  (cond
    [(pair? d)    (+ 2 (elems-width d))]
    [(null? d)    2]
    [(symbol? d)  (string-length (symbol->string d))]
    [(string? d)  (+ 2 (string-length d) (string-escape-count d))]
    [(char? d)    (char-write-width d)]
    [(boolean? d) 2]
    [(vector? d)  (+ 3 (vector-elems-width d))]
    [(flonum? d)  (string-length (%flonum->string d))]
    [(number? d)  (string-length (number->string d))]
    [else         12]))

;; elements of a (possibly improper) list: widths + one space between each, plus
;; " . " and the tail when the list is dotted.
(define (elems-width d)
  (let loop ([cur d] [w 0] [first #t])
    (cond
      [(pair? cur) (loop (cdr cur)
                         (+ w (if first 0 1) (datum-width (car cur)))
                         #f)]
      [(null? cur) w]
      [else        (+ w 3 (datum-width cur))])))

(define (vector-elems-width v)
  (let ([n (vector-length v)])
    (let loop ([i 0] [w 0])
      (if (= i n)
          w
          (loop (+ i 1) (+ w (if (= i 0) 0 1) (datum-width (vector-ref v i))))))))

;; --- the layout rule (design D4) ------------------------------------------
;; Print a datum on one line when it fits the column budget from where it starts;
;; otherwise FILL: keep packing elements onto the current line while they fit, and
;; start a new line indented one level (2 columns) past the opening paren when the
;; next one does not.  `col` is the column the datum starts at -- the caller has
;; already emitted that much indentation.
;;
;; Fill rather than one-element-per-line: the design left the break style open until
;; there was real `lower`-stage output to judge, and one-per-line splits runs of
;; atoms -- `(code "code_6" cp.7 (n.3) #f ...)` -- across five lines where the Chez
;; reference keeps them together.  Filling reads much closer to that reference
;; without adopting its form-specific (let/lambda/if) rules.
(define (pp-datum d col)
  (if (or (<= (+ col (datum-width d)) *pp-width*) (not (pair? d)))
      (pp-write d)                      ; fits, or has no break rule: one line
      (pp-list d col)))

(define (pp-list d col)
  (let* ([ind  (+ col 2)]
         [hcol (+ col 1 (datum-width (car d)))])   ; column after the head
    (pp-emit "(")
    (pp-datum (car d) (+ col 1))
    ;; A head too wide to fit was itself broken across lines, so its end column is
    ;; not knowable here; saturate, which just forces the next element onto a fresh
    ;; line.  Every column below is likewise an upper bound when an element had to
    ;; break internally -- conservative, so a line can come out short but never long.
    (let loop ([cur (cdr d)] [cc (if (<= hcol *pp-width*) hcol *pp-width*)])
      (cond
        [(null? cur) (pp-emit ")")]
        [(pair? cur)
         (let* ([w    (datum-width (car cur))]
                [fits (<= (+ cc 1 w) *pp-width*)])
           (if fits
               (begin (pp-emit " ") (pp-datum (car cur) (+ cc 1)))
               (begin (pp-emit "\n") (pp-indent ind) (pp-datum (car cur) ind)))
           (loop (cdr cur) (if fits (+ cc 1 w) (+ ind w))))]
        [else                            ; dotted tail
         (pp-emit "\n") (pp-indent ind) (pp-emit ". ")
         (pp-datum cur (+ ind 2))
         (pp-emit ")")]))))

;; --- the dumpers ----------------------------------------------------------
;; Level 1: the concise trace, byte-identical to the Chez driver's announce-stage.
;; Both dumpers return the unspecified value, like core.ss's `no-dump`: a dumper is
;; called for effect in a form sequence, and nothing downstream should be able to
;; observe a narration byte-count as a value.
(define (dump-stage-name stage)
  (pp-emit "  stage ") (pp-emit stage) (pp-emit "\n")
  (if #f #f))

;; Level 2/3: the header the Chez driver's `dump` writes, then the form, then a
;; blank line -- the same shape, so one splitter reads either stream.  `unit` is #f
;; for the program under inspection, or a library name (only reached at level 3),
;; which is named in the header so units cannot be confused for one another.
;; A per-form tag (design D8) needs nothing here: core.ss's `dump-tagged` puts it in
;; the stage NAME, so it works with any dumper -- including the Chez driver's.
(define (dump-stage-form unit stage form)
  (pp-emit ";; ==== after ") (pp-emit stage)
  (if unit (begin (pp-emit " [unit ") (pp-write unit) (pp-emit "]")) #f)
  (pp-emit " ====\n")
  (pp-datum form 0)
  (pp-emit "\n\n")
  (if #f #f))

;; Build the dump procedure for one compilation unit: (stage form) -> unspecified.
;; `unit` is #f for the program (or the library `emit lib` was pointed at -- the
;; unit under inspection either way) and a library name for an incidentally
;; compiled unit like (scheme base), which is dumped only at level 3 (design D7).
;; Returns core.ss's `no-dump` when this unit is not being dumped, so every caller
;; can pass the result straight through with no level test of its own.
(define (make-dumper unit)
  (let ([lvl (%dump-level)])
    (cond
      [(= lvl 0)              no-dump]
      [(and unit (< lvl 3))   no-dump]
      [(= lvl 1)              (lambda (stage form) (dump-stage-name stage))]
      [else                   (lambda (stage form) (dump-stage-form unit stage form))])))
