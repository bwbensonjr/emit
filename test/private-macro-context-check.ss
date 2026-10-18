;;; Imported helper registry entries must not become source-visible bindings.
;;; Run: chez --libdirs src --script test/private-macro-context-check.ss
(include "test/syntax-context-check.ss")
(include "src/prelude-surface.scm")
(include "src/core.ss")

(define private-table (list '(fixture macros) '() '() artifact-roundtrip))
(define private-source-bindings
  (append bindings (import-tables->bindings (list private-table))))
(check "saved private macro is absent from the public binding view"
       (map car (import-tables->bindings (list private-table))) '(public))
(check "saved private macro cannot be invoked by its hidden registry key"
       (guard (error (#t 'rejected))
         (frontend-expand-forms
           '((fixture.macros:private 4))
           (import-tables->macro-env (list private-table)) '()
           private-source-bindings '(fixture consumer))
         'accepted)
       'rejected)

(define prefixed-private-table
  (import-set-table '(prefix (fixture macros) p:) private-table))
(check "prefixed public macro remains explicitly published"
       (map car (import-tables->bindings (list prefixed-private-table))) '(p:public))
(define prefixed-expansion
  (frontend-expand-forms
    '((p:public 4)) (import-tables->macro-env (list prefixed-private-table)) '()
    (append bindings (import-tables->bindings (list prefixed-private-table)))
    '(fixture prefixed-consumer)))
(check "prefixed public macro retains private definition-site dependencies"
       (eval (caar prefixed-expansion) (environment '(chezscheme))) 5)

(define other-public-front
  (frontend-expand-forms
    '((define-syntax public (syntax-rules () ((_ x) 99))))
    '() '() bindings '(fixture other-macros)))
(define other-public-table
  (export-table-datum
    '(fixture other-macros) '() '()
    (resolve-exported-macros '(fixture other-macros) '((public . public))
                            (cadr other-public-front) '() '())))
(check "conflicting public prefixed macro names are validated"
       (guard (error (#t 'rejected))
         (validate-import-tables
           (list prefixed-private-table
                 (import-set-table '(prefix (fixture other-macros) p:) other-public-table)))
         'accepted)
       'rejected)
(define foreign-front
  (frontend-expand-forms
    '((define-syntax inc (syntax-rules () ((_ x) (+ x 1)))))
    '() '() bindings '(foreign)))
(define foreign-table
  (export-table-datum '(foreign) '() '()
    (resolve-exported-macros '(foreign) '((inc . inc)) (cadr foreign-front) '() '())))
(define colliding-import-table
  (import-set-table '(rename (foreign) (inc x.private.0)) foreign-table))
(define colliding-owner-front
  (frontend-expand-forms
    '((define-syntax x (syntax-rules () ((_ v) (+ v 10))))
      (define-syntax outer (syntax-rules () ((_ v) (list (x v) (x.private.0 v))))))
    (import-tables->macro-env (list colliding-import-table)) '()
    (append bindings (import-tables->bindings (list colliding-import-table))) '(fixture owner)))
(define colliding-owner-interface
  (library-macro-interface '(fixture owner) '((fixture.owner:x . outer))
                          (cadr colliding-owner-front) '() '()
                          (list colliding-import-table) '(fixture.owner:x)))
(define colliding-owner-table
  (export-table-datum '(fixture owner) '() '() colliding-owner-interface))
(define collision-facade-interface
  (forwarded-macros '((public . fixture.owner:x)) (list colliding-owner-table)))
(define collision-facade-table
  (export-table-datum '(fixture facade) '() '() collision-facade-interface))
(define collision-import-result
  (frontend-expand-forms
    '((public 4)) (import-tables->macro-env (list collision-facade-table)) '()
    (append bindings (import-tables->bindings (list collision-facade-table))) '(consumer)))
(check "owned and forwarded hidden-key collisions retain both origins"
       (eval (caar collision-import-result) (environment '(chezscheme))) '(14 5))
(printf "private macro contexts: ~a total checks passed\n" passed)
