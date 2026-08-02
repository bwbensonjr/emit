;;; prelude.scm -- standard library procedures prepended to every program.
;;;
;;; Pure Scheme over the core primitives + variadic lambda; the driver
;;; (src/compile.ss) prepends these top-level defines to each program, with
;;; user-wins shadowing (a user define of the same name drops the prelude's).
;;; See openspec prelude-mechanism.  memq/assq compare with eq?; member/assoc
;;; are their structural analogues over equal? (see openspec
;;; equality-and-list-library).  not/eq?/eqv?/equal? are primitives (see
;;; prim-table), so they are not defined here.

;;; --- derived syntactic forms (syntax-rules macros) ------------------------
;;; cond/and/or/when/unless/let* are macros expanded by src/passes/expand.ss.
;;; Named `let` is still hand-written there (it overloads the core `let`
;;; keyword).  `t` in `or`/`cond` is a macro-introduced temporary and is renamed
;;; hygienically per expansion, so it cannot capture user identifiers.

(define-syntax and
  (syntax-rules ()
    ((_) #t)
    ((_ e) e)
    ((_ e1 e2 ...) (if e1 (and e2 ...) #f))))

(define-syntax or
  (syntax-rules ()
    ((_) #f)
    ((_ e) e)
    ((_ e1 e2 ...) (let ((t e1)) (if t t (or e2 ...))))))

;; when/unless: the UNTAKEN branch is the unspecified value, not #f (change:
;; unspecified-value).  `when` gets it from the two-armed `if` -- the parser supplies the
;; missing alternative -- and `unless`, which needs the else arm for its body, spells it
;; with the `(if #f #f)` idiom.  (R7RS leaves the result unspecified even when the branch
;; IS taken; Emit returns the body value there, as most implementations do.)
;; `unless`'s nested `(if #f #f)` emits a dead branch diamond (+8 IR lines per use), the
;; same cost `case`/`do` already pay for the idiom.  It costs nothing in the binary:
;; `icmp ne i64 1, 1` is constant-folded, and clang -O2 collapses the whole diamond
;; (verified against the emitted IR), so the standalone-executable size goal is unaffected.
(define-syntax when
  (syntax-rules ()
    ((_ test e ...) (if test (begin e ...)))))

(define-syntax unless
  (syntax-rules ()
    ((_ test e ...) (if test (if #f #f) (begin e ...)))))

(define-syntax let*
  (syntax-rules ()
    ((_ () body ...) (begin body ...))
    ((_ ((x v) rest ...) body ...) (let ((x v)) (let* (rest ...) body ...)))))

;; cond: falling off the end with no clause matched yields the unspecified value, not #f
;; (change: unspecified-value) -- matching `case`'s no-match rule below.
(define-syntax cond
  (syntax-rules (else =>)
    ((_) (if #f #f))
    ((_ (else e ...)) (begin e ...))
    ((_ (test => proc) rest ...) (let ((t test)) (if t (proc t) (cond rest ...))))
    ((_ (test) rest ...) (let ((t test)) (if t t (cond rest ...))))
    ((_ (test e ...) rest ...) (if test (begin e ...) (cond rest ...)))))

;; `case`: evaluate KEY once, then run the first clause whose datum list contains
;; it (eqv?), else the `else` clause.  A parenthesized KEY is bound to a hygienic
;; temp `k` first (so it is not re-evaluated per clause); the recursive calls pass
;; the bound identifier, which no longer matches the compound-KEY rule.  Expands
;; to `cond` over `(memv k '(d ...))`.
(define-syntax case
  (syntax-rules (else)
    ((_ (key ...) clause ...) (let ((k (key ...))) (case k clause ...)))
    ((_ k) (if #f #f))
    ((_ k (else e ...)) (begin e ...))
    ((_ k ((d ...) e ...) clause ...)
     (if (memv k (quote (d ...))) (begin e ...) (case k clause ...)))))

;; R7RS `do`: iterate with parallel-updated bindings.  Each binding is
;; (var init step) or (var init) [step defaults to var, i.e. unchanged].  On each
;; pass: if `test` holds, the result exprs run (unspecified value if none);
;; otherwise the commands run and every var is rebound to its step -- all steps
;; are evaluated before any rebind because they are the arguments of the loop
;; call.  %do-step supplies the default step.  (change: inexact-numbers)
(define-syntax %do-step
  (syntax-rules ()
    ((_ x) x)
    ((_ x s) s)))
(define-syntax do
  (syntax-rules ()
    ((_ ((var init step ...) ...)
        (test result ...)
        command ...)
     (letrec ((loop (lambda (var ...)
                      (if test
                          (begin (if #f #f) result ...)
                          (begin command ...
                                 (loop (%do-step var step ...) ...))))))
       (loop init ...)))))

(define (list . xs) xs)

;;; --- compositional car/cdr accessors (cxr combinators) --------------------
;;; caar..cddr and the depth-3 forms caaar..cdddr, each the named composition of
;;; the primitive car/cdr (letters read right-to-left = innermost-first).
(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))
(define (caaar x) (car (caar x)))
(define (caadr x) (car (cadr x)))
(define (cadar x) (car (cdar x)))
(define (caddr x) (car (cddr x)))
(define (cdaar x) (cdr (caar x)))
(define (cdadr x) (cdr (cadr x)))
(define (cddar x) (cdr (cdar x)))
(define (cdddr x) (cdr (cddr x)))

(define (length xs)
  (let loop ([xs xs] [n 0])
    (if (null? xs) n (loop (cdr xs) (+ n 1)))))

(define (reverse xs)
  (let loop ([xs xs] [acc (quote ())])
    (if (null? xs) acc (loop (cdr xs) (cons (car xs) acc)))))

;; append is variadic (R7RS): zero or more lists.  The compiler core uses 3-arg
;; append (e.g. emit-code-def's argdecls), and Chez's append is variadic, so
;; this must be too for the core to self-compile (fix-closure-self-compilation).
(define (%append2 a b)
  (if (null? a) b (cons (car a) (%append2 (cdr a) b))))
(define (append . lists)
  (if (null? lists)
      (quote ())
      (if (null? (cdr lists))
          (car lists)
          (%append2 (car lists) (apply append (cdr lists))))))

;; map/for-each are variadic (R7RS): one or more lists, walked in lockstep,
;; stopping at the shortest.  The single-list case is the fast path; the
;; multi-list case (used pervasively by the compiler core -- e.g. rename's
;; (map cons names new) and emit's (for-each ... slots (iota k))) applies f to
;; the i-th element of every list.  Chez's map/for-each are variadic, so these
;; match and the core self-compiles (fix-closure-self-compilation).
(define (%map1 f xs)
  (if (null? xs) (quote ()) (cons (f (car xs)) (%map1 f (cdr xs)))))
(define (%any-null? ls)
  (if (null? ls) #f (if (null? (car ls)) #t (%any-null? (cdr ls)))))
(define (%mapn f ls)
  (if (%any-null? ls)
      (quote ())
      (cons (apply f (%map1 car ls)) (%mapn f (%map1 cdr ls)))))
(define (map f xs . more)
  (if (null? more) (%map1 f xs) (%mapn f (cons xs more))))

(define (memq x xs)
  (if (null? xs) #f (if (eq? x (car xs)) xs (memq x (cdr xs)))))

;; memv: like memq but compares with eqv? (used by the `case` macro).
(define (memv x xs)
  (if (null? xs) #f (if (eqv? x (car xs)) xs (memv x (cdr xs)))))

(define (assq k xs)
  (if (null? xs) #f (if (eq? k (car (car xs))) (car xs) (assq k (cdr xs)))))

;;; --- structural list library (equality-and-list-library) ------------------
;;; member/assoc mirror memq/assq but compare with equal? (structural).
(define (member x xs)
  (if (null? xs) #f (if (equal? x (car xs)) xs (member x (cdr xs)))))

(define (assoc k xs)
  (if (null? xs) #f (if (equal? k (car (car xs))) (car xs) (assoc k (cdr xs)))))

(define (filter p xs)
  (if (null? xs)
      (quote ())
      (if (p (car xs))
          (cons (car xs) (filter p (cdr xs)))
          (filter p (cdr xs)))))

;; fold-left: tail-recursive, f receives (acc elem), left-to-right (R6RS order).
(define (fold-left f acc xs)
  (if (null? xs) acc (fold-left f (f acc (car xs)) (cdr xs))))

;; fold-right: non-tail, f receives (elem acc), right-to-left (R6RS order).
(define (fold-right f acc xs)
  (if (null? xs) acc (f (car xs) (fold-right f acc (cdr xs)))))

;;; --- additional list/utility procedures (self-host-gap-sweep G10) ----------
;;; The compiler core assumes these; all are pure Scheme over existing prims.
;;; (predicate-taking procs take the predicate first, per R6RS.)

;; apply a procedure to each element for effect; returns the unspecified value.
(define (%for-each1 f xs)
  (if (null? xs) (if #f #f) (begin (f (car xs)) (%for-each1 f (cdr xs)))))
(define (%for-eachn f ls)
  (if (%any-null? ls)
      (if #f #f)
      (begin (apply f (%map1 car ls)) (%for-eachn f (%map1 cdr ls)))))
(define (for-each f xs . more)
  (if (null? more) (%for-each1 f xs) (%for-eachn f (cons xs more))))

;; #t iff the predicate holds for every element (short-circuits on #f).
(define (andmap p xs)
  (if (null? xs) #t (if (p (car xs)) (andmap p (cdr xs)) #f)))

;; first tail whose head satisfies the predicate, else #f.
(define (memp p xs)
  (if (null? xs) #f (if (p (car xs)) xs (memp p (cdr xs)))))

;; fourth-element accessor (extends the cxr set one deeper).
(define (cadddr x) (car (cdddr x)))

;; #t iff a proper list (walks to null; a dotted tail yields #f).
(define (list? x)
  (if (null? x) #t (if (pair? x) (list? (cdr x)) #f)))

(define (zero? n) (= n 0))

;; the sublist after n elements, the nth element, and the first n elements.
(define (list-tail xs n) (if (zero? n) xs (list-tail (cdr xs) (- n 1))))
(define (list-ref xs n) (car (list-tail xs n)))
(define (list-head xs n)
  (if (zero? n) (quote ()) (cons (car xs) (list-head (cdr xs) (- n 1)))))

;; a list of n copies of x.
(define (make-list n x) (if (zero? n) (quote ()) (cons x (make-list (- n 1) x))))

;; the list (0 1 ... n-1).
(define (iota n)
  (let loop ([i 0] [acc (quote ())])
    (if (= i n) (reverse acc) (loop (+ i 1) (cons i acc)))))

;; the larger of two numbers.
(define (max a b) (if (< a b) b a))

;; THE unspecified value -- one distinguished immediate, distinct from #f and '() and
;; truthy (change: unspecified-value).  `(if #f #f)` is the two-armed form, so the parser
;; supplies the missing alternative as `(primcall %unspec)`; this needs no special case.
;; The GENERATOR is exposed so a program can declare "no interesting result"; there is
;; deliberately no `unspecified?` predicate to test for it (R7RS-WG1 ballot #49).  What
;; Emit returns here is not a promise -- portable programs must not rely on it.
(define (void) (if #f #f))

;; construct a string from character arguments (via the list->string primitive).
(define (string . cs) (list->string cs))

;;; --- string-append over a list (self-host-gap-sweep G8) --------------------
;;; Compiler support for `string-append` in value position: the parser eta-expands
;;; a bare `string-append` to `(lambda gs (%str-concat gs))`, so `(apply
;;; string-append xs)` works for any arity.  Written in the common subset -- each
;;; `(string-append a b)` here is 2-arg, i.e. native under Chez and the binary
;;; primcall under Emit -- so the prelude still loads and runs under Chez.
(define (%str-concat xs)
  (if (null? xs) "" (string-append (car xs) (%str-concat (cdr xs)))))

;;; --- character / string library (string-char-library) ---------------------
;;; char comparisons are n-ary and chained, reducing through char->integer and
;;; the numeric comparisons.  `op` is a lambda wrapper (primitives are not
;;; first-class, so we cannot pass = / < directly); chr-cmp recurses over the
;;; user-defined comparison chain.
(define (chr-cmp op a b rest)
  (if (op (char->integer a) (char->integer b))
      (if (null? rest) #t (chr-cmp op b (car rest) (cdr rest)))
      #f))
(define (char=?  a b . rest) (chr-cmp (lambda (x y) (=  x y)) a b rest))
(define (char<?  a b . rest) (chr-cmp (lambda (x y) (<  x y)) a b rest))
(define (char>?  a b . rest) (chr-cmp (lambda (x y) (>  x y)) a b rest))
(define (char<=? a b . rest) (chr-cmp (lambda (x y) (<= x y)) a b rest))
(define (char>=? a b . rest) (chr-cmp (lambda (x y) (>= x y)) a b rest))

;; string->list: codepoint-indexed, built from the end so the list is in order.
(define (string->list s)
  (let loop ([i (- (string-length s) 1)] [acc (quote ())])
    (if (< i 0) acc (loop (- i 1) (cons (string-ref s i) acc)))))

;;; --- number->string (base-10 signed integers) -----------------------------
;;; Inverse of the reader's integer parsing (rd-parse-int), so it round-trips.
;;; Digits are peeled from the NON-POSITIVE magnitude of n via quotient/remainder
;;; by 10: for m <= 0, (remainder m 10) is in -9..0 so (- 0 (remainder m 10)) is
;;; the 0..9 digit, and (quotient m 10) truncates toward zero.  Working on the
;;; negative side (never negating the whole value) means the full fixnum range is
;;; handled exactly, INCLUDING the most-negative fixnum -- whose magnitude has no
;;; positive fixnum representation, so a negate-first approach would overflow.
(define (ns-digits m acc)                ; m <= 0 -> chars of |m|, prepended to acc
  (let ([ch (integer->char (+ 48 (- 0 (remainder m 10))))]
        [rest (quotient m 10)])
    (if (= rest 0)
        (cons ch acc)
        (ns-digits rest (cons ch acc)))))
;;; Flonums route to the runtime formatter (%flonum->string: shortest round-
;;; trippable decimal, always with a '.').  `exact?` gates it -- exact? is true
;;; only for fixnums, so the integer path is unchanged; the flonum branch is
;;; never reached with a fixnum (and so is dead during the bootstrap regen, where
;;; %flonum->string is not yet a known primcall).  (change: inexact-numbers)
(define (number->string n)
  (if (exact? n)
      (cond
        [(= n 0) "0"]
        [(< n 0) (list->string (cons #\- (ns-digits n (quote ()))))]
        [else    (list->string (ns-digits (- 0 n) (quote ())))])
      (%flonum->string n)))

;;; --- exceptions: error objects, raise, guard (r7rs-exceptions-subset) ------
;;; R7RS `(error message irritant ...)` builds a CATCHABLE error object and raises
;;; it.  As a compatible superset we also accept a leading SYMBOL `who` (the
;;; compiler's internal call style, and how this prelude is written so it stays
;;; valid under the Chez bootstrap too), folding "who: message" into the message.
;;; Uncaught, an error renders and aborts as before (REPL host survives; a
;;; standalone executable exits non-zero).  %error-abort builds the error object
;;; in the runtime (rt_error) and raises it through the guard escape stack.
(define (error a . rest)
  (if (string? a)
      (raise (%make-error-object a rest))            ; R7RS: (error message irritant ...)
      (raise (%make-error-object
               (string-append (symbol->string a) (string-append ": " (car rest)))
               (cdr rest)))))                         ; superset: (error who message ...)

;;; --- dynamic extent: winds, escape continuations, handlers (dynamic-extent) --
;;; Rung 3 of the call/cc staircase (openspec/explorations/continuations-and-control.md).
;;; THREE structures, each with one job (design D4):
;;;   escape frames  -- in the runtime; setjmp targets, each with a generation id
;;;   *winds*        -- here; active dynamic-wind (before . after) pairs, innermost first
;;;   *handlers*     -- here; the R7RS current-exception-handler chain
;;; `raise` CALLS the current handler (it does not transfer); `guard` is a handler
;;; that escapes.  So there is one transfer mechanism, not two.
(define *winds* (quote ()))
(define *handlers* (quote ()))

;;; Pop entries off the wind list until it is the captured TARGET, running each
;;; `after`.  The entry is popped BEFORE its `after` runs, so a raise or escape from
;;; inside an `after` cannot re-enter it and unwinding cannot loop; the new transfer
;;; then unwinds the rest on its own way out.
(define (%unwind-to target)
  (if (eq? *winds* target)
      #t
      (if (null? *winds*)
          #t                                  ; target is not on this chain
          (let ((entry (car *winds*)))
            (set! *winds* (cdr *winds*))
            ((cdr entry))
            (%unwind-to target)))))

;;; dynamic-wind: before, body, after -- with `after` on EVERY exit.  The normal
;;; path pops and runs it here; an escape or a raise runs it through %unwind-to.
(define (dynamic-wind before thunk after)
  (before)
  (set! *winds* (cons (cons before after) *winds*))
  (let ((r (thunk)))
    (set! *winds* (cdr *winds*))
    (after)
    r))

;;; call/cc, restricted to ESCAPE continuations (design D1).  %run-guarded pushes a
;;; runtime escape frame and runs the thunk; %escape-frame reads that frame's id
;;; (innermost = ours, since nothing has been pushed since); %escape-to delivers a
;;; value to it.  %escape-to returns #f ONLY when no live frame carries the id --
;;; the capturing call has returned -- which is a diagnostic, not a jump into a dead
;;; frame.  Re-entrant continuations are rung 4 and are not supported.
(define (call-with-current-continuation f)
  (let ((saved-winds *winds*))
    (cdr (%run-guarded
          (lambda ()
            (let ((id (%escape-frame)))
              (f (lambda (v)
                   ;; Liveness FIRST.  Unwinding to a dead continuation's depth would
                   ;; run the `after` thunks -- including the one that pops the very
                   ;; handler meant to report this error -- for a transfer that cannot
                   ;; happen.  When live, %escape-to does not return.
                   (if (%escape-live? id)
                       (begin (%unwind-to saved-winds) (%escape-to id v))
                       #f)
                   (error 'call/cc
                          "continuation invoked outside its extent")))))))))

(define (call/cc f) (call-with-current-continuation f))

;;; Install HANDLER for the dynamic extent of THUNK.  The push/pop rides
;;; dynamic-wind, so an escape out of the thunk restores the chain for free.
;;; (Rung 2 exposes this as `with-exception-handler`; it needs no new machinery.)
(define (%with-handler handler thunk)
  (let ((saved *handlers*))
    (dynamic-wind
      (lambda () (set! *handlers* (cons handler saved)))
      thunk
      (lambda () (set! *handlers* saved)))))

;;; raise any object: call the current handler with the chain popped to the outer
;;; one, per R7RS.  A handler for `raise` must not return -- `guard`'s escapes -- so
;;; a normal return falls through to the unhandled path.  With no handler at all,
;;; %raise renders and aborts exactly as before.
(define (raise obj)
  (if (null? *handlers*)
      (%raise obj)
      (let ((h (car *handlers*)) (saved *handlers*))
        (set! *handlers* (cdr *handlers*))
        (h obj)
        (set! *handlers* saved)
        (%raise obj))))

;;; R7RS error-object accessors over the runtime error-object representation.
(define (error-object? x) (%error-object? x))
(define (error-object-message x) (%error-object-message x))
(define (error-object-irritants x) (%error-object-irritants x))

;;; guard: evaluate BODY; if it raises, bind the object to VAR and run the clauses
;;; as a `cond` in the guard's continuation.  No matching clause (and no else)
;;; re-raises outward.  This is R7RS's own shape (change: dynamic-extent, design
;;; D4): `guard` is not a mechanism of its own -- it installs a HANDLER that escapes
;;; to the guard's continuation, so the intervening dynamic-wind `after` thunks run
;;; on the ordinary escape path.
;;;
;;; DEVIATION (recorded): R7RS reraises a non-matching guard "within the dynamic
;;; environment of the original call to raise".  That needs re-entering a
;;; continuation whose extent has ended (rung 4); here the reraise happens in the
;;; GUARD's dynamic environment, so `after` thunks between the raise point and the
;;; guard have already run and do not run again.
(define-syntax guard
  (syntax-rules ()
    ((_ (var clause ...) body ...)
     (let ((%gres
            (call-with-current-continuation
              (lambda (%gk)
                (%with-handler
                  (lambda (%gobj) (%gk (cons #t %gobj)))
                  (lambda () (cons #f (begin body ...))))))))
       (if (car %gres)
           (let ((var (cdr %gres))) (%guard-clauses var clause ...))
           (cdr %gres))))))

(define-syntax %guard-clauses
  (syntax-rules (else =>)
    ((_ v) (raise v))                                              ; no clause matched
    ((_ v (else e ...)) (begin e ...))
    ((_ v (test => proc) rest ...) (let ((gt test)) (if gt (proc gt) (%guard-clauses v rest ...))))
    ((_ v (test) rest ...) (let ((gt test)) (if gt gt (%guard-clauses v rest ...))))
    ((_ v (test e ...) rest ...) (if test (begin e ...) (%guard-clauses v rest ...)))))

;;; --- parameter objects (change: dynamic-extent, design D3) -----------------
;;; A parameter is a closure over a one-slot cell.  R7RS specifies the object as
;;; callable with ZERO arguments returning its value, which is what makes it
;;; substitutable for a plain accessor procedure at any call site.  The one- and
;;; two-argument forms are internal to `parameterize`: one argument converts and
;;; sets (a new binding), two restore a previously converted value unconverted.
(define (make-parameter init . conv)
  (let ((convert (if (null? conv) (lambda (x) x) (car conv)))
        (cell (%make-vector 1 0)))
    (%vector-set! cell 0 ((if (null? conv) (lambda (x) x) (car conv)) init))
    (lambda args
      (if (null? args)
          (%vector-ref cell 0)
          (if (null? (cdr args))
              (%vector-set! cell 0 (convert (car args)))
              (%vector-set! cell 0 (car args)))))))

;;; parameterize rides dynamic-wind, so restoration on a normal exit, on an escape,
;;; and on a raise all come from one place (design D3).
(define (%with-parameters params vals thunk)
  (let ((olds (map (lambda (p) (p)) params)))
    (dynamic-wind
      (lambda () (for-each (lambda (p v) (p v)) params vals))
      thunk
      (lambda () (for-each (lambda (p v) (p v #f)) params olds)))))

(define-syntax parameterize
  (syntax-rules ()
    ((_ ((p v) ...) body ...)
     (%with-parameters (list p ...) (list v ...) (lambda () body ...)))))

;;; --- vector constructors (vectors change) ---------------------------------
;;; make-vector/vector-ref/vector-set!/vector-length/vector? are primitives;
;;; the variadic constructor and list conversion are prelude Scheme over them.
(define (list->vector xs)
  (let ([v (make-vector (length xs) 0)])
    (let loop ([xs xs] [i 0])
      (if (null? xs)
          v
          (begin (vector-set! v i (car xs)) (loop (cdr xs) (+ i 1)))))))
(define (vector . xs) (list->vector xs))

(define (list->bytevector bs)
  (let ([bv (make-bytevector (length bs) 0)])
    (let loop ([bs bs] [i 0])
      (if (null? bs)
          bv
          (begin (bytevector-u8-set! bv i (car bs)) (loop (cdr bs) (+ i 1)))))))
(define (bytevector . bs) (list->bytevector bs))

;; --- multiple values (openspec multiple-values): values / call-with-values ---
;; A distinguished bundle carries 0 or >=2 values; exactly one value is returned
;; as itself (identity), so ordinary single-value code is untouched.  The bundle
;; is a disjoint HDR_MV wrapper (%list->mv) that only call-with-values consumes,
;; spreading it into the consumer via the existing `apply` -- so `(map ...)` and
;; `(apply consumer ...)` both work with no calling-convention change.
(define (values . vs)
  (if (and (pair? vs) (null? (cdr vs)))
      (car vs)                 ; exactly one value -> identity
      (%list->mv vs)))         ; zero or >=2 values -> a bundle carrying the list
(define (call-with-values producer consumer)
  (let ([r (producer)])
    (if (%mv? r)
        (apply consumer (%mv->list r))
        (consumer r))))

;; --- hash tables (openspec hash-tables): SRFI-69 subset, equal?-keyed --------
;; Built on vectors + the %hash primitive.  A table is an opaque HDR_HASHTABLE
;; wrapper (%make-hash-table) around a mutable spine vector #(count buckets _);
;; `buckets` is a vector of association lists ((key . val) ...).  Pairs are
;; immutable here, so an existing key is updated by rebuilding its bucket alist
;; (drop the old entry, prepend the new one).  The table grows (rehashes into
;; ~2x buckets) once count/nbuckets exceeds the load factor, keeping lookup
;; amortized O(1).  %hash need only be CONSISTENT with equal? (the bucket scan
;; below is the source of truth), so collisions are merely slow, never wrong.
(define %ht-initial-buckets 8)
(define %ht-load-factor 3)

(define (make-hash-table)
  (%make-hash-table (vector 0 (make-vector %ht-initial-buckets (quote ())) #f)))
(define (hash-table? x) (%hash-table? x))

(define (%ht-count ht)        (vector-ref (%hash-table-spine ht) 0))
(define (%ht-buckets ht)      (vector-ref (%hash-table-spine ht) 1))
(define (%ht-set-count! ht n) (vector-set! (%hash-table-spine ht) 0 n))
(define (%ht-set-buckets! ht b) (vector-set! (%hash-table-spine ht) 1 b))

;; %hash is non-negative and nbuckets positive, so remainder == modulo here.
(define (%ht-index key nbuckets) (remainder (%hash key) nbuckets))

;; the (key . val) pair for an equal? key in an alist, or #f
(define (%ht-assoc key al)
  (if (null? al) #f
      (if (equal? key (car (car al))) (car al) (%ht-assoc key (cdr al)))))
;; the alist with the (first) equal? key removed
(define (%ht-remove key al)
  (if (null? al) (quote ())
      (if (equal? key (car (car al)))
          (cdr al)
          (cons (car al) (%ht-remove key (cdr al))))))

(define (hash-table-ref/default ht key default)
  (let* ((bs (%ht-buckets ht))
         (p (%ht-assoc key (vector-ref bs (%ht-index key (vector-length bs))))))
    (if p (cdr p) default)))

(define (hash-table-contains? ht key)
  (let ((bs (%ht-buckets ht)))
    (if (%ht-assoc key (vector-ref bs (%ht-index key (vector-length bs)))) #t #f)))

(define (hash-table-ref ht key)
  (let* ((bs (%ht-buckets ht))
         (p (%ht-assoc key (vector-ref bs (%ht-index key (vector-length bs))))))
    (if p (cdr p) (error "hash-table-ref: key not found" key))))

(define (hash-table-set! ht key val)
  (let* ((bs (%ht-buckets ht))
         (n (vector-length bs))
         (i (%ht-index key n))
         (al (vector-ref bs i))
         (existed (%ht-assoc key al)))
    (vector-set! bs i (cons (cons key val) (if existed (%ht-remove key al) al)))
    (if existed
        #f
        (begin
          (%ht-set-count! ht (+ (%ht-count ht) 1))
          (if (> (%ht-count ht) (* %ht-load-factor n)) (%ht-grow! ht) #f)))))

(define (hash-table-delete! ht key)
  (let* ((bs (%ht-buckets ht))
         (i (%ht-index key (vector-length bs)))
         (al (vector-ref bs i)))
    (if (%ht-assoc key al)
        (begin (vector-set! bs i (%ht-remove key al))
               (%ht-set-count! ht (- (%ht-count ht) 1)))
        #f)))

;; reinsert every entry into a ~2x bucket vector, recomputing each index
(define (%ht-grow! ht)
  (let* ((old (%ht-buckets ht))
         (newn (* 2 (vector-length old)))
         (newb (make-vector newn (quote ()))))
    (let loop ((i 0))
      (if (< i (vector-length old))
          (begin
            (let bloop ((al (vector-ref old i)))
              (if (null? al) #f
                  (let* ((kv (car al)) (j (%ht-index (car kv) newn)))
                    (vector-set! newb j (cons kv (vector-ref newb j)))
                    (bloop (cdr al)))))
            (loop (+ i 1)))
          #f))
    (%ht-set-buckets! ht newb)))

(define (hash-table-size ht) (%ht-count ht))

(define (%ht-fold-buckets al acc)
  (if (null? al) acc
      (cons (cons (car (car al)) (cdr (car al))) (%ht-fold-buckets (cdr al) acc))))
(define (hash-table->alist ht)
  (let ((bs (%ht-buckets ht)))
    (let loop ((i 0) (acc (quote ())))
      (if (< i (vector-length bs))
          (loop (+ i 1) (%ht-fold-buckets (vector-ref bs i) acc))
          acc))))
(define (hash-table-keys ht) (map car (hash-table->alist ht)))
(define (hash-table-values ht) (map cdr (hash-table->alist ht)))

;;; --- reader (scheme-reader): read-from-string source text -> datum --------
;;; Recursive descent over a string; the scan position is threaded functionally
;;; as (datum . next-index) pairs.  Characters are classified by codepoint
;;; (char->integer) because char literals are not interned (so eq? on them does
;;; not hold).  v1 reads integers, symbols, lists, #t/#f, #\char, "strings"
;;; (no escapes), 'quote and `/,/,@ quasiquote sugar, skipping whitespace and
;;; ; line comments.

(define (rd-ws? c)                       ; space, tab, newline, return
  (let ([k (char->integer c)])
    (or (= k 32) (or (= k 9) (or (= k 10) (= k 13))))))
(define (rd-digit? c)
  (let ([k (char->integer c)]) (and (< 47 k) (< k 58))))   ; '0'..'9'
(define (rd-delim? c)                    ; ends a token: ws or ( ) [ ] " ;
  (let ([k (char->integer c)])
    (or (rd-ws? c)
        (or (= k 40) (or (= k 41) (or (= k 91) (or (= k 93)
        (or (= k 34) (= k 59)))))))))

(define (rd-skip-line s n i)             ; index just past the next newline (or n)
  (if (< i n)
      (if (= (char->integer (string-ref s i)) 10) (+ i 1) (rd-skip-line s n (+ i 1)))
      i))
(define (rd-skip-ws s n i)               ; next index that is not ws or a comment
  (if (< i n)
      (let ([c (string-ref s i)])
        (cond
          [(rd-ws? c) (rd-skip-ws s n (+ i 1))]
          [(= (char->integer c) 59) (rd-skip-ws s n (rd-skip-line s n (+ i 1)))]
          [else i]))
      i))

(define (rd-token-end s n i)             ; first delimiter index >= i (or n)
  (if (< i n)
      (if (rd-delim? (string-ref s i)) i (rd-token-end s n (+ i 1)))
      i))

(define (rd-all-digits? tok a m)
  (if (< a m) (if (rd-digit? (string-ref tok a)) (rd-all-digits? tok (+ a 1) m) #f) #t))
(define (rd-numeric? tok)                ; optional +/- then >=1 digits
  (let ([m (string-length tok)])
    (and (< 0 m)
         (let ([c0 (char->integer (string-ref tok 0))])
           (cond
             [(rd-digit? (string-ref tok 0)) (rd-all-digits? tok 0 m)]
             [(or (= c0 45) (= c0 43)) (and (< 1 m) (rd-all-digits? tok 1 m))]
             [else #f])))))
(define (rd-digits tok a m acc)
  (if (< a m)
      (rd-digits tok (+ a 1) m (+ (* acc 10) (- (char->integer (string-ref tok a)) 48)))
      acc))
(define (rd-parse-int tok)
  (let ([m (string-length tok)] [c0 (char->integer (string-ref tok 0))])
    (cond
      [(= c0 45) (- 0 (rd-digits tok 1 m 0))]
      [(= c0 43) (rd-digits tok 1 m 0)]
      [else (rd-digits tok 0 m 0)])))

;;; --- inexact real (flonum) literal recognition (change: inexact-numbers) ----
;;; A flonum token is  [sign] ( digits [. digits] | . digits ) [exp]  with at
;;; least one digit AND at least one of a dot or an exponent (a pure-digit token
;;; is an integer, matched by rd-numeric?).  exp = (e|E) [sign] >=1 digits.  This
;;; only CLASSIFIES the token; the value parse is the runtime strtod (correctly
;;; rounded, so it round-trips with the flonum printer) via %string->flonum.
(define (rd-dotchar? c) (= (char->integer c) 46))                         ; the char .
(define (rd-exp-char? c) (let ([k (char->integer c)]) (or (= k 101) (= k 69))))  ; e E
(define (rd-sign-char? c) (let ([k (char->integer c)]) (or (= k 43) (= k 45))))  ; + -
(define (rd-scan-digits tok a m)         ; index just past a run of >=0 digits
  (if (and (< a m) (rd-digit? (string-ref tok a))) (rd-scan-digits tok (+ a 1) m) a))
(define (rd-flonum? tok)
  (let ([m (string-length tok)])
    (and (< 0 m)
      (let ([i0 (if (rd-sign-char? (string-ref tok 0)) 1 0)])
        (let ([i1 (rd-scan-digits tok i0 m)])            ; past integer digits
          (let ([i2 (if (and (< i1 m) (rd-dotchar? (string-ref tok i1))) (+ i1 1) i1)])
            (let ([had-dot (< i1 i2)])
              (let ([i3 (rd-scan-digits tok i2 m)])       ; past fraction digits
                (and (or (< i0 i1) (< i2 i3))             ; at least one digit
                     (let ([i4 (if (and (< i3 m) (rd-exp-char? (string-ref tok i3)))
                                   (let ([i5 (if (and (< (+ i3 1) m)
                                                      (rd-sign-char? (string-ref tok (+ i3 1))))
                                                 (+ i3 2) (+ i3 1))])
                                     (let ([i6 (rd-scan-digits tok i5 m)])
                                       (if (< i5 i6) i6 -1)))   ; exponent needs >=1 digit
                                   i3)])
                       (and (< -1 i4)                     ; valid (or no) exponent
                            (= i4 m)                      ; consumed the whole token
                            (or had-dot (< i3 i4)))))))))))))   ; a dot OR an exponent

(define (rd-atom s n i)                  ; token -> integer, flonum, or interned symbol
  (let ([j (rd-token-end s n i)])
    (let ([tok (substring s i j)])
      (cons (cond [(rd-numeric? tok) (rd-parse-int tok)]
                  [(rd-flonum? tok) (%string->flonum tok)]
                  [else (string->symbol tok)])
            j))))

(define (rd-hex-digit c)                 ; hex char -> value (0 for non-hex)
  (let ([k (char->integer c)])
    (cond
      [(and (< 47 k) (< k 58)) (- k 48)]      ; 0-9
      [(and (< 96 k) (< k 103)) (- k 87)]     ; a-f
      [(and (< 64 k) (< k 71)) (- k 55)]      ; A-F
      [else 0])))
(define (rd-hex s n i acc)               ; \xHH...; -> (codepoint . index-past-;)
  (if (< i n)
      (if (= (char->integer (string-ref s i)) 59)     ; ;
          (cons acc (+ i 1))
          (rd-hex s n (+ i 1) (+ (* acc 16) (rd-hex-digit (string-ref s i)))))
      (cons acc i)))
(define (rd-str-esc c)                   ; escape letter -> the character it denotes
  (let ([k (char->integer c)])
    (cond
      [(= k 110) (integer->char 10)]     ; \n
      [(= k 116) (integer->char 9)]      ; \t
      [(= k 114) (integer->char 13)]     ; \r
      [else c])))                        ; \\ \" and any other: the char itself
(define (rd-string s n i)                ; i just past opening "; decodes escapes
  (let loop ([i i] [acc (quote ())])
    (if (< i n)
        (let* ([c (string-ref s i)] [k (char->integer c)])
          (cond
            [(= k 34) (cons (list->string (reverse acc)) (+ i 1))]        ; closing "
            [(= k 92)                                                     ; backslash escape
             (let ([e (string-ref s (+ i 1))])
               (if (= (char->integer e) 120)                             ; \xHH;
                   (let ([hx (rd-hex s n (+ i 2) 0)])
                     (loop (cdr hx) (cons (integer->char (car hx)) acc)))
                   (loop (+ i 2) (cons (rd-str-esc e) acc))))]            ; \n \t \r \\ \"
            [else (loop (+ i 1) (cons c acc))]))
        (cons (list->string (reverse acc)) i))))

(define (rd-hash s n i)                  ; i just past #
  (let ([k (char->integer (string-ref s i))])
    (cond
      [(= k 116) (cons #t (+ i 1))]                        ; #t
      [(= k 102) (cons #f (+ i 1))]                        ; #f
      [(= k 92) (rd-char s n i)]                           ; #\<char> or #\<name>
      [(= k 40) (let ([r (rd-list s n (+ i 1) (quote ()))])  ; #( ... ) -> vector
                  (cons (list->vector (car r)) (cdr r)))]
      [(and (= k 117)                                        ; #u8( ... ) -> bytevector
            (< (+ i 2) n)
            (= (char->integer (string-ref s (+ i 1))) 56)    ; 8
            (= (char->integer (string-ref s (+ i 2))) 40))   ; (
       (let ([r (rd-list s n (+ i 3) (quote ()))])
         (cons (list->bytevector (car r)) (cdr r)))]
      [else (let ([j (rd-token-end s n i)])
              (cons (string->symbol (substring s i j)) j))])))

(define (rd-char-name tok)               ; multi-char #\ name -> character
  (cond
    [(string=? tok "space")   (integer->char 32)]
    [(string=? tok "newline") (integer->char 10)]
    [(string=? tok "tab")     (integer->char 9)]
    [(string=? tok "return")  (integer->char 13)]
    [(string=? tok "nul")     (integer->char 0)]
    [(string=? tok "null")    (integer->char 0)]
    [(string=? tok "delete")  (integer->char 127)]
    [(string=? tok "altmode") (integer->char 27)]
    [(string=? tok "esc")     (integer->char 27)]
    [else (string-ref tok 0)]))          ; unknown name: first char (undefined per spec)
(define (rd-char s n i)                  ; i at '\' of #\ ; content at i+1
  (let* ([cs (+ i 1)]
         [end (rd-token-end s n (+ cs 1))]   ; force the first content char in
         [tok (substring s cs end)])
    (if (= (string-length tok) 1)
        (cons (string-ref s cs) end)         ; single-character literal
        (cons (rd-char-name tok) end))))     ; named character

(define (rd-quote s n i)                 ; 'x -> (quote x)
  (let ([j (rd-skip-ws s n i)])
    (let ([r (rd-datum s n j)])
      (cons (list (quote quote) (car r)) (cdr r)))))

(define (rd-quasi s n i)                 ; `x -> (quasiquote x)
  (let ([j (rd-skip-ws s n i)])
    (let ([r (rd-datum s n j)])
      (cons (list (quote quasiquote) (car r)) (cdr r)))))

(define (rd-unquote s n i)               ; ,x -> (unquote x); ,@x -> (unquote-splicing x)
  (if (and (< i n) (= (char->integer (string-ref s i)) 64))     ; @  -> splicing
      (let ([j (rd-skip-ws s n (+ i 1))])
        (let ([r (rd-datum s n j)])
          (cons (list (quote unquote-splicing) (car r)) (cdr r))))
      (let ([j (rd-skip-ws s n i)])
        (let ([r (rd-datum s n j)])
          (cons (list (quote unquote) (car r)) (cdr r))))))

(define (rd-dot? s n j)                  ; a standalone `.` token at j (dotted-pair marker)
  (and (= (char->integer (string-ref s j)) 46)      ; .
       (= (rd-token-end s n (+ j 1)) (+ j 1))))      ; next char is a delimiter -> lone .
(define (rd-append-reverse acc tail)     ; (reverse acc) terminated by tail (improper list)
  (if (null? acc) tail (rd-append-reverse (cdr acc) (cons (car acc) tail))))
(define (rd-list s n i acc)              ; i after (; read until ) (supports . tail)
  (let ([j (rd-skip-ws s n i)])
    (if (< j n)
        (cond
          [(let ([c (char->integer (string-ref s j))]) (or (= c 41) (= c 93)))
           (cons (reverse acc) (+ j 1))]                                           ; ) or ]
          [(rd-dot? s n j)                                                          ; . tail
           (let* ([r (rd-datum s n (rd-skip-ws s n (+ j 1)))]
                  [j2 (rd-skip-ws s n (cdr r))])
             (cons (rd-append-reverse acc (car r)) (+ j2 1)))]                      ; past )
          [else (let ([r (rd-datum s n j)])
                  (rd-list s n (cdr r) (cons (car r) acc)))])
        (cons (reverse acc) j))))

(define (rd-datum s n i)                 ; i at a non-ws char -> (datum . next)
  (let ([k (char->integer (string-ref s i))])
    (cond
      [(= k 40) (rd-list s n (+ i 1) (quote ()))]          ; (
      [(= k 91) (rd-list s n (+ i 1) (quote ()))]          ; [ (brackets = parens)
      [(= k 39) (rd-quote s n (+ i 1))]                    ; '
      [(= k 96) (rd-quasi s n (+ i 1))]                    ; `
      [(= k 44) (rd-unquote s n (+ i 1))]                  ; ,
      [(= k 34) (rd-string s n (+ i 1))]                   ; "
      [(= k 35) (rd-hash s n (+ i 1))]                     ; #
      [else (rd-atom s n i)])))

(define (read-from-string s)
  (let ([n (string-length s)])
    (car (rd-datum s n (rd-skip-ws s n 0)))))

;;; --- whole-program read (stdin-source-reader) -----------------------------
;;; Loop the single-datum reader across the whole source: skip inter-form
;;; whitespace/; comments, read a datum, continue from the next position, and
;;; stop at end of input.  Returns the top-level forms in source order (the empty
;;; list for empty or whitespace/comment-only input).  This is what a self-hosted
;;; core uses to turn its input text into the form list it compiles.
(define (read-all-from-string s)
  (let ([n (string-length s)])
    (let loop ([i (rd-skip-ws s n 0)] [acc (quote ())])
      (if (< i n)
          (let ([r (rd-datum s n i)])
            (loop (rd-skip-ws s n (cdr r)) (cons (car r) acc)))
          (reverse acc)))))

;;; --- ports (change: scheme-io-library, design D1/D2) -----------------------
;;; A port is a RECORD over the existing record layer, so `port?` is
;;; `%record-of-type?` and a port is an ordinary first-class value -- no new heap
;;; header code, no printer/GC/equality teaching (design D1).
;;;
;;; FIELD LAYOUT.  Field 0 is a CONTRACT SHARED WITH THE RUNTIME: the
;;; port-directed output primitives (%display-port and friends) are handed the
;;; port record and read slot 0 as their handle, so the two-argument output forms
;;; stay bare primcalls with no Scheme wrapper on the path.  If this layout moves,
;;; `port_arg_stream` in src/runtime/runtime.c moves with it.
;;;
;;;   0 handle    OUTPUT: fixnum handle into the runtime's FILE * table
;;;                       (0 = stdout, 1 = stderr, 2+ = opened by this program)
;;;               INPUT:  #f -- so a port-directed WRITE to an input port finds no
;;;                       fixnum in slot 0 and reports an error instead of writing
;;;   1 input?    #t input, #f output
;;;   2 buf       INPUT: the whole source text, slurped (D2); #f = not yet slurped
;;;               (the stdin port only -- see %port-buf), OUTPUT: #f
;;;   3 pos       INPUT: cursor, a byte index into buf; OUTPUT: unused
;;;   4 string?   #t for a string port (get-output-string is legal on it)
;;;   5 closed?   #t once closed
;;; The port type descriptor is made ON FIRST USE, not at load time.  Two reasons,
;;; both load-bearing: this file is also `load`ed into the Chez bootstrap host by
;;; the reader unit tests, where a `%`-primitive is unbound until Emit compiles it
;;; -- so no top-level INITIALIZER here may call one (every other `%`-use in this
;;; file is likewise inside a procedure body) -- and a program that never mentions
;;; a port then runs no port initialization at all.
(define %port-rtd-cell #f)
(define (%port-rtd)
  (if %port-rtd-cell
      %port-rtd-cell
      (begin (set! %port-rtd-cell (%make-record-type "port"))
             %port-rtd-cell)))

(define (%make-port handle input? buf pos string? closed?)
  (%make-record (%port-rtd) (list handle input? buf pos string? closed?)))

(define (port? p) (%record-of-type? p (%port-rtd)))
(define (input-port? p) (and (port? p) (%record-ref p 1)))
(define (output-port? p) (and (port? p) (not (%record-ref p 1))))
;;; Every port this implementation makes is textual; binary ports are out of scope
;;; (design non-goal), so textual-port? is port? until they exist.
(define (textual-port? p) (port? p))
(define (port-closed? p) (%record-ref p 5))
(define (input-port-open? p) (and (input-port? p) (not (%record-ref p 5))))
(define (output-port-open? p) (and (output-port? p) (not (%record-ref p 5))))

;;; Guard every operation behind "is this the right kind of live port?", so a
;;; wrong-type or use-after-close argument becomes a catchable R7RS error naming
;;; the operation rather than a wrong tag walk (spec: an operation on a closed port
;;; reports an error).
(define (%check-input-port p who)
  (if (not (input-port? p))
      (error who "not an input port" p)
      (if (%record-ref p 5) (error who "port is closed" p) p)))
(define (%check-output-port p who)
  (if (not (output-port? p))
      (error who "not an output port" p)
      (if (%record-ref p 5) (error who "port is closed" p) p)))

;;; The source text of an input port, slurped on first use.  Every port EXCEPT the
;;; stdin one arrives with its text already in hand (open-input-file slurps at open,
;;; open-input-string is handed it).  current-input-port must NOT slurp when it is
;;; created -- that would block every program at startup on a stdin nobody reads --
;;; so it starts with #f here and pulls the stream in on the first actual read.
(define (%port-buf p)
  (let ((b (%record-ref p 2)))
    (if b
        b
        (let ((s (%read-all-stdin)))
          (%record-set! p 2 s)
          s))))

;;; --- input ports ----------------------------------------------------------
;;; open-input-file SLURPS (design D2), which is precisely what makes a file port
;;; and a string port the same object: both are a string plus a cursor, so every
;;; input operation below is pure Scheme over data already in hand and `read` is
;;; the reader this file already defines. The cost -- a source larger than memory
;;; cannot be read, and input written after the open is not seen -- is documented
;;; in the spec and docs/PRIMITIVES.md, not just here.
(define (open-input-string s) (%make-port #f #t s 0 #t #f))
(define (open-input-file path)
  (let ((s (%read-file path)))
    (if s
        (%make-port #f #t s 0 #f #f)
        (error 'open-input-file "cannot open file for input" path))))

(define (%port-at-eof? p) (>= (%record-ref p 3) (string-length (%port-buf p))))

(define (read-char p)
  (%check-input-port p 'read-char)
  (if (%port-at-eof? p)
      (eof-object)
      (let ((i (%record-ref p 3)))
        (%record-set! p 3 (+ i 1))
        (string-ref (%port-buf p) i))))

(define (peek-char p)
  (%check-input-port p 'peek-char)
  (if (%port-at-eof? p)
      (eof-object)
      (string-ref (%port-buf p) (%record-ref p 3))))

;;; read-line: up to but NOT including the next line feed, which is consumed; a
;;; final line with no terminator is returned as-is.
(define (read-line p)
  (%check-input-port p 'read-line)
  (if (%port-at-eof? p)
      (eof-object)
      (let* ((s (%port-buf p))
             (n (string-length s)))
        (let loop ((i (%record-ref p 3)))
          (if (>= i n)
              (let ((start (%record-ref p 3)))          ; unterminated final line
                (%record-set! p 3 n)
                (substring s start n))
              (if (char=? (string-ref s i) #\newline)
                  (let ((start (%record-ref p 3)))
                    (%record-set! p 3 (+ i 1))          ; consume the line feed
                    (substring s start i))
                  (loop (+ i 1))))))))

;;; read-string: up to k characters, short ONLY at end of input.
(define (read-string k p)
  (%check-input-port p 'read-string)
  (if (%port-at-eof? p)
      (eof-object)
      (let* ((s (%port-buf p))
             (n (string-length s))
             (start (%record-ref p 3))
             (end (if (> (+ start k) n) n (+ start k))))
        (%record-set! p 3 end)
        (substring s start end))))

;;; read: ONE datum at the cursor, leaving the port positioned after it.  This is
;;; a cursor discipline over the reader that already exists, NOT a second reader --
;;; rd-datum returns (datum . next-index), which is exactly one `read` step, and
;;; rd-skip-ws is what makes leading whitespace and ; comments disappear.  Sharing
;;; one reader means a user-visible `read` and the compiler's own front end accept
;;; the same external representations by construction.
(define (read p)
  (%check-input-port p 'read)
  (let* ((s (%port-buf p))
         (n (string-length s))
         (i (rd-skip-ws s n (%record-ref p 3))))
    (if (>= i n)
        (begin (%record-set! p 3 n) (eof-object))
        (let ((r (rd-datum s n i)))
          (%record-set! p 3 (cdr r))
          (car r)))))

;;; --- output ports ---------------------------------------------------------
;;; An output port streams through to its runtime handle on every operation (D2);
;;; a string port is a handle too (an in-memory stream in the runtime), so ONE
;;; printer serves both and nothing accumulates in Scheme.
(define (open-output-file path)
  (let ((h (%port-open-output-file path)))
    (if h
        (%make-port h #f #f 0 #f #f)
        (error 'open-output-file "cannot open file for output" path))))

(define (open-output-string)
  (let ((h (%port-open-output-string)))
    (if h
        (%make-port h #f #f 0 #t #f)
        (error 'open-output-string "cannot open an output string port"))))

;;; get-output-string does NOT require the port to be open: write-then-close-then-
;;; collect is the natural idiom, and closing a string port finalizes its buffer
;;; rather than discarding it.  This reads accumulated state instead of reading FROM
;;; or writing TO the port, so it is not the "operation on a closed port" the spec
;;; requires to fail.
(define (get-output-string p)
  (if (not (output-port? p))
      (error 'get-output-string "not an output port" p)
      (if (not (%record-ref p 4))
          (error 'get-output-string "not a string port" p)
          (%port-get-output-string (%record-ref p 0)))))

(define (flush-output-port p)
  (%check-output-port p 'flush-output-port)
  (%port-flush (%record-ref p 0)))

;;; close-port: flush, then close, for either direction.  Closing an
;;; already-closed port is permitted and does nothing (R7RS).  The runtime refuses
;;; to close the reserved stdout/stderr handles, so closing (current-output-port)
;;; cannot take the process's stdout with it.
(define (close-port p)
  (if (not (port? p))
      (error 'close-port "not a port" p)
      (if (%record-ref p 5)
          (if #f #f)                                  ; already closed: no effect
          (begin
            (if (not (%record-ref p 1)) (%port-close (%record-ref p 0)))
            (%record-set! p 5 #t)
            (if #f #f)))))
(define (close-input-port p)
  (if (input-port? p) (close-port p) (error 'close-input-port "not an input port" p)))
(define (close-output-port p)
  (if (output-port? p) (close-port p) (error 'close-output-port "not an output port" p)))

;;; --- the current ports, as parameter objects ------------------------------
;;; R7RS makes these PARAMETER objects so that with-output-to-file can rebind them
;;; for a dynamic extent.  That became possible when `dynamic-extent` shipped
;;; make-parameter / parameterize / dynamic-wind, which is why this change was
;;; sequenced after it (design D4, superseded).  A parameter is callable with zero
;;; arguments, so `(current-output-port)` reads identically to the plain accessor
;;; the earlier design would have shipped.
;;;
;;; The two reserved handles (0 stdout, 1 stderr) need no runtime table slot, so
;;; these three cost one record each and no file descriptor.  The stdin port's text
;;; is pulled in on first read, never here (see %port-buf).
;;; These three are hand-written rather than `make-parameter` calls for two
;;; reasons.  First, their initial port must be built LAZILY (see %port-rtd above),
;;; so there is no value to hand `make-parameter` at load time.  Second,
;;; current-output-port has to reach the RUNTIME as well as Scheme: `(display x)`
;;; with no port compiles to a bare primcall whose destination is a runtime cell
;;; (rt_current_out in src/runtime/runtime.c), which is how a port-less display
;;; follows `with-output-to-file` while its emitted code stays byte-identical.
;;; Every set must push the new port's handle into that cell -- INCLUDING the
;;; restore leg, which arrives as the two-argument form `(p v #f)` that a
;;; make-parameter converter would never see.
;;;
;;; The protocol is make-parameter's exactly -- zero arguments reads, one or two
;;; set -- so `parameterize` drives these, and a call site cannot tell them from
;;; plain accessor procedures.
(define %stdout-port #f)
(define %stderr-port #f)
(define %stdin-port  #f)

(define (current-output-port . args)
  (if (null? args)
      (begin
        (if (not %stdout-port)
            (begin (set! %stdout-port (%make-port 0 #f #f 0 #f #f))
                   (%set-current-output! 0)))
        %stdout-port)
      (let ((p (car args)))
        (set! %stdout-port p)
        (%set-current-output! (%record-ref p 0))
        (if #f #f))))

(define (current-error-port . args)
  (if (null? args)
      (begin
        (if (not %stderr-port) (set! %stderr-port (%make-port 1 #f #f 0 #f #f)))
        %stderr-port)
      (begin (set! %stderr-port (car args)) (if #f #f))))

;;; The stdin port's TEXT is pulled in on the first read, never here (see
;;; %port-buf) -- slurping at startup would block every program on a stdin nobody
;;; reads.
(define (current-input-port . args)
  (if (null? args)
      (begin
        (if (not %stdin-port) (set! %stdin-port (%make-port #f #t #f 0 #f #f)))
        %stdin-port)
      (begin (set! %stdin-port (car args)) (if #f #f))))

;;; call-with-port: hand the port to PROC and close it on EVERY exit -- a normal
;;; return, an escape via a continuation, or a raise.  dynamic-wind is what makes
;;; the escaping cases work; a version that just closed after the call would leak
;;; the port exactly when it matters most.
(define (call-with-port p proc)
  (dynamic-wind
    (lambda () (if #f #f))
    (lambda () (proc p))
    (lambda () (close-port p))))

;;; with-output-to-file / with-input-from-file: rebind the corresponding parameter
;;; for the dynamic extent of THUNK, then close the port and restore the parameter.
;;; Both ride dynamic-wind for the same reason call-with-port does.
(define (with-output-to-file path thunk)
  (let ((p (open-output-file path))
        (saved (current-output-port)))
    (dynamic-wind
      (lambda () (current-output-port p))
      thunk
      (lambda () (current-output-port saved #f) (close-port p)))))

(define (with-input-from-file path thunk)
  (let ((p (open-input-file path))
        (saved (current-input-port)))
    (dynamic-wind
      (lambda () (current-input-port p))
      thunk
      (lambda () (current-input-port saved #f) (close-port p)))))

(define (call-with-output-file path proc)
  (call-with-port (open-output-file path) proc))
(define (call-with-input-file path proc)
  (call-with-port (open-input-file path) proc))
