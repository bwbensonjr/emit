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

;; A TOP-LEVEL DEFINE DISPLACES A KEYWORD OF THE SAME NAME (change:
;; binding-aware-expander, issue #103; design D3).  A keyword is a binding, so
;; `(define (when x) ...)` makes `when` a variable and every later use of it an ordinary
;; call -- which requires dropping the transformer, since the expander would otherwise
;; rewrite the call before anything looked at the binding.
;;
;; user-wins, exactly as `with-prelude` (src/core.ss) already resolves a define-vs-define
;; collision by dropping the prelude's; this closes the define-vs-SYNTAX combination that
;; was missing.  Prunes imported keywords as well as the scope's own, because both arrive
;; in one `macro-env`.
;;
;; Callers that fold their whole top level into a letrec before expanding (a program, via
;; `collect-toplevel`) already get this from `exp`'s letrec arm -- the names are lexical
;; bindings by then.  It is the per-form paths that need it: a library body form and a
;; REPL form are each expanded on their own, with no enclosing letrec to put the name in
;; scope.  Pruning uniformly is what makes those three paths agree (dev->ship fidelity).
;;
;; A collision inside our OWN sources would silently delete a macro we depend on, so it is
;; a checked build invariant rather than a hope: test/macro-shadow-check.sh.
(define (prune-shadowed-macros macro-env defined-names)
  (let loop ([es macro-env] [acc '()])
    (cond
      [(null? es) (reverse acc)]
      [(memq (caar es) defined-names) (loop (cdr es) acc)]
      [else (loop (cdr es) (cons (car es) acc))])))

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

;; THE LITERALS LIST OUTRANKS `_` AND `...` (R7RS 4.3.2, issue #80).  An identifier named
;; in a rule's literals list matches only itself, even when it is spelled `_` or `...` --
;; so the literals test has to come BEFORE the two special-identifier readings, in every
;; place the distinction is made.  Testing `_` first is what let a pattern match input the
;; rule was written to reject, silently: with `_` a literal, `(_ _ _)` requires two literal
;; `_` arguments, and matching `a b` against it answers 2 where R7RS says fall through.
;; Four sites decide this -- these two functions, each in its symbol arm and its ellipsis
;; arm -- and they move together because they are one question; a matcher and a
;; variable-collector that disagree about what `...` means would be worse than either bug.
;; Inert for every rule whose literals list is empty or names neither identifier, which is
;; every macro in the compiler's own sources.
(define (ellipsis-at? pat literals)      ; is (cadr pat) a repetition marker, not a literal?
  (and (pair? (cdr pat))
       (eq? (cadr pat) *ellipsis*)
       (not (memq *ellipsis* literals))))

;; pattern variables of a pattern (excluding literals / _ / ...), as (var . depth)
(define (pattern-vars pat literals)
  (let walk ([pat pat] [depth 0] [acc '()])
    (cond
      [(and (symbol? pat) (memq pat literals)) acc]
      [(or (eq? pat *wildcard*) (eq? pat *ellipsis*)) acc]
      [(symbol? pat) (cons (cons pat depth) acc)]
      [(pair? pat)
       (if (ellipsis-at? pat literals)
           (walk (cddr pat) depth (walk (car pat) (+ depth 1) acc))
           (walk (cdr pat) depth (walk (car pat) depth acc)))]
      [else acc])))

;; A LITERAL DOES NOT MATCH AN IDENTIFIER BOUND AT THE USE SITE (R7RS 4.3.2, issue #92).
;; R7RS compares a literal by BINDING, not by spelling: where the program has bound the
;; auxiliary keyword as a variable, the identifier at the use site is an ordinary
;; reference and the literal-bearing rule must not match -- matching falls through to the
;; following rules, which is what makes `(let ((=> #f)) (cond (#t => 'ok)))` answer `ok`
;; instead of applying the clause body to the test value.  `bound` is the use site's
;; lexical bindings, threaded from `exp`.
;;
;; The test comes LAST, after the literals membership and the `eq?`, so it costs nothing
;; on any form that was not going to match anyway (design D5).  `pattern-vars` takes no
;; `bound`: it inspects the PATTERN, where a use site's bindings mean nothing.
;;
;; This models the use site only.  A literal rebound in the transformer's own definition
;; environment is not tracked -- that needs the syntax objects this expander does not have
;; (recorded as a non-goal in the macro-system spec, not as an oversight).
(define (match-pat pat form literals bound)
  (cond
    [(and (symbol? pat) (memq pat literals))
     (if (and (eq? pat form) (not (memq form bound))) '() no-match)]
    [(eq? pat *wildcard*) '()]
    [(symbol? pat) (list (cons pat form))]        ; pattern variable
    [(null? pat) (if (null? form) '() no-match)]
    [(pair? pat)
     (if (ellipsis-at? pat literals)
         (match-ellipsis (car pat) (cddr pat) form literals bound)
         (if (pair? form)
             (let ([m1 (match-pat (car pat) (car form) literals bound)])
               (if (eq? m1 no-match)
                   no-match
                   (let ([m2 (match-pat (cdr pat) (cdr form) literals bound)])
                     (if (eq? m2 no-match) no-match (append m1 m2)))))
             no-match))]
    [else (if (equal? pat form) '() no-match)]))   ; literal datum (number, etc.)

(define (match-ellipsis sub tailpat form literals bound)
  (let ([tail-len (proper-length tailpat)]
        [form-len (proper-length form)])
    (if (< form-len tail-len)
        no-match
        (let* ([rep-count (- form-len tail-len)]
               [reps (take-n form rep-count)]
               [rest (list-tail form rep-count)]
               [submatches (map (lambda (f) (match-pat sub f literals bound)) reps)])
          (if (memp (lambda (m) (eq? m no-match)) submatches)
              no-match
              (let* ([subvars (map car (pattern-vars sub literals))]
                     [ell (map (lambda (v)
                                 (cons v (make-ell
                                           (map (lambda (m) (cdr (assq v m))) submatches))))
                               subvars)]
                     [mt (match-pat tailpat rest literals bound)])
                (if (eq? mt no-match) no-match (append ell mt))))))))

;; ---- template instantiation + hygiene ------------------------------------
;; pattern vars occurring in a template (unique)
(define (template-vars t pvars)
  (let ([seen (quote ())])
    (let walk ([t t])
      (cond
        [(symbol? t) (if (memq t pvars) (list t) (quote ()))]
        [(pair? t)
         (if (memq t seen)
             (quote ())
             (begin
               (set! seen (cons t seen))
               (union (walk (car t)) (walk (cdr t)))))]
        [else (quote ())]))))

;; A quoted template can be reused as an object graph only when it contains no
;; ellipsis escape.  Even without pattern variables, (... <template>) is active
;; syntax-rules template syntax and must be instantiated.
(define (template-ellipsis-escape? t)
  (let ([seen (quote ())])
    (let walk ([t t])
      (cond
        [(not (pair? t)) #f]
        [(memq t seen) #f]
        [else
         (set! seen (cons t seen))
         (or (and (eq? (car t) *ellipsis*)
                  (pair? (cdr t))
                  (null? (cddr t)))
             (walk (car t))
             (walk (cdr t)))]))))

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
             ;; No introduced identifier exists inside quoted data.  Treating it
             ;; atomically also lets a labelled cyclic constant remain a graph.
             (if #f #f)
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
               ;; Export-time name resolution never rewrites quoted data.  Reuse
               ;; its graph so sharing/back-edges survive into the artifact.
               t
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
        ;; A quoted constant with no pattern variables is already the exact
        ;; object graph the expansion needs.  Reusing its tail preserves datum-
        ;; labelled cycles and sharing instead of recursively copying forever.
        (if (and (null? (template-vars (cdr tmpl) pvars))
                 (not (template-ellipsis-escape? (cdr tmpl))))
            (cons 'quote (cdr tmpl))
            (cons 'quote (instantiate-seq (cdr tmpl) binds pvars renames #t)))]
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
         (if (and (null? (template-vars (cdr tmpl) pvars))
                  (not (template-ellipsis-escape? (cdr tmpl))))
             (cons 'quote (cdr tmpl))
             (cons 'quote (instantiate-escaped (cdr tmpl) binds pvars renames #t)))
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

;; ---- the lexically bound identifiers at a point in the traversal ----------
;; (change: binding-aware-expander, issue #103.)  `exp` threads the set of identifiers
;; bound as VARIABLES where it is looking, because two of its decisions are about what an
;; identifier means and neither can be made from the spelling alone: whether a head names
;; a macro (`macro-lookup`) and whether a use-site identifier matches a `syntax-rules`
;; literal (`match-pat`).  Before this the pass carried only a recursion depth, so a
;; binding could not shadow a keyword -- `(let ((when f)) (when 5))` expanded the MACRO,
;; silently, since `(when 5)` is a legal use of it with an empty body.
;;
;; A LIST, threaded, not a global or a hash table: the pass is pure and its scopes are
;; sibling-recursive, so a mutated global would need save/restore at every arm.
;;
;; The list is NOT always short, and the reason is worth knowing before optimizing it:
;; `collect-toplevel` runs before this pass and folds a program's whole top level into one
;; letrec, so from inside that fold `bound` holds every top-level name -- ~800 of them when
;; the compiler compiles itself.  That is exactly why `macro-lookup` tests `macro-env`
;; FIRST and consults `bound` only on a hit (design D5): the membership scan happens only
;; where a head really does name a macro, never on the every-pair-head path.  Measured: a
;; post-edit `make regen` converged at iteration 2 in 16m47s, inside its ~22-minute
;; expectation, so the threading costs nothing observable.
;;
;; The formals of a `lambda`: a proper list, a dotted list whose tail is the rest
;; parameter, or a bare symbol.  Anything else is malformed and is left to `parse`, which
;; reports it in the frontend's own style -- this must not be the pass that dies on it.
(define (add-formals formals bound)
  (let loop ([f formals] [acc bound])
    (cond
      [(symbol? f) (cons f acc)]                 ; rest parameter (or a bare-symbol formal)
      [(pair? f) (loop (cdr f) (if (symbol? (car f)) (cons (car f) acc) acc))]
      [else acc])))

;; The names a BODY's internal definitions bind.  `parse` turns internal defines into a
;; letrec, so they are in scope for the whole body -- including the forms written before
;; the define -- which is why the scan runs before any body form is expanded.  Defensive
;; about shape on purpose: this runs on user syntax, and a malformed `define` belongs to
;; `parse`'s diagnostics, not to a `car` of the empty list in here (cf. issue #91).
(define (add-body-defines forms bound)
  (let loop ([fs forms] [acc bound])
    (if (not (pair? fs))
        acc
        (let ([f (car fs)])
          (loop (cdr fs)
                (if (and (pair? f) (eq? (car f) 'define) (pair? (cdr f)))
                    (let ([sig (cadr f)])
                      (cond [(symbol? sig) (cons sig acc)]
                            [(and (pair? sig) (symbol? (car sig))) (cons (car sig) acc)]
                            [else acc]))
                    acc))))))

;; ---- the fixpoint driver -------------------------------------------------
(define *macro-depth-limit* 1000)

(define (expand e macro-env known)
  ;; A BINDING SHADOWS A KEYWORD (R7RS 4.2/5.3, issue #103).  A macro keyword is a
  ;; binding like any other, so an identifier bound as a variable at the point of use is
  ;; not a keyword there and the form is an ordinary application.
  ;;
  ;; ORDER MATTERS (design D5): `assq` on the small macro alist runs first and `memq` on
  ;; `bound` only on a HIT -- i.e. only where the head really does name a macro, which is
  ;; rare and where the work about to happen is far larger.  Testing `bound` first would
  ;; put a list scan on the hottest path in the pass (every pair head of every form).
  (define (macro-lookup h bound)
    (and (symbol? h)
         (let ([entry (assq h macro-env)])
           (and entry (not (memq h bound)) entry))))

  (define (apply-macro entry form bound)   ; entry = (name literals . rules)
    (let ([literals (cadr entry)] [rules (cddr entry)])
      (let loop ([rules rules])
        (if (null? rules)
            (error 'expand "no matching syntax-rules pattern for macro use" form)
            (let* ([pat (caar rules)] [tmpl (cdar rules)]
                   ;; ignore keyword slot; `bound` narrows the literals (issue #92)
                   [m (match-pat (cdr pat) (cdr form) literals bound)])
              (if (eq? m no-match)
                  (loop (cdr rules))
                  (let* ([pvars (map car (pattern-vars (cdr pat) literals))]
                         ;; `known`, NOT `known` + `bound`: this asks whether a TEMPLATE
                         ;; identifier is introduced and so must be renamed, and that
                         ;; answer must not depend on the use site.  A template temporary
                         ;; sharing a name with a local at the use site would otherwise
                         ;; stop being renamed and start capturing it -- the exact
                         ;; failure hygiene exists to prevent (design D2).
                         [renames (collect-renames tmpl pvars known)])
                    (instantiate tmpl m pvars renames #f))))))))

  (define (exp1 e bound) (exp e 0 bound))
  (define (exp* es bound) (map (lambda (x) (exp1 x bound)) es))

  ;; a body: its internal defines bind for the whole body, then each form expands
  (define (exp-body forms bound)
    (let ([b (add-body-defines forms bound)])
      (exp* forms b)))

  (define (exp e depth bound)
    (when (> depth *macro-depth-limit*)
      (error 'expand "macro expansion did not terminate (depth limit exceeded)" e))
    (if (not (pair? e))
        e                                        ; atoms/symbols/literals unchanged
        (let ([h (car e)])
          (cond
            [(eq? h 'quote) e]                    ; do not descend into quoted data
            [(eq? h 'quasiquote)                  ; rewrite, then re-expand the unquoted holes
             (exp1 (qq (cadr e) 1) bound)]
            [(memq h '(unquote unquote-splicing))
             (error 'expand "unquote/unquote-splicing outside quasiquote" e)]
            [(macro-lookup h bound)
             => (lambda (entry) (exp (apply-macro entry e bound) (+ depth 1) bound))]
            [(eq? h 'lambda)
             `(lambda ,(cadr e) ,@(exp-body (cddr e) (add-formals (cadr e) bound)))]
            [(eq? h 'let)
             (if (symbol? (cadr e))               ; named let (overloads core `let`)
                 ;; the loop NAME is bound in the body: `rewrite-named-let` produces a
                 ;; letrec, so the arm below adds it -- no special case needed here
                 (exp1 (rewrite-named-let (cadr e) (caddr e) (cdddr e)) bound)
                 ;; initializers see the OUTER scope; only the body sees the names
                 `(let ,(map (lambda (b) (bind-exp b bound)) (cadr e))
                    ,@(exp-body (cddr e) (add-formals (map bind-name (cadr e)) bound))))]
            ;; letrec and letrec* expand identically and are DISTINGUISHED here only
            ;; so the post-expand dump still shows the form the user wrote; parse
            ;; maps both to the one `letrec` IL node (see src/parse.ss).
            ;; The names are in scope for the INITIALIZERS as well as the body.
            [(memq h '(letrec letrec*))
             (let ([inner (add-formals (map bind-name (cadr e)) bound)])
               `(,h ,(map (lambda (b) (bind-exp b inner)) (cadr e))
                    ,@(exp-body (cddr e) inner)))]
            [(memq h '(+ - * /)) (expand-arith (lambda (x) (exp1 x bound)) h (cdr e))]
            [(eq? h 'string-append)
             (expand-string-append (lambda (x) (exp1 x bound)) (cdr e))]
            ;; `string=?` is n-ary in R7RS 6.7.  It joins the chain here rather than
            ;; becoming a variadic prelude procedure (the route char=? took), because a
            ;; prelude define of an integrable name shadows the primitive for EVERY
            ;; arity -- the two-argument call would lose its bare primcall, and the
            ;; compiler's own reader leans on it.
            [(memq h '(= < > <= >= eq? eqv? string=?))
             (expand-compare (lambda (x) (exp1 x bound)) h (cdr e))]
            [else (exp* e bound)]))))             ; if/begin/set!/apply/primcall/application

  (define (bind-exp b bound) (list (car b) (exp1 (cadr b) bound)))

  (exp e 0 '()))

;; a binding's name, tolerating a malformed clause (parse reports that, not this pass)
(define (bind-name b) (if (pair? b) (car b) b))

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
