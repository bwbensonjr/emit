;;; expand.ss -- syntax-rules macro expander (source->source).
;;;
;;; Runs after collect-toplevel and before parse.  A fixpoint pass over a macro
;;; environment (collected from `define-syntax` forms in the prelude and the
;;; program): each macro use is rewritten by the first matching `syntax-rules`
;;; rule and the result re-expanded, until only core forms and known primitive
;;; heads remain.  The branching/binding derived forms (cond, and, or, when,
;;; unless, let*) now live in the prelude as syntax-rules macros; named `let` is
;;; still handled here because it overloads the core `let` keyword.  The n-ary
;;; arithmetic (+ - *) and comparison (= < > <= >= eq? eqv?) desugarings stay
;;; hand-written: they are arity-driven folds, not pattern rewrites.
;;;
;;; Hygiene: an identifier a template introduces that is not a pattern variable
;;; and does not name a known binding (core keyword, primitive, prelude/top-level
;;; define, or macro keyword) is consistently renamed to a fresh name per
;;; expansion, so a macro's temporaries can neither capture nor be captured.

(define *ellipsis* '...)
(define *wildcard* '_)

;; core forms recursed into structurally (never treated as macros).
;; quasiquote/unquote/unquote-splicing are intercepted by `exp` (rewritten to
;; core forms before parse); they appear here only so hygiene's `known` set
;; leaves them un-renamed.
(define *core-keywords* '(quote if lambda let letrec letrec* begin set! define apply
                          define-syntax syntax-rules
                          quasiquote unquote unquote-splicing))
;; comparison heads handled by the hand-written desugar but not in *prims*
(define *extra-op-keywords* '(> <= >=))

;; ---- macro environment ---------------------------------------------------
;; env: alist keyword -> (literals . rules); rules: list of (pattern . template)

(define (define-syntax-form? f)
  (and (pair? f) (eq? (car f) 'define-syntax)))

(define (parse-define-syntax f)          ; (define-syntax name (syntax-rules (lit ...) (pat tmpl) ...))
  (let ([name (cadr f)] [sr (caddr f)])
    (unless (and (pair? sr) (eq? (car sr) 'syntax-rules))
      (error 'expand "define-syntax requires a syntax-rules transformer" f))
    (cons name (cons (cadr sr)                          ; literals
                     (map (lambda (r) (cons (car r) (cadr r))) (cddr sr))))))

;; Scan the (prelude-first) top-level forms: lift define-syntax into a macro
;; environment, return (list macro-env remaining-runtime-forms).  define-syntax
;; is only recognized at the literal top level (compile-time only; none survive).
(define (collect-define-syntax forms)
  (let loop ([fs forms] [env '()] [runtime '()])
    (cond
      [(null? fs) (list (reverse env) (reverse runtime))]
      [(define-syntax-form? (car fs))
       (loop (cdr fs) (cons (parse-define-syntax (car fs)) env) runtime)]
      [else (loop (cdr fs) env (cons (car fs) runtime))])))

;; ---- syntax-rules matcher ------------------------------------------------
;; match-pat returns an alist var->value, or the `no-match` sentinel.  A leaf
;; pattern variable maps to the matched syntax; an ellipsis variable maps to an
;; `ell`-tagged list (one entry per repetition, itself a form or a nested ell).
(define no-match (list 'no-match))
(define ell-tag (list '<ellipsis>))
(define (make-ell xs) (cons ell-tag xs))
(define (ell? v) (and (pair? v) (eq? (car v) ell-tag)))
(define (ell-list v) (cdr v))

(define (proper-length x)                ; number of leading pairs
  (let loop ([x x] [n 0]) (if (pair? x) (loop (cdr x) (+ n 1)) n)))
(define (take-n xs n) (if (= n 0) '() (cons (car xs) (take-n (cdr xs) (- n 1)))))

;; pattern variables of a pattern (excluding literals / _ / ...), as (var . depth)
(define (pattern-vars pat literals)
  (let walk ([pat pat] [depth 0] [acc '()])
    (cond
      [(or (eq? pat *wildcard*) (eq? pat *ellipsis*)) acc]
      [(symbol? pat) (if (memq pat literals) acc (cons (cons pat depth) acc))]
      [(pair? pat)
       (if (and (pair? (cdr pat)) (eq? (cadr pat) *ellipsis*))
           (walk (cddr pat) depth (walk (car pat) (+ depth 1) acc))
           (walk (cdr pat) depth (walk (car pat) depth acc)))]
      [else acc])))

(define (match-pat pat form literals)
  (cond
    [(eq? pat *wildcard*) '()]
    [(symbol? pat)
     (if (memq pat literals)
         (if (eq? pat form) '() no-match)         ; literal: identical identifier
         (list (cons pat form)))]                 ; pattern variable
    [(null? pat) (if (null? form) '() no-match)]
    [(pair? pat)
     (if (and (pair? (cdr pat)) (eq? (cadr pat) *ellipsis*))
         (match-ellipsis (car pat) (cddr pat) form literals)
         (if (pair? form)
             (let ([m1 (match-pat (car pat) (car form) literals)])
               (if (eq? m1 no-match)
                   no-match
                   (let ([m2 (match-pat (cdr pat) (cdr form) literals)])
                     (if (eq? m2 no-match) no-match (append m1 m2)))))
             no-match))]
    [else (if (equal? pat form) '() no-match)]))   ; literal datum (number, etc.)

(define (match-ellipsis sub tailpat form literals)
  (let ([tail-len (proper-length tailpat)]
        [form-len (proper-length form)])
    (if (< form-len tail-len)
        no-match
        (let* ([rep-count (- form-len tail-len)]
               [reps (take-n form rep-count)]
               [rest (list-tail form rep-count)]
               [submatches (map (lambda (f) (match-pat sub f literals)) reps)])
          (if (memp (lambda (m) (eq? m no-match)) submatches)
              no-match
              (let* ([subvars (map car (pattern-vars sub literals))]
                     [ell (map (lambda (v)
                                 (cons v (make-ell
                                           (map (lambda (m) (cdr (assq v m))) submatches))))
                               subvars)]
                     [mt (match-pat tailpat rest literals)])
                (if (eq? mt no-match) no-match (append ell mt))))))))

;; ---- template instantiation + hygiene ------------------------------------
;; pattern vars occurring in a template (unique)
(define (template-vars t pvars)
  (cond
    [(symbol? t) (if (memq t pvars) (list t) '())]
    [(pair? t) (union (template-vars (car t) pvars) (template-vars (cdr t) pvars))]
    [else '()]))

;; introduced identifiers to rename: template symbols that are not pattern vars,
;; not ellipsis/wildcard, not known bindings, and not inside quote.
;;
;; A UNIT-QUALIFIED symbol is never one of them (change: library-macro-export).  A
;; transformer that arrives from an imported library carries template identifiers already
;; resolved in the library that defined it -- `mylib:helper` -- and renaming one would
;; break the reference that library resolved.  The test is structural rather than a
;; lookup in `known`: a colon is exactly the "belongs to some other unit" encoding
;; (`unit-qualified?`, src/util.scm), so this cannot be defeated by an incomplete
;; known-set, and a unit's own names never contain one.
(define (collect-renames tmpl pvars known)
  (let ([seen '()])
    (let walk ([t tmpl] [quoted? #f])
      (cond
        [(symbol? t)
         (when (and (not quoted?)
                    (not (memq t pvars))
                    (not (eq? t *ellipsis*)) (not (eq? t *wildcard*))
                    (not (memq t known))
                    (not (unit-qualified? t))
                    (not (assq t seen)))
           (set! seen (cons (cons t (fresh-name t)) seen)))]
        [(pair? t)
         (if (eq? (car t) 'quote)
             (for-each (lambda (x) (walk x #t)) (cdr t))
             (begin (walk (car t) quoted?) (walk (cdr t) quoted?)))]
        [else (if #f #f)]))
    seen))

;; ---- export-time resolution of an exported macro -------------------------
;; (change: library-macro-export, design D2/D3.)
;;
;; An exported macro is instantiated in the IMPORTER's scope, so every name its templates
;; mention must be resolved HERE, in the library that defines it: otherwise hygiene
;; renames the reference away in the importer and the expansion fails as an unbound
;; variable.  Resolving at export time is also what lets a template mention a name the
;; library does NOT export, with no widening of its public surface -- a library's private
;; top-level bindings are already externally linkable mangled globals.
;;
;; Classification order mirrors what the expander itself does, and the first arm is
;; load-bearing: `*core-keywords*` / `*prims*` / `*integrable*` / `*extra-op-keywords*`
;; are left alone BEFORE the unit's own bindings are consulted, so `(+ a b)` in a template
;; still reaches expand-arith's inline arithmetic in the importer rather than becoming a
;; call to a global named `+`.
;;
;; The LAST arm is the other load-bearing one: an identifier this pass cannot resolve is
;; left exactly as written.  Emit's hygiene is a name-set test with no syntax objects, so a
;; template-introduced temporary (`tmp` in `(let ((tmp a)) ...)`) and a reference to a name
;; nothing defines are indistinguishable here; leaving both alone means a macro that
;; expands correctly today cannot be broken by this pass.  It is also the whole of design
;; D5: a baked derived form (`when`, `cond`) falls through this arm and expands in the
;; importer against the baked set every door registers, so none of those transformers has
;; to be copied into a user library's interface.
;;
;; Returns the library's compile-time interface: (list <entries> <own-refs> <foreign-refs>).
(define (universally-known-id? s)
  (or (memq s *core-keywords*)
      (memq s *prims*)
      (memq s *extra-op-keywords*)
      (assq s *integrable*)
      (eq? s *ellipsis*)
      (eq? s *wildcard*)))

(define (resolve-exported-macros unit exports macro-env defined-names import-env-alist)
  (let ([entries '()]      ; resolved (keyword literals . rules), reverse order
        [seen    '()]      ; OUTPUT keywords already queued (dup/cycle guard)
        [queue   '()]      ; (external-keyword . internal-keyword) still to resolve
        [own     '()]      ; this unit's own internal names the templates reach
        [foreign '()])     ; other units' mangled symbols the templates reach, as strings
    ;; Keyed on the OUTPUT keyword, not the internal name: one internal macro may have to
    ;; travel under two keywords -- its external name (because it is exported) and its
    ;; unit-qualified spelling (because another template mentions it).  Keying on the
    ;; internal name would emit only the first and leave the second template referencing a
    ;; keyword no entry defines.  The output keywords are finite, so the drain terminates
    ;; even for mutually recursive macros.
    (define (enqueue! out internal)
      (unless (memq out seen)
        (set! seen (cons out seen))
        (set! queue (append queue (list (cons out internal))))))
    (define (note-own! s)
      (unless (memq s own) (set! own (cons s own))))
    (define (note-foreign! sym)
      (let ([str (symbol->string sym)])
        (unless (member str foreign) (set! foreign (cons str foreign)))))
    ;; one template identifier -> the spelling it resolves to in THIS library
    (define (resolve-id s)
      (cond
        [(universally-known-id? s) s]
        [(memq s defined-names) (note-own! s) (string->symbol (mangle unit s))]
        [(assq s macro-env)
         ;; a private macro travels hidden under a unit-qualified KEYWORD, transitively,
         ;; so an exported macro may be written on top of one (design D3)
         (let ([k (string->symbol (mangle unit s))]) (enqueue! k s) k)]
        [else
         (let ([imp (assq s import-env-alist)])
           (if imp
               (begin (note-foreign! (cdr imp)) (cdr imp))
               s))]))                                  ; design D4: leave it exactly as written
    ;; Rewrite one template, skipping pattern variables, LITERALS, and quoted data.  A
    ;; literal is matched by identity against the use site (`match-pat`), so rewriting one
    ;; would break the match in the importer -- which a library that happens to define a
    ;; top-level binding of the same name would otherwise cause.
    (define (resolve-template t pvars literals)
      (let walk ([t t] [quoted? #f])
        (cond
          [(symbol? t)
           (if (or quoted? (memq t pvars) (memq t literals)) t (resolve-id t))]
          [(pair? t)
           (if (eq? (car t) 'quote)
               (cons 'quote (walk (cdr t) #t))
               (cons (walk (car t) quoted?) (walk (cdr t) quoted?)))]
          [else t])))
    (define (resolve-entry out entry)                  ; entry = (name literals . rules)
      (let ([literals (cadr entry)])
        (cons out
              (cons literals
                    (map (lambda (r)
                           (let* ([pat (car r)]
                                  [pvars (map car (pattern-vars (cdr pat) literals))])
                             (cons pat (resolve-template (cdr r) pvars literals))))
                         (cddr entry))))))
    ;; seed from the exported macros: an export's EXTERNAL name is the keyword an
    ;; importer sees, so a renamed macro export needs nothing further (design D2).
    (for-each (lambda (e) (when (assq (cdr e) macro-env) (enqueue! (car e) (cdr e))))
              exports)
    ;; drain: resolving a template may discover a private macro, which joins the queue
    (let loop ()
      (unless (null? queue)
        (let ([job (car queue)])
          (set! queue (cdr queue))
          (set! entries (cons (resolve-entry (car job) (assq (cdr job) macro-env)) entries))
          (loop))))
    (list (reverse entries) (reverse own) (reverse foreign))))

(define (instantiate tmpl binds pvars renames quoted?)
  (cond
    [(symbol? tmpl)
     (cond
       [(memq tmpl pvars)
        (let ([v (cdr (assq tmpl binds))])
          (when (ell? v)
            (error 'expand "pattern variable used at wrong ellipsis depth" tmpl))
          v)]
       [quoted? tmpl]
       [(assq tmpl renames) => cdr]
       [else tmpl])]
    [(pair? tmpl)
     (cond
       [(eq? (car tmpl) 'quote)
        (cons 'quote (instantiate-seq (cdr tmpl) binds pvars renames #t))]
       [(and (eq? (car tmpl) *ellipsis*)                ; (... <tmpl>) ellipsis escape
             (pair? (cdr tmpl)) (null? (cddr tmpl)))
        (instantiate-escaped (cadr tmpl) binds pvars renames quoted?)]
       [else (instantiate-seq tmpl binds pvars renames quoted?)])]
    [else tmpl]))

;; (... <tmpl>) escape: instantiate <tmpl> with every `...` treated as a literal
;; identifier (never a repetition marker); pattern variables still substitute.
(define (instantiate-escaped tmpl binds pvars renames quoted?)
  (cond
    [(eq? tmpl *ellipsis*) *ellipsis*]
    [(symbol? tmpl)
     (cond
       [(memq tmpl pvars)
        (let ([v (cdr (assq tmpl binds))])
          (when (ell? v)
            (error 'expand "pattern variable used at wrong ellipsis depth" tmpl))
          v)]
       [quoted? tmpl]
       [(assq tmpl renames) => cdr]
       [else tmpl])]
    [(pair? tmpl)
     (if (eq? (car tmpl) 'quote)
         (cons 'quote (instantiate-escaped (cdr tmpl) binds pvars renames #t))
         (cons (instantiate-escaped (car tmpl) binds pvars renames quoted?)
               (instantiate-escaped (cdr tmpl) binds pvars renames quoted?)))]
    [else tmpl]))

(define (instantiate-seq tmpls binds pvars renames quoted?)
  (cond
    [(null? tmpls) '()]
    [(not (pair? tmpls)) (instantiate tmpls binds pvars renames quoted?)]   ; dotted tail
    [(and (pair? (cdr tmpls)) (eq? (cadr tmpls) *ellipsis*))
     (append (expand-ellipsis (car tmpls) binds pvars renames quoted?)
             (instantiate-seq (cddr tmpls) binds pvars renames quoted?))]
    [else
     (cons (instantiate (car tmpls) binds pvars renames quoted?)
           (instantiate-seq (cdr tmpls) binds pvars renames quoted?))]))

(define (expand-ellipsis sub binds pvars renames quoted?)
  (let ([ctrl (filter (lambda (v) (let ([p (assq v binds)]) (and p (ell? (cdr p)))))
                      (template-vars sub pvars))])
    (when (null? ctrl)
      (error 'expand "ellipsis template has no matching pattern variable" sub))
    (let* ([lists (map (lambda (v) (ell-list (cdr (assq v binds)))) ctrl)]
           [n (length (car lists))])
      (for-each (lambda (l) (unless (= (length l) n)
                              (error 'expand "mismatched ellipsis match lengths" sub)))
                lists)
      (let loop ([i 0] [acc '()])
        (if (= i n)
            (reverse acc)
            (let ([binds2 (append (map (lambda (v l) (cons v (list-ref l i))) ctrl lists)
                                  binds)])
              (loop (+ i 1)
                    (cons (instantiate sub binds2 pvars renames quoted?) acc))))))))

;; ---- the fixpoint driver -------------------------------------------------
(define *macro-depth-limit* 1000)

(define (expand e macro-env known)
  (define (macro-lookup h) (and (symbol? h) (assq h macro-env)))

  (define (apply-macro entry form)   ; entry = (name literals . rules)
    (let ([literals (cadr entry)] [rules (cddr entry)])
      (let loop ([rules rules])
        (if (null? rules)
            (error 'expand "no matching syntax-rules pattern for macro use" form)
            (let* ([pat (caar rules)] [tmpl (cdar rules)]
                   [m (match-pat (cdr pat) (cdr form) literals)])  ; ignore keyword slot
              (if (eq? m no-match)
                  (loop (cdr rules))
                  (let* ([pvars (map car (pattern-vars (cdr pat) literals))]
                         [renames (collect-renames tmpl pvars known)])
                    (instantiate tmpl m pvars renames #f))))))))

  (define (exp1 e) (exp e 0))

  (define (exp e depth)
    (when (> depth *macro-depth-limit*)
      (error 'expand "macro expansion did not terminate (depth limit exceeded)" e))
    (if (not (pair? e))
        e                                        ; atoms/symbols/literals unchanged
        (let ([h (car e)])
          (cond
            [(eq? h 'quote) e]                    ; do not descend into quoted data
            [(eq? h 'quasiquote)                  ; rewrite, then re-expand the unquoted holes
             (exp1 (qq (cadr e) 1))]
            [(memq h '(unquote unquote-splicing))
             (error 'expand "unquote/unquote-splicing outside quasiquote" e)]
            [(macro-lookup h) => (lambda (entry) (exp (apply-macro entry e) (+ depth 1)))]
            [(eq? h 'lambda) `(lambda ,(cadr e) ,@(map exp1 (cddr e)))]
            [(eq? h 'let)
             (if (symbol? (cadr e))               ; named let (overloads core `let`)
                 (exp1 (rewrite-named-let (cadr e) (caddr e) (cdddr e)))
                 `(let ,(map bind-exp (cadr e)) ,@(map exp1 (cddr e))))]
            ;; letrec and letrec* expand identically and are DISTINGUISHED here only
            ;; so the post-expand dump still shows the form the user wrote; parse
            ;; maps both to the one `letrec` IL node (see src/parse.ss).
            [(memq h '(letrec letrec*))
             `(,h ,(map bind-exp (cadr e)) ,@(map exp1 (cddr e)))]
            [(memq h '(+ - * /)) (expand-arith exp1 h (cdr e))]
            [(eq? h 'string-append) (expand-string-append exp1 (cdr e))]
            ;; `string=?` is n-ary in R7RS 6.7.  It joins the chain here rather than
            ;; becoming a variadic prelude procedure (the route char=? took), because a
            ;; prelude define of an integrable name shadows the primitive for EVERY
            ;; arity -- the two-argument call would lose its bare primcall, and the
            ;; compiler's own reader leans on it.
            [(memq h '(= < > <= >= eq? eqv? string=?)) (expand-compare exp1 h (cdr e))]
            [else (map exp1 e)]))))               ; if/begin/set!/apply/primcall/application

  (define (bind-exp b) (list (car b) (exp1 (cadr b))))

  (exp e 0))

;; named let: (let name ([x e] ...) body ...) ->
;;   (letrec ([name (lambda (x ...) body ...)]) (name e ...))
(define (rewrite-named-let name binds body)
  `(letrec ([,name (lambda ,(map car binds) ,@body)])
     (,name ,@(map cadr binds))))

;; quasiquote: rewrite a quasiquoted datum `d` at nesting `level` into core forms
;; (cons/append/list/quote).  Unquoted expressions are emitted as-is; the caller
;; re-expands the whole result, so they are expanded within the fixpoint (D2).
;; This is the standard R7RS quasiquote algorithm restricted to list structure.
(define (qq d level)
  (cond
    ;; The `(pair? (cdr d))` / `(pair? (cdr (car d)))` guards ensure a datum is
    ;; treated as (unquote/unquote-splicing/quasiquote X) only when it is a proper
    ;; (kw . (X)) form.  A bare `(unquote)`/`(quasiquote)` symbol appearing as list
    ;; *data* (e.g. `` `(quote unquote) ``) falls through to the general-pair arm
    ;; and is reproduced structurally instead of crashing in `cadr` (gap G6).
    [(and (pair? d) (eq? (car d) 'unquote) (pair? (cdr d)))  ; (unquote x)
     (if (= level 1)
         (cadr d)                                          ; level 1: splice the expression
         `(list (quote unquote) ,(qq (cadr d) (- level 1))))]  ; nested: keep structurally
    [(and (pair? d) (eq? (car d) 'unquote-splicing) (pair? (cdr d)))  ; bare (u-s x)
     (if (= level 1)
         (error 'expand "unquote-splicing not in list context" d)
         `(list (quote unquote-splicing) ,(qq (cadr d) (- level 1))))]
    [(and (pair? d) (eq? (car d) 'quasiquote) (pair? (cdr d)))  ; nested qq: level+1
     `(list (quote quasiquote) ,(qq (cadr d) (+ level 1)))]
    [(and (pair? d) (pair? (car d))                       ; list with leading splice
          (eq? (car (car d)) 'unquote-splicing) (pair? (cdr (car d))) (= level 1))
     `(append ,(cadr (car d)) ,(qq (cdr d) level))]
    [(pair? d)                                            ; general pair
     `(cons ,(qq (car d) level) ,(qq (cdr d) level))]
    [else `(quote ,d)]))                                  ; atom / () / boolean

;; ---- hand-written arithmetic / comparison desugaring ---------------------
;; N-ary arithmetic -> nested binary forms.  Operands are expanded first, then
;; left-folded so operands evaluate left-to-right and `-` subtracts in order.
;; Identities: (+) -> 0, (*) -> 1, (- a) -> (- 0 a).  Two-operand forms reduce
;; to (op a b) unchanged.
(define (expand-arith exp1 op args)
  (let ([xs (map exp1 args)])
    (case op
      [(+) (cond [(null? xs) 0]
                 [(null? (cdr xs)) (car xs)]
                 [else (fold-arith op xs)])]
      [(*) (cond [(null? xs) 1]
                 [(null? (cdr xs)) (car xs)]
                 [else (fold-arith op xs)])]
      [(-) (cond [(null? xs) (error 'expand "(-) requires at least one argument")]
                 [(null? (cdr xs)) `(- 0 ,(car xs))]
                 [else (fold-arith op xs)])]
      ;; `/` mirrors `-`: `(/ a)` is the reciprocal `(/ 1 a)`, `(/ a b ...)` folds
      ;; left; `(/)` is an error.  (change: inexact-numbers)
      [(/) (cond [(null? xs) (error 'expand "(/) requires at least one argument")]
                 [(null? (cdr xs)) `(/ 1 ,(car xs))]
                 [else (fold-arith op xs)])])))

(define (fold-arith op xs)
  (let loop ([acc (list op (car xs) (cadr xs))] [rest (cddr xs)])
    (if (null? rest) acc (loop (list op acc (car rest)) (cdr rest)))))

;; N-ary `string-append` -> left-folded binary primcalls (the runtime op is
;; binary), mirroring the arithmetic fold.  Identities: () -> "", one arg -> that
;; arg.  A bare `string-append` in value position is handled separately by the
;; parser (the self-contained `str` fold over raw primcalls -- see *integrable*;
;; the old eta over the prelude's `%str-concat` was retired).  This only rewrites
;; the direct-call form the core uses pervasively in `emit.ss`.
(define (expand-string-append exp1 args)
  (let ([xs (map exp1 args)])
    (cond [(null? xs) ""]
          [(null? (cdr xs)) (car xs)]
          [else (fold-arith 'string-append xs)])))

;; N-ary comparisons -> single-evaluation chained pairwise comparisons.  Each
;; operand is bound to a fresh temp (so <=/>= may reference it twice), then the
;; short-circuiting conjunction of adjacent pairwise tests is built.  Fewer than
;; two operands compare true.
(define (expand-compare exp1 op args)
  (let ([xs (map exp1 args)])
    (if (or (null? xs) (null? (cdr xs)))
        #t
        (let ([temps (map (lambda (x) (fresh-name 'cmp)) xs)])
          (bind-temps temps xs (compare-chain op temps))))))

(define (bind-temps temps exprs body)
  (if (null? temps)
      body
      `(let ([,(car temps) ,(car exprs)])
         ,(bind-temps (cdr temps) (cdr exprs) body))))

(define (compare-chain op temps)
  (and-core
    (let loop ([ts temps])
      (if (null? (cdr ts))
          '()
          (cons (cmp-pair op (car ts) (cadr ts)) (loop (cdr ts)))))))

(define (and-core ps)
  (cond [(null? ps) #t]
        [(null? (cdr ps)) (car ps)]
        [else `(if ,(car ps) ,(and-core (cdr ps)) #f)]))

(define (cmp-pair op x y)
  (case op
    [(=)    `(= ,x ,y)]
    [(<)    `(< ,x ,y)]
    [(>)    `(< ,y ,x)]
    [(<=)   `(if (< ,x ,y) #t (= ,x ,y))]
    [(>=)   `(if (< ,y ,x) #t (= ,x ,y))]
    [(eq?)  `(eq? ,x ,y)]
    [(eqv?) `(eqv? ,x ,y)]
    [(string=?) `(string=? ,x ,y)]))
