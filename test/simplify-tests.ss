;;; simplify-tests.ss -- unit tests for the simplify pass (change: simplify-known-calls).
;;; Run from the repo root:  chez --libdirs src --script test/simplify-tests.ss
;;;
;;; Exercises the pass directly at the IL->IL level, independent of the rest of
;;; the pipeline.  The inputs below are written in the shape the pass actually
;;; sees: post-`convert-assignments` core IL, alpha-renamed (every binder
;;; distinct), with `set!` already gone.

(import (chezscheme))
(include "src/match.scm")           ; flat source (change: self-hosting-completion)
(include "src/util.scm")
(include "src/parse.ss")            ; param-names / param-rest
(include "src/passes/simplify.ss")

(define pass 0)
(define fail 0)
(define (check name got want)
  (if (equal? got want)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n         got:  ~s\n         want: ~s\n" name got want))))

(printf "simplify unit tests\n")

;; ---- rule 1: inline a known, singly-referenced lambda --------------------

(printf "\ninlining\n")

(check "the motivating case: square collapses to a constant"
  (simplify '(letrec ([square.0 (lambda (n.1) (primcall %* n.1 n.1))])
               (call square.0 (const 34))))
  '(const 1156))

(check "inlined body survives when the argument is not constant"
  (simplify '(letrec ([f.0 (lambda (n.1) (primcall %* n.1 n.1))])
               (call f.0 x)))
  '(let ([n.1 x]) (primcall %* n.1 n.1)))

(check "a let-bound lambda inlines the same way"
  (simplify '(let ([f.0 (lambda (n.1) (primcall %+ n.1 (const 1)))])
               (call f.0 (const 41))))
  '(const 42))

(check "a zero-argument lambda inlines with no let"
  (simplify '(letrec ([f.0 (lambda () (const 7))]) (call f.0)))
  '(const 7))

(check "inlining reaches a call site nested inside another lambda"
  (simplify '(letrec ([f.0 (lambda (n.1) (primcall %* n.1 (const 2)))])
               (lambda (y.2) (call f.0 y.2))))
  '(lambda (y.2) (let ([n.1 y.2]) (primcall %* n.1 (const 2)))))

;; ---- rule 1: the cases that must NOT inline -----------------------------

(printf "\nnot inlined\n")

(check "a self-recursive function is never inlined"
  (simplify '(letrec ([fact.0 (lambda (n.1)
                                (if (primcall %= n.1 (const 0))
                                    (const 1)
                                    (primcall %* n.1 (call fact.0 (primcall %- n.1 (const 1))))))])
               (call fact.0 (const 5))))
  '(letrec ([fact.0 (lambda (n.1)
                      (if (primcall %= n.1 (const 0))
                          (const 1)
                          (primcall %* n.1 (call fact.0 (primcall %- n.1 (const 1))))))])
     (call fact.0 (const 5))))

(check "a twice-called function is never inlined"
  (simplify '(letrec ([f.0 (lambda (n.1) (primcall %* n.1 n.1))])
               (primcall %+ (call f.0 (const 2)) (call f.0 (const 3)))))
  '(letrec ([f.0 (lambda (n.1) (primcall %* n.1 n.1))])
     (primcall %+ (call f.0 (const 2)) (call f.0 (const 3)))))

(check "a name used as a value, not an operator, is not inlined"
  (simplify '(letrec ([f.0 (lambda (n.1) n.1)]) (call g f.0)))
  '(letrec ([f.0 (lambda (n.1) n.1)]) (call g f.0)))

(check "an arity mismatch is not inlined"
  (simplify '(letrec ([f.0 (lambda (a.1 b.2) a.1)]) (call f.0 (const 1))))
  '(letrec ([f.0 (lambda (a.1 b.2) a.1)]) (call f.0 (const 1))))

(check "a variadic lambda is not inlined"
  (simplify '(letrec ([f.0 (lambda (a.1 . r.2) a.1)]) (call f.0 (const 1) (const 2))))
  '(letrec ([f.0 (lambda (a.1 . r.2) a.1)]) (call f.0 (const 1) (const 2))))

(check "a shadowing inner binder hides the outer name (no inline, no capture)"
  ;; the `(call f.0 ...)` under the inner lambda refers to the PARAMETER f.0,
  ;; so the outer binding is referenced zero times as an operator
  (simplify '(letrec ([f.0 (lambda (n.1) n.1)])
               (call h (lambda (f.0) (call f.0 (const 1))))))
  '(call h (lambda (f.0) (call f.0 (const 1)))))

;; ---- rule 2: constant propagation and folding ---------------------------

(printf "\nconstants\n")

(check "an immediate constant propagates to its use sites"
  (simplify '(let ([x.0 (const 2)]) (primcall %* x.0 y)))
  '(primcall %* (const 2) y))

(check "arithmetic over constants folds"
  (simplify '(primcall %+ (const 40) (primcall %* (const 1) (const 2))))
  '(const 42))

(check "comparisons over constants fold to booleans"
  (list (simplify '(primcall %= (const 3) (const 3)))
        (simplify '(primcall %< (const 4) (const 3))))
  '((const #t) (const #f)))

(check "a non-immediate constant is NOT propagated (would duplicate the object)"
  ;; two references to one string must stay two references to ONE object;
  ;; copying the literal would allocate twice and break eq?
  (simplify '(let ([s.0 (const "hi")]) (call eq? s.0 s.0)))
  '(let ([s.0 (const "hi")]) (call eq? s.0 s.0)))

(check "a pair constant is not propagated either"
  (simplify '(let ([p.0 (const (1 2))]) (call cons p.0 p.0)))
  '(let ([p.0 (const (1 2))]) (call cons p.0 p.0)))

(check "an unfoldable primitive is left for the runtime"
  (simplify '(primcall %/ (const 1) (const 3)))
  '(primcall %/ (const 1) (const 3)))

;; ---- rule 2: the foldable window ----------------------------------------
;; The compiler is self-hosted and emit's own fixnums wrap silently, so folding
;; is confined to operands small enough that no operation can leave the fixnum
;; range -- a sufficient condition, checked BEFORE anything is computed.  The
;; property under test is one-directional: nothing outside the window folds, and
;; nothing that folds is ever wrong.

(printf "\nfoldable window\n")

;; 2^30 - 1, the pass's window
(define lim 1073741823)

;; 2^60 - 1, the fixnum ceiling
(define fx-max 1152921504606846975)

;; encode-const now reaches it too (issue #7 fixed)
(define enc-max fx-max)

(check "the largest product in the window folds, and stays a fixnum"
  (let ([r (simplify `(primcall %* (const ,lim) (const ,lim)))])
    (list r (<= (cadr r) fx-max)))
  `((const ,(* lim lim)) #t))

(check "no folded result can exceed what encode-const can emit (issue #7)"
  ;; The window must never let a fold produce a literal the emitter would write
  ;; out wrong.  encode-const once overflowed at 2^57, which forced the window
  ;; down to 2^28 - 1; it now reaches the whole fixnum range.  If that ever
  ;; regresses, or the window is widened past the emitter, it must fail HERE
  ;; rather than silently miscompile a user's program.
  (list (<= (* sfy-fold-limit sfy-fold-limit) enc-max)
        (<= (+ sfy-fold-limit sfy-fold-limit) enc-max))
  '(#t #t))

(check "the largest foldable product round-trips through the emitter's encoding"
  ;; 1073741823^2 is a valid fixnum but exceeds the old 2^57 encoding cliff --
  ;; the exact case that miscompiled before issue #7 was fixed
  (let ([r (simplify '(primcall %* (const 1073741823) (const 1073741823)))])
    (list r (<= (cadr r) fx-max)))
  '((const 1152921502459363329) #t))

(check "the most negative product in the window folds"
  (simplify `(primcall %* (const ,(- 0 lim)) (const ,lim)))
  `(const ,(* (- 0 lim) lim)))

(check "an operand one past the window is refused"
  (simplify `(primcall %+ (const ,(+ lim 1)) (const 1)))
  `(primcall %+ (const ,(+ lim 1)) (const 1)))

(check "a negative operand one past the window is refused"
  (simplify `(primcall %- (const ,(- 0 lim 1)) (const 1)))
  `(primcall %- (const ,(- 0 lim 1)) (const 1)))

(check "an operand near the fixnum ceiling is refused"
  (simplify `(primcall %* (const ,fx-max) (const 2)))
  `(primcall %* (const ,fx-max) (const 2)))

(check "a product that would overflow the fixnum range can never be reached"
  ;; both operands would have to exceed the window to overflow, and those are
  ;; refused -- so no fold can produce a non-fixnum
  (simplify `(primcall %* (const 1152921504606847) (const 1000)))
  `(primcall %* (const 1152921504606847) (const 1000)))

(check "comparisons outside the window are refused too"
  (simplify `(primcall %< (const ,(+ lim 1)) (const 0)))
  `(primcall %< (const ,(+ lim 1)) (const 0)))

(check "a large constant still PROPAGATES (copying needs no window)"
  (simplify `(let ([x.0 (const ,fx-max)]) (call f x.0)))
  `(call f (const ,fx-max)))

;; ---- rule 3: dead bindings ----------------------------------------------

(printf "\ndead bindings\n")

(check "an unreferenced lambda binding is dropped"
  (simplify '(letrec ([used.0 (lambda () (const 1))]
                      [dead.1 (lambda () (const 2))])
               (call used.0)))
  '(const 1))

(check "a dead self-recursive binding is dropped"
  (simplify '(letrec ([loop.0 (lambda (n.1) (call loop.0 n.1))]) (const 9)))
  '(const 9))

(check "an unreferenced binding with an effectful rhs is KEPT"
  (simplify '(let ([x.0 (call display (const 1))]) (const 2)))
  '(let ([x.0 (call display (const 1))]) (const 2)))

(check "a mutually recursive dead pair is dropped by inlining then dropping"
  ;; a.0's one use is b.1's body, so it inlines there; that leaves b.1 merely
  ;; self-recursive and unreferenced, which rule 3 then drops.  The fixed-point
  ;; loop is what turns two rules that each see nothing into a full removal.
  (simplify '(letrec ([a.0 (lambda () (call b.1))] [b.1 (lambda () (call a.0))])
               (const 0)))
  '(const 0))

(check "a mutually recursive LIVE pair is kept intact"
  (simplify '(letrec ([even?.0 (lambda (n.1) (call odd?.2 n.1))]
                      [odd?.2 (lambda (n.3) (call even?.0 n.3))])
               (primcall %+ (call even?.0 x) (call odd?.2 y))))
  '(letrec ([even?.0 (lambda (n.1) (call odd?.2 n.1))]
            [odd?.2 (lambda (n.3) (call even?.0 n.3))])
     (primcall %+ (call even?.0 x) (call odd?.2 y))))

;; ---- the rules compose ---------------------------------------------------

(printf "\ncomposition\n")

(check "a chain of single-use helpers collapses in one call"
  (simplify '(letrec ([f.0 (lambda (a.1) (call g.2 (primcall %+ a.1 (const 1))))]
                      [g.2 (lambda (b.3) (primcall %* b.3 (const 10)))])
               (call f.0 (const 3))))
  '(const 40))

(check "a pass over an already-simplified term is a no-op"
  (let ([once (simplify '(letrec ([f.0 (lambda (n.1) (primcall %* n.1 n.1))])
                           (call f.0 (const 12))))])
    (list once (simplify once)))
  '((const 144) (const 144)))

(printf "\n~a passed, ~a failed\n" pass fail)
(exit (if (> fail 0) 1 0))
