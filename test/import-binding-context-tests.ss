;;; Import binding identity and compile-time interface regression checks.
;;; Run: chez --libdirs src --script test/import-binding-context-tests.ss
(import (chezscheme))
(include "src/match.scm")
(include "src/util.scm")
(include "src/parse.ss")
(include "src/passes/expand.ss")
(include "src/prelude-surface.scm")
(include "src/core.ss")

(define checks 0)
(define (check label actual expected)
  (unless (equal? actual expected)
    (error 'import-bindings label actual expected))
  (set! checks (+ checks 1)))
(define (rejects thunk)
  (guard (e [else #t]) (thunk) #f))
(define (runtime-table name target)
  (export-table-datum name (list (cons 'f target)) '() (make-ct-half '() '() '())))
(define (macro-table name)
  (export-table-datum name '() '()
    (make-ct-half
      (list (make-contextual-transformer 'm (list 'macro name 'm) '()
              '(((_) . 1)) '()))
      '() '())))

(define owner (runtime-table '(owner) "owner:f"))
(define other (runtime-table '(other) "other:f"))
(check "different runtime locations conflict"
       (rejects (lambda () (validate-import-tables (list owner other)))) #t)
(check "reverse import order still conflicts"
       (rejects (lambda () (validate-import-tables (list other owner)))) #t)
(check "same location through facade is legal"
       (length (validate-import-tables
                 (list owner (runtime-table '(facade) "owner:f")))) 2)
(check "independent equal-text transformers conflict"
       (rejects (lambda () (validate-import-tables
                            (list (macro-table '(a)) (macro-table '(b)))))) #t)
(check "same transformer through facade remains one binding"
       (let* ([a (macro-table '(a))]
              [b (export-table-datum '(b) '() '() (table-ct-half a))])
         (length (validate-import-tables (list a b)))) 2)
(check "runtime versus macro collision is rejected"
       (rejects (lambda ()
         (validate-import-tables
           (list owner (import-set-table '(rename (a) (m f)) (macro-table '(a))))))) #t)
(check "within-set rename collision is rejected"
       (rejects (lambda ()
         (validate-import-tables
           (list (import-set-table '(rename (a) (g f))
             (export-table-datum '(a) '((f . "a:f") (g . "a:g")) '()
               (make-ct-half '() '() '()))))))) #t)

(define base
  (export-table-datum '(scheme base) '() '()
    (make-ct-half '() '() '() (builtin-library-bindings '(scheme base)))))
(define prefixed (import-set-table '(prefix (scheme base) b:) base))
(check "primitive prefix preserves origin"
       (cdr (assq 'b:car (ct-bindings (table-ct-half prefixed))))
       (cdr (assq 'car (ct-bindings (table-ct-half base)))))
(check "core prefix preserves identity"
       (cadr (assq 'b:if (ct-bindings (table-ct-half prefixed)))) 'core)
(check "primitive exclusion removes public binding"
       (assq 'car (import-table-bindings
                    (import-set-table '(except (scheme base) car) base))) #f)
(check "other standard libraries do not publish base names"
       (rejects (lambda ()
         (import-set-table '(only (scheme inexact) define car)
                           '((scheme inexact) ((sqrt . "scheme.inexact:sqrt")) ())))) #t)
(check "raw backend operators are not published"
       (assq '%car (import-table-bindings base)) #f)
(check "old runtime-only tables still read"
       (table-ct-half '((old) ((f . "old:f")) ((f "old:code:f" 0))))
       '(() () ()))
(check "new context metadata round trips"
       (read (open-input-string (render-datum prefixed))) prefixed)
(check "builtin metadata does not change runtime rows" (cadr prefixed) '())
(define contextual-table (macro-table '(contextual)))
(check "macro interfaces without explicit visibility require rebuilding"
       (guard (e [else (condition-message e)])
         (validate-library-interface
           (list '(legacy-context) '() '()
                 (list (ct-macros (table-ct-half contextual-table)) '() '()
                       '(binding-context-v2 ()))))
         #f)
       "incompatible macro visibility; rebuild library")
(define legacy-builtin-half
  (list '() '() '()
        (list 'binding-context-v2 (builtin-library-bindings '(scheme base)))))
(check "runtime-only builtin interfaces retain legacy extension support"
       (ct-bindings (table-ct-half
                     (validate-library-interface
                       (list '(legacy-builtins) '() '() legacy-builtin-half))))
       (builtin-library-bindings '(scheme base)))
(unless (equal? (getenv "EMIT_VERBOSITY") "quiet")
  (fprintf (current-error-port) "test import binding contexts -> assertions [~a passed]~n" checks))
