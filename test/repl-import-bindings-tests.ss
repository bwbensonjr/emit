;;; Exercise session import transactions directly against the shared core.
(import (chezscheme))
(include "src/match.scm")
(include "src/util.scm")
(include "src/parse.ss")
(include "src/passes/expand.ss")
(include "src/passes/recognize-let.ss")
(include "src/passes/convert-assignments.ss")
(include "src/passes/simplify.ss")
(include "src/passes/convert-closures.ss")
(include "src/passes/lower.ss")
(include "src/emit.ss")
(include "src/prelude-surface.scm")
(include "src/core.ss")
(define (read-all-from-string s)
  (let ([p (open-input-string s)])
    (let loop ([forms '()])
      (let ([f (read p)])
        (if (eof-object? f) (reverse forms) (loop (cons f forms)))))))
(define (error-object? e) (condition? e))
(define (error-object-message e)
  (if (message-condition? e) (condition-message e) "error"))
(define (error-object-irritants e)
  (if (irritants-condition? e) (condition-irritants e) '()))
(define *prelude-source* "")
(define saved-session-state #f)
(define (repl-state-set! state) (set! saved-session-state state))
(define (repl-state-ref) saved-session-state)
(define (source-home) "")
(define (includes-read) '())
(define (set-source-home! path) (void))
(define (set-includes-read! paths) (void))
(include "src/repl-core.ss")

(define checks 0)
(define (check name actual expected)
  (unless (equal? actual expected)
    (error 'repl-import-test name actual expected))
  (set! checks (+ checks 1)))
(define base-table
  (export-table-datum '(scheme base) '((map . "scheme.base:map")) '()
                      (make-ct-half '() '() '()
                                    (builtin-library-bindings '(scheme base)))))
(define a-table '((a) ((f . "a:f")) ()))
(define b-table '((b) ((f . "b:f")) ()))
(define alias-table '((alias) ((f . "a:f")) ()))

(init-session "enabled")
(set! *repl-libs* (list base-table a-table b-table alias-table))
(check "startup imports base" (car (repl-autoimport "")) 'ok)
(check "startup map is visible" (and (assq 'map (vector-ref *repl-env* 0)) #t) #t)
(check "prefix replaces implicit base"
       (car (repl-autoimport "(import (prefix (scheme base) b:))")) 'ok)
(check "bare map removed" (assq 'map (vector-ref *repl-env* 0)) #f)
(check "prefixed map visible"
       (cdr (assq 'b:map (vector-ref *repl-env* 0))) 'scheme.base:map)
(check "primitive alias retained"
       (cadr (assq 'b:car (repl-session-bindings))) 'primitive)
(check "ordinary primitive hidden" (assq 'car (repl-session-bindings)) #f)
(check "explicit imports accumulate" (car (repl-autoimport "(import (a))")) 'ok)
(define prior-env (vector-ref *repl-env* 0))
(define prior-specs *repl-import-specs*)
(check "conflicting whole transaction rejected"
       (car (repl-autoimport "(import (only (scheme base) car) (b))")) 'error)
(check "failed merge preserves environment" (vector-ref *repl-env* 0) prior-env)
(check "failed merge preserves import views" *repl-import-specs* prior-specs)
(check "same-origin facade accepted" (car (repl-autoimport "(import (alias))")) 'ok)
(check "pre-init conflict rejected" (car (compile-one-form '(import (b)))) 'error)
(repl-note-defines! '(map))
(repl-env-define! *repl-env* 'map)
(define own-map (repl-env-lookup *repl-env* 'map))
(check "subsequent import succeeds"
       (car (repl-autoimport "(import (only (scheme base) car))")) 'ok)
(check "session generation survives view rebuild" (repl-env-lookup *repl-env* 'map) own-map)

(set! make-dumper (lambda (name) no-dump))
(init-session "")
(check "session variable definition compiles"
       (car (compile-one-form '(define x 7))) 'ok)
(define original-x (repl-env-lookup *repl-env* 'x))
(check "session macro definition compiles"
       (car (compile-one-form '(define-syntax read-x (syntax-rules () ((_ ) x))))) 'syntax)
(check "session variable redefinition compiles"
       (car (compile-one-form '(define x 8))) 'ok)
(define read-x-result (compile-one-form '(read-x)))
(check "macro retains original generation" (car read-x-result) 'ok)
(check "macro emitted reference targets original generation"
       (str-contains? (car (cdr read-x-result)) (symbol->string original-x)) #t)
(check "old generation stays addressable"
       (repl-env-lookup *repl-env* original-x) original-x)
(check "local syntax compiles interactively"
       (car (compile-one-form '(let-syntax ((m (syntax-rules () ((_ x) x)))) (m 42)))) 'ok)
(check "syntax-only forms advance origin generation" (> *repl-syntax-n* *repl-n*) #t)
(define syntax-generation *repl-syntax-n*)
(check "failed expansion is recoverable"
       (car (compile-one-form '(let-syntax ((m (syntax-rules () ((_ ) 1)))) (m 2)))) 'error)
(check "failed expansion restores origin generation" *repl-syntax-n* syntax-generation)

(init-session "enabled")
(set! *repl-libs* (list base-table a-table))
(check "prefixed syntax view installs"
       (car (repl-autoimport "(import (prefix (scheme base) b:))")) 'ok)
(check "prefixed definition is discovered"
       (car (compile-one-form '(b:define x (b:quote 7)))) 'ok)
(check "prefixed transformer definition is discovered"
       (car (compile-one-form
              '(b:define-syntax m (b:syntax-rules () ((_ x) (b:+ x 1)))))) 'syntax)
(check "prefixed macro invocation compiles" (car (compile-one-form '(m 8))) 'ok)
(check "later import rebuild keeps own macro" (car (repl-autoimport "(import (a))")) 'ok)
(check "own macro remains available" (car (compile-one-form '(m 9))) 'ok)
(check "hidden bare syntax fails" (car (compile-one-form '(lambda (x) x))) 'error)
(check "hidden include is not intercepted"
       (repl-source-splicing-form '(include "missing.scm")) #f)
(check "prefixed include is recognized"
       (repl-source-splicing-form '(b:include "body.scm")) '(include "body.scm"))
(check "generated definition groups compile"
       (car (compile-one-form
              '(b:begin (b:define a (b:lambda () (b)))
                        (b:define b (b:lambda () 12)) (a)))) 'ok)
(check "mixed definition group compiles"
       (car (compile-one-form
              '(b:begin (b:define captured 31)
                        (b:define-syntax grouped
                          (b:syntax-rules () ((_ ) captured)))))) 'ok)
(define captured-generation (repl-env-lookup *repl-env* 'captured))
(check "group macro captures allocated generation"
       (cadddr (assq 'captured
                     (transformer-context (assq 'grouped *repl-macro-env*))))
       captured-generation)
(check "redefinition after mixed group compiles"
       (car (compile-one-form '(b:define captured 32))) 'ok)
(check "mixed group macro keeps its generation"
       (str-contains? (car (cdr (compile-one-form '(grouped))))
                      (symbol->string captured-generation)) #t)
(check "legacy runtime-only interface remains readable"
       (check-cached-rows (list (list '(a) '() a-table "a:__init"))) #t)
(define legacy-macro-table
  (export-table-datum '(legacy) '() '()
                      (make-ct-half '((m () ((_) . 1))) '() '())))
(check "legacy macro context requires rebuild"
       (guard (e (#t 'error))
         (check-cached-rows
           (list (list '(legacy) '() legacy-macro-table "legacy:__init"))))
       'error)
(init-session "")
(check "definition-generating macro compiles"
       (car (compile-one-form
              '(define-syntax install-private
                 (syntax-rules ()
                   ((_ public)
                    (begin (define hidden-value 41)
                           (define (public) hidden-value))))))) 'syntax)
(check "captured public definition and private global compile"
       (car (compile-one-form '(install-private read-private))) 'ok)
(check "captured definition is source-visible"
       (and (assq 'read-private (repl-session-bindings)) #t) #t)
(check "introduced global spelling stays hidden"
       (car (compile-one-form 'hidden-value)) 'error)
(check "introduced global remains available to compiled procedure"
       (car (compile-one-form '(read-private))) 'ok)
(define private-runtime-targets
  (filter (lambda (n) (not (memq n *repl-source-names*))) *repl-own-names*))
(check "private global retains an internal generation"
       (and (pair? private-runtime-targets)
            (repl-env-lookup *repl-env* (car private-runtime-targets)) #t) #t)
(check "a later source definition can publish the hidden spelling"
       (car (compile-one-form '(define hidden-value 99))) 'ok)
(check "the later source binding becomes visible"
       (and (assq 'hidden-value (repl-session-bindings)) #t) #t)
(check "transformer-generating macro compiles"
       (car (compile-one-form
              '(define-syntax install-private-syntax
                 (syntax-rules ()
                   ((_ public)
                    (begin
                      (define-syntax hidden-syntax
                        (syntax-rules () ((_ ) 13)))
                      (define-syntax public
                        (syntax-rules () ((_ ) (hidden-syntax)))))))))) 'syntax)
(check "captured public transformer and private dependency compile"
       (car (compile-one-form '(install-private-syntax read-private-syntax))) 'syntax)
(check "introduced transformer spelling stays hidden"
       (car (compile-one-form '(hidden-syntax))) 'error)
(check "private transformer dependency remains usable"
       (car (compile-one-form '(read-private-syntax))) 'ok)
(check "explicitly publishing a same-spelled transformer compiles"
       (car (compile-one-form
              '(define-syntax hidden-syntax (syntax-rules () ((_ ) 99))))) 'syntax)
(check "public transformer still reaches its original private dependency"
       (car (frontend-expand-forms '((read-private-syntax)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe))) '(13))
(define visible-before-failure *repl-source-names*)
(check "a failed generated definition group is rejected"
       (car (compile-one-form '(begin (define doomed 1) no-such-binding))) 'error)
(check "failed group restores the source visibility set"
       *repl-source-names* visible-before-failure)
(set! *repl-libs* (list a-table))
(check "imports preserve protected session bindings"
       (car (repl-autoimport "(import (a))")) 'ok)
(check "private runtime targets remain unavailable after import rebuild"
       (any-of? (lambda (n) (assq n (repl-session-bindings))) private-runtime-targets) #f)
(check "private transformer dependency survives import rebuild"
       (car (frontend-expand-forms '((read-private-syntax)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe))) '(13))
(define visible-before-save *repl-source-names*)
(repl-save-state!)
(set! *repl-source-names* '())
(repl-restore-state!)
(check "source visibility persists across host calls"
       *repl-source-names* visible-before-save)
(check "host-call restore keeps private transformer dependencies usable"
       (car (frontend-expand-forms '((read-private-syntax)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe))) '(13))
(check "private-global reader generator compiles"
       (car (compile-one-form
              '(define-syntax install-private-reader
                 (syntax-rules ()
                   ((_ public)
                    (begin
                      (define hidden-global 17)
                      (define-syntax public
                        (syntax-rules () ((_ ) hidden-global))))))))) 'syntax)
(check "private global and captured reader declaration compile"
       (car (compile-one-form '(install-private-reader read-hidden-global))) 'ok)
(define protected-global
  (cadddr (assq 'hidden-global
                 (transformer-context (assq 'read-hidden-global *repl-macro-env*)))))
(check "introduced global context resolves to its allocated generation"
       (and (memq protected-global *repl-owned-globals*) #t) #t)
(check "source cannot name the introduced global"
       (car (compile-one-form 'hidden-global)) 'error)
(check "later explicit hidden-global definition compiles"
       (car (compile-one-form '(define hidden-global 99))) 'ok)
(check "reader transformer keeps the introduced global generation"
       (car (frontend-expand-forms '((read-hidden-global)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe)))
       (list protected-global))
(init-session "")
(check "record declarations compile with public family bindings"
       (car (compile-one-form '(define-record-type box (make-box x) box? (x box-value)))) 'ok)
(check "record metadata exposes only the source constructor predicate and accessor"
       (and (= (length *repl-source-names*) 3)
            (andmap (lambda (n) (memq n *repl-source-names*))
                    '(make-box box? box-value)) #t) #t)
(check "record runtime helpers do not gain source binding rows"
       (let ([rows (filter (lambda (row) (eq? (cadr row) 'runtime))
                           (repl-session-bindings))])
         (and (= (length rows) 3)
              (andmap (lambda (row) (memq (car row) '(make-box box? box-value))) rows)
              #t)) #t)

(init-session "")
(set! *repl-libs* (list '((foreign) ((x . "foreign:x")) ()) a-table))
(check "foreign runtime import installs" (car (repl-autoimport "(import (foreign))")) 'ok)
(define imported-x (repl-env-lookup *repl-env* 'x))
(check "colon-spelled source definition gets local storage"
       (car (compile-one-form '(define foreign:x 99))) 'ok)
(define colon-alias (cdr (assq 'foreign:x *repl-source-aliases*)))
(define colon-generation (repl-env-lookup *repl-env* colon-alias))
(check "colon alias has a distinct internal name" (eq? colon-alias 'foreign:x) #f)
(check "colon source name does not overwrite imported storage"
       (repl-env-lookup *repl-env* 'x) imported-x)
(check "public colon name resolves to its local generation"
       (cadddr (assq 'foreign:x (repl-session-bindings))) colon-generation)
(check "colon alias is assignable as a local variable"
       (car (compile-one-form '(set! foreign:x 100))) 'ok)
(check "the imported original stays immutable"
       (car (compile-one-form '(set! x 1))) 'error)
(check "colon procedure definition compiles"
       (car (compile-one-form '(define (foreign:proc n) (+ n 1)))) 'ok)
(check "colon procedure alias is callable"
       (car (compile-one-form '(foreign:proc 3))) 'ok)
(check "colon macro declaration compiles"
       (car (compile-one-form
              '(define-syntax foreign:macro (syntax-rules () ((_ ) 7))))) 'syntax)
(check "colon macro alias expands"
       (car (frontend-expand-forms '((foreign:macro)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe))) '(7))
(check "macro capturing colon variable compiles"
       (car (compile-one-form
              '(define-syntax read-colon (syntax-rules () ((_ ) foreign:x))))) 'syntax)
(check "colon variable redefinition allocates another local target"
       (car (compile-one-form '(define foreign:x 101))) 'ok)
(check "captured colon variable retains its prior generation"
       (car (frontend-expand-forms '((read-colon)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe)))
       (list colon-generation))
(define aliases-before-failure *repl-source-aliases*)
(check "failed source alias group is rejected"
       (car (compile-one-form '(begin (define future:alias 1) no-such-binding))) 'error)
(check "failed group restores public aliases" *repl-source-aliases* aliases-before-failure)
(check "import rebuild preserves colon aliases"
       (car (repl-autoimport "(import (a))")) 'ok)
(check "colon procedure still compiles after import rebuild"
       (car (compile-one-form '(foreign:proc 4))) 'ok)
(define aliases-before-save *repl-source-aliases*)
(repl-save-state!)
(set! *repl-source-aliases* '())
(repl-restore-state!)
(check "source aliases persist across host calls" *repl-source-aliases* aliases-before-save)

(init-session "")
(check "private-slot generator compiles"
       (car (compile-one-form
              '(define-syntax allocate-private-slot
                 (syntax-rules ()
                   ((_ public)
                    (begin (define secret 11)
                           (define-syntax public (syntax-rules () ((_ ) secret))))))))) 'syntax)
(check "private slot and public reader compile"
       (car (compile-one-form '(allocate-private-slot read-secret-slot))) 'ok)
(define private-slot-name
  (car (filter (lambda (n) (not (memq n *repl-source-names*))) *repl-own-names*)))
(define private-slot-generation (repl-env-lookup *repl-env* private-slot-name))
(check "source can later define the exact private target spelling"
       (car (compile-one-form (list 'define private-slot-name 22))) 'ok)
(check "later public alias uses a different actual target"
       (eq? (cdr (assq private-slot-name *repl-source-aliases*)) private-slot-name) #f)
(check "the captured private slot is not overwritten"
       (repl-env-lookup *repl-env* private-slot-name) private-slot-generation)
(check "reader keeps original private generation after explicit public definition"
       (car (frontend-expand-forms '((read-secret-slot)) *repl-macro-env*
                                   *repl-known* (repl-session-bindings) '(probe)))
       (list private-slot-generation))
(printf "repl import bindings: ~a checks passed\n" checks)
