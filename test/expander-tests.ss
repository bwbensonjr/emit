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

(printf "\n  ~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
