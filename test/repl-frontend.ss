;;; repl-frontend.ss -- unit tests for the REPL persistent-globals front end.
;;; Run from the repo root:  chez --libdirs src --script test/repl-frontend.ss
;;;
;;; Exercises the front-end model (parse.ss REPL section + the pass threading)
;;; at the IL level: a form sees earlier definitions, redefinition wins for
;;; later forms, forward references are rejected, lambda defines self-recurse,
;;; and value defines see the previous binding.  Execution-level behavior is
;;; covered separately by the end-to-end backend tests.

(import (chezscheme))

(include "src/match.scm")           ; flat source (change: self-hosting-completion)
(include "src/util.scm")
(include "src/parse.ss")
(include "src/passes/recognize-let.ss")
(include "src/passes/convert-assignments.ss")
(include "src/passes/simplify.ss")
(include "src/passes/convert-closures.ss")
(include "src/passes/lower.ss")

(define pass 0)
(define fail 0)
(define (check name got want)
  (if (equal? got want)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n         got:  ~s\n         want: ~s\n" name got want))))
(define (check-pred name got pred)
  (if (pred got)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n         got:  ~s\n" name got))))
(define (check-raises name thunk)
  (let ([raised (guard (e (#t 'raised)) (thunk) 'no-error)])
    (check name raised 'raised)))

;; does symbol `s` appear anywhere in tree `t`?
(define (mentions? s t)
  (cond [(eq? s t) #t]
        [(pair? t) (or (mentions? s (car t)) (mentions? s (cdr t)))]
        [else #f]))

(printf "REPL front-end unit tests\n")

;; 1. A later form sees an earlier definition.
(let ([env (make-repl-env)])
  (reset-counter!)
  (check "define x binds x.g0"
         (repl-lower-form env '(define x 41))
         '(global-set! x.g0 (const 41)))
  (check "reference resolves to x.g0"
         (repl-lower-form env '(+ x 1))
         '(primcall %+ (global-ref x.g0) (const 1))))

;; 2. Redefinition: a later form uses the newest generation.
(let ([env (make-repl-env)])
  (reset-counter!)
  (repl-lower-form env '(define y 1))
  (repl-lower-form env '(define y 2))
  (check "y resolves to latest generation y.g1"
         (repl-env-lookup env 'y) 'y.g1)
  (check "sum uses the latest y.g1"
         (repl-lower-form env '(+ y y))
         '(primcall %+ (global-ref y.g1) (global-ref y.g1))))

;; 3. Forward reference is rejected.
(let ([env (make-repl-env)])
  (reset-counter!)
  (check-raises "undefined name errors"
                (lambda () (repl-lower-form env '(+ z 1)))))

;; 4. A lambda definition registers before its init, so it self-recurses into
;;    the new binding.
(let ([env (make-repl-env)])
  (reset-counter!)
  (let ([il (repl-lower-form env '(define (f n) (f n)))])
    (check-pred "recursive call targets f.g0"
                il (lambda (t) (and (eq? (car t) 'global-set!)
                                    (eq? (cadr t) 'f.g0)
                                    (mentions? 'f.g0 (caddr t)))))))

;; 5. A value definition registers after its init, so the init sees the previous
;;    binding: (define w 10) then (define w (+ w 1)) reads the old w.g0.
(let ([env (make-repl-env)])
  (reset-counter!)
  (repl-lower-form env '(define w 10))
  (check "value redefinition reads previous generation"
         (repl-lower-form env '(define w (+ w 1)))
         '(global-set! w.g1 (primcall %+ (global-ref w.g0) (const 1)))))

;; 6. The whole front-end pipeline lowers a form to L-code carrying the global
;;    nodes (no unbound-variable crash from `lower`).
(let ([env (make-repl-env)])
  (reset-counter!)
  (repl-lower-form env '(define g 7))
  (let* ([il (repl-lower-form env '(+ g g))]
         [lc (lower-program
               (convert-closures
                 (simplify
                   (convert-assignments
                     (recognize-let il)))))])
    (check-pred "lowers to a program with global-ref"
                lc (lambda (t) (and (eq? (car t) 'program) (mentions? 'g.g0 t))))))

;; Evaluate the collected source with Chez's explicit letrec* spelling. This checks
;; the frontend's binding order only; `convert-assignments` must then keep that
;; order, which the classify-letrec checks below cover.
(define (eval-toplevel forms)
  (reset-counter!)
  (let ([program (collect-toplevel forms)])
    (eval (cond
            [(and (pair? program) (eq? (car program) 'letrec))
             (cons 'letrec* (cdr program))]
            ;; Emit accepts repeated placeholders in this fallback and resolves
            ;; them to one location. Chez requires that binder to appear once.
            [(and (pair? program) (eq? (car program) 'let))
             (cons 'let
                   (cons (let loop ([bs (cadr program)] [seen '()])
                           (cond [(null? bs) '()]
                                 [(memq (caar bs) seen) (loop (cdr bs) seen)]
                                 [else (cons (car bs) (loop (cdr bs) (cons (caar bs) seen)))]))
                         (cddr program)))]
            [else program])
          (environment '(chezscheme)))))
(check "program mutation before definition"
       (eval-toplevel '((define x 1) (set! x 2) (define y x) y)) 2)
(check "program parameter update before definition"
       (eval-toplevel '((define p (make-parameter #f)) (p 5) (define r (p)) r)) 5)
(check "program effects before first definition"
       (with-output-to-string
         (lambda () (eval-toplevel '((display "start")
                                    (define x (begin (display "init") 42))
                                    (display "end")))))
       "startinitend")
(check "program interleaved redefinition"
       (with-output-to-string
         (lambda () (eval-toplevel '((define x 1) (display x)
                                    (define x 2) (display x))))) "12")
(check "program mutual procedure scope"
       (eval-toplevel '((define (even n) (if (= n 0) #t (odd (- n 1))))
                        (define (odd n) (if (= n 0) #f (even (- n 1))))
                        (even 10))) #t)
(check "program ignores intermediate values"
       (eval-toplevel '((+ 1 2) (define x 42) x)) 42)
(check "program generated binding avoids source name"
       (eval-toplevel '((define toplevel-effect.0 7)
                        (set! toplevel-effect.0 8)
                        (define y toplevel-effect.0) y)) 8)
(check-raises "program effect exception precedes later initializer"
              (lambda () (eval-toplevel '((error 'test "stop")
                                         (define x 42) x))))
(check "program quoted cycles are not lexical names"
       (eval-toplevel '((display "") (define q '#0=(a . #0#)) (eq? q (cdr q)))) #t)
(check-raises "internal definitions still precede expressions"
              (lambda () (build-body '((display 1) (define x 2) x))))

;; classify-letrec returns (plain boxed keep).  Plain bindings run before every
;; boxed fill, so an impure one written after a boxed one must be boxed too.
(define (classified binds)
  (map (lambda (part) (map car part)) (classify-letrec binds '())))
(check "letrec plain prefix before a boxed binding is unchanged"
       (classified '((x (call (global-ref g))) (f (lambda () (const 1)))
                     (y (call f)) (z (const 2))))
       '((x z) (y) (f)))
(check "letrec impure binding after a boxed one keeps source order"
       (classified '((f (lambda () (const 1))) (a (call f))
                     (b (call (global-ref g))) (c (const 3)) (d x) (e c)))
       '((c d e) (a b) (f)))
(check "letrec assigned outer reference after a boxed one keeps source order"
       (map (lambda (part) (map car part))
            (classify-letrec '((f (lambda () (const 1))) (a (call f)) (b x)) '(x)))
       '(() (a b) (f)))

(printf "\n~a passed, ~a failed\n" pass fail)
(exit (if (zero? fail) 0 1))
