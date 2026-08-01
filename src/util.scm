;;; util.scm -- generic helpers shared across passes, flattened out of util.ss
;;; (change: self-hosting-completion).  Bare top-level `define`s, no `(library ...)`
;;; wrapper, so the source concatenates with no Chez assembler.

;; order-preserving set ops (lists as sets)
(define (union a b)
  (let loop ([b b] [acc (reverse a)])
    (cond
      [(null? b) (reverse acc)]
      [(memq (car b) acc) (loop (cdr b) acc)]
      [else (loop (cdr b) (cons (car b) acc))])))
(define (union* ls) (fold-left union '() ls))
(define (diff a b) (filter (lambda (x) (not (memq x b))) a))
(define (mem? x s) (and (memq x s) #t))

;; ---- order-pinned map (issue #11) -----------------------------------------
;; R7RS leaves the ORDER in which `map` applies its procedure unspecified, and the
;; two hosts genuinely differ: Chez applies in back-to-front PAIRS once the list is
;; longer than three -- (map tick '(0 1 2 3 4 5 6 7)) yields (7 8 5 6 3 4 1 2) --
;; while the prelude's `map` is strictly left-to-right.  So any `map` over a
;; SIDE-EFFECTING procedure (one that allocates a temp, emits an instruction, or
;; bumps the gensym counter) produces different output on the Chez-hosted driver
;; than on the shipped self-hosted doors, for any list of more than three elements.
;;
;; That broke the cross-door byte-identity of library units (issue #11: `apply`
;; spills K=8 slots through exactly such a map) and is the mechanism behind the
;; operand-order divergence in issue #6 (a call with more than three arguments has
;; its operands EMITTED, and therefore evaluated, in a different order per host).
;;
;; `map-lr` pins the order to left-to-right on both hosts.  Use it -- never `map` --
;; wherever the procedure has an effect; plain `map` stays fine for pure rewrites.
;; (`for-each` needs no equivalent: R7RS specifies it left-to-right.)
(define (map-lr f xs)
  (let loop ([xs xs] [acc '()])
    (if (null? xs) (reverse acc) (loop (cdr xs) (cons (f (car xs)) acc)))))

;; two-list sibling, for the `(map f as bs)` shape; same guarantee.
(define (map-lr2 f xs ys)
  (let loop ([xs xs] [ys ys] [acc '()])
    (if (or (null? xs) (null? ys))
        (reverse acc)
        (loop (cdr xs) (cdr ys) (cons (f (car xs) (car ys)) acc)))))

;; deterministic gensym: a monotonic counter, reset per compile so output
;; (renamed IL, .ll labels) is stable and readable.
(define counter 0)
(define (reset-counter!) (set! counter 0))
(define (next!) (let ([n counter]) (set! counter (+ n 1)) n))
;; fresh variable, e.g. (fresh-name 'x) => x.7
(define (fresh-name base)
  (string->symbol
    (string-append (symbol->string base) "." (number->string (next!)))))
;; fresh code label string, e.g. (fresh-label "code") => "code_3"
(define (fresh-label base)
  (string-append base "_" (number->string (next!))))

;; ---- module-qualified symbol naming (change: module-resolution-scaffold) ----
;; A compilation unit's own emitted symbols -- top-level globals and lifted
;; code-block labels -- are named through `mangle`, a PURE function of the unit's
;; library name and the internal name, with no dependence on compile order or the
;; gensym counter.  For a library named (p1 p2 ... pn) and internal name x it
;; returns "p1.p2.....pn:x" (parts joined by ".", then ":", then the name).
;;
;; The PROGRAM (non-library) unit is the empty-prefix unit `program-unit`; for it
;; `mangle` returns the internal name UNCHANGED, so a library-free program's
;; emitted symbols are byte-identical to before this scaffolding.  Stage 1 passes
;; a real library name to get "scheme.base:map" and the like.
(define program-unit '())                 ; the empty-prefix (non-library) unit

(define (mangle library-name internal-name)
  (let ([x (if (symbol? internal-name)
               (symbol->string internal-name)
               internal-name)])
    (if (null? library-name)
        x                                  ; empty prefix: round-trip unchanged
        (let loop ([parts (cdr library-name)]
                   [acc   (symbol->string (car library-name))])
          (if (null? parts)
              (string-append acc ":" x)
              (loop (cdr parts)
                    (string-append acc "." (symbol->string (car parts)))))))))
