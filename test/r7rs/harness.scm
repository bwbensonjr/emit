;;; harness.scm -- a (chibi test) substitute for the vendored R7RS suite
;;; (change: r7rs-conformance-suite).
;;;
;;; The suite is written against (chibi test).  This provides the subset it actually
;;; uses, in the subset of R7RS that Emit accepts TODAY -- which is the sharp constraint
;;; here: the harness measures what is missing, so it cannot use anything missing.  No
;;; vector->list, no string-map, no let-values, no internal define-syntax (Emit
;;; recognizes define-syntax only at the literal top level), no procedure?.  If a name
;;; below stops being available, the whole suite reports nothing rather than reporting a
;;; gap, so keep this file conservative.
;;;
;;; The suite defines its own test-numeric-syntax, test-write-syntax, test-precision,
;;; test-round-trip, test-read-error and test-exception-handler-N; those are ordinary
;;; forms in the file and need nothing here.  What (chibi test) itself supplies, and this
;;; file must, is: test, test-assert, test-error, test-values, test-begin, test-end.
;;;
;;; NAMING: every helper here is `hx-` prefixed, and NOT `%` prefixed.  A `%` name is a
;;; RESERVED raw primitive in Emit (src/parse.ss `*prims*`), so `(define (%equal? a b) ...)`
;;; does not shadow anything -- calls to it compile to the built-in structural equality
;;; primcall and the definition is silently ignored, with no diagnostic.  The failure mode
;;; is confusing: the tolerance below tests correctly when called directly, and appears to
;;; do nothing when reached through a helper that a primcall has quietly replaced.
;;;
;;; Output contract with test/r7rs-suite-tests.sh -- tab-separated, one line each:
;;;   FAIL <tab> <expression> <tab> <expected> <tab> <obtained>
;;;   SUMMARY <tab> pass=<N> <tab> fail=<N>
;;; `write` escapes newlines and tabs inside strings, so a value can never split a line.

(import (scheme base) (scheme inexact) (scheme file) (scheme read) (scheme cxr)
        (scheme case-lambda) (scheme char) (scheme process-context) (scheme write))

(define hx-pass 0)
(define hx-fail 0)
(define hx-section "")

;;; --- comparison (design D5) -----------------------------------------------------
;;; Inexact results are compared APPROXIMATELY.  The suite writes expected flonums to
;;; about 15 significant digits because (chibi test) compares that way: it expects
;;; (sqrt 2) to be 1.4142135623731, while the correctly-rounded double is
;;; 1.4142135623730951.  Comparing those with equal? reports 13 failures in section 6.2
;;; where Emit is right, and a gate that cries wolf gets ignored.
;;;
;;; Two limits keep the tolerance from hiding real defects:
;;;   * exactness must still match, so (test 1 1.0) fails as the suite intends -- the
;;;     suite asserts exactness deliberately and often;
;;;   * the tolerance applies to NUMBERS BEING COMPARED, never to the truth of a
;;;     predicate the suite is testing.  (= 9007199254740992.0 9007199254740993) yields a
;;;     boolean, so issue #77 still fails here, which is the case that proves the point.
(define hx-tolerance 1e-10)

(define (hx-nan? x) (not (= x x)))

(define (hx-close? a b)
  (if (= a b)
      #t                                 ; also the +inf.0 case, where a-b would be NaN
      (if (or (hx-nan? a) (hx-nan? b))
          (and (hx-nan? a) (hx-nan? b))      ; the suite does expect +nan.0 in places
          (< (abs (- a b))
             (* hx-tolerance (max 1.0 (abs a) (abs b)))))))

(define (hx-num-eq? a b)
  (if (exact? a)
      (if (exact? b) (= a b) #f)
      (if (exact? b) #f (hx-close? a b))))

;; Structural, because a flonum can be nested: test-values compares a list of results,
;; and several tests expect a list or vector of inexact numbers.
(define (hx-equal? a b)
  (cond
    ((and (number? a) (number? b)) (hx-num-eq? a b))
    ((and (pair? a) (pair? b))
     (if (hx-equal? (car a) (car b)) (hx-equal? (cdr a) (cdr b)) #f))
    ((and (vector? a) (vector? b))
     (if (= (vector-length a) (vector-length b))
         (hx-vec-eq? a b 0)
         #f))
    (else (equal? a b))))

;; No vector->list here: it is one of the names this suite is measuring the absence of.
(define (hx-vec-eq? a b i)
  (if (= i (vector-length a))
      #t
      (if (hx-equal? (vector-ref a i) (vector-ref b i))
          (hx-vec-eq? a b (+ i 1))
          #f)))

;;; --- reporting ------------------------------------------------------------------
(define (hx-report expr expected got)
  (set! hx-fail (+ hx-fail 1))
  (display "FAIL\t") (write expr)
  (display "\t") (write expected)
  (display "\t") (write got)
  (newline))

(define (hx-check expr expected got)
  (if (hx-equal? expected got)
      (set! hx-pass (+ hx-pass 1))
      (hx-report expr expected got)))

(define (hx-summary)
  (display "SUMMARY\tpass=") (display hx-pass)
  (display "\tfail=") (display hx-fail)
  (newline))

;;; --- the (chibi test) surface the suite uses ------------------------------------
;;; Both arities of `test`: the suite uses (test expected expr) and, 108 times, a named
;;; (test "name" expected expr).  The name is not reported -- the expression is more
;;; use when reading a failure.
(define-syntax test
  (syntax-rules ()
    ((test expected expr) (hx-check (quote expr) expected expr))
    ((test name expected expr) (hx-check (quote expr) expected expr))))

(define-syntax test-assert
  (syntax-rules ()
    ((test-assert expr) (hx-check (quote expr) #t (if expr #t #f)))
    ((test-assert name expr) (hx-check (quote expr) #t (if expr #t #f)))))

;; An expression the standard says must raise.  A trap Emit cannot catch aborts the
;; program instead, which the exclusion manifest handles -- that is a form that does not
;; RUN, not a test that fails.
(define-syntax test-error
  (syntax-rules ()
    ((test-error expr) (hx-check (quote expr) #t (guard (e (#t #t)) expr #f)))
    ((test-error x expr) (hx-check (quote expr) #t (guard (e (#t #t)) expr #f)))))

(define-syntax test-values
  (syntax-rules ()
    ((test-values expected expr)
     (hx-check (quote expr)
               (call-with-values (lambda () expected) list)
               (call-with-values (lambda () expr) list)))))

(define-syntax test-begin
  (syntax-rules ()
    ((test-begin name) (set! hx-section name))
    ((test-begin) (set! hx-section ""))))

(define-syntax test-end
  (syntax-rules ()
    ((test-end) (values))
    ((test-end name) (values))))
