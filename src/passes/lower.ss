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
;;;     (app f (arg ...))
;;;
;;; A variable reference becomes (local x) if bound in the current code, else
;;; (free-ref i) into the current closure's environment.

(define *code-defs* '())
(define (add-code! def) (set! *code-defs* (cons def *code-defs*)))

;; The current compilation unit's library name (change: module-resolution-scaffold),
;; threaded in by lower-program as module state alongside `*code-defs*`.  Lifted
;; code-block labels are named through it via `mangle`; the program unit is the
;; empty prefix, so its labels stay "code_N" (byte-identity).
(define *unit* program-unit)

;; a fresh, unit-qualified code-block label: "code_N" for the program unit,
;; "L:code_N" for a library unit.
(define (fresh-code-label) (mangle *unit* (fresh-label "code")))

;; `unit` is the compilation unit's library name (a list of symbol parts); the
;; program unit is `program-unit` (empty prefix).  It is optional so the pass
;; tests that call (lower-program e) still get the program unit.
(define (lower-program e . opt)
  (set! *code-defs* '())
  (set! *unit* (if (null? opt) program-unit (car opt)))
  (let ([entry (lower e '() '() #f)])       ; top level: no locals, no free vars, no self
    `(program ,(reverse *code-defs*) ,entry)))

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
    [(global-set! ,s ,rhs) `(global-set! ,s ,(L rhs))]
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
       `(make-closure ,label ,(map (lambda (v) (lower v locals fmap self)) fvs)))]
    [(closures ,cbinds ,body)                            ; letrec group -> closure-block
     (let* ([xs (map car cbinds)]
            [locals2 (append xs locals)]
            [entries
             (map (lambda (b)
                    (match (caddr b)
                      [(lambda ,params ,lbody)
                       (let ([fvs (free-vars (caddr b))]
                             [label (fresh-code-label)])
                         (hoist-code! label params lbody fvs (car b))  ; self-name = binding
                         ;; captures lowered in the group scope (siblings visible)
                         (list (car b) label
                               (map (lambda (v) (lower v locals2 fmap self)) fvs)))]))
                  cbinds)])
       `(closure-block ,entries ,(lower body locals2 fmap self)))]
    [(apply ,f . ,args) `(apply-app ,(L f) ,(map L args))]
    [(call ,f . ,args)
     ;; B-self: a call whose operator is the enclosing function's own name, not
     ;; shadowed by a local binding, is a self-call -> a direct call to its code
     ;; label reusing the current closure ptr as self (see emit `self-app`).  The
     ;; self-reference is still captured (free-var indices are unchanged); the
     ;; direct call simply bypasses that capture.  Everything else stays an
     ;; indirect (app ...) call.
     (if (and self (symbol? f) (eq? f (car self)) (not (memq f locals)))
         `(self-app ,(cdr self) ,(map L args))
         `(app ,(L f) ,(map L args)))]))

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
