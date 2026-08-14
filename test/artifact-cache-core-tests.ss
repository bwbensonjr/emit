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
;;; A handful of stand-ins are needed for names repl-core.ss reaches outside the flat core --
;;; the substrate's reader, the primcall-based dumper, R7RS's error-object accessors, and the
;;; include reader's record of what it opened (src/include-reader.ss calls `%read-file`, which
;;; is a primcall, so it cannot be included here any more than src/compile.ss can include it)
;;; -- exactly as src/compile.ss supplies its own for the same reason.  They are test
;;; scaffolding, not a second implementation: nothing under test touches them.
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
;; The include reader's half (change: chez-free-unit-pipeline): mode 4 resets this record
;; before parsing and the session state carries it between host calls.  No library here
;; includes anything, so an empty record is the whole of what these need.
(define *includes-read* '())
(define (reset-includes-read!) (set! *includes-read* '()))
(define (includes-read) (reverse *includes-read*))
(define (set-includes-read! ps) (set! *includes-read* (reverse ps)))
(define *source-home* "")
(define (set-source-home! p) (set! *source-home* p))
(define (source-home) *source-home*)
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

;; Mode 15 selects by canonical unit KEY, not by a rendered name datum (change:
;; chez-free-unit-pipeline): the host speaks keys everywhere else, so library-name equality
;; stays in the core.
(define meta (repl-cached-libs-text (string-append (mangle '(tlib) "") "\n")))
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
(check "unregistered key refused by mode 15" (car (repl-cached-libs-text "nope:\n")) 'error)

;; An entry whose imports are not registered yet is DEFERRED, not applied and not refused
;; (change: chez-free-unit-pipeline, design D13).  A cache hit would otherwise be order-blind
;; exactly where compiling is not: the REPL door runs each unit's __init as it adds it, so a
;; unit registered ahead of one it reads globals from would initialize against empty slots.
;; The host's fixpoint loop already retries this status -- it is mode 4's.
(init-session "")
(check "a row whose import is unregistered is deferred"
       (car (repl-register-cached-libs "(((tlib) ((dep)) ((tlib) () ()) \"tlib:__init\"))"))
       'deferred)
(check "  registers nothing"   (assoc '(tlib) *repl-libs*) #f)

;; ... and once that import IS registered, the same entry applies.  Two rows in one entry
;; satisfy each other in order, which is how the baked set's members do it.
(init-session "")
(check "rows satisfy each other in dependency order"
       (car (repl-register-cached-libs
              (string-append "(((dep) () ((dep) () ()) \"dep:__init\")"
                             " ((tlib) ((dep)) ((tlib) () ()) \"tlib:__init\"))")))
       'ok)
(check "  both are registered" (and (assoc '(dep) *repl-libs*)
                                    (assoc '(tlib) *repl-libs*) #t) #t)

(printf "~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
