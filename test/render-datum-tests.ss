;;; Unit tests for render-datum / render-datum-loose (change: reader-datum-parity,
;;; design D3/D3a/D4; issues #64, #52).
;;;
;;; The renderer lives in src/core.ss and is written in the common subset, so it loads
;;; and runs directly under Chez -- which is also the point of two of these cases: the
;;; artifact path's whole obligation is that CHEZ can read back what it writes, and this
;;; is the only suite in a position to check that with Chez's own `read`.
;;;
;;; What it pins:
;;;   * the two entry points AGREE on every datum except the one place they are
;;;     deliberately different (a character with no portable representation).  They share
;;;     one worker precisely so a new datum type gains an arm in both at once; a test
;;;     that compares them is what keeps that true;
;;;   * strict mode RAISES rather than emitting something the other door cannot read --
;;;     for such a character, and for a bytevector, whose R7RS #u8(...) spelling Chez's
;;;     `read` rejects (design D3a);
;;;   * what strict mode DOES write reads back through Chez's `read` as the same datum.
;;;
;;; Run from the repo root: chez --libdirs src --script test/render-datum-tests.ss

(define host-read read)
(define host-error error)

;; src/core.ss uses match/util helpers; pull in what it needs, then core.ss itself.
;; `include`, not `load`, for the same reason src/compile.ss uses it: core.ss calls
;; compile-library at :115 and defines it at :1105, and `load` compiles each top-level
;; form on its own, so the forward reference draws an argument-count warning that
;; splicing the file as one body does not.
(include "src/match.scm")
(include "src/util.scm")
(include "src/core.ss")

(define pass 0)
(define fail 0)
(define (ok m)  (set! pass (+ pass 1)) (display "  [OK  ] ") (display m) (newline))
(define (bad m) (set! fail (+ fail 1)) (display "  [FAIL] ") (display m) (newline))

(define (raised thunk)                    ; -> 'raised, or the value
  (call/cc (lambda (k)
    (with-exception-handler (lambda (e) (k 'raised)) thunk))))

(define (check name got want)
  (if (equal? got want)
      (ok (string-append name " => " (if (string? got) got "<non-string>")))
      (begin (bad (string-append name " => "
                                 (if (string? got) got "<non-string>")
                                 "  want "
                                 (if (string? want) want "<non-string>"))))))

(display "render-datum: the arms core-language requires the reader to produce")
(newline)

(check "vector"        (render-datum '#(1 2))        "#(1 2)")
(check "vector empty"  (render-datum '#())           "#()")
(check "vector nested" (render-datum '#(1 #(2 #(3)))) "#(1 #(2 #(3)))")
(check "vector in list" (render-datum '(a #(b c) d)) "(a #(b c) d)")
(check "vector dotted" (render-datum '(#(1) . #(2))) "(#(1) . #(2))")
(check "vector mixed"  (render-datum '#(a "s" #\c #t #f 1 () (p . q)))
       "#(a \"s\" #\\c #t #f 1 () (p . q))")

(display "")
(newline)
(display "the two entry points agree except on an unrepresentable character")
(newline)

;; Every datum here must render identically through both, including the nested cases --
;; that is what makes the shared worker safe.
(let loop ([ds (list '#(1 2) '#() '#(1 #(2)) '(a #(b) . c) "s" 'sym 42 #t #f '()
                     #\a #\space #\newline '(1 "two" #\3 #(4)))])
  (if (null? ds)
      (ok "strict and loose agree on every representable datum")
      (let* ([d (car ds)]
             [a (render-datum d)]
             [b (render-datum-loose d)])
        (if (equal? a b)
            (loop (cdr ds))
            (bad (string-append "entry points disagree: " a " vs " b))))))

;; The deliberate divergence: a character with no portable external representation.
;; Strict raises (it would corrupt an artifact); loose spells it, because its output is
;; only ever read by a human.
(let ([c (integer->char 1)])
  (if (eq? 'raised (raised (lambda () (render-datum c))))
      (ok "strict raises on a character with no portable representation")
      (bad "strict should have raised on #\\x1"))
  (check "loose spells it" (render-datum-loose c) "#\\x1"))

;; ...and the same divergence one level down, inside a structure, which is the case a
;; non-recursive fix would miss.
(let ([d (list 'a (integer->char 1))])
  (if (eq? 'raised (raised (lambda () (render-datum d))))
      (ok "strict raises for one nested inside a list")
      (bad "strict should have raised for a nested unrepresentable character"))
  (check "loose renders the whole structure" (render-datum-loose d) "(a #\\x1)"))

(display "")
(newline)
(display "a bytevector: refused in an artifact, spelled in a diagnostic (design D3a)")
(newline)

;; R7RS spells it #u8(...); Chez's `read` rejects that and uses #vu8(...).  The driver
;; reads export tables back with `read`, so strict mode must refuse rather than write a
;; spelling one door cannot parse.
(if (eq? 'raised (raised (lambda () (render-datum (bytevector 1 2)))))
    (ok "strict raises on a bytevector")
    (bad "strict should have raised on a bytevector"))
(check "loose spells the bytevector" (render-datum-loose (bytevector 1 2)) "#u8(1 2)")
(if (eq? 'raised (raised (lambda () (render-datum (list 'a (bytevector 1))))))
    (ok "strict raises for one nested inside a list")
    (bad "strict should have raised for a nested bytevector"))

(display "")
(newline)
(display "what strict mode writes, Chez's read parses back as the same datum")
(newline)

;; The artifact path's entire obligation, checked against the reader that actually
;; consumes it on the reuse path (src/compile.ss, `read-program expf`).
(let loop ([ds (list '#(1 2) '#() '#(1 #(2 #(3)))
                     '(a #(b c) d) '#(a "s" #\c #t 1 () (p . q))
                     '(define-syntax m (syntax-rules () ((_) (quote #(1 2))))))])
  (if (null? ds)
      (ok "every strict rendering round-trips through Chez's read")
      (let* ([d (car ds)]
             [text (render-datum d)]
             [back (host-read (open-input-string text))])
        (if (equal? back d)
            (loop (cdr ds))
            (bad (string-append "round-trip lost: " text))))))

(newline)
(display "  ") (display pass) (display " passed, ")
(display fail) (display " failed") (newline)
(exit (if (= fail 0) 0 1))
