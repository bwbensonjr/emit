;;; Contextual identity must survive ordinary-symbol lowering boundaries.
;;; Run: chez --libdirs src --script test/contextual-boundary-tests.ss
(include "test/syntax-context-check.ss")

(check "introduced top-level definition does not alias a source binding"
       (run '((define march-hare 99)
              (define-syntax maker
                (syntax-rules ()
                  ((_ name)
                   (begin
                     (define march-hare 42)
                     (define-syntax name (syntax-rules () ((_) march-hare)))))))
              (maker hatter)
              (list march-hare (hatter))))
       '(99 42))

(define collision-front
  (frontend-expand-forms
    '((define %syntax.tmp.2 99)
      (define-syntax m (syntax-rules () ((_ x) (let ((tmp 1)) x))))
      (m %syntax.tmp.2))
    '() '() bindings '()))
(check "generated identifier cannot equal a source identifier spelling"
       (eval (cons 'let (cons '() (car collision-front))) (environment '(chezscheme)))
       99)

(define core-shadow-front
  (frontend-expand-forms
    '((define (if x y z) (+ x y z)) (if 1 2 3))
    '() '() bindings '()))
(check "runtime core-spelled operator is protected before parsing"
       (car (cadr (car core-shadow-front))) '(begin if))

(define definition-shadow-front
  (frontend-expand-forms
    '((define (define x) x) (define 5)) '() '() bindings '()))
(check "defining define preserves its declaration identity"
       (car (car (car definition-shadow-front))) 'define)
(check "later source define spelling is an ordinary runtime call"
       (car (cadr (car definition-shadow-front))) '(begin define))
(define unsupported-name-shadow-front
  (frontend-expand-forms
    '((define (define-values x) x) (define-values 5)) '() '() bindings '()))
(check "runtime definition-form spelling cannot trigger unsupported-syntax diagnostics"
       (car (cadr (car unsupported-name-shadow-front))) '(begin define-values))

(define record-shadow-front
  (frontend-expand-forms
    '((define-record-type box (make-box x) box? (x define-record-type))
      (define-record-type (make-box 7))) '() '() bindings '()))
(check "record declaration keeps identity when its accessor shadows its keyword"
       (car (car (car record-shadow-front))) 'define-record-type)
(check "record-spelled accessor call cannot be rediscovered as a declaration"
       (car (cadr (car record-shadow-front))) '(begin define-record-type))

(define mixed-graph-source
  (read (open-input-string "((quote #0=(#(a #0#))))")))
(define mixed-graph-result
  (cadar (car (frontend-expand-forms mixed-graph-source '() '() bindings '()))))
(check "reader pair and vector backedges share one syntax conversion graph"
       (eq? mixed-graph-result (vector-ref (car mixed-graph-result) 1)) #t)
(define vector-graph-source
  (read (open-input-string "(#0=#(#0#))")))
(define vector-graph-result
  (caar (frontend-expand-forms vector-graph-source '() '() bindings '())))
(check "self-evaluating vector cycles retain graph identity"
       (eq? vector-graph-result (vector-ref vector-graph-result 0)) #t)

(define introduced-owner
  (frontend-expand-forms
    '((define march-hare 99)
      (define-syntax maker
        (syntax-rules ()
          ((_ name)
           (begin (define march-hare 42)
                  (define-syntax name (syntax-rules () ((_) march-hare)))))))
      (maker hatter))
    '() '() bindings '(fixture introduced)))
(define introduced-target (car (frontend-private-targets introduced-owner)))
(check "metadata records source-provided binding targets exactly"
       (frontend-source-targets introduced-owner) '(march-hare maker hatter))
(check "introduced target is distinct from source-visible spelling"
       (memq introduced-target (frontend-source-targets introduced-owner)) #f)
(define introduced-interface
  (resolve-exported-macros
    '(fixture introduced) '((hatter . hatter)) (cadr introduced-owner)
    (map cadr (car introduced-owner)) '()))
(check "export roots the actual introduced runtime target"
       (cadr introduced-interface) (list introduced-target))
(check "export mangles an introduced runtime target exactly once"
       (cadddr (car (transformer-context (caar introduced-interface))))
       (string->symbol (mangle '(fixture introduced) introduced-target)))

(define collision-alias 'fixture.macros:private)
(define collision-interface
  (resolve-exported-macros '(fixture macros) (list (cons collision-alias 'public))
                          (cadr artifact-front) '(helper) '()))
(define collision-public (assq collision-alias (car collision-interface)))
(check "hidden export queue does not consume a public alias spelling"
       (length (car collision-interface)) 2)
(define collision-consumer
  (frontend-expand-forms
    (list (list collision-alias 4)) (car collision-interface) '()
    (cons (list collision-alias 'macro (transformer-origin collision-public) collision-public) bindings)
    '(fixture alias-consumer)))
(check "public alias and renamed private helper preserve separate origins"
       (eval (caar collision-consumer) (environment '(chezscheme))) 5)

(define two-private-owner
  (frontend-expand-forms
    '((define-syntax maker
        (syntax-rules ()
          ((_ name value)
           (begin (define-syntax private (syntax-rules () ((_) value)))
                  (define-syntax name (syntax-rules () ((_) (private))))))))
      (maker first 42) (maker second 43))
    '() '() bindings '(fixture private-owners)))
(define two-private-interface
  (resolve-exported-macros '(fixture private-owners) '((first . first) (second . second))
                          (cadr two-private-owner) '() '()))
(define two-private-bindings
  (append (map (lambda (name)
                 (let ([entry (assq name (car two-private-interface))])
                   (list name 'macro (transformer-origin entry) entry))) '(first second)) bindings))
(define two-private-consumer
  (frontend-expand-forms '((list (first) (second))) (car two-private-interface) '()
                         two-private-bindings '(fixture private-consumer)))
(check "separate introduced top-level macros keep distinct saved entries"
       (eval (caar two-private-consumer) (environment '(chezscheme))) '(42 43))

(printf "contextual lowering boundaries: ~a total checks passed\n" passed)
