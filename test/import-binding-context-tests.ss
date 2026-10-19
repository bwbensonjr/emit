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
;; Load only the driver's root-joining helpers, not its effectful CLI. These
;; assertions also execute on CI's older Chez, where path-build is unbound.
(call-with-input-file "src/compile.ss"
  (lambda (port)
    (let loop ([form (read port)])
      (unless (eof-object? form)
        (when (and (pair? form) (eq? (car form) 'define)
                   (pair? (cadr form))
                   (memq (caadr form) '(ensure-slash absolute-library-root)))
          (eval form (interaction-environment)))
        (loop (read port))))))
(check "relative root with spaces is joined on the Chez host"
       (absolute-library-root "lib with spaces")
       (string-append (ensure-slash (current-directory)) "lib with spaces"))
(check "absolute root is unchanged" (absolute-library-root "/tmp/libraries")
       "/tmp/libraries")
(check "root joining retains a trailing separator"
       (absolute-library-root "relative/")
       (string-append (ensure-slash (current-directory)) "relative/"))
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

;; #136: a freshly rebuilt binding and an artifact-restored one may be equal
;; without sharing the same allocation. Do not let that history label exports.
(define (history-table shared?)
  (let* ([unit (list 'history)]
         [origin (list 'macro unit 'm)]
         [row (list 'lambda 'core (list 'builtin 'core 'lambda) 'lambda)]
         [rules (list (list '(_) 'lambda 'x 'x))]
         [entry (make-contextual-transformer 'm origin '() rules (list row))]
         [alias (make-contextual-transformer 'history:m
                   (if shared? origin (list 'macro (list 'history) 'm))
                   '() (if shared? rules (list (list '(_) 'lambda 'x 'x)))
                   (list (if shared? row
                             (list 'lambda 'core (list 'builtin 'core 'lambda)
                                   'lambda))))])
    (export-table-datum unit '() '()
      (make-ct-half (list entry alias) '() '() (list row) '(m)))))
(define shared-history (history-table #t))
(define separate-history (history-table #f))
(check "history fixture has equal contents" shared-history separate-history)
(check "history fixture exposes different original labels"
       (string=? (render-datum shared-history) (render-datum separate-history)) #f)
(check "binding allocation history does not change artifact bytes"
       (render-export-table shared-history) (render-export-table separate-history))
(check "restored metadata renders identically"
       (render-export-table (read (open-input-string (render-datum separate-history))))
       (render-export-table shared-history))
(check "canonicalization is idempotent"
       (render-export-table (canonical-export-table shared-history))
       (render-export-table shared-history))
(check "canonicalization preserves values"
       (canonical-export-table shared-history) shared-history)
(let* ([origin '(builtin core lambda)]
       [a (list 'lambda 'core origin 'lambda 'first-key)]
       [b (list 'lambda 'core origin 'lambda 'second-key)]
       [alias (list 'alias 'core origin 'lambda 'first-key)]
       [table (export-table-datum '(keys) '() '()
                (make-ct-half
                  (list (make-contextual-transformer 'm '(macro (keys) m) '() '()
                          (list a b alias)))
                  '() '()))]
       [rows (transformer-context
               (car (ct-macros (table-ct-half (canonical-export-table table)))))])
  (check "same-origin bindings retain distinct lexical keys"
         (eq? (car rows) (cadr rows)) #f)
  (check "same-origin aliases retain distinct spellings"
         (eq? (car rows) (caddr rows)) #f))
(define (datum-table rules)
  (export-table-datum '(data) '() '()
    (make-ct-half
      (list (make-contextual-transformer 'm '(macro (data) m) '() rules '()))
      '() '())))
(let* ([spoof (vector '%syntax-identifier-v2 'x 'x 'not-a-binding)]
       [rules (source-syntax (list (list '(_) (list 'quote spoof))))]
       [table (datum-table rules)])
  (check "reader vector cannot forge a compiler identifier during canonicalization"
         (canonical-export-table table) table))
(let* ([row (list 'lambda 'core (list 'builtin 'core 'lambda) 'lambda)]
       [id (vector '%syntax-identifier-v2 'lambda '(key lambda) row)]
       [table (export-table-datum '(identifier) '() '()
                (make-ct-half
                  (list (make-contextual-transformer 'm '(macro (identifier) m) '()
                          (list id) (list row)))
                  '() '()))]
       [back (read (open-input-string (render-export-table table)))]
       [m (car (ct-macros (table-ct-half back)))])
  (check "identifier fallback shares the canonical binding row"
         (eq? (vector-ref (car (transformer-rules m)) 3)
              (car (transformer-context m))) #t))
(let* ([leaf (list 'lambda 'core '(builtin core lambda) 'lambda)]
       [text (string-copy "shared")]
       [cycle (cons 'cycle '())]
       [v (vector leaf leaf (list 'lambda 'core '(builtin core lambda) 'lambda)
                  text text cycle)]
       [rules (list (list '(_) (list 'quote v)))])
  (set-cdr! cycle cycle)
  (let* ([encoded (render-export-table (datum-table rules))]
         [back (read (open-input-string encoded))]
         [saved (cadr (cadr (car (transformer-rules
                                  (car (ct-macros (table-ct-half back)))))))])
    (check "user pair sharing survives" (eq? (vector-ref saved 0) (vector-ref saved 1)) #t)
    (check "equal user lists are not merged"
           (eq? (vector-ref saved 0) (vector-ref saved 2)) #f)
    (check "user string sharing survives"
           (eq? (vector-ref saved 3) (vector-ref saved 4)) #t)
    (check "user cycle survives"
           (eq? (vector-ref saved 5) (cdr (vector-ref saved 5))) #t)))
(unless (equal? (getenv "EMIT_VERBOSITY") "quiet")
  (fprintf (current-error-port) "test import binding contexts -> assertions [~a passed]~n" checks))
