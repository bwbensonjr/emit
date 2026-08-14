;;; expander-tests.ss -- unit tests for the syntax-rules expander (expand.ss).
;;; Run from the repo root:  chez --libdirs src --script test/expander-tests.ss
;;;
;;; Exercises the expander directly at the source->source level, independent of
;;; the rest of the pipeline.  Added by change: port-match-to-syntax-rules to
;;; cover the ellipsis-escape (... ...) needed to host a syntax-rules matcher.

(import (chezscheme))
(include "src/match.scm")
(include "src/util.scm")            ; flat source (change: self-hosting-completion)
(include "src/parse.ss")            ; *prims* / *integrable*, which the export-time
                                    ; resolution pass classifies against (change:
                                    ; library-macro-export)
(include "src/passes/expand.ss")

(define pass 0)
(define fail 0)
(define (check name got want)
  (if (equal? got want)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n         got:  ~s\n         want: ~s\n" name got want))))

(define base-known
  (append *core-keywords* *extra-op-keywords*
          '(list cons car cdr null? pair? eq? equal? not append)))

;; expand FORM in an environment built from the given define-syntax forms.
(define (expand-with dsx form)
  (expand form (map parse-define-syntax dsx) base-known))

(printf "expander unit tests\n")

;; ---- ellipsis escape (... ...) ----
;; R7RS: (... <tmpl>) yields <tmpl> with ellipses inside treated literally.
(check "ellipsis escape yields a literal ..."
       (expand-with
         (list '(define-syntax gen (syntax-rules () ((_ a) (list a (... ...))))))
         '(gen foo))
       '(list foo ...))

;; inside an escape, pattern variables still substitute but `...` stays literal
(check "escape substitutes pvars, keeps ... literal"
       (expand-with
         (list '(define-syntax gen2 (syntax-rules () ((_ a) (... (a ...))))))
         '(gen2 foo))
       '(foo ...))

;; regression: ordinary ellipsis repetition still expands
(check "ordinary ellipsis still repeats"
       (expand-with
         (list '(define-syntax lst (syntax-rules () ((_ x ...) (list x ...)))))
         '(lst 1 2 3))
       '(list 1 2 3))

;; ---- export-time resolution of an exported macro -------------------------
;; (change: library-macro-export, design D2/D3.)  These drive resolve-exported-macros
;; directly: one row of the classification table per check, plus the two properties the
;; artifact depends on (determinism, and one macro travelling under two keywords).

(define (dsx name . rules)          ; (dsx 'm '((_ a) (f a))) -> a macro-env entry
  (parse-define-syntax
    (list 'define-syntax name (cons 'syntax-rules (cons '() rules)))))

;; resolve ONE exported macro and return just its rewritten template
(define (tmpl-of iface) (cdr (car (cddr (car (car iface))))))
(define (resolve1 tmpl defined imports)
  (resolve-exported-macros '(mylib) '((m . m))
                           (list (dsx 'm (list '(_ a) tmpl)))
                           defined imports))

(check "a core keyword / integrable head is left alone"
       (tmpl-of (resolve1 '(let ((x (+ a 1))) (cons x a)) '() '()))
       '(let ((x (+ a 1))) (cons x a)))

(check "the unit's own binding resolves to its mangled symbol"
       (tmpl-of (resolve1 '(helper a) '(helper) '()))
       '(mylib:helper a))

(check "...and is recorded as an own-ref"
       (cadr (resolve1 '(helper a) '(helper) '()))
       '(helper))

(check "an imported name resolves to the exporter's mangled symbol"
       (tmpl-of (resolve1 '(base-f a) '() '((base-f . scheme.base:base-f))))
       '(scheme.base:base-f a))

(check "...and is recorded as a foreign-ref, as a string"
       (caddr (resolve1 '(base-f a) '() '((base-f . scheme.base:base-f))))
       '("scheme.base:base-f"))

(check "an unresolvable identifier is left exactly as written (design D4)"
       (tmpl-of (resolve1 '(let ((tmp a)) (when tmp tmp)) '() '()))
       '(let ((tmp a)) (when tmp tmp)))

;; `a` is the pattern variable AND a top-level binding of the library: the pattern
;; variable wins, because it is substituted from the macro USE at each expansion.
(check "a pattern variable is never resolved, even shadowing an own binding"
       (tmpl-of (resolve1 '(cons a a) '(a) '()))
       '(cons a a))

;; ...and a name that is NOT a pattern variable is resolved even when it looks like a
;; standard procedure: `list` is not integrable, so a library defining its own wins.
(check "an own binding shadowing a library procedure resolves to the unit's own"
       (tmpl-of (resolve1 '(list a) '(list) '()))
       '(mylib:list a))

(check "quoted data is untouched"
       (tmpl-of (resolve1 '(quote (helper a)) '(helper) '()))
       '(quote (helper a)))

;; A syntax-rules LITERAL is matched by identity in the importer, so it must survive
;; verbatim even when the library happens to define a top-level binding of that name --
;; otherwise the importer's match fails against the spelling the user wrote.
(check "a literal is left alone even when the library defines that name"
       (cdr (car (cddr (car (car (resolve-exported-macros
                                   '(mylib) '((m . m))
                                   (list (parse-define-syntax
                                           '(define-syntax m
                                              (syntax-rules (else)
                                                ((_ else a) (cons (quote else) a))))))
                                   '(else) '()))))))
       '(cons (quote else) a))

;; a private macro travels hidden under a unit-qualified keyword, transitively
(define nested-iface
  (resolve-exported-macros '(mylib) '((outer . outer))
                           (list (dsx 'outer '((_ e) (%mid e)))
                                 (dsx '%mid '((_ e) (%inner e)))
                                 (dsx '%inner '((_ e) (helper e))))
                           '(helper) '()))

(check "an exported template's private macro is rewritten to a hidden keyword"
       (tmpl-of nested-iface)
       '(mylib:%mid e))

(check "the hidden macros travel too, transitively"
       (map car (car nested-iface))
       '(outer mylib:%mid mylib:%inner))

(check "a helper reached two macros deep is still an own-ref"
       (cadr nested-iface)
       '(helper))

;; A macro that is BOTH exported and mentioned by another template must travel under
;; both keywords -- its external name and its unit-qualified spelling -- or the second
;; template references a keyword no entry defines.
(check "a macro both exported and mentioned travels under both keywords"
       (map car (car (resolve-exported-macros
                       '(mylib) '((outer . outer) (inner . inner))
                       (list (dsx 'outer '((_ e) (inner e)))
                             (dsx 'inner '((_ e) (cons e e))))
                       '() '())))
       '(outer inner mylib:inner))

(check "a renamed macro export is keyed on the EXTERNAL keyword"
       (map car (car (resolve-exported-macros
                       '(mylib) '((swap! . %swap))
                       (list (dsx '%swap '((_ a b) (cons a b))))
                       '() '())))
       '(swap!))

;; The interface is written into an artifact, so it must not depend on the gensym
;; counter: two runs with the counter advanced in between must agree byte-for-byte.
(check "resolution is deterministic (no fresh-name, no counter)"
       (let ([a (resolve1 '(helper (let ((tmp a)) tmp)) '(helper) '())])
         (fresh-name 'junk) (fresh-name 'junk)
         (equal? a (resolve1 '(helper (let ((tmp a)) tmp)) '(helper) '())))
       #t)

;; Hygiene must not rename an identifier that arrived already resolved: an imported
;; transformer's `mylib:helper` is not in the importer's `known` list here, and would be
;; renamed away by the pre-change rule.
(check "an already-resolved identifier survives hygiene in the importer"
       (expand '(m 5) (list (dsx 'm '((_ e) (mylib:helper e)))) base-known)
       '(mylib:helper 5))

;; ---- the literals list outranks _ and ... (R7RS 4.3.2, issue #80) ----
;; Testing `_` first meant a `_` named as a literal never got to BE one, so a pattern
;; matched input the rule was written to reject -- and answered plausibly, which is why
;; this went unnoticed until an external suite asked.  The rules below are the suite's
;; own count-to-2_ : with `_` a literal, (_ _ _) needs two literal `_` ARGUMENTS.
(define count-to-2_
  '(define-syntax count-to-2_
     (syntax-rules (_)
       ((_) 0)
       ((_ _) 1)
       ((_ _ _) 2)
       ((x . y) (quote fail)))))
(check "a literal _ matches only itself, not anything"
       (map (lambda (f) (expand-with (list count-to-2_) f))
            '((count-to-2_ _ _) (count-to-2_) (count-to-2_ a b) (count-to-2_ a b c d)))
       '(2 0 (quote fail) (quote fail)))

;; the control: the same rules with an EMPTY literals list, where `_` is the wildcard
;; and the answers are the ordinary ones.  If this ever moves, the fix reached too far.
(define count-to-2
  '(define-syntax count-to-2
     (syntax-rules ()
       ((_) 0)
       ((_ _) 1)
       ((_ _ _) 2)
       ((x . y) (quote fail)))))
(check "an empty literals list leaves _ a wildcard"
       (map (lambda (f) (expand-with (list count-to-2) f))
            '((count-to-2) (count-to-2 a) (count-to-2 a b) (count-to-2 a b c)))
       '(0 1 2 (quote fail)))

;; the ellipsis half of the same precedence question.  No exclusion row reaches this
;; (the suite's case is blocked behind other gaps), but it is the same one-line test in
;; the same two functions, so it moves with `_` rather than waiting to be found later.
(define lit-ellipsis
  '(define-syntax lit-ellipsis
     (syntax-rules (...)
       ((_ a ...) (quote matched-literal-dots))
       ((_ x y) (quote ordinary))
       ((_ . r) (quote fallthrough)))))
(check "a literal ... matches only itself, and does not mean repetition"
       (map (lambda (f) (expand-with (list lit-ellipsis) f))
            '((lit-ellipsis p ...) (lit-ellipsis p q) (lit-ellipsis a b c)))
       '((quote matched-literal-dots) (quote ordinary) (quote fallthrough)))

;; ... and an ordinary variadic macro is untouched by that, which is the property that
;; makes the reordering safe for every macro in the compiler's own sources
(check "an ordinary ellipsis pattern still repeats"
       (map (lambda (f)
              (expand-with
                (list '(define-syntax my-list (syntax-rules () ((_ e ...) (list e ...)))))
                f))
            '((my-list 1 2 3) (my-list)))
       '((list 1 2 3) (list)))

;; ---- a binding shadows a keyword -----------------------------------------
;; (change: binding-aware-expander, issues #103 and #92.)  These drive `expand` at the
;; source level, which is where the defect lived: the pass carried a recursion depth and
;; no notion of what was BOUND, so a keyword was resolved by spelling and a binding could
;; not shadow it.  A use of a shadowed keyword must come out as an ordinary application --
;; the form unchanged except for its subforms -- not as the macro's expansion.

(define w-macro
  '(define-syntax w (syntax-rules () ((_ e) (quote expanded-the-macro)))))

(check "a let binding shadows a keyword"
       (expand-with (list w-macro) '(let ((w f)) (w 1)))
       '(let ((w f)) (w 1)))

(check "an initializer is still OUTSIDE the let's scope"
       (expand-with (list w-macro) '(let ((w (w 1))) 2))
       '(let ((w (quote expanded-the-macro))) 2))

(check "a lambda formal shadows a keyword, rest formal included"
       (list (expand-with (list w-macro) '(lambda (w) (w 1)))
             (expand-with (list w-macro) '(lambda (a . w) (w 1)))
             (expand-with (list w-macro) '(lambda w (w 1))))
       '((lambda (w) (w 1))
         (lambda (a . w) (w 1))
         (lambda w (w 1))))

;; letrec differs from let: the names are in scope for the initializers too
(check "letrec shadows a keyword in its initializers as well as its body"
       (expand-with (list w-macro) '(letrec ((w (lambda () (w 1)))) (w 2)))
       '(letrec ((w (lambda () (w 1)))) (w 2)))

(check "an internal define shadows a keyword for the WHOLE body"
       (expand-with (list w-macro) '(lambda (x) (w 1) (define w x) (w 2)))
       '(lambda (x) (w 1) (define w x) (w 2)))

;; the named-let case that started this (issue #103): the loop name is a keyword, so the
;; recursive call must call the loop, not expand the macro.  Named let is rewritten to a
;; letrec, so what this really checks is that the rewrite is expanded under the current
;; bindings rather than at top level.
(check "a named let shadows a keyword in its own body"
       (expand-with (list w-macro) '(let w ((j 0)) (w (+ j 1))))
       '(letrec ((w (lambda (j) (w (+ j 1))))) (w 0)))

(check "an unshadowed keyword still expands"
       (expand-with (list w-macro) '(let ((x 1)) (w x)))
       '(let ((x 1)) (quote expanded-the-macro)))

;; a binding does NOT reach into quoted data, and the keyword there was never a use anyway
(check "shadowing does not disturb quoted data"
       (expand-with (list w-macro) '(let ((w f)) (quote (w 1))))
       '(let ((w f)) (quote (w 1))))

;; ---- a literal does not match a bound identifier (issue #92) -------------
;; R7RS 4.3.2 compares a literal by binding, not by spelling.  `arrow` stands in for
;; `cond`'s `=>`: the receiver-shaped rule must be skipped where the program has bound the
;; name, and matching must FALL THROUGH to the next rule rather than fail.
(define arrow-macro
  '(define-syntax arrow
     (syntax-rules (=>)
       ((_ a => b)  (quote receiver))
       ((_ a b ...) (quote ordinary)))))   ; arity as wide as cond's ordinary clause

(check "a literal matches an unbound identifier of that spelling"
       (expand-with (list arrow-macro) '(arrow 1 => 2))
       '(quote receiver))

(check "a literal does not match an identifier bound at the use site"
       (expand-with (list arrow-macro) '(let ((=> #f)) (arrow 1 => 2)))
       '(let ((=> #f)) (quote ordinary)))

;; and the shadow is scoped: leaving the binding restores the literal reading
(check "the literal reading returns outside the binding's scope"
       (expand-with (list arrow-macro)
                    '(begin (let ((=> #f)) (arrow 1 => 2)) (arrow 3 => 4)))
       '(begin (let ((=> #f)) (quote ordinary)) (quote receiver)))

;; ---- pruning a keyword a top-level define displaces (design D3) ----------
;; The per-form paths (a library body, a REPL form) have no enclosing letrec to make a
;; top-level name a lexical binding, so they prune the macro environment instead.  Same
;; question, answered before expansion rather than during it.
(check "prune-shadowed-macros drops exactly the displaced keyword"
       (map car (prune-shadowed-macros
                  (map parse-define-syntax
                       (list w-macro
                             '(define-syntax keep (syntax-rules () ((_) 0)))))
                  '(w other)))
       '(keep))

(check "a pruned keyword is an ordinary application"
       (expand (quote (w 1))
               (prune-shadowed-macros (map parse-define-syntax (list w-macro)) '(w))
               base-known)
       '(w 1))

(printf "\n  ~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
