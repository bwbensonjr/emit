;;; lower.ss (tasks 3.4 lambda-lift + 3.5 closure/allocation lowering)
;;;
;;; Hoists every lambda's code to a top-level definition and turns closures into
;;; explicit heap allocation.  Output "L-code":
;;;
;;;   (program (code-def ...) entry-expr)
;;;   code-def = (code label self (fixed ...) rest body)  ; self = closure ptr (arg0)
;;;             rest = a name (variadic callee) or #f (fixed arity)
;;;   expr =
;;;     (const d) | (local x) | (free-ref i)
;;;     (if e e e) | (seq e e) | (primcall op e ...) | (let ([x e] ...) e)
;;;     (make-closure label (cap ...))                 ; acyclic closure
;;;     (closure-block ([x label (cap ...)] ...) body) ; letrec group (two-phase)
;;;     (app f (arg ...))                              ; unknown callee: load its code ptr
;;;     (known-app label f (arg ...))                  ; known callee: call the label
;;;     (self-app label (arg ...))                     ; known callee == self: reuse %self
;;;
;;; A variable reference becomes (local x) if bound in the current code, else
;;; (free-ref i) into the current closure's environment.

(define *code-defs* '())
(define (add-code! def) (set! *code-defs* (cons def *code-defs*)))

;; Statically-known closures: name -> code label, for every closure-block binding
;; in the unit (P5-B-general).  A call whose operator is one of these needs no
;; code-pointer load -- the label is known here -- though the closure value is
;; still passed as the callee's `self`.
;;
;; Keyed by NAME, which is sound because the IL is alpha-renamed before this pass:
;; a name identifies its binding, so no scope tracking is needed and a stale entry
;; from an out-of-scope group can never be reached by a well-scoped call.
;;
;; This rule cannot fire in the REPL, which is why it needs no closed-world
;; carve-out: there a top-level name lowers to `(global-ref ...)`, not a
;; closure-block binding, so redefinition keeps working exactly as before.
(define *known-closures* '())
(define (known-closure x) (assq x *known-closures*))
(define (add-known! xs labels)
  (set! *known-closures* (append (map cons xs labels) *known-closures*)))

;; Imported library procedures whose code label this unit may name: an alist of
;; (mangled-symbol label arity rest?), from the import tables of the unit being
;; compiled.  A call whose operator is a `(global-ref sym)` found here, with an
;; argument count equal to a fixed arity or at least a variadic minimum, is
;; direct-called exactly like a known closure-block binding.  Anything else -- an
;; arity mismatch, a value export, an unimported global -- keeps the indirect path,
;; so an arity error still traps where it always did (changes:
;; cross-unit-direct-calls, cross-unit-variadic-direct-calls).
;;
;; This is per-UNIT state, not per-form: a library or program is lowered one
;; top-level form at a time, so `lower-program` must NOT clear it.  Every core entry
;; point sets it instead (compile-forms to '(), compile-library*/
;; compile-program-with-imports to their imports', the REPL to the session's), which
;; is what keeps one compilation's table from leaking into the next.
;;
;; Soundness rests on a library global being assigned once, by its unit's __init,
;; and never reassigned -- see design D4.  That holds on BOTH doors: a unit's
;; globals are stored only by its own per-define __init_N thunks, `set!` on a
;; own top-level binding, or on an imported one, is a compile error (issue #5 made a
;; REPL SESSION global assignable, and deliberately stopped there), and a REPL
;; redefinition allocates a
;; fresh PROGRAM global (x.gN) rather than touching the library's slot.  A future
;; library-reload feature would have to revisit this.
(define *import-calls* '())
(define (set-import-calls! alist) (set! *import-calls* alist))
(define (known-import sym n)
  (let ([p (assq sym *import-calls*)])
    (and p
         (if (cadddr p) (>= n (caddr p)) (= n (caddr p)))
         (cadr p))))

;; The current compilation unit's library name (change: module-resolution-scaffold),
;; threaded in by lower-program as module state alongside `*code-defs*`.  Lifted
;; code-block labels are named through it via `mangle`; the program unit is the
;; empty prefix, so its labels stay "code_N" (byte-identity).
(define *unit* program-unit)

;; a fresh, unit-qualified code-block label: "code_N" for the program unit,
;; "L:code_N" for a library unit.
(define (fresh-code-label) (mangle *unit* (fresh-label "code")))

;; --- stable labels for library top-level procedures (change:
;;     cross-unit-direct-calls, design D1) ------------------------------------
;; A code label taken from the gensym counter is not knowable by an importer: the
;; AOT tree-shake recompiles a unit against a root set derived from the very
;; program that must name the callee, and a pruned unit lowers fewer forms, so the
;; counter has reached a different value by the time a kept binding is lowered
;; (`zero?` was scheme.base:code_168 whole and scheme.base:code_216 pruned).  A
;; library TOP-LEVEL binding whose initializer is a lambda therefore gets
;; "<unit>:code:<internal-name>" -- mangled through the same function as its value
;; symbol, so it inherits that symbol's determinism and is identical whole or
;; pruned.  Inner lambdas, anonymous lambdas, and every program-unit label keep the
;; counter untouched (`*unit*` is the empty prefix off the library path).
(define (stable-code-label s)
  (mangle *unit* (string-append "code:" (symbol->string s))))

;; The unit's exported-procedure call interface, accumulated as the stable labels
;; above are handed out: (internal-name label arity [rest]) per top-level lambda
;; binding.  `arity` is exact without the marker and the minimum with it (change:
;; cross-unit-variadic-direct-calls).  compile-library* reads this back to fill the
;; export table's call rows, so what the table advertises is exactly what was
;; emitted rather than a re-derivation from the source.  It spans a whole unit --
;; lower-program runs once per top-level form -- so the unit driver resets it, not
;; lower-program.
(define *unit-procs* '())
(define (reset-unit-procs!) (set! *unit-procs* '()))
(define (add-unit-proc! name label arity rest?)
  (set! *unit-procs*
        (cons (if rest?
                  (list name label arity 'rest)
                  (list name label arity))
              *unit-procs*)))

;; The top-level names this unit ASSIGNS (change: library-toplevel-set, issue #14).
;; A unit may `set!` its own top-level binding, so its slot can hold a different
;; closure after __init -- and an importer that direct-called the label recorded
;; above would keep running the code the slot held at link time.  The export table
;; is the ONLY channel by which an importer learns a label, so withholding the row
;; is what keeps the direct call sound; that is the invariant design D4 of
;; cross-unit-direct-calls now rests on, in place of the old blanket prohibition.
;; Recorded by `assign-global` as it resolves each form, and read below.
(define *unit-assigned* '())
(define (reset-unit-assigned!) (set! *unit-assigned* '()))
(define (add-unit-assigned! name)
  (set! *unit-assigned* (cons name *unit-assigned*)))
(define (unit-assigned? name) (and (memq name *unit-assigned*) #t))

;; The unit's advertised call interface: the rows above MINUS every assigned name.
;; Filtering at the single reader -- `export-call-rows` runs once per unit, after
;; every form is lowered -- is what makes a pre-pass unnecessary: the assigned set
;; is complete by the time the table is built, whichever order the forms came in
;; (design D1).  The withheld binding's code is still emitted under its stable
;; label (its define's `make-closure` needs it); the label just stops being
;; published, exactly as for a non-procedure export.
(define (unit-procs)
  (reverse (filter (lambda (p) (not (unit-assigned? (car p)))) *unit-procs*)))

;; `unit` is the compilation unit's library name (a list of symbol parts); the
;; program unit is `program-unit` (empty prefix).  It is optional so the pass
;; tests that call (lower-program e) still get the program unit.
;;
;; `definition?` (second optional, default #t) says whether this form is a top-level
;; DEFINITION, whose `global-set!` is an initializer entitled to the stable,
;; name-derived code label -- as opposed to a COMMAND, whose `global-set!` is an
;; ordinary assignment (change: library-body-declarations).  It defaults to #t because
;; every caller that predates commands passes a define or runs in the program unit,
;; where the stable-label path is inert (`*unit*` is the empty prefix).
(define (lower-program e . opt)
  (set! *code-defs* '())
  (set! *known-closures* '())
  (set! *unit* (if (null? opt) program-unit (car opt)))
  (let* ([definition? (or (null? opt) (null? (cdr opt)) (cadr opt))]
         [entry (lower-top e definition?)])  ; top level: no locals, no free vars, no self
    `(program ,(reverse *code-defs*) ,entry)))

;; One lowered top-level form's SPINE (change: library-toplevel-set): the
;; `global-set!` nodes that are this unit's top-level binding initializers, and the
;; `seq` chain a define-record-type expands into (several mutually-visible top-level
;; bindings in one form).  Only these positions get the stable, name-derived label.
;;
;; Position, not shape, is what tells a top-level initializer apart from an ordinary
;; store.  Now that a unit can `set!` its own top level, `(set! f (lambda ...))` in a
;; procedure body is ALSO a `global-set!` of `f` with a lambda rhs -- and if `lower`
;; still routed it through `lower-global-init` it would claim `L:code:f` a second
;; time and emit a duplicate function definition.  `locals`/`fmap` cannot separate
;; them: a nullary procedure that captures nothing is lowered with the same empty
;; ones as the top level.  So the spine is walked explicitly here and `lower`'s
;; `global-set!` arm just lowers its rhs (design D2 of library-toplevel-set).
;;
;; Position is not sufficient on its own, though.  Once a library body may contain
;; COMMANDS (change: library-body-declarations), a top-level `(set! f (lambda ...))`
;; is a `global-set!` in the very same position as a define's initializer -- and it
;; would claim `L:code:f` a second time, the same duplicate definition, now reachable
;; from a library's top level.  Only a form that IS a definition may hand out the
;; stable label, which is what `definition?` carries down from the unit driver; a
;; command's spine lowers like any other expression.
(define (lower-top e definition?)
  (cond
    [(not definition?) (lower e '() '() #f)]
    [(and (pair? e) (eq? (car e) 'seq))
     `(seq ,(lower-top (cadr e) #t) ,(lower-top (caddr e) #t))]
    [(and (pair? e) (eq? (car e) 'global-set!))
     `(global-set! ,(cadr e) ,(lower-global-init (cadr e) (caddr e) '() '() #f))]
    [else (lower e '() '() #f)]))

;; lower expr in a code context: locals = names bound here; fmap = var -> env index.
;; `self` = (name . label) naming the enclosing function's self-binding and its code
;; label, or #f at the top level / in an anonymous lambda (change:
;; inline-fixnum-arith-and-self-calls) -- used to turn a self-call into a direct call.
(define (lower e locals fmap self)
  (define (L x) (lower x locals fmap self))
  (match e
    [(const ,d) `(const ,d)]
    [,x (guard (symbol? x))
        (cond
          [(memq x locals) `(local ,x)]
          [(assq x fmap) => (lambda (p) `(free-ref ,(cdr p)))]
          [else (error 'lower "unbound variable" x)])]
    [(global-ref ,s) `(global-ref ,s)]
    [(global-set! ,s ,rhs) `(global-set! ,s ,(L rhs))]   ; NESTED: see lower-top
    [(if ,a ,b ,c) `(if ,(L a) ,(L b) ,(L c))]
    [(seq ,a ,b) `(seq ,(L a) ,(L b))]
    [(primcall ,op . ,args) `(primcall ,op ,@(map L args))]
    [(let ,binds ,body)
     (let ([xs (map car binds)]
           [es (map (lambda (b) (L (cadr b))) binds)])   ; rhs in current scope
       `(let ,(map list xs es) ,(lower body (append xs locals) fmap self)))]
    [(lambda ,params ,body)                              ; standalone -> make-closure
     (let* ([fvs (free-vars e)]
            [label (fresh-code-label)])
       (hoist-code! label params body fvs #f)            ; anonymous: no self-name
       `(make-closure ,label ,(map-lr (lambda (v) (lower v locals fmap self)) fvs)))]
    [(closures ,cbinds ,body)                            ; letrec group -> closure-block
     ;; Labels for the whole group are allocated BEFORE any body is lowered, so a
     ;; mutually recursive sibling can be direct-called from a body compiled first
     ;; (P5-B-general).  This is why code labels are numbered per group rather than
     ;; interleaved with each body's temporaries.
     (let* ([xs (map car cbinds)]
            [locals2 (append xs locals)]
            [labels (map-lr (lambda (b) (fresh-code-label)) cbinds)]
            [ignored (add-known! xs labels)]
            [entries
             (map-lr2 (lambda (b label)
                    (match (caddr b)
                      [(lambda ,params ,lbody)
                       (let ([fvs (free-vars (caddr b))])
                         (hoist-code! label params lbody fvs (car b))  ; self-name = binding
                         ;; captures lowered in the group scope (siblings visible)
                         (list (car b) label
                               (map-lr (lambda (v) (lower v locals2 fmap self)) fvs)))]))
                  cbinds labels)])
       `(closure-block ,entries ,(lower body locals2 fmap self)))]
    [(apply ,f . ,args) `(apply-app ,(L f) ,(map L args))]
    [(call ,f . ,args)
     ;; B-self: a call whose operator is the enclosing function's own name, not
     ;; shadowed by a local binding, is a self-call -> a direct call to its code
     ;; label reusing the current closure ptr as self (see emit `self-app`).  The
     ;; self-reference is still captured (free-var indices are unchanged); the
     ;; direct call simply bypasses that capture.  Everything else stays an
     ;; indirect (app ...) call.
     ;; B-general: any other statically-known closure is called directly too, with
     ;; its own closure value as `self`.  A self-call stays a `self-app` because it
     ;; can reuse `%self` and skip loading the closure at all.
     ;; Cross-unit (change: cross-unit-direct-calls): an operator that resolved to an
     ;; IMPORTED binding with a recorded label and matching exact/minimum arity is the same shape --
     ;; the global is still loaded (it carries the captured environment) and passed as
     ;; the callee's self; only the code-pointer load out of it disappears.
     (let ([k (and (symbol? f) (known-closure f))]
           [g (and (pair? f) (eq? (car f) 'global-ref)
                   (known-import (cadr f) (length args)))])
       (cond
         [(and self (symbol? f) (eq? f (car self)) (not (memq f locals)))
          `(self-app ,(cdr self) ,(map L args))]
         [k `(known-app ,(cdr k) ,(L f) ,(map L args))]
         [g `(known-app ,g ,(L f) ,(map L args))]
         [else `(app ,(L f) ,(map L args))]))]))

;; The initializer of a top-level binding (change: cross-unit-direct-calls).  In a
;; LIBRARY unit a lambda initializer is hoisted under the stable, name-derived label
;; rather than a counter one and recorded with its exact or minimum arity as part of
;; the unit's call interface.  Everything else (a value initializer, and every
;; program/REPL-unit binding, where `*unit*` is the empty prefix) falls through to
;; the ordinary `lower`, so those paths are untouched.
;;
;; Reached only from `lower-top`, i.e. only for a `global-set!` on a form's top-level
;; spine; a nested one is an assignment, not an initializer, and must not take this
;; label (change: library-toplevel-set, design D2).
;;
;; This mirrors `lower`'s standalone-lambda arm exactly apart from the label: the
;; closure is still allocated and still captures the same free variables, since the
;; binding's VALUE is a runtime closure either way.  Only its code is now nameable
;; from another unit.
(define (lower-global-init s rhs locals fmap self)
  (if (and (not (null? *unit*)) (pair? rhs) (eq? (car rhs) 'lambda))
      (let* ([params (cadr rhs)]
             [body   (caddr rhs)]
             [fvs    (free-vars rhs)]
             [label  (stable-code-label s)])
        (add-unit-proc! s label (length (param-fixed params)) (param-rest params))
        (hoist-code! label params body fvs #f)     ; anonymous: no self-name
        `(make-closure ,label ,(map-lr (lambda (v) (lower v locals fmap self)) fvs)))
      (lower rhs locals fmap self)))

;; hoist a lambda body as a top-level code def; its body sees params (fixed +
;; rest) as locals and free vars via an index map matching the capture order.
;; The code def records the fixed params and the rest name (or #f) so emit can
;; build the rest list and arity-check.  `self-name` (or #f) is the function's own
;; name, so a self-call in the body can lower to a direct call to `label`.
(define (hoist-code! label params body fvs self-name)
  (let* ([self (fresh-name 'cp)]
         [fmap (let loop ([fvs fvs] [i 0] [acc '()])
                 (if (null? fvs) (reverse acc)
                     (loop (cdr fvs) (+ i 1) (cons (cons (car fvs) i) acc))))]
         [lbody (lower body (param-names params) fmap
                       (and self-name (cons self-name label)))])
    (add-code! `(code ,label ,self ,(param-fixed params) ,(param-rest params) ,lbody))))
