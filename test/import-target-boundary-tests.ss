;;; Imported locations must remain distinct from source and generated binders.
;;; Run: chez --libdirs src --script test/import-target-boundary-tests.ss
(include "test/syntax-context-check.ss")

(define imported-target-front
  (frontend-expand-forms
    '((define foreign:x 99) (list imported-x foreign:x)) '() '()
    (cons '(imported-x runtime (runtime foreign:x) foreign:x) bindings) '()))
(check "source colon spelling cannot capture an imported target"
       (eval (list 'let '((foreign:x 1))
                   (cons 'let (cons '() (car imported-target-front))))
             (environment '(chezscheme)))
       '(1 99))
(define source-colon-target
  (cdr (assq 'foreign:x (frontend-source-aliases imported-target-front))))
(check "source aliases map the original spelling to its actual target"
       (and (not (eq? source-colon-target 'foreign:x))
            (not (unit-qualified? source-colon-target))
            (equal? (frontend-source-targets imported-target-front) (list source-colon-target)))
       #t)

(define lexical-import-target '%syntax.mine:x.0.0)
(define lexical-target-front
  (frontend-expand-forms
    '((lambda () (let ((x 99)) imported-x))) '() '()
    (cons (list 'imported-x 'runtime (list 'runtime lexical-import-target)
                lexical-import-target) bindings) '(mine)))
(reset-counter!)
(define lexical-target-core
  (resolve-globals
    (rename-program (parse-program (caar lexical-target-front)))
    (vector (list (cons lexical-import-target lexical-import-target)) 0)))
(check "alpha-renamed lexical target cannot capture an imported location"
       (caddr (caddr lexical-target-core)) (list 'global-ref lexical-import-target))
(check "lexical lowering does not create source export aliases"
       (frontend-source-aliases lexical-target-front) '())

(define colon-macro-front
  (frontend-expand-forms
    '((define-syntax source:macro (syntax-rules () ((_ x) (+ x 1))))
      (define-syntax generate (syntax-rules () ((_ name) (define name 9))))
      (generate result)
      (source:macro result))
    '() '() bindings '(fixture macro-alias)))
(define colon-macro-target
  (cdr (assq 'source:macro (frontend-source-aliases colon-macro-front))))
(check "source macro spelling maps to a colon-free actual keyword"
       (and (not (eq? colon-macro-target 'source:macro))
            (not (unit-qualified? colon-macro-target))
            (if (assq colon-macro-target (cadr colon-macro-front)) #t #f))
       #t)
(check "declaration recompilation retains its allocated macro keyword"
       (length (cadr colon-macro-front)) 2)
(check "unchanged source macro and generated caller names retain identity aliases"
       (list (assq 'generate (frontend-source-aliases colon-macro-front))
             (assq 'result (frontend-source-aliases colon-macro-front)))
       '((generate . generate) (result . result)))
(check "aliased macro still expands after generated definitions change its context"
       (eval (cons 'let (cons '() (car colon-macro-front))) (environment '(chezscheme))) 10)

(define colon-record-front
  (frontend-expand-forms
    '((define-record-type box (source:make value) source:box?
        (value source:get source:set!)))
    '() '() bindings '(fixture record-alias)))
(check "record aliases include exactly the source-provided runtime binders"
       (map car (frontend-source-aliases colon-record-front))
       '(source:make source:box? source:get source:set!))
(check "all record actual targets are outside the imported-global namespace"
       (map unit-qualified? (frontend-source-targets colon-record-front)) '(#f #f #f #f))

(define repeat-source-front
  (frontend-expand-forms
    '((define source:x 1) (define source:x 2) source:x) '() '() bindings '()))
(check "repeated source definitions share one allocated actual target"
       (cadr (car (car repeat-source-front)))
       (cadr (cadr (car repeat-source-front))))
(check "a repeated source name has one alias and one source target"
       (list (length (frontend-source-aliases repeat-source-front))
             (length (frontend-source-targets repeat-source-front))) '(1 1))

(define old-private-target '%binding.0)
(define old-private-generation '%binding.0.g7)
(define old-private-macro
  (make-contextual-transformer
    'get-old '(macro session get-old) '() '(((_) . old))
    (list (list 'old 'runtime (list 'session old-private-generation) old-private-generation))))
(define later-source-front
  (frontend-expand-forms
    '((define %binding.0 99) (list (get-old) %binding.0))
    (list old-private-macro) (list old-private-target old-private-generation)
    (cons (list 'get-old 'macro (transformer-origin old-private-macro) old-private-macro) bindings)
    '(repl 10)))
(define later-source-target
  (cdr (assq old-private-target (frontend-source-aliases later-source-front))))
(check "explicit source definition of a prior private target allocates a new slot"
       (eq? later-source-target old-private-target) #f)
(check "prior protected reference remains distinct from later source definition"
       (eval (list 'let (list (list old-private-generation 42))
                   (cons 'let (cons '() (car later-source-front))))
             (environment '(chezscheme))) '(42 99))

(define primitive-reference-macro
  (make-contextual-transformer
    'primitive-reference '(macro fixture primitive-reference) '()
    '(((_) . (car (quote (1)))))
    (list (assq 'car bindings) (assq 'quote bindings))))
(define primitive-shadow-front
  (frontend-expand-forms
    '((define (car x) 99) (list (primitive-reference) (car '(1))))
    (list primitive-reference-macro) '()
    (cons (list 'primitive-reference 'macro (transformer-origin primitive-reference-macro)
                primitive-reference-macro) bindings)
    '(fixture primitive-shadow)))
(check "source primitive shadow cannot capture an imported macro primitive reference"
       (eval (cons 'let (cons '() (car primitive-shadow-front)))
             (environment '(chezscheme))) '(1 99))
(check "source primitive binder has an explicit distinct alias target"
       (eq? (cdr (assq 'car (frontend-source-aliases primitive-shadow-front))) 'car) #f)
(printf "import target boundaries: ~a total checks passed\n" passed)
