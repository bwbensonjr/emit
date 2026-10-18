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
(define *core-keywords*
  '(quote if lambda let letrec letrec* begin set! define apply define-syntax
    syntax-rules quasiquote unquote unquote-splicing))
;; comparison heads handled by the hand-written desugar but not in *prims*
(define *extra-op-keywords* '(> <= >=))

;; ---- macro environment ---------------------------------------------------
;; env: alist keyword -> (literals . rules); rules: list of (pattern . template)

(define (define-syntax-form? f) (and (pair? f) (eq? (car f) 'define-syntax)))

(define (parse-define-syntax
         f) ; (define-syntax name (syntax-rules (lit ...) (pat tmpl) ...))
  (let ([name (cadr f)] [sr (caddr f)])
    (unless (and (pair? sr) (eq? (car sr) 'syntax-rules))
      (error 'expand "define-syntax requires a syntax-rules transformer" f))
    (cons name
          (cons (cadr sr) ; literals
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
;; scope.  Pruning uniformly is what makes those three compilation paths agree (dev->ship fidelity).
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

(define (proper-length x) ; number of leading pairs
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
(define (ellipsis-at? pat literals) ; is (cadr pat) a repetition marker, not a literal?
  (and (pair? (cdr pat)) (eq? (cadr pat) *ellipsis*) (not (memq *ellipsis* literals))))

;; pattern variables of a pattern (excluding literals / _ / ...), as (var . depth)
(define (pattern-vars pat literals)
  (let walk ([pat pat] [depth 0] [acc '()])
    (cond
      [(and (symbol? pat) (memq pat literals)) acc]
      [(or (eq? pat *wildcard*) (eq? pat *ellipsis*)) acc]
      [(symbol? pat) (cons (cons pat depth) acc)]
      [(pair? pat) (if (ellipsis-at? pat literals)
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
    [(symbol? pat) (list (cons pat form))] ; pattern variable
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
    [else (if (equal? pat form) '() no-match)])) ; literal datum (number, etc.)

(define (match-ellipsis sub tailpat form literals bound)
  (let ([tail-len (proper-length tailpat)] [form-len (proper-length form)])
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
                                 (cons v
                                       (make-ell (map (lambda (m) (cdr (assq v m)))
                                                      submatches))))
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
              (begin (set! seen (cons t seen)) (union (walk (car t)) (walk (cdr t)))))]
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
        [else (set! seen (cons t seen))
              (or (and (eq? (car t) *ellipsis*) (pair? (cdr t)) (null? (cddr t)))
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
        [(symbol? t) (when (and (not quoted?)
                                (not (memq t pvars))
                                (not (eq? t *ellipsis*))
                                (not (eq? t *wildcard*))
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
;; expands correctly today cannot be broken by this pass. The optional import callback
;; distinguishes an imported transformer from an unresolved identifier, records its
;; dependency for forwarding, and returns the hidden keyword that the template uses.
;;
;; Returns the library's compile-time interface: (list <entries> <own-refs> <foreign-refs>).
(define (universally-known-id? s)
  (or (memq s *core-keywords*)
      (memq s *prims*)
      (memq s *extra-op-keywords*)
      (assq s *integrable*)
      (eq? s *ellipsis*)
      (eq? s *wildcard*)))

(define (resolve-exported-macros-legacy unit exports macro-env defined-names
         import-env-alist . opt)
  (let ([entries '()] ; resolved (keyword literals . rules), reverse order
        [seen '()]    ; OUTPUT keywords already queued (dup/cycle guard)
        [queue '()]   ; (external-keyword . internal-keyword) still to resolve
        [own '()]     ; this unit's own internal names the templates reach
        [foreign '()] ; other units' mangled symbols the templates reach, as strings
        [import-macro (if (pair? opt) (car opt) (lambda (s) #f))])
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
    (define (note-own! s) (unless (memq s own) (set! own (cons s own))))
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
        [(import-macro s) => (lambda (k) k)]
        [else (let ([imp (assq s import-env-alist)])
                (if imp
                    (begin (note-foreign! (cdr imp)) (cdr imp))
                    s))])) ; design D4: leave it exactly as written
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
    (define (resolve-entry out entry) ; entry = (name literals . rules)
      (let ([literals (cadr entry)])
        (cons out
              (cons literals
                    (map-lr
                      (lambda (r)
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
          (set! entries
            (cons (resolve-entry (car job) (assq (cdr job) macro-env)) entries))
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
        [(and (eq? (car tmpl) *ellipsis*) ; (... <tmpl>) ellipsis escape
              (pair? (cdr tmpl))
              (null? (cddr tmpl)))
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
    [(not (pair? tmpls)) (instantiate tmpls binds pvars renames quoted?)] ; dotted tail
    [(and (pair? (cdr tmpls)) (eq? (cadr tmpls) *ellipsis*))
      (append (expand-ellipsis (car tmpls) binds pvars renames quoted?)
              (instantiate-seq (cddr tmpls) binds pvars renames quoted?))]
    [else (cons (instantiate (car tmpls) binds pvars renames quoted?)
                (instantiate-seq (cdr tmpls) binds pvars renames quoted?))]))

(define (expand-ellipsis sub binds pvars renames quoted?)
  (let ([ctrl (filter (lambda (v) (let ([p (assq v binds)]) (and p (ell? (cdr p)))))
                      (template-vars sub pvars))])
    (when (null? ctrl)
      (error 'expand "ellipsis template has no matching pattern variable" sub))
    (let* ([lists (map (lambda (v) (ell-list (cdr (assq v binds)))) ctrl)]
           [n (length (car lists))])
      (for-each (lambda (l)
                  (unless (= (length l) n)
                    (error 'expand "mismatched ellipsis match lengths" sub)))
                lists)
      (let loop ([i 0] [acc '()])
        (if
          (= i n)
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
      [(symbol? f) (cons f acc)] ; rest parameter (or a bare-symbol formal)
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
                      (cond
                        [(symbol? sig) (cons sig acc)]
                        [(and (pair? sig) (symbol? (car sig))) (cons (car sig) acc)]
                        [else acc]))
                    acc))))))

;; ---- include and cond-expand inside bodies (change: portable-library-surface) ----
;; Is F a form whose head is one of the three that splice?  Only the head is tested; the
;; caller decides what a local binding of the keyword means.  The splicing itself is in
;; src/core.ss, beside the include reader and the feature table it needs.
(define (splicing-form? f)
  (and (pair? f) (memq (car f) (quote (include include-ci cond-expand))) #t))

(define (any-splicing-form? fs)
  (and (pair? fs) (or (splicing-form? (car fs)) (any-splicing-form? (cdr fs)))))

;; ---- the fixpoint driver -------------------------------------------------
(define *macro-depth-limit* 1000)

(define (expand-legacy e macro-env known)
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
         (let ([entry (assq h macro-env)]) (and entry (not (memq h bound)) entry))))

  (define (apply-macro entry form bound) ; entry = (name literals . rules)
    (let ([literals (cadr entry)] [rules (cddr entry)])
      (let loop ([rules rules])
        (if (null? rules)
            (error 'expand "no matching syntax-rules pattern for macro use" form)
            (let* ([pat (caar rules)]
                   [tmpl (cdar rules)]
                   ;; ignore keyword slot; `bound` narrows the literals (issue #92)
                   [m (match-pat (cdr pat) (cdr form) literals bound)])
              (if
                (eq? m no-match)
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
  ;; Expansion allocates fresh names: host map visitation order must not leak
  ;; into quoted introduced symbols, lambda order, or serialized artifacts.
  (define (exp* es bound) (map-lr (lambda (x) (exp1 x bound)) es))

  ;; a body: its internal defines bind for the whole body, then each form expands
  ;; ...after its include and cond-expand forms are spliced (change:
  ;; portable-library-surface, design D9), so an included definition is an internal
  ;; definition of this body.  The splice itself is the core's (splice-body-forms), and
  ;; it is reached only when a body has such a form, so this pass still runs without it.
  (define (exp-body forms0 bound)
    (let* ([forms
             (if (any-splicing-form? forms0)
                 (splice-body-forms forms0 bound (lambda (h) (macro-lookup h bound)))
                 forms0)]
           [b (add-body-defines forms bound)])
      ;; A procedure signature is binding syntax, not an application to expand.
      ;; Normalize internal defines so their initializer follows the lambda path
      ;; with its formals bound, including dotted and rest-only signatures (#128).
      (map-lr
        (lambda (f)
          (if (and (pair? f) (eq? (car f) 'define) (pair? (cdr f)))
              (let ([nd (normalize-define f)]) `(define ,(car nd) ,(exp1 (cadr nd) b)))
              (exp1 f b)))
        forms)))

  (define (exp e depth bound)
    (when (> depth *macro-depth-limit*)
      (error 'expand "macro expansion did not terminate (depth limit exceeded)" e))
    (if
      (not (pair? e))
      e ; atoms/symbols/literals unchanged
      (let ([h (car e)])
        (cond
          [(eq? h 'quote) e] ; do not descend into quoted data
          ;; The advertised feature list as a constant -- the body of (scheme base)'s
          ;; `features` (change: portable-library-surface, design D10).
          [(eq? h '%advertised-features) (list 'quote *advertised-features*)]
          [(eq? h 'quasiquote) ; rewrite, then re-expand the unquoted holes
            (exp1 (qq (cadr e) 1) bound)]
          [(memq h '(unquote unquote-splicing))
            (error 'expand "unquote/unquote-splicing outside quasiquote" e)]
          [(macro-lookup h bound)
            =>
            (lambda (entry) (exp (apply-macro entry e bound) (+ depth 1) bound))]
          ;; include / include-ci / cond-expand in EXPRESSION position behave as `begin`
          ;; over what they contribute (R7RS 4.1.7, 4.2.1); a local binding of the
          ;; keyword shadows it, as it shadows a macro.
          [(and (splicing-form? e) (not (memq h bound)))
            (let ([fs (splice-body-forms (list e)
                                         bound
                                         (lambda (k) (macro-lookup k bound)))])
              (exp (if (null? fs) (quote (if #f #f)) (cons 'begin fs)) depth bound))]
          [(eq? h 'lambda) `(lambda ,(cadr e)
                              ,@(exp-body (cddr e) (add-formals (cadr e) bound)))]
          [(eq? h 'let)
            (if (symbol? (cadr e)) ; named let (overloads core `let`)
                ;; the loop NAME is bound in the body: `rewrite-named-let` produces a
                ;; letrec, so the arm below adds it -- no special case needed here
                (exp1 (rewrite-named-let (cadr e) (caddr e) (cdddr e)) bound)
                ;; initializers see the OUTER scope; only the body sees the names
                `(let ,(map-lr (lambda (b) (bind-exp b bound)) (cadr e))
                      ,@(exp-body (cddr e)
                                  (add-formals (map bind-name (cadr e)) bound))))]
          ;; letrec and letrec* expand identically and are DISTINGUISHED here only
          ;; so the post-expand dump still shows the form the user wrote; parse
          ;; maps both to the one `letrec` IL node (see src/parse.ss).
          ;; The names are in scope for the INITIALIZERS as well as the body.
          [(memq h '(letrec letrec*))
            (let ([inner (add-formals (map bind-name (cadr e)) bound)])
              `(,h ,(map-lr (lambda (b) (bind-exp b inner)) (cadr e))
                   ,@(exp-body (cddr e) inner)))]
          [(memq h '(+ - * /)) (expand-arith (lambda (x) (exp1 x bound)) h (cdr e))]
          [(eq? h 'string-append) (expand-string-append (lambda (x) (exp1 x bound))
                                                        (cdr e))]
          ;; `string=?` is n-ary in R7RS 6.7.  It joins the chain here rather than
          ;; becoming a variadic prelude procedure (the route char=? took), because a
          ;; prelude define of an integrable name shadows the primitive for EVERY
          ;; arity -- the two-argument call would lose its bare primcall, and the
          ;; compiler's own reader leans on it.
          [(memq h '(= < > <= >= eq? eqv? string=?))
            (expand-compare (lambda (x) (exp1 x bound)) h (cdr e))]
          [else (exp* e bound)])))) ; if/begin/set!/apply/primcall/application

  (define (bind-exp b bound) (list (car b) (exp1 (cadr b) bound)))

  (exp e 0 '()))

;; a binding's name, tolerating a malformed clause (parse reports that, not this pass)
(define (bind-name b) (if (pair? b) (car b) b))

;; named let: (let name ([x e] ...) body ...) ->
;;   (letrec ([name (lambda (x ...) body ...)]) (name e ...))
(define (rewrite-named-let name binds body)
  `(letrec ([,name (lambda ,(map car binds) ,@body)]) (,name ,@(map cadr binds))))

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
    [(and (pair? d) (eq? (car d) 'unquote) (pair? (cdr d))) ; (unquote x)
      (if (= level 1)
          (cadr d) ; level 1: splice the expression
          `(list (quote unquote)
                 ,(qq (cadr d) (- level 1))))] ; nested: keep structurally
    [(and (pair? d) (eq? (car d) 'unquote-splicing) (pair? (cdr d))) ; bare (u-s x)
      (if (= level 1)
          (error 'expand "unquote-splicing not in list context" d)
          `(list (quote unquote-splicing) ,(qq (cadr d) (- level 1))))]
    [(and (pair? d) (eq? (car d) 'quasiquote) (pair? (cdr d))) ; nested qq: level+1
      `(list (quote quasiquote) ,(qq (cadr d) (+ level 1)))]
    [(and (pair? d)
          (pair? (car d)) ; list with leading splice
          (eq? (car (car d)) 'unquote-splicing)
          (pair? (cdr (car d)))
          (= level 1)) `(append ,(cadr (car d)) ,(qq (cdr d) level))]
    [(pair? d) ; general pair
      `(cons ,(qq (car d) level) ,(qq (cdr d) level))]
    [else `(quote ,d)])) ; atom / () / boolean

;; ---- hand-written arithmetic / comparison desugaring ---------------------
;; N-ary arithmetic -> nested binary forms.  Operands are expanded first, then
;; left-folded so operands evaluate left-to-right and `-` subtracts in order.
;; Identities: (+) -> 0, (*) -> 1, (- a) -> (- 0 a).  Two-operand forms reduce
;; to (op a b) unchanged.
(define (expand-arith exp1 op args)
  (let ([xs (map-lr exp1 args)])
    (case op
      [(+) (cond [(null? xs) 0] [(null? (cdr xs)) (car xs)] [else (fold-arith op xs)])]
      [(*) (cond [(null? xs) 1] [(null? (cdr xs)) (car xs)] [else (fold-arith op xs)])]
      [(-) (cond
             [(null? xs) (error 'expand "(-) requires at least one argument")]
             [(null? (cdr xs)) `(- 0 ,(car xs))]
             [else (fold-arith op xs)])]
      ;; `/` mirrors `-`: `(/ a)` is the reciprocal `(/ 1 a)`, `(/ a b ...)` folds
      ;; left; `(/)` is an error.  (change: inexact-numbers)
      [(/) (cond
             [(null? xs) (error 'expand "(/) requires at least one argument")]
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
  (let ([xs (map-lr exp1 args)])
    (cond
      [(null? xs) ""]
      [(null? (cdr xs)) (car xs)]
      [else (fold-arith 'string-append xs)])))

;; N-ary comparisons -> single-evaluation chained pairwise comparisons.  Each
;; operand is bound to a fresh temp (so <=/>= may reference it twice), then the
;; short-circuiting conjunction of adjacent pairwise tests is built.  Fewer than
;; two operands compare true.
(define (expand-compare exp1 op args)
  (let ([xs (map-lr exp1 args)])
    (if (or (null? xs) (null? (cdr xs)))
        #t
        (let ([temps (map-lr (lambda (x) (fresh-name 'cmp)) xs)])
          (bind-temps temps xs (compare-chain op temps))))))

(define (bind-temps temps exprs body)
  (if (null? temps)
      body
      `(let ([,(car temps) ,(car exprs)]) ,(bind-temps (cdr temps) (cdr exprs) body))))

(define (compare-chain op temps)
  (and-core (let loop ([ts temps])
              (if (null? (cdr ts))
                  '()
                  (cons (cmp-pair op (car ts) (cadr ts)) (loop (cdr ts)))))))

(define (and-core ps)
  (cond
    [(null? ps) #t]
    [(null? (cdr ps)) (car ps)]
    [else `(if ,(car ps) ,(and-core (cdr ps)) #f)]))

(define (cmp-pair op x y)
  (case op
    [(=) `(= ,x ,y)]
    [(<) `(< ,x ,y)]
    [(>) `(< ,y ,x)]
    [(<=) `(if (< ,x ,y) #t (= ,x ,y))]
    [(>=) `(if (< ,y ,x) #t (= ,x ,y))]
    [(eq?) `(eq? ,x ,y)]
    [(eqv?) `(eqv? ,x ,y)]
    [(string=?) `(string=? ,x ,y)]))

;; ---- contextual identifiers and transformers ----------------------------
;; Identifier vectors occur only in compiler-created syntax. Reader vectors
;; remain datum leaves. A key distinguishes an introduced name from a same-
;; spelled source name; its fallback is the definition-site binding. Lexical
;; environments contain an optional fifth field with the identifier key.
(define (syntax-id? x)
  (and (vector? x)
       (= (vector-length x) 4)
       (eq? (vector-ref x 0) '%syntax-identifier-v2)))
(define (syntax-reader-vector? x)
  (and (vector? x)
       (= (vector-length x) 2)
       (eq? (vector-ref x 0) '%syntax-reader-vector-v2)))
(define (source-syntax x . options)
  ;; Every reader vector is wrapped once at ingress, so a datum cannot forge an
  ;; identifier by spelling its serialized tag. Saved transformer syntax is
  ;; already trusted compiler output and does not cross this ingress again.
  (let ([seen '()])
    (let walk ([x x])
      (cond
        [(vector? x) (let ([old (assq x seen)])
                       (if old
                           (cdr old)
                           (let* ([payload (make-vector (vector-length x))]
                                  [out (vector '%syntax-reader-vector-v2 payload)])
                             (set! seen (cons (cons x out) seen))
                             (let loop ([i 0])
                               (unless (= i (vector-length x))
                                 (vector-set! payload i (walk (vector-ref x i)))
                                 (loop (+ i 1))))
                             out)))]
        [(pair? x) (let ([old (assq x seen)])
                     (if old
                         (cdr old)
                         (let ([out (cons #f #f)])
                           (set! seen (cons (cons x out) seen))
                           (when (pair? options) ((car options) out x))
                           (set-car! out (walk (car x)))
                           (set-cdr! out (walk (cdr x)))
                           out)))]
        [else x]))))
(define (syntax-name x) (if (syntax-id? x) (vector-ref x 1) x))
(define (syntax-key x) (if (syntax-id? x) (vector-ref x 2) x))
(define (syntax-identifier? x) (or (symbol? x) (syntax-id? x)))
(define (syntax-binding-key row)
  (if (pair? (cdr (cdddr row))) (car (cdr (cdddr row))) (car row)))
(define (syntax-lookup x bindings)
  (and (syntax-identifier? x)
       (let ([key (syntax-key x)])
         (let loop ([bs bindings])
           (cond
             [(null? bs) (and (syntax-id? x) (vector-ref x 3))]
             [(equal? key (syntax-binding-key (car bs))) (car bs)]
             [else (loop (cdr bs))])))))
(define (contextual-transformer? entry)
  (and (pair? (cdr entry)) (eq? (cadr entry) '%contextual-transformer-v2)))
(define (transformer-origin entry)
  (if (contextual-transformer? entry) (caddr entry) #f))
(define (transformer-literals entry)
  (if (contextual-transformer? entry) (cadddr entry) (cadr entry)))
(define (transformer-rules entry)
  (if (contextual-transformer? entry) (car (cdr (cdddr entry))) (cddr entry)))
(define (transformer-context entry)
  (if (contextual-transformer? entry) (cadr (cdr (cdddr entry))) '()))
(define (make-contextual-transformer name origin literals rules context)
  (list name '%contextual-transformer-v2 origin literals rules context))

;; Contexts refer to transformers by origin, never by a recursively embedded
;; environment. The saved datum is consequently finite even for mutual recursion.
(define (serialize-transformer-context bindings)
  (map
    (lambda (row)
      (if (eq? (cadr row) 'macro)
          (append (list (car row) 'macro (caddr row) (list 'macro-origin (caddr row)))
                  (cdr (cdddr row)))
          row))
    bindings))
(define (contextualize-macro-entry entry bindings unit)
  (if (contextual-transformer? entry)
      entry
      (make-contextual-transformer (car entry)
                                   (list 'macro unit (car entry))
                                   (transformer-literals entry)
                                   (transformer-rules entry)
                                   (serialize-transformer-context bindings))))

;; Export dependency discovery observes template binding positions. In particular,
;; a temporary named like a global must not retain that global in an AOT image.
(define (transformer-free-bindings entry)
  (let ([env (transformer-context entry)] [refs '()])
    (define (note x bound pvars)
      (when (and (syntax-identifier? x)
                 (not (member (syntax-key x) bound))
                 (not (memq (syntax-key x) pvars)))
        (let ([b (syntax-lookup x env)])
          ;; A context needs every identifier key, even when several aliases
          ;; denote one binding origin. Dependency rooting deduplicates later.
          (when (and b
                     (not (memp (lambda (r)
                                  (and (equal? (syntax-binding-key b)
                                               (syntax-binding-key r))
                                       (equal? (caddr b) (caddr r))))
                                refs)))
            (set! refs (cons b refs))))))
    (define (names x)
      (cond
        [(syntax-identifier? x) (list (syntax-key x))]
        [(pair? x) (append (names (car x)) (names (cdr x)))]
        [else '()]))
    (define (walk t bound pvars)
      (cond
        [(syntax-identifier? t) (note t bound pvars)]
        [(pair? t)
          (let* ([b (syntax-lookup (car t) env)]
                 [h (and b (eq? (cadr b) 'core) (cadddr b))])
            (cond
              [(eq? h 'quote) (note (car t) bound pvars)]
              [(and (eq? h 'lambda) (pair? (cdr t)))
                (note (car t) bound pvars)
                (walk (cddr t) (append (names (cadr t)) bound) pvars)]
              [(and (memq h '(let letrec letrec*))
                    (pair? (cdr t))
                    (syntax-proper-list? (cadr t)))
                (note (car t) bound pvars)
                (let* ([clauses (cadr t)]
                       [inner (append (apply append
                                             (map (lambda (c)
                                                    (if (pair? c) (names (car c)) '()))
                                                  clauses))
                                      bound)])
                  (for-each (lambda (c)
                              (when (pair? c)
                                (walk (cdr c) (if (eq? h 'let) bound inner) pvars)))
                            clauses)
                  (walk (cddr t) inner pvars))]
              [else (walk (car t) bound pvars) (walk (cdr t) bound pvars)]))]
        [else #f]))
    (for-each (lambda (literal) (note literal '() '())) (transformer-literals entry))
    (for-each
      (lambda (r)
        (walk (cdr r) '() (syntax-pattern-vars (cdar r) (transformer-literals entry))))
      (transformer-rules entry))
    (reverse refs)))

(define (resolve-exported-macros unit exports macro-env defined-names import-env-alist
         . options)
  (if (not (memp contextual-transformer? macro-env))
      (apply resolve-exported-macros-legacy
             (append (list unit exports macro-env defined-names import-env-alist)
                     options))
      (let ([entries '()]
            [own '()]
            [foreign '()]
            [seen '()]
            [queue '()]
            [reserved (map car exports)]
            [private-keys '()]
            [private-serial 0])
        (define (queue! key entry)
          (unless (memq key seen)
            (set! seen (cons key seen))
            (set! queue (append queue (list (cons key entry))))))
        (define (find-origin origin)
          (memp (lambda (m) (equal? (transformer-origin m) origin)) macro-env))
        (define (queue-private! entry)
          (let* ([origin (transformer-origin entry)] [old (assoc origin private-keys)])
            (unless old
              (let* ([base (mangle unit (car entry))]
                     [key (let loop ([candidate (string->symbol base)])
                            (if (memq candidate reserved)
                                (let ([n private-serial])
                                  (set! private-serial (+ n 1))
                                  (loop (string->symbol (string-append base
                                                                       ".private."
                                                                       (number->string
                                                                         n)))))
                                candidate))])
                (set! reserved (cons key reserved))
                (set! private-keys (cons (cons origin key) private-keys))
                (queue! key entry)))))
        (define (owned-runtime-target row)
          (let ([origin (caddr row)])
            (and (eq? (cadr row) 'runtime)
                 (pair? origin)
                 (eq? (car origin) 'global)
                 (equal? (cadr origin) unit)
                 (memq (caddr origin) defined-names)
                 (caddr origin))))
        (define (export-row row)
          (let ([own-target (owned-runtime-target row)])
            (if own-target
                (let ([target (string->symbol (mangle unit own-target))])
                  ;; Published runtime origins use their actual global location,
                  ;; matching the import table's reconstruction of that location.
                  ;; Session contexts are finalized separately to REPL generations.
                  (append (list (car row) (cadr row) (list 'runtime target) target)
                          (cdr (cdddr row))))
                row)))
        (for-each
          (lambda (e) (let ([m (assq (cdr e) macro-env)]) (when m (queue! (car e) m))))
          exports)
        (let loop ()
          (unless (null? queue)
            (let* ([job (car queue)] [m (cdr job)] [refs (transformer-free-bindings m)])
              (set! queue (cdr queue))
              (for-each
                (lambda (r)
                  (cond
                    [(eq? (cadr r) 'macro)
                      (let ([found (find-origin (caddr r))])
                        (if found
                            (queue-private! (car found))
                            (when (pair? options) ((car options) (car r)))))]
                    [(eq? (cadr r) 'runtime)
                      (cond
                        [(owned-runtime-target r) =>
                                                  (lambda (target)
                                                    (unless (memq target own)
                                                      (set! own (cons target own))))]
                        [(unit-qualified? (cadddr r))
                          (let ([s (symbol->string (cadddr r))])
                            (unless (member s foreign)
                              (set! foreign (cons s foreign))))])]))
                refs)
              (set! entries
                (cons (make-contextual-transformer (car job)
                                                   (transformer-origin m)
                                                   (transformer-literals m)
                                                   (transformer-rules m)
                                                   (map export-row refs))
                      entries))
              (loop))))
        (list (reverse entries) (reverse own) (reverse foreign)))))

(define (syntax-proper-list? x)
  (let loop ([slow x] [fast x])
    (cond
      [(null? fast) #t]
      [(not (pair? fast)) #f]
      [(null? (cdr fast)) #t]
      [(not (pair? (cdr fast))) #f]
      [else (let ([next-slow (cdr slow)] [next-fast (cddr fast)])
              (and (not (eq? next-slow next-fast)) (loop next-slow next-fast)))])))
(define (syntax-check-list who x)
  (unless (syntax-proper-list? x)
    (error 'expand "expected a proper syntax list" who x)))
(define (syntax-datum x)
  (let ([seen '()])
    (let walk ([x x])
      (cond
        [(syntax-reader-vector? x)
          (let ([old (assq x seen)])
            (if old
                (cdr old)
                (let* ([payload (vector-ref x 1)]
                       [out (make-vector (vector-length payload))])
                  (set! seen (cons (cons x out) seen))
                  (let loop ([i 0])
                    (unless (= i (vector-length payload))
                      (vector-set! out i (walk (vector-ref payload i)))
                      (loop (+ i 1))))
                  out)))]
        [(syntax-id? x) (syntax-name x)]
        [(pair? x) (let ([old (assq x seen)])
                     (if old
                         (cdr old)
                         (let ([out (cons #f #f)])
                           (set! seen (cons (cons x out) seen))
                           (set-car! out (walk (car x)))
                           (set-cdr! out (walk (cdr x)))
                           out)))]
        [else x]))))
(define (syntax-literal-member? id literals)
  (and (syntax-identifier? id)
       (memp (lambda (lit) (equal? (syntax-key id) (syntax-key lit))) literals)))
(define (syntax-ellipsis? x literals)
  (and (syntax-identifier? x)
       (eq? (syntax-name x) '...)
       (not (syntax-literal-member? x literals))))
(define (syntax-pattern-vars pat literals)
  (cond
    [(syntax-literal-member? pat literals) '()]
    [(syntax-identifier? pat)
      (if (memq (syntax-name pat) '(_ ...)) '() (list (syntax-key pat)))]
    [(pair? pat) (union (syntax-pattern-vars (car pat) literals)
                        (syntax-pattern-vars (cdr pat) literals))]
    [else '()]))
(define (syntax-binding-equal? a ae b be)
  (and (syntax-identifier? a)
       (syntax-identifier? b)
       (let ([ab (syntax-lookup a ae)] [bb (syntax-lookup b be)])
         (if (and ab bb)
             (equal? (caddr ab) (caddr bb))
             (and (not ab) (not bb) (eq? (syntax-name a) (syntax-name b)))))))

(define (syntax-match pat form literals definition-env use-env)
  (cond
    [(syntax-literal-member? pat literals)
      (if (syntax-binding-equal? pat definition-env form use-env) '() no-match)]
    [(and (syntax-identifier? pat) (eq? (syntax-name pat) '_)) '()]
    [(syntax-identifier? pat) (list (cons (syntax-key pat) form))]
    [(null? pat) (if (null? form) '() no-match)]
    [(pair? pat)
      (if
        (and (pair? (cdr pat)) (syntax-ellipsis? (cadr pat) literals))
        (let* ([sub (car pat)]
               [tail (cddr pat)]
               [n (- (proper-length form) (proper-length tail))])
          (if (< n 0)
              no-match
              (let* ([ms (map-lr (lambda (f)
                                   (syntax-match sub f literals definition-env use-env))
                                 (take-n form n))]
                     [mt (syntax-match tail
                                       (list-tail form n)
                                       literals
                                       definition-env
                                       use-env)])
                (if (or (eq? mt no-match) (memp (lambda (m) (eq? m no-match)) ms))
                    no-match
                    (append
                      (map (lambda (v)
                             (cons v (make-ell (map (lambda (m) (cdr (assq v m))) ms))))
                           (syntax-pattern-vars sub literals))
                      mt)))))
        (if
          (pair? form)
          (let ([a (syntax-match (car pat) (car form) literals definition-env use-env)]
                [d (syntax-match (cdr pat) (cdr form) literals definition-env use-env)])
            (if (or (eq? a no-match) (eq? d no-match)) no-match (append a d)))
          no-match))]
    [else (if (equal? pat form) '() no-match)]))

;; The explicit binding view is authoritative. The legacy API remains available
;; for low-level datum-expander clients while callers migrate their frontend.
(define (expand e macro-env known . options)
  (if (null? options)
      (expand-legacy e macro-env known)
      (let ([result (frontend-expand-forms
                      (list e)
                      macro-env
                      known
                      (car options)
                      (if (pair? (cdr options)) (cadr options) '()))])
        (let ([forms (car result)])
          (cond
            [(null? forms) '(if #f #f)]
            [(null? (cdr forms)) (car forms)]
            [else (cons 'begin forms)])))))

(define (frontend-source-targets result) (car (caddr result)))
(define (frontend-private-targets result) (cadr (caddr result)))
(define (frontend-source-aliases result) (caddr (caddr result)))

(define (frontend-expand-forms forms macro-env known bindings unit)
  (let ([serial 0]
        [target-serial 0]
        [registry '()]
        [public-macros '()]
        [source-origins '()]
        [reserved '()]
        [source-targets '()]
        [private-targets '()]
        [source-aliases '()]
        [top-targets '()]
        [macro-targets '()])
    (define (reserve-data! data)
      (let ([seen '()])
        (let walk ([x data])
          (cond
            [(symbol? x) (unless (memq x reserved) (set! reserved (cons x reserved)))]
            [(or (pair? x) (vector? x)) (unless (memq x seen)
                                          (set! seen (cons x seen))
                                          (if (pair? x)
                                              (begin (walk (car x)) (walk (cdr x)))
                                              (let loop ([i 0])
                                                (unless (= i (vector-length x))
                                                  (walk (vector-ref x i))
                                                  (loop (+ i 1))))))]
            [else #f]))))
    (define (read-syntax x)
      (reserve-data! x)
      (source-syntax x
                     (lambda (copy original)
                       (set! source-origins
                         (cons (cons copy original) source-origins)))))
    (define (new-key name)
      (let loop ()
        (let* ([n serial]
               [candidate (string->symbol (string-append "%syntax."
                                                         (mangle unit name)
                                                         "."
                                                         (number->string n)))])
          (set! serial (+ n 1))
          (if (memq candidate reserved)
              (loop)
              (begin (set! reserved (cons candidate reserved)) candidate)))))
    ;; Keep canonical primitive references free even when source defines the
    ;; same spelling; exported aliases still retain that source spelling.
    (define (top-target name)
      (let* ([key (syntax-key name)] [old (assoc key top-targets)])
        (if old
            (cdr old)
            (let ([target (if (and (equal? key (syntax-name name))
                                   (not (unit-qualified? (syntax-name name)))
                                   (not (integrable? (syntax-name name)))
                                   (not (memq (syntax-name name) known)))
                              (syntax-name name)
                              (new-target))])
              (set! top-targets (cons (cons key target) top-targets))
              target))))
    ;; Lowered locals must not share the colon-bearing namespace of imported
    ;; globals, including after alpha-renaming appends its numeric suffix.
    (define (new-target)
      (let loop ()
        (let* ([n target-serial]
               [candidate (string->symbol
                            (string-append "%binding." (number->string n)))])
          (set! target-serial (+ n 1))
          (if (memq candidate reserved)
              (loop)
              (begin (set! reserved (cons candidate reserved)) candidate)))))
    (define (note-top-target! name target)
      (if (equal? (syntax-key name) (syntax-name name))
          (begin
            (unless (assq (syntax-name name) source-aliases)
              (set! source-aliases
                (cons (cons (syntax-name name) target) source-aliases)))
            (unless (memq target source-targets)
              (set! source-targets (cons target source-targets))))
          (unless (memq target private-targets)
            (set! private-targets (cons target private-targets)))))
    (define (macro-row entry)
      (list (car entry)
            'macro
            (transformer-origin entry)
            (list 'macro-origin (transformer-origin entry))))
    (define (remember! entry)
      (unless (memp
                (lambda (m) (equal? (transformer-origin m) (transformer-origin entry)))
                registry)
        (set! registry (cons entry registry)))
      entry)
    (define (find-macro row)
      (let ([origin (caddr row)])
        (let loop ([ms registry])
          (cond
            [(null? ms) (error 'expand "missing transformer context dependency" origin)]
            [(equal? origin (transformer-origin (car ms))) (car ms)]
            [else (loop (cdr ms))]))))
    (define (kind x env) (let ([b (syntax-lookup x env)]) (and b (cadr b))))
    (define (head-name f env)
      (and (pair? f)
           (let ([b (syntax-lookup (car f) env)])
             (and b (memq (cadr b) '(core auxiliary)) (cadddr b)))))
    (define (splice/context f h)
      (let* ([original (assq f source-origins)]
             [canonical (cons h (syntax-datum (cdr f)))])
        (when original
          (note-include-origins! canonical (include-origin (cdr original))))
        (read-syntax (splice-body-forms (list canonical) '() (lambda (name) #f)))))
    (define (form-size f minimum maximum who)
      (unless (and (syntax-proper-list? f)
                   (>= (length f) minimum)
                   (or (not maximum) (<= (length f) maximum)))
        (error 'expand "malformed syntax form" who (syntax-datum f))))
    (define (identifier! x who)
      (unless (syntax-identifier? x)
        (error 'expand "expected identifier" who (syntax-datum x))))
    (define (bind-variables ids env)
      (let loop ([xs ids] [acc env] [seen '()])
        (if
          (null? xs)
          acc
          (let* ([x (car xs)] [key (syntax-key x)])
            (identifier! x 'binding)
            (when (member key seen) (error 'expand "duplicate binding" (syntax-name x)))
            (let ([target (new-target)])
              (loop
                (cdr xs)
                (cons
                  (list (syntax-name x) 'runtime (list 'lexical unit target) target key)
                  acc)
                (cons key seen)))))))
    (define (formal-ids f)
      (cond
        [(null? f) '()]
        [(syntax-identifier? f) (list f)]
        [(pair? f) (identifier! (car f) 'lambda) (cons (car f) (formal-ids (cdr f)))]
        [else (error 'expand "malformed lambda formals" (syntax-datum f))]))
    (define (lower-id x env)
      (let ([b (syntax-lookup x env)])
        (cond
          [b (if (memq (cadr b) '(core auxiliary macro))
                 (error 'expand "syntax identifier used as a value" (syntax-name x))
                 (cadddr b))]
          [else (error 'expand "unbound variable" (syntax-name x))])))
    (define (lower-formals f env)
      (cond
        [(null? f) '()]
        [(syntax-identifier? f) (lower-id f env)]
        [else (cons (lower-id (car f) env) (lower-formals (cdr f) env))]))
    (define (capture t env)
      (cond
        [(syntax-identifier? t)
          (if (syntax-id? t)
              t
              (vector '%syntax-identifier-v2 t t (syntax-lookup t env)))]
        [(pair? t)
          ;; Quoted graphs are data; the quote head alone carries its context.
          (if (eq? (head-name t env) 'quote)
              (cons (capture (car t) env) (cdr t))
              (cons (capture (car t) env) (capture (cdr t) env)))]
        [else t]))
    (define (template-vars/context t pvars)
      (let ([seen '()])
        (let walk ([t t])
          (cond
            [(syntax-identifier? t)
              (if (memq (syntax-key t) pvars) (list (syntax-key t)) '())]
            [(pair? t) (if (memq t seen)
                           '()
                           (begin
                             (set! seen (cons t seen))
                             (union (walk (car t)) (walk (cdr t)))))]
            [else '()]))))
    (define (instantiate/context tmpl matches pvars definition-env)
      (let ([introduced '()])
        (define (intro id)
          (let* ([key (syntax-key id)] [old (assq key introduced)])
            (if old
                (cdr old)
                (let ([id2 (vector '%syntax-identifier-v2
                                   (syntax-name id)
                                   (new-key (syntax-name id))
                                   (syntax-lookup id definition-env))])
                  (set! introduced (cons (cons key id2) introduced))
                  id2))))
        (define (walk t ms quoted? escaped?)
          (cond
            [(syntax-identifier? t)
              (let ([v (assq (syntax-key t) ms)])
                (cond
                  [v (when (ell? (cdr v))
                       (error 'expand
                              "pattern variable used at wrong ellipsis depth"
                              (syntax-name t)))
                     (cdr v)]
                  [quoted? (syntax-name t)]
                  [(and escaped? (eq? (syntax-name t) '...)) t]
                  [else (intro t)]))]
            [(pair? t)
              (cond
                [(eq? (head-name t definition-env) 'quote)
                  (if (and (null? (template-vars/context (cdr t) pvars))
                           (not (template-ellipsis-escape? (syntax-datum (cdr t)))))
                      (cons (intro (car t)) (cdr t))
                      (cons (intro (car t)) (walk (cdr t) ms #t escaped?)))]
                [(and (not escaped?)
                      (syntax-identifier? (car t))
                      (eq? (syntax-name (car t)) '...)
                      (pair? (cdr t))
                      (null? (cddr t))) (walk (cadr t) ms quoted? #t)]
                [(and (not escaped?)
                      (pair? (cdr t))
                      (syntax-identifier? (cadr t))
                      (eq? (syntax-name (cadr t)) '...))
                  (let* ([vars (filter (lambda (v)
                                         (let ([m (assq v ms)]) (and m (ell? (cdr m)))))
                                       (template-vars/context (car t) pvars))])
                    (when (null? vars)
                      (error 'expand
                             "ellipsis template has no matching pattern variable"
                             (syntax-datum t)))
                    (let* ([lists (map (lambda (v) (ell-list (cdr (assq v ms)))) vars)]
                           [n (length (car lists))])
                      (for-each (lambda (xs)
                                  (unless (= n (length xs))
                                    (error 'expand
                                           "mismatched ellipsis match lengths"
                                           (syntax-datum t))))
                                lists)
                      (append
                        (let loop ([i 0] [acc '()])
                          (if (= i n)
                              (reverse acc)
                              (loop (+ i 1)
                                    (cons (walk (car t)
                                                (append (map (lambda (v xs)
                                                               (cons v (list-ref xs i)))
                                                             vars
                                                             lists)
                                                        ms)
                                                quoted?
                                                escaped?)
                                          acc))))
                        (walk (cddr t) ms quoted? escaped?))))]
                [else (cons (walk (car t) ms quoted? escaped?)
                            (walk (cdr t) ms quoted? escaped?))])]
            [else t]))
        (walk tmpl matches #f #f)))
    (define (apply/context entry form env depth)
      (when (> depth *macro-depth-limit*)
        (error 'expand
               "macro expansion did not terminate (depth limit exceeded)"
               (syntax-name (car form))))
      (when (and (pair? (transformer-origin entry))
                 (member 'case-lambda (transformer-origin entry)))
        (syntax-check-list 'case-lambda form)
        (for-each
          (lambda (clause)
            (unless (and (syntax-proper-list? clause) (>= (length clause) 2))
              (error 'expand "malformed case-lambda clause" (syntax-datum clause)))
            (let check ([f (car clause)] [seen '()])
              (cond
                [(null? f) #t]
                [(syntax-identifier? f)
                  (when (member (syntax-key f) seen)
                    (error 'expand "duplicate case-lambda formal" (syntax-name f)))]
                [(and (pair? f) (syntax-identifier? (car f)))
                  (when (member (syntax-key (car f)) seen)
                    (error 'expand
                           "duplicate case-lambda formal"
                           (syntax-name (car f))))
                  (check (cdr f) (cons (syntax-key (car f)) seen))]
                [else
                  (error 'expand "malformed case-lambda formals" (syntax-datum f))])))
          (cdr form)))
      (let ([literals (transformer-literals entry)] [de (transformer-context entry)])
        (let loop ([rules (transformer-rules entry)])
          (when (null? rules)
            (error 'expand
                   "no matching syntax-rules pattern for macro use"
                   (syntax-datum form)))
          (let* ([r (car rules)]
                 [m (syntax-match (cdar r) (cdr (capture form env)) literals de env)])
            (if (eq? m no-match)
                (loop (cdr rules))
                (instantiate/context (cdr r)
                                     m
                                     (syntax-pattern-vars (cdar r) literals)
                                     de))))))
    (define (parse-transformer name spec env origin target)
      (unless (and (pair? spec) (eq? (head-name spec env) 'syntax-rules))
        (error 'expand
               "define-syntax requires a syntax-rules transformer"
               (syntax-datum spec)))
      (form-size spec 3 #f 'syntax-rules)
      (syntax-check-list 'syntax-rules (cadr spec))
      (for-each (lambda (x) (identifier! x 'syntax-rules)) (cadr spec))
      (let ([rules (map-lr
                     (lambda (r)
                       (form-size r 2 2 'syntax-rules)
                       (unless (and (pair? (car r)) (syntax-identifier? (caar r)))
                         (error 'expand
                                "syntax-rules pattern must start with an identifier"
                                (syntax-datum r)))
                       (cons (car r) (cadr r)))
                     (cddr spec))])
        (remember! (make-contextual-transformer target
                                                origin
                                                (cadr spec)
                                                rules
                                                (serialize-transformer-context env)))))
    (define (syntax-bindings clauses env recursive?)
      (syntax-check-list (if recursive? 'letrec-syntax 'let-syntax) clauses)
      (let ([names (map-lr
                     (lambda (c)
                       (form-size c 2 2 (if recursive? 'letrec-syntax 'let-syntax))
                       (identifier! (car c) (if recursive? 'letrec-syntax 'let-syntax))
                       (car c))
                     clauses)])
        (let* ([rows
                 (map-lr
                   (lambda (x)
                     (let* ([origin (list 'macro unit (new-key (syntax-name x)))]
                            [target (new-target)])
                       (set! macro-targets (cons (cons origin target) macro-targets))
                       (list (syntax-name x)
                             'macro
                             origin
                             (list 'macro-origin origin)
                             (syntax-key x))))
                   names)]
               [extended (append rows env)])
          (let check ([xs names] [seen '()])
            (unless (null? xs)
              (when (member (syntax-key (car xs)) seen)
                (error 'expand "duplicate let-syntax keyword" (syntax-name (car xs))))
              (check (cdr xs) (cons (syntax-key (car xs)) seen))))
          (for-each (lambda (clause row)
                      (parse-transformer (car clause)
                                         (cadr clause)
                                         (if recursive? extended env)
                                         (caddr row)
                                         (cdr (assoc (caddr row) macro-targets))))
                    clauses
                    rows)
          extended)))
    ;; Prefix discovery registers all direct syntax declarations before expanding
    ;; prefix uses. Discovered declarations share one mutable definition group;
    ;; transformer contexts are finalized after the prefix is known.
    (define (body fs env top? depth)
      (syntax-check-list 'body fs)
      (let ([group '()]
            [declarations '()]
            [runtime '()]
            [pending fs]
            [expressions? #f]
            [registered '()]
            [bindings-dirty? #f])
        (define (environment) (append group env))
        (define (declared-head f)
          (let ([old (assq f declarations)])
            (if old (cdr old) (head-name f (environment)))))
        (define (register! f)
          (let ([h (declared-head f)])
            (when (and (memq h '(define define-syntax define-record-type))
                       (not (assq f declarations)))
              (set! declarations (cons (cons f h) declarations)))
            (when (eq? h 'begin)
              (syntax-check-list 'begin f)
              (let ([prior registered])
                (for-each register! (cdr f))
                (when (and (not (eq? registered prior)) (not (assq f declarations)))
                  (set! declarations (cons (cons f h) declarations)))))
            (when (eq? h 'define-record-type)
              (check-record-type-form (syntax-datum f))
              (unless (memp (lambda (p) (eq? f (car p))) registered)
                (let ([ids (cons (car (caddr f))
                                 (cons (cadddr f)
                                       (apply append
                                              (map (lambda (field) (cdr field))
                                                   (cdr (cdddr f))))))])
                  (for-each
                    (lambda (name)
                      (let* ([target (if top? (top-target name) (new-target))]
                             [row (list (syntax-name name)
                                        'runtime
                                        (list (if top? 'global 'lexical) unit target)
                                        target
                                        (syntax-key name))])
                        (set! group (cons row group))
                        (set! bindings-dirty? #t)
                        (when top? (note-top-target! name target))
                        (set! registered (cons (cons f row) registered))))
                    ids))))
            (when (memq h '(define define-syntax))
              (form-size f 3 #f h)
              (let* ([sig (cadr f)]
                     [name (if (and (eq? h 'define) (pair? sig)) (car sig) sig)])
                (identifier! name h)
                (unless (memp (lambda (p) (eq? f (car p))) registered)
                  (when (and top?
                             (pair? unit)
                             (memp
                               (lambda (r)
                                 (and (equal? (syntax-key name) (syntax-binding-key r))
                                      (not (eq? (cadr r)
                                                (if (eq? h 'define-syntax)
                                                    'macro
                                                    'runtime)))))
                               group))
                    (error 'expand
                           "binding has both define and define-syntax"
                           (syntax-name name)))
                  (when (and (not top?)
                             (memp (lambda (r)
                                     (equal? (syntax-key name) (syntax-binding-key r)))
                                   group))
                    (error 'expand "duplicate internal definition" (syntax-name name)))
                  (let* ([target (if top? (top-target name) (new-target))]
                         [origin (if (eq? h 'define-syntax)
                                     (list 'macro
                                           unit
                                           (syntax-name name)
                                           (new-key (syntax-name name)))
                                     (list (if top? 'global 'lexical) unit target))]
                         [row (list (syntax-name name)
                                    (if (eq? h 'define-syntax) 'macro 'runtime)
                                    origin
                                    (if (eq? h 'define-syntax)
                                        (list 'macro-origin origin)
                                        target)
                                    (syntax-key name))])
                    (set! group (cons row group))
                    (set! bindings-dirty? #t)
                    (when (eq? h 'define-syntax)
                      (set! macro-targets (cons (cons origin target) macro-targets)))
                    (when top? (note-top-target! name target))
                    (set! registered (cons (cons f row) registered))))))))
        (define (compile-declarations!)
          (when bindings-dirty?
            (set! bindings-dirty? #f)
            (for-each (lambda (p)
                        (when (eq? (cadr (cdr p)) 'macro)
                          (let ([f (car p)] [r (cdr p)])
                            ;; Replace a provisional transformer after group discovery.
                            (set! registry
                              (filter (lambda (m)
                                        (not (equal? (transformer-origin m) (caddr r))))
                                      registry))
                            (parse-transformer (cadr f)
                                               (caddr f)
                                               (environment)
                                               (caddr r)
                                               (cdr (assoc (caddr r) macro-targets))))))
                      (reverse registered))))
        (for-each register! fs)
        (compile-declarations!)
        (let loop ()
          (unless (null? pending)
            (let* ([f (car pending)]
                   [e (environment)]
                   [h (declared-head f)]
                   [binding (and (pair? f) (syntax-lookup (car f) e))])
              (set! pending (cdr pending))
              (cond
                [(and (not (assq f declarations)) binding (eq? (cadr binding) 'macro))
                  (set! pending
                    (cons (apply/context (find-macro binding) f e depth) pending))
                  (set! depth (+ depth 1))]
                [(eq? h 'begin) (syntax-check-list 'begin f)
                                (for-each register! (cdr f))
                                (compile-declarations!)
                                (set! pending (append (cdr f) pending))]
                [(memq h '(include include-ci cond-expand))
                  (let ([spliced (splice/context f h)])
                    (for-each register! spliced)
                    (compile-declarations!)
                    (set! pending (append spliced pending)))]
                [(memq h '(define define-syntax define-record-type))
                  (when (and expressions? (not top?))
                    (error 'expand
                           "internal definition must precede body expressions"
                           h))
                  (register! f)
                  (compile-declarations!)
                  (unless (eq? h 'define-syntax) (set! runtime (cons f runtime)))]
                [else (set! expressions? #t) (set! runtime (cons f runtime))])
              (loop))))
        (compile-declarations!)
        (when top?
          (set! public-macros
            (append (map (lambda (p) (find-macro (cdr p)))
                         (filter (lambda (p) (eq? (cadr (cdr p)) 'macro))
                                 (reverse registered)))
                    public-macros)))
        (map-lr
          (lambda (f)
            (if (eq? (declared-head f) 'define)
                (let* ([sig (cadr f)]
                       [name (if (pair? sig) (car sig) sig)]
                       [init (if (pair? sig)
                                 (cons (core-id 'lambda) (cons (cdr sig) (cddr f)))
                                 (begin (form-size f 3 3 'define) (caddr f)))])
                  (list 'define
                        (lower-id name (environment))
                        (expr init (environment) 0)))
                (expr (if (eq? (declared-head f) 'define-record-type)
                          (cons (core-id 'define-record-type) (cdr f))
                          f)
                      (environment)
                      0)))
          (reverse runtime))))
    (define (core-id name)
      (vector '%syntax-identifier-v2
              name
              (list 'internal name)
              (list name 'core (list 'builtin name) name)))
    (define (constructor-id name)
      (vector '%syntax-identifier-v2
              name
              (list 'constructor name)
              (list name
                    (if (eq? name 'cons) 'primitive 'runtime)
                    (list 'builtin name)
                    (if (eq? name 'cons)
                        name
                        (string->symbol (mangle '(scheme base) name))))))
    (define (qq/context d level env)
      (let ([h (and (pair? d) (head-name d env))])
        (cond
          [(and (memq h '(unquote unquote-splicing quasiquote))
                (pair? (cdr d))
                (null? (cddr d)))
            (cond
              [(eq? h 'unquote) (if (= level 1)
                                    (cadr d)
                                    (list (constructor-id 'list)
                                          (list (core-id 'quote) 'unquote)
                                          (qq/context (cadr d) (- level 1) env)))]
              [(eq? h 'unquote-splicing)
                (if (= level 1)
                    (error 'expand "unquote-splicing not in list context")
                    (list (constructor-id 'list)
                          (list (core-id 'quote) 'unquote-splicing)
                          (qq/context (cadr d) (- level 1) env)))]
              [else (list (constructor-id 'list)
                          (list (core-id 'quote) 'quasiquote)
                          (qq/context (cadr d) (+ level 1) env))])]
          [(and (pair? d)
                (pair? (car d))
                (eq? (head-name (car d) env) 'unquote-splicing)
                (pair? (cdar d))
                (null? (cddar d))
                (= level 1))
            (list (constructor-id 'append) (cadar d) (qq/context (cdr d) level env))]
          [(pair? d) (list (constructor-id 'cons)
                           (qq/context (car d) level env)
                           (qq/context (cdr d) level env))]
          [else (list (core-id 'quote) d)])))
    (define (expr f env depth)
      (when (> depth *macro-depth-limit*)
        (error 'expand "macro expansion did not terminate (depth limit exceeded)"))
      (cond
        [(syntax-identifier? f) (lower-id f env)]
        [(syntax-reader-vector? f) (syntax-datum f)]
        [(not (pair? f)) f]
        [else
          (let* ([binding (syntax-lookup (car f) env)] [h (head-name f env)])
            (cond
              [(and binding (eq? (cadr binding) 'macro))
                (expr (apply/context (find-macro binding) f env depth) env (+ depth 1))]
              [(eq? h 'quote) (form-size f 2 2 'quote)
                              (list 'quote (syntax-datum (cadr f)))]
              [(eq? h '%advertised-features) (list 'quote *advertised-features*)]
              [(eq? h 'define-record-type)
                (check-record-type-form (syntax-datum f))
                (cons 'define-record-type
                      (cons (syntax-name (cadr f))
                            (cons (cons (lower-id (car (caddr f)) env)
                                        (syntax-datum (cdr (caddr f))))
                                  (cons
                                    (lower-id (cadddr f) env)
                                    (map (lambda (field)
                                           (cons (syntax-name (car field))
                                                 (map (lambda (id) (lower-id id env))
                                                      (cdr field))))
                                         (cdr (cdddr f)))))))]
              [(and (syntax-identifier? (car f))
                    (eq? (syntax-name (car f)) 'define-values)
                    (not binding)) (error 'expand
                                          "define-values: unsupported binding shape"
                                          (syntax-datum f))]
              [(eq? h 'lambda) (form-size f 3 #f 'lambda)
                               (let ([inner (bind-variables (formal-ids (cadr f)) env)])
                                 (cons 'lambda
                                       (cons (lower-formals (cadr f) inner)
                                             (body (cddr f) inner #f depth))))]
              [(memq h '(let-syntax letrec-syntax))
                (form-size f 3 #f h)
                (let* ([inner (syntax-bindings (cadr f) env (eq? h 'letrec-syntax))]
                       [fs (body (cddr f) inner #f depth)])
                  ;; An empty let preserves the scope of definitions in the body.
                  (cons 'let (cons '() fs)))]
              [(memq h '(let letrec letrec*))
                (form-size f 3 #f h)
                (if (and (eq? h 'let) (syntax-identifier? (cadr f)))
                    (begin
                      (form-size f 4 #f 'let)
                      (let ([loop-name (cadr f)] [clauses (caddr f)])
                        (syntax-check-list 'let clauses)
                        (for-each (lambda (c) (form-size c 2 2 'let)) clauses)
                        (expr
                          (list (core-id 'letrec)
                                (list (list loop-name
                                            (cons (core-id 'lambda)
                                                  (cons (map car clauses) (cdddr f)))))
                                (cons loop-name (map cadr clauses)))
                          env
                          depth)))
                    (let ([clauses (cadr f)])
                      (syntax-check-list h clauses)
                      (for-each (lambda (c) (form-size c 2 2 h)) clauses)
                      (let ([inner (bind-variables (map car clauses) env)])
                        (cons h
                              (cons (map-lr (lambda (c)
                                              (list (lower-id (car c) inner)
                                                    (expr (cadr c)
                                                          (if (eq? h 'let) env inner)
                                                          0)))
                                            clauses)
                                    (body (cddr f) inner #f depth))))))]
              [(eq? h 'begin)
                (cons 'begin (map-lr (lambda (e) (expr e env 0)) (cdr f)))]
              [(memq h '(include include-ci cond-expand))
                (let ([expanded (body (splice/context f h) env #f depth)])
                  (cons 'let (cons '() expanded)))]
              [(eq? h 'if) (form-size f 3 4 'if)
                           (cons 'if (map-lr (lambda (e) (expr e env 0)) (cdr f)))]
              [(eq? h 'set!)
                (form-size f 3 3 'set!)
                (let ([b (syntax-lookup (cadr f) env)])
                  (when (and b (not (eq? (cadr b) 'runtime)))
                    (error 'expand "set! requires a variable" (syntax-name (cadr f))))
                  (list 'set! (lower-id (cadr f) env) (expr (caddr f) env 0)))]
              [(eq? h 'quasiquote)
                (form-size f 2 2 'quasiquote)
                ;; Generated constructors carry definition identities, while the
                ;; unquoted holes retain the surrounding lexical environment.
                (expr (qq/context (cadr f) 1 env) env depth)]
              [(memq h '(unquote unquote-splicing))
                (error 'expand "unquote/unquote-splicing outside quasiquote" h)]
              [(memq h '(define define-syntax syntax-rules))
                (error 'expand "definition or transformer in expression position" h)]
              [(and binding
                    (eq? (cadr binding) 'primitive)
                    (memq (cadddr binding) '(+ - * /)))
                (expand-arith (lambda (e) (expr e env 0)) (cadddr binding) (cdr f))]
              [(and binding
                    (eq? (cadr binding) 'primitive)
                    (memq (cadddr binding) '(= < > <= >= eq? eqv? string=?)))
                (expand-compare (lambda (e) (expr e env 0)) (cadddr binding) (cdr f))]
              [(and binding
                    (eq? (cadr binding) 'primitive)
                    (eq? (cadddr binding) 'string-append))
                (expand-string-append (lambda (e) (expr e env 0)) (cdr f))]
              [(eq? h 'apply)
                (cons 'apply (map-lr (lambda (e) (expr e env 0)) (cdr f)))]
              [else
                (syntax-check-list 'application f)
                (let* ([operator (expr (car f) env 0)]
                       [protected
                         (if
                           (and (symbol? operator)
                                (not (and binding (eq? (cadr binding) 'primitive)))
                                (or (memq operator *core-keywords*)
                                    (memq operator '(define-record-type define-values))
                                    (memq operator *prims*)))
                           (list 'begin operator)
                           operator)])
                  (cons protected (map-lr (lambda (e) (expr e env 0)) (cdr f))))]))]))
    (reserve-data! forms)
    (reserve-data! bindings)
    (reserve-data! known)
    (reserve-data! macro-env)
    (let* ([initial-macros
             (map-lr (lambda (m)
                       (contextualize-macro-entry
                         (if (contextual-transformer? m) m (read-syntax m))
                         bindings
                         unit))
                     macro-env)]
           [macro-rows
             (filter (lambda (row) row)
                     (map-lr2
                       (lambda (old m)
                         (let ([public (assq (car m) bindings)])
                           (and (or (and public
                                         (eq? (cadr public) 'macro)
                                         (equal? (caddr public) (transformer-origin m)))
                                    (not (contextual-transformer? old)))
                                (macro-row m))))
                       macro-env
                       initial-macros))]
           [env (append bindings macro-rows)])
      ;; Legacy entries need the combined definition environment, including their
      ;; recursive siblings. Saved contextual entries already carry their owner.
      (set! registry
        (map-lr2
          (lambda (old new)
            (if (contextual-transformer? old)
                new
                (make-contextual-transformer (car new)
                                             (transformer-origin new)
                                             (transformer-literals new)
                                             (transformer-rules new)
                                             (serialize-transformer-context env))))
          macro-env
          initial-macros))
      (let ([runtime (body (read-syntax forms) env #t 0)])
        (list runtime
              public-macros
              (list (reverse source-targets)
                    (reverse private-targets)
                    (reverse source-aliases)))))))
