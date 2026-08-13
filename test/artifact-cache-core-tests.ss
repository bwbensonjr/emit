;;; artifact-cache-core-tests.ss -- modes 14/15 round-trip (change: baked-set-artifact-cache).
;;;
;;; The register-from-prebuilt path has to be indistinguishable from the compile path
;;; (spec: artifact-cache, "The cache never changes what a door produces"), and the cheapest
;;; way to hold that is to compile a library, serialize what it registered, register THAT
;;; into a fresh session, and require the two registrations to be equal.
;;;
;;; Chez-hosted, because these modes live in src/repl-core.ss: the shipped binary links
;;; COMMITTED IR, so an edit there is invisible to `emit` until `make regen`, and the Chez
;;; driver (src/compile.ss) does not include repl-core.ss either.  Including it here is the
;;; only way to exercise a repl-core edit before the regen barrier.
;;;
;;; Four stand-ins are needed for names repl-core.ss reaches outside the flat core -- the
;;; substrate's reader, the primcall-based dumper, and R7RS's error-object accessors --
;;; exactly as src/compile.ss supplies its own for the same reason.  They are test scaffolding,
;;; not a second implementation: nothing under test touches them.
(import (chezscheme))
(include "src/match.scm") (include "src/util.scm") (include "src/parse.ss")
(include "src/passes/expand.ss") (include "src/passes/recognize-let.ss")
(include "src/passes/convert-assignments.ss") (include "src/passes/simplify.ss")
(include "src/passes/convert-closures.ss") (include "src/passes/lower.ss")
(include "src/emit.ss") (include "src/prelude-surface.scm") (include "src/core.ss")

;; Stand-ins for what repl-core.ss reaches outside the flat core (the substrate's reader
;; and the primcall-based dumper), mirroring how src/compile.ss supplies its own.
(define (read-all-from-string s)
  (let ([p (open-input-string s)])
    (let loop ([acc '()])
      (let ([d (read p)]) (if (eof-object? d) (reverse acc) (loop (cons d acc)))))))
(define (rd-skip-ws s i) i)
(define (rd-token-end s i) i)
(define (error-object? e) (condition? e))
(define (error-object-message e)
  (if (message-condition? e) (condition-message e) "error"))
(define (error-object-irritants e)
  (if (irritants-condition? e) (condition-irritants e) '()))
(define *prelude-source* "")
(include "src/repl-core.ss")
(set! make-dumper (lambda (name) no-dump))

(define pass 0) (define fail 0)
(define (check name got want)
  (if (equal? got want)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n         got:  ~s\n         want: ~s\n" name got want))))

(init-session "")
(define r4 (repl-load-library-text
  "(define-library (tlib) (export greet twice) (import) (begin (define (greet) 42) (define (twice x) (* x 2))))"))
(check "mode 4 compiled the library" (car r4) 'ok)
(define compiled-table (assoc '(tlib) *repl-libs*))
(define compiled-imports (cached-lib-imports '(tlib)))

(define meta (repl-cached-libs-text "((tlib))"))
(check "mode 15 returned ok" (car meta) 'ok)
(printf "  metadata: ~a\n" (cdr meta))

(init-session "")
(check "fresh session has no tlib" (assoc '(tlib) *repl-libs*) #f)
(define r14 (repl-register-cached-libs (cdr meta)))
(check "mode 14 returned ok" (car r14) 'ok)
(check "mode 14 reported the __init symbol" (cdr r14) (mangle '(tlib) "__init"))
(check "export table round-trips identically" (assoc '(tlib) *repl-libs*) compiled-table)
(check "direct imports round-trip" (cached-lib-imports '(tlib)) compiled-imports)

(init-session "")
(check "malformed row refused" (car (repl-register-cached-libs "((tlib) (junk))")) 'error)
(check "  registers nothing"   (assoc '(tlib) *repl-libs*) #f)
(init-session "")
(check "table/name mismatch refused"
       (car (repl-register-cached-libs "(((tlib) () ((OTHER) () ()) \"tlib:__init\"))")) 'error)
(check "  registers nothing"   (assoc '(tlib) *repl-libs*) #f)
(init-session "")
(check "empty metadata refused" (car (repl-register-cached-libs "")) 'error)
(init-session "")
(check "unregistered name refused by mode 15" (car (repl-cached-libs-text "((nope))")) 'error)

(printf "~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
