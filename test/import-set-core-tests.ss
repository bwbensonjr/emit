;;; Unit tests for import-set parsing and the export-table transform (change:
;;; portable-library-surface, design D1/D2).
;;;
;;; The functions under test live in src/core.ss, are pure, and are written in the common
;;; subset, so they run directly under Chez.  The end-to-end behavior -- a set changing
;;; what a program or library can reference, on every path -- is test/import-set-tests.sh;
;;; this pins the table shapes that suite cannot see:
;;;   * a set's library name and shape errors;
;;;   * the libraries a spec list reaches, deduplicated;
;;;   * runtime rows and CALL rows renamed in lockstep, mangled targets untouched;
;;;   * public macro keywords renamed or dropped while unit-qualified entries survive;
;;;   * all-bare specs hand back the very same tables (the byte-identity guarantee).
;;;
;;; Run from the repo root: chez --libdirs src --script test/import-set-core-tests.ss

(include "src/match.scm")
(include "src/util.scm")
(include "src/core.ss")

(define pass 0)
(define fail 0)
(define (ok m)  (set! pass (+ pass 1)) (display "  [OK  ] ") (display m) (newline))
(define (bad m) (set! fail (+ fail 1)) (display "  [FAIL] ") (display m) (newline))
(define (check m got want)
  (if (equal? got want)
      (ok m)
      (begin (bad m) (display "         got:  ") (write got) (newline)
                     (display "         want: ") (write want) (newline))))

;; The condition message a thunk raises, or 'no-error.
(define (raised-message thunk)
  (call/cc (lambda (k)
    (with-exception-handler
      (lambda (e) (k (if (message-condition? e) (condition-message e) 'unknown)))
      thunk))))

;; A table shaped like compile-library's: two procedures with call rows, one public macro
;; whose template reaches a private macro carried under a unit-qualified keyword.
(define table
  (list '(t lib)
        '((greet . "t.lib:greet") (helper . "t.lib:helper"))
        '((greet "t.lib:code:greet" 0) (helper "t.lib:code:helper" 0))
        (list '((swap! () ((_ a b) (t.lib:%swap a b)))
                (t.lib:%swap () ((_ a b) (set! a b))))
              '(%bump)
              '())))

(define (rows t) (cadr t))
(define (calls t) (caddr t))
(define (macro-keys t) (map car (ct-macros (table-ct-half t))))

(display "import-set parsing") (newline)
(check "a bare name is its own library" (import-spec-library '(t lib)) '(t lib))
(check "nested sets reach the innermost library"
       (import-spec-library '(prefix (only (except (t lib) helper) greet) p:)) '(t lib))
(check "libraries are deduplicated in first-occurrence order"
       (import-specs->libraries '((a) (only (b) x) (prefix (a) p:) (b)))
       '((a) (b)))
(check "a prefix with no prefix is malformed"
       (raised-message (lambda () (import-spec-library '(prefix (t lib)))))
       "malformed import set: (prefix (t lib))")
(check "a rename that is not a pair is malformed"
       (raised-message (lambda () (import-spec-library '(rename (t lib) greet))))
       "malformed import set: (rename (t lib) greet)")
(check "an only naming a non-symbol is malformed"
       (raised-message (lambda () (import-spec-library '(only (t lib) "greet"))))
       "malformed import set: (only (t lib) \"greet\")")

(display "the table transform") (newline)
(let ([t (import-set-table '(prefix (t lib) p:) table)])
  (check "prefix renames runtime rows, keeping mangled targets" (rows t)
         '((p:greet . "t.lib:greet") (p:helper . "t.lib:helper")))
  (check "prefix renames call rows in lockstep" (map car (calls t)) '(p:greet p:helper))
  (check "prefix renames the public macro; the unit-qualified entry is kept"
         (macro-keys t) '(p:swap! t.lib:%swap))
  (check "own-refs pass through" (ct-own-refs (table-ct-half t)) '(%bump)))
(let ([t (import-set-table '(only (t lib) greet) table)])
  (check "only keeps the named row" (rows t) '((greet . "t.lib:greet")))
  (check "only keeps the named call row" (map car (calls t)) '(greet))
  (check "only drops the public macro, keeps the private one" (macro-keys t) '(t.lib:%swap)))
(let ([t (import-set-table '(except (t lib) swap!) table)])
  (check "except of a macro keeps every procedure" (map car (rows t)) '(greet helper)))
(let ([t (import-set-table '(rename (t lib) (greet hello) (swap! sw)) table)])
  (check "rename renames one row" (map car (rows t)) '(hello helper))
  (check "rename renames its call row" (map car (calls t)) '(hello helper))
  (check "rename renames a macro keyword" (macro-keys t) '(sw t.lib:%swap)))
(check "a set naming an absent export names it"
       (raised-message (lambda () (import-set-table '(only (t lib) nope) table)))
       "nope is not exported by (t lib) in (only (t lib) nope)")
(check "except of a hidden name is an error too"
       (raised-message
         (lambda () (import-set-table '(except (only (t lib) greet) helper) table)))
       "helper is not exported by (t lib) in (except (only (t lib) greet) helper)")

;; universal-library-names reads the expander's and parser's keyword tables, which this
;; suite does not include; stand-ins keep the case self-contained.
(define *core-keywords* '(define if lambda))
(define *extra-op-keywords* '(>))
(define *integrable* '((car %car 1)))
(let ([base (list '(scheme base) '((map . "scheme.base:map")) '())])
  (check "only over a (scheme ...) library accepts a core keyword and a primitive"
         (rows (import-set-table '(only (scheme base) define car map) base))
         '((map . "scheme.base:map")))
  (check "except over a (scheme ...) library accepts a primitive, which stays universal"
         (rows (import-set-table '(except (scheme base) car) base))
         '((map . "scheme.base:map"))))
(check "a user library does not publish primitives"
       (raised-message (lambda () (import-set-table '(only (t lib) car) table)))
       "car is not exported by (t lib) in (only (t lib) car)")

(display "applying specs to a unit's tables") (newline)
(let ([tables (list table)])
  (check "all-bare specs return the identical tables (eq?)"
         (eq? (apply-import-specs '((t lib)) tables) tables) #t)
  (check "a library imported through two sets contributes both views"
         (map (lambda (t) (map car (rows t)))
              (apply-import-specs '((only (t lib) greet) (prefix (t lib) p:)) tables))
         '((greet) (p:greet p:helper)))
  (let ([base (list '(scheme base) '((map . "scheme.base:map")) '())])
    (check "a table no spec names is kept whole (the implicit (scheme base))"
           (map car (apply-import-specs '((only (t lib) greet)) (list base table)))
           '((scheme base) (t lib)))
    (check "a (scheme base) set is detected"
           (scheme-base-import-set? '((except (scheme base) map))) #t)
    (check "a bare (scheme base) is not a set"
           (scheme-base-import-set? '((scheme base))) #f)))

(newline)
(display "import-set core: ") (display pass) (display " passed, ")
(display fail) (display " failed") (newline)
(exit (if (= fail 0) 0 1))
