;;; simplify.ss (change: simplify-known-calls) -- the ladder's first OPTIMIZING
;;; pass.  Every other pass is a translation: it changes representation and hands
;;; on the same amount of work.  This one removes work, by three rules:
;;;
;;;   1. inline a known, singly-referenced lambda binding into its one call site
;;;   2. propagate immediate constants and fold primcalls over constants
;;;   3. drop bindings left with no references
;;;
;;; Applied to `(letrec ([square (lambda (n) (primcall %* n n))]) (call square (const 34)))`
;;; the three collapse the whole program to `(const 1156)` -- no closure record,
;;; no indirect call, no multiply.
;;;
;;; PLACEMENT: after `convert-assignments`, before `convert-closures`.  That is the
;;; one point in the ladder where `set!` is already gone (assigned variables have
;;; been boxed into box/unbox/set-box! primcalls) but lambdas are still lambdas.
;;; Because every variable the pass can see is therefore IMMUTABLE, both
;;; substitution rules are valid with no assignment analysis of their own.  A `set!`
;;; node reaching this pass would break that reasoning, so there is deliberately no
;;; `set!` clause below: it fails loudly rather than silently miscompiling.
;;;
;;; PRECONDITION: the alpha-renamed IL produced by `rename-program` (every binder
;;; distinct).  The traversals below are shadow-aware anyway -- a binder that
;;; rebinds the name under study hides it -- but inlining moves a lambda body
;;; INWARD, and only alpha-renaming guarantees no intervening binder captures one
;;; of its free variables.

;; ---- the foldable window -----------------------------------------------
;; A fold must never produce a value the runtime could not have produced, and the
;; compiler is SELF-HOSTED: when emit compiles emit, this arithmetic runs on
;; emit's own fixnums, which wrap silently (rt_add/rt_sub/rt_mul: no overflow
;; check, no bignums).  So the pass may not compute a result and range-check it
;; afterwards -- it would be checking an already-wrapped value.
;;
;; Rather than pre-checking each operation against the fixnum boundary, fold only
;; operands small enough that NO operation can leave the range.  TWO ceilings
;; apply, and the lower one wins:
;;
;;   arithmetic -- fixnums are a 61-bit signed payload (3 tag bits;
;;     src/runtime/runtime.c), so operands within +/-(2^30 - 1) give a largest
;;     product of (2^30-1)^2 = 2^60 - 2^31 + 1, just under the 2^60 - 1 maximum.
;;
;;   encoding -- a folded result must also survive being EMITTED.  This ceiling
;;     used to be the lower of the two and briefly clamped the window to
;;     +/-(2^28 - 1): `encode-const` built the tagged word as `(* d 8)` in the
;;     compiler's own arithmetic, which overflowed for |d| >= 2^57 (GitHub issue
;;     #7).  That is fixed -- encode-const now multiplies in decimal -- so the
;;     encodable range is the full fixnum range and the arithmetic ceiling binds
;;     again.  The unit tests still pin the encoding property explicitly, so if
;;     that ever regresses the window fails loudly instead of miscompiling.
;;
;; This is deliberately a SUFFICIENT condition, not an exact one: a fold whose
;; result would fit but whose operands are larger is simply left for the runtime.
;; The failure mode is "folds less", never "folds wrong" -- and unlike an exact
;; boundary test, it needs no fixnum-boundary literal anywhere in this file.  That
;; independence is worth keeping even now that issue #7 is fixed: it is what let
;; this pass stay correct while the emitter could not represent its own bounds.
(define sfy-fold-limit 1073741823)              ; 2^30 - 1

(define (sfy-foldable? d)
  (and (integer? d) (exact? d)
       (<= d sfy-fold-limit)
       (>= d (- 0 sfy-fold-limit))))

;; ---- which constants may be duplicated ---------------------------------
;; Propagating a constant copies it to every use site, so it is restricted to the
;; IMMEDIATES -- the data `encode-const` turns into an inline operand with no
;; emission.  A string, pair, or flonum constant materializes at run time
;; (rt_make_string / rt_cons / rt_flonum_lit), so duplicating it would allocate a
;; second object: extra code, and for a string it would break `eq?` between two
;; references that used to name one object.  Symbols are eq?-safe (rt_intern) but
;; still cost a call per site, so they are excluded too.  Note this is a different
;; question from the folding window above: a propagated constant is COPIED, never
;; computed, so any exact integer the program already contains is fine here.
(define (sfy-immediate? d)
  (or (and (integer? d) (exact? d))
      (boolean? d)
      (char? d)
      (null? d)))

(define (sfy-const-foldable? e)                ; an IL node holding a foldable int
  (and (pair? e) (eq? (car e) 'const) (sfy-foldable? (cadr e))))

;; ---- constant folding --------------------------------------------------
;; Only the binary integer primitives whose runtime behavior is exactly defined
;; (src/runtime/runtime.c) are folded, and only when both operands are constants
;; inside the foldable window above.  `/`, `quotient`, `modulo` and the flonum
;; paths are left alone: they trap or contaminate, and the runtime stays the
;; single definition of numeric semantics.
(define (sfy-fold op args)
  (let ([node `(primcall ,op ,@args)])
    (if (and (pair? args) (pair? (cdr args)) (null? (cddr args))
             (sfy-const-foldable? (car args)) (sfy-const-foldable? (cadr args)))
        (let ([a (cadr (car args))] [b (cadr (cadr args))])
          (cond
            [(eq? op '%+) `(const ,(+ a b))]
            [(eq? op '%-) `(const ,(- a b))]
            [(eq? op '%*) `(const ,(* a b))]
            [(eq? op '%=) `(const ,(= a b))]
            [(eq? op '%<) `(const ,(< a b))]
            [else node]))
        node)))

;; ---- occurrence survey -------------------------------------------------
;; Every occurrence of `x` in `e`, as a list: the symbol `ref` for an ordinary
;; reference, an integer N for a use as the operator of an N-argument `call`.
;; Shadow-aware: a binder that rebinds x hides the binding under study.
(define (sfy-uses x e)
  (define (u e) (sfy-uses x e))
  (define (u* es) (fold-left append '() (map u es)))
  (define (hides? xs) (mem? x xs))
  (match e
    [(const ,d) '()]
    [,y (guard (symbol? y)) (if (eq? y x) '(ref) '())]
    [(global-ref ,s) '()]
    [(global-set! ,s ,rhs) (u rhs)]
    [(if ,a ,b ,c) (u* (list a b c))]
    [(seq ,a ,b) (u* (list a b))]
    [(primcall ,op . ,args) (u* args)]
    [(lambda ,params ,body) (if (hides? (param-names params)) '() (u body))]
    [(let ,binds ,body)                        ; rhs's are in the OUTER scope
     (append (u* (map cadr binds))
             (if (hides? (map car binds)) '() (u body)))]
    [(letrec ,binds ,body)                     ; rhs's are in the letrec's scope
     (if (hides? (map car binds))
         '()
         (append (u* (map cadr binds)) (u body)))]
    [(apply ,f . ,args) (u* (cons f args))]
    [(call ,f . ,args)
     (append (if (eq? f x) (list (length args)) (u f)) (u* args))]))

;; ---- rewriting one name ------------------------------------------------
;; Rewrite every VISIBLE occurrence of `x` in `e`.  `on-ref` returns the
;; replacement for a bare reference; `on-app` receives the already-rewritten
;; argument list and returns the replacement for a `(call x arg ...)` node, or #f
;; to leave the call shape alone (its operator is then rewritten through
;; `on-ref`).  Shadow-aware, exactly like sfy-uses.
(define (sfy-rewrite x on-ref on-app e)
  (define (r e) (sfy-rewrite x on-ref on-app e))
  (define (r-binds bs) (map (lambda (b) (list (car b) (r (cadr b)))) bs))
  (define (hides? xs) (mem? x xs))
  (match e
    [(const ,d) e]
    [,y (guard (symbol? y)) (if (eq? y x) (on-ref) y)]
    [(global-ref ,s) e]
    [(global-set! ,s ,rhs) `(global-set! ,s ,(r rhs))]
    [(if ,a ,b ,c) `(if ,(r a) ,(r b) ,(r c))]
    [(seq ,a ,b) `(seq ,(r a) ,(r b))]
    [(primcall ,op . ,args) `(primcall ,op ,@(map r args))]
    [(lambda ,params ,body)
     (if (hides? (param-names params)) e `(lambda ,params ,(r body)))]
    [(let ,binds ,body)
     `(let ,(r-binds binds)
        ,(if (hides? (map car binds)) body (r body)))]
    [(letrec ,binds ,body)
     (if (hides? (map car binds))
         e
         `(letrec ,(r-binds binds) ,(r body)))]
    [(apply ,f . ,args) `(apply ,(r f) ,@(map r args))]
    [(call ,f . ,args)
     (let ([as (map r args)])
       (if (eq? f x)
           (let ([rep (on-app as)]) (if rep rep `(call ,(on-ref) ,@as)))
           `(call ,(r f) ,@as)))]))

;; ---- binding groups ----------------------------------------------------
(define (sfy-let kind binds body)              ; a group with no bindings is its body
  (if (null? binds) body (list kind binds body)))

(define (sfy-effect-free? rhs)                 ; safe to drop unreferenced
  (and (pair? rhs) (or (eq? (car rhs) 'lambda) (eq? (car rhs) 'const))))

(define (sfy-fixed-params? params)             ; proper list => fixed arity
  (and (list? params) (not (param-rest params))))

;; Rules 1-3 over one `let`/`letrec` group, whose parts have already been
;; simplified.  The two kinds differ in exactly one way that matters here: a
;; let's right-hand sides are evaluated in the OUTER scope, so the bound names
;; are not visible in them; a letrec's are visible throughout the group.
(define (sfy-bind kind binds body)
  (let loop ([todo binds] [kept '()] [body body])
    (if (null? todo)
        (sfy-let kind (reverse kept) body)
        (let* ([b    (car todo)]
               [x    (car b)]
               [rhs  (cadr b)]
               [rest (cdr todo)]
               [rec? (eq? kind 'letrec)]
               ;; where x is visible, EXCLUDING its own right-hand side: a
               ;; letrec binding referenced only from inside itself is dead.
               [sibs (if rec? (map cadr (append (reverse kept) rest)) '())]
               [uses (fold-left append '()
                       (map (lambda (n) (sfy-uses x n)) (append sibs (list body))))]
               [self (if rec? (sfy-uses x rhs) '())])
          (cond
            ;; RULE 1 -- inline a known, singly-referenced lambda.  The single
            ;; occurrence must be an operator of matching fixed arity, and there
            ;; must be no self-reference (which is what excludes every recursive
            ;; function, with no separate recursion test).  Single-use means the
            ;; body MOVES rather than being copied, so this can never duplicate
            ;; code or grow the output.
            [(and (pair? rhs) (eq? (car rhs) 'lambda)
                  (sfy-fixed-params? (cadr rhs))
                  (null? self)
                  (pair? uses) (null? (cdr uses))
                  (equal? (car uses) (length (cadr rhs))))
             (let* ([params (cadr rhs)]
                    [lbody  (caddr rhs)]
                    [on-ref (lambda () x)]     ; unreachable: the one use is the call
                    [on-app (lambda (as) (sfy-let 'let (map list params as) lbody))]
                    [sub    (lambda (n) (sfy-rewrite x on-ref on-app n))])
               (loop (if rec? (map (lambda (bb) (list (car bb) (sub (cadr bb)))) rest) rest)
                     (if rec? (map (lambda (bb) (list (car bb) (sub (cadr bb)))) kept) kept)
                     (sub body)))]
            ;; RULE 2a -- propagate an immediate constant to its use sites.
            [(and (pair? rhs) (eq? (car rhs) 'const) (sfy-immediate? (cadr rhs)))
             (let* ([on-ref (lambda () rhs)]
                    [on-app (lambda (as) #f)]  ; keep the (erroneous) call shape
                    [sub    (lambda (n) (sfy-rewrite x on-ref on-app n))])
               (loop (if rec? (map (lambda (bb) (list (car bb) (sub (cadr bb)))) rest) rest)
                     (if rec? (map (lambda (bb) (list (car bb) (sub (cadr bb)))) kept) kept)
                     (sub body)))]
            ;; RULE 3 -- drop an unreferenced binding whose right-hand side is
            ;; syntactically effect-free.  This is what removes the closure
            ;; allocation, not merely the work the closure guarded.
            [(and (null? uses) (sfy-effect-free? rhs))
             (loop rest kept body)]
            [else (loop rest (cons b kept) body)])))))

;; ---- the pass ----------------------------------------------------------
;; One bottom-up rewrite: simplify the children, then apply the rules at this
;; node.  `set!` has no clause on purpose (see the header).
(define (sfy e)
  (match e
    [(const ,d) e]
    [,x (guard (symbol? x)) x]
    [(global-ref ,s) e]
    [(global-set! ,s ,rhs) `(global-set! ,s ,(sfy rhs))]
    [(if ,a ,b ,c) `(if ,(sfy a) ,(sfy b) ,(sfy c))]
    [(seq ,a ,b) `(seq ,(sfy a) ,(sfy b))]
    [(primcall ,op . ,args) (sfy-fold op (map sfy args))]
    [(lambda ,params ,body) `(lambda ,params ,(sfy body))]
    [(let ,binds ,body)
     (sfy-bind 'let (map (lambda (b) (list (car b) (sfy (cadr b)))) binds) (sfy body))]
    [(letrec ,binds ,body)
     (sfy-bind 'letrec (map (lambda (b) (list (car b) (sfy (cadr b)))) binds) (sfy body))]
    [(apply ,f . ,args) `(apply ,(sfy f) ,@(map sfy args))]
    [(call ,f . ,args) `(call ,(sfy f) ,@(map sfy args))]))

;; Each rule can expose work for the others -- inlining creates a `let` of
;; constants, folding empties a binding, dropping it can strand the next one --
;; and a chain of calls needs one round per link.  Rather than ordering the rules
;; cleverly in a single traversal, run the whole rewrite to a fixed point.  The
;; cap is a runaway guard, not a tuning knob: the pass is a pure function of the
;; term, so the same input reaches the same fixed point in the same number of
;; rounds on every host and every door (the cross-door byte-identity guarantee).
(define sfy-max-rounds 10)

(define (simplify e)
  (let loop ([e e] [n 0])
    (let ([e2 (sfy e)])
      (cond
        [(equal? e2 e) e2]
        [(>= n sfy-max-rounds) e2]
        [else (loop e2 (+ n 1))]))))
