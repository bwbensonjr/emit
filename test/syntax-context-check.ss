;;; syntax-context-check.ss -- contextual expansion and lexical macro checks.
;;; Run: chez --libdirs src --script test/syntax-context-check.ss
(import (chezscheme))
(include "src/match.scm")
(include "src/util.scm")
(include "src/parse.ss")
(include "src/passes/expand.ss")

(define syntax-names
  (append *core-keywords* '(let-syntax letrec-syntax define-record-type)))
(define bindings
  (append (map (lambda (s) (list s 'core (list 'builtin s) s)) syntax-names)
          (map (lambda (p) (list (car p) 'primitive (list 'builtin (car p)) (car p))) *integrable*)
          (map (lambda (s) (list s 'runtime (list 'builtin s) s))
               '(list append length values call-with-values error odd? even?))))
(define (run forms . macros)
  (let* ([entries (if (null? macros) '() (car macros))]
         ;; These are the public export declarations of this harness's saved
         ;; interface fixtures. Private registry entries are deliberately absent.
         [public-rows
           (map (lambda (m) (list (car m) 'macro (transformer-origin m) m))
                (filter (lambda (m) (and (contextual-transformer? m)
                                        (memq (car m) '(public use-aliases)))) entries))]
         [front (frontend-expand-forms forms entries
                                       '() (append public-rows bindings) '(syntax test))]
         [expanded (car front)])
    (eval (cons 'let (cons '() expanded)) (environment '(chezscheme)))))
(define passed 0)
(define (check name got expected)
  (unless (equal? got expected) (error 'syntax-context-check name got expected))
  (set! passed (+ passed 1))
  (printf "  [OK] ~a\n" name))

(check "definition-site lexical variable"
       (run '((let ((x 'outer))
                (let-syntax ((m (syntax-rules () ((_ ) x))))
                  (let ((x 'inner)) (m)))))) 'outer)
(check "nonrecursive keyword sees outer transformer"
       (run '((define-syntax m (syntax-rules () ((_) 'outer)))
              (let-syntax ((m (syntax-rules () ((_) (m))))) (m)))) 'outer)
(check "recursive local transformers"
       (run '((letrec-syntax
                ((a (syntax-rules () ((_ x) (b x))))
                 (b (syntax-rules () ((_ x) x))))
                (a 7)))) 7)
(check "known global does not capture introduced temporary"
       (run '((define tmp 9)
              (define-syntax m (syntax-rules () ((_ x) (let ((tmp 1)) x))))
              (m tmp))) 9)
(check "same lexical literal matches, shadow differs"
       (run '((let ((x 1))
                (let-syntax ((m (syntax-rules (x) ((_ x) 'same) ((_ y) 'other))))
                  (list (m x) (let ((x 2)) (m x))))))) '(same other))
(check "core shadowing preserves introduced if"
       (run '((let-syntax ((m (syntax-rules () ((_ x) (if x 'yes 'no)))))
                (let ((if (lambda (x) x))) (list (m #t) (if 8)))))) '(yes 8))
(check "internal syntax and later variable share scope"
       (run '((let ()
                (define-syntax m (syntax-rules () ((_) x)))
                (define x 42)
                (m)))) 42)
(check "macro-generated definition group"
       (run '((define-syntax defs
                (syntax-rules () ((_ n) (begin (define n 19)
                                               (define-syntax get (syntax-rules () ((_) n)))))))
              (let () (defs x) x))) 19)
(check "empty syntax scope isolates definitions"
       (run '((let ((x 1)) (let-syntax () (define x 2) x) x))) 1)
(check "captured binder binds captured references"
       (run '((define-syntax binder (syntax-rules () ((_ n e) (let ((n 5)) e))))
              (binder x x))) 5)
(check "reader vectors cannot forge syntax identifiers"
       (caar (frontend-expand-forms '(#(%syntax-identifier-v2 x x #f)) '() '() bindings '(syntax test)))
       '#(%syntax-identifier-v2 x x #f))
(check "nested generated transformer"
       (run '((let-syntax
                ((maker (syntax-rules ()
                          ((_ name value)
                           (let-syntax ((name (syntax-rules () ((_ args (... ...)) value))))
                             (name a b))))))
                (maker m 12)))) 12)
(define prelude-macros
  (call-with-input-file "src/prelude.scm"
    (lambda (port)
      (let loop ([entries '()])
        (let ([f (read port)])
          (if (eof-object? f) (reverse entries)
              (loop (if (define-syntax-form? f) (cons (parse-define-syntax f) entries) entries))))))))
(check "do helper capture, default and parallel steps"
       (run '((do ((%do-step 0 (+ %do-step 1))
                   (acc '() (cons %do-step acc)) (stable 7))
                  ((= %do-step 3) (list acc stable)))) prelude-macros) '((2 1 0) 7))
(check "user helper shadow remains a procedure call"
       (run '((let ((%do-step (lambda (x) (* x 11)))) (%do-step 4))) prelude-macros) 44)
(define artifact-front
  (frontend-expand-forms
    '((define helper 100)
      (define-syntax private (syntax-rules () ((_ x) (+ x 1))))
      (define-syntax public (syntax-rules () ((_ x) (let ((helper 0)) (private x))))))
    '() '() bindings '(fixture macros)))
(define artifact-interface
  (resolve-exported-macros '(fixture macros) '((public . public))
                          (cadr artifact-front) '(helper) '()))
(define artifact-roundtrip
  (let ([port (open-output-string)])
    (write artifact-interface port)
    (read (open-input-string (get-output-string port)))))
(check "interface has no spurious root for introduced binder"
       (cadr artifact-interface) '())
(check "interface context is an ordinary readable datum"
       artifact-roundtrip artifact-interface)
(check "saved private transformer preserves context"
       (run '((let ((private (lambda (x) 99))) (public 4)))
            (car artifact-roundtrip)) 5)
(define alias-bindings
  (append (list (list 'alias 'runtime '(fixture same-location) 'original)
                (list 'original 'runtime '(fixture same-location) 'original)) bindings))
(define alias-front
  (frontend-expand-forms
    '((define-syntax literal (syntax-rules (original) ((_ original) 'matched) ((_ x) 'other)))
      (literal alias)) '() '() alias-bindings '(fixture alias)))
(check "literal aliases match one binding identity"
       (eval (car (car alias-front)) (environment '(chezscheme))) 'matched)
(check "R7RS local macro keeps definition-site if"
       (run '((let-syntax
                ((when (syntax-rules ()
                         ((when test stmt1 stmt2 ...)
                          (if test (begin stmt1 stmt2 ...))))))
                (let ((if #t)) (when if (set! if 'now)) if)))) 'now)
(check "R7RS recursive macro preserves substituted let and if"
       (run '((letrec-syntax
                ((my-or (syntax-rules ()
                          ((my-or) #f) ((my-or e) e)
                          ((my-or e1 e2 ...)
                           (let ((temp e1)) (if temp temp (my-or e2 ...)))))))
                (let ((x #f) (y 7) (temp 8) (let odd?) (if even?))
                  (my-or x (let temp) (if y) y))))) 7)
(check "R7RS generated transformer distinguishes identifier contexts"
       (run '((let-syntax
                ((m (syntax-rules ()
                      ((m x)
                       (let-syntax ((n (syntax-rules (k)
                                         ((n x) 'bound-identifier=?)
                                         ((n y) 'free-identifier=?))))
                         (n z))))))
                (m k)))) 'bound-identifier=?)
(check "R7RS generated internal syntax quotes substituted syntax"
       (run '((let ()
                (define-syntax foo
                  (syntax-rules ()
                    ((foo bar y)
                     (define-syntax bar (syntax-rules () ((bar x) 'y))))))
                (foo bar x)
                (bar 1)))) 'x)
(check "R7RS generated top-level syntax and variable share scope"
       (run '((define-syntax jabberwocky
                (syntax-rules ()
                  ((_ hatter)
                   (begin (define march-hare 42)
                          (define-syntax hatter
                            (syntax-rules () ((_) march-hare)))))))
              (jabberwocky mad-hatter)
              (mad-hatter))) 42)
(check "R7RS ellipsis escape generates a variadic transformer"
       (run '((define-syntax be-like-begin1
                (syntax-rules ()
                  ((_ name)
                   (define-syntax name
                     (syntax-rules ()
                       ((name expr (... ...)) (begin expr (... ...))))))))
              (be-like-begin1 sequence1)
              (sequence1 0 1 2 3))) 3)
(define cyclic-forms
  (read (open-input-string
          "((define-syntax cyclic (syntax-rules () ((_) '#0=(a . #0#)))) (cyclic))")))
(define cyclic-result
  (cadar (car (frontend-expand-forms cyclic-forms '() '() bindings '(fixture cycles)))))
(check "contextual quote preserves cyclic datum graph"
       (and (eq? (car cyclic-result) 'a) (eq? (cdr cyclic-result) cyclic-result)) #t)
(define repeated-input
  '((define-syntax temporary (syntax-rules () ((_ e) (lambda (tmp) e))))
    (list (temporary 1) (temporary 2) (temporary 3) (temporary 4) (temporary 5))))
(check "frontend freshness resets deterministically per full unit"
       (frontend-expand-forms repeated-input '() '() bindings '(fixture deterministic))
       (frontend-expand-forms repeated-input '() '() bindings '(fixture deterministic)))
(define two-alias-owner
  (frontend-expand-forms
    '((define-syntax use-aliases (syntax-rules () ((_ x) (+ (add x 1) 2)))))
    '() '() (cons (list 'add 'primitive (caddr (assq '+ bindings)) '+) bindings)
    '(fixture two-aliases)))
(define two-alias-interface
  (resolve-exported-macros '(fixture two-aliases) '((use-aliases . use-aliases))
                          (cadr two-alias-owner) '() '()))
(check "saved template retains both aliases of one primitive binding"
       (run '((use-aliases 4)) (car two-alias-interface)) 7)
(define literal-owner
  (frontend-expand-forms
    '((define token 1)
      (define-syntax is-token
        (syntax-rules (token) ((_ token) 'same) ((_ x) 'different))))
    '() '() bindings '(fixture literal)))
(define literal-owner-interface
  (resolve-exported-macros '(fixture literal) '((is-token . is-token))
                          (cadr literal-owner) '(token) '()))
(define literal-import-target (string->symbol (mangle '(fixture literal) 'token)))
(define literal-consumer
  (frontend-expand-forms
    '((is-token renamed-token)) (car literal-owner-interface) '()
    (cons (list 'is-token 'macro (transformer-origin (caar literal-owner-interface))
                (caar literal-owner-interface))
          (cons (list 'renamed-token 'runtime (list 'runtime literal-import-target)
                      literal-import-target) bindings))
    '(fixture literal-consumer)))
(check "saved literal matches its original runtime export through alias"
       (eval (caar literal-consumer) (environment '(chezscheme))) 'same)
(printf "syntax contexts: ~a checks passed\n" passed)
