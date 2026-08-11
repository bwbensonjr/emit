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
;;; All twenty-eight: the four depth-2 forms, which R7RS-small puts in (scheme base),
;;; and the twenty-four depth-3 and depth-4 compositions, which it puts in
;;; (scheme cxr) -- see the partition in src/prelude-surface.scm for which library
;;; exports which.  Each is the named composition of the primitive car/cdr, the
;;; letters read right-to-left = innermost-first, so cXYZ = (cX (cYZ x)).
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
;;; The depth-4 forms.  Fifteen of the sixteen are new (change:
;;; scheme-base-partition, design D9): (scheme cxr) is specified to export
;;; twenty-four procedures, and shipping a library named after the standard in which
;;; (caddar x) is an unbound variable would be a worse conformance state than not
;;; having the library at all.  `cadddr` is the sixteenth and predates them -- the
;;; prelude grew as self-hosting needed names, which is why only it was here.  The
;;; compiler uses none of these, so they are homed in (scheme cxr) alone.
(define (caaaar x) (car (caaar x)))
(define (caaadr x) (car (caadr x)))
(define (caadar x) (car (cadar x)))
(define (caaddr x) (car (caddr x)))
(define (cadaar x) (car (cdaar x)))
(define (cadadr x) (car (cdadr x)))
(define (caddar x) (car (cddar x)))
(define (cdaaar x) (cdr (caaar x)))
(define (cdaadr x) (cdr (caadr x)))
(define (cdadar x) (cdr (cadar x)))
(define (cdaddr x) (cdr (caddr x)))
(define (cddaar x) (cdr (cdaar x)))
(define (cddadr x) (cdr (cdadr x)))
(define (cdddar x) (cdr (cddar x)))
(define (cddddr x) (cdr (cdddr x)))

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

;;; --- max / min (R7RS 6.2.6) -----------------------------------------------
;;; Variadic over one or more numbers (change: numeric-conformance, design D6 /
;;; GitHub issue #26 -- `max` used to be strictly binary and `min` did not exist).
;;;
;;; R7RS requires INEXACTNESS CONTAGION: if any argument is inexact the result is
;;; inexact, even when the argument that WON the comparison is exact.  That second
;;; half is the one a naive implementation gets wrong -- `(max 3.0 4)` is 4.0, not 4
;;; -- so the winner and the exactness are tracked separately: the fold carries a
;;; flag for "some argument was inexact" and the conversion happens once, at the end.
;;; Comparison itself is by numeric value across the exactness boundary, which `<`
;;; already does.
;;; The flag is `inex`, NOT `inexact?`: naming it after the predicate would shadow
;;; the predicate this very fold calls, and the shadowed call would ask a boolean.
(define (%minmax-fold pick xs best inex)
  (if (null? xs)
      (if inex (exact->inexact best) best)
      (%minmax-fold pick (cdr xs) (pick best (car xs))
                    (if inex #t (inexact? (car xs))))))
(define (%minmax pick a rest)
  (%minmax-fold pick rest a (inexact? a)))
(define (max a . rest) (%minmax (lambda (x y) (if (< x y) y x)) a rest))
(define (min a . rest) (%minmax (lambda (x y) (if (< y x) y x)) a rest))

;;; --- the R7RS 6.2 numeric inventory (change: numeric-conformance) -----------
;;; Emit's tower is two types -- a 61-bit exact integer and a double -- which R7RS
;;; 6.2.3 explicitly permits ("an implementation in which exact numbers are always
;;; integer").  Everything below is Scheme over the existing primitives; only what
;;; genuinely needs C (the flonum arm of the rounding family, classification, libm)
;;; is a `%`-op, which is what kept the staged-bootstrap cost proportional.
;;;
;;; The 6.2.3 exact-for-exact guarantee is honored throughout: abs, ceiling, floor,
;;; gcd, lcm, max, min, round, square, truncate and the division family all return
;;; exact results for exact arguments.  A result that leaves the fixnum range traps
;;; through the existing overflow diagnostic -- (abs FIXNUM_MIN) among them, whose
;;; magnitude is one past the range -- inherited from `+ - *`, not re-implemented.

;;; Type predicates apply to ANY object and answer #f for a non-number (R7RS 6.2.6),
;;; unlike the arithmetic predicates below them, which require a number.
(define (complex? n) (number? n))
(define (exact-integer? n) (if (exact? n) (integer? n) #f))
;;; `rational?` is the finite reals: every exact integer, and a flonum that is
;;; neither an infinity nor a NaN.  %finite? is the runtime's isfinite, so there is
;;; one definition of finiteness shared with (scheme inexact)'s `finite?`.
(define (rational? n) (if (number? n) (%finite? n) #f))

;;; Sign and parity require a number; `<` and `remainder` supply the trap, and
;;; remainder's integrality guard is what makes (odd? 7.5) an error rather than an
;;; answer.
(define (positive? n) (< 0 n))
(define (negative? n) (< n 0))
(define (even? n) (= 0 (remainder n 2)))
(define (odd? n) (if (= 0 (remainder n 2)) #f #t))

(define (abs n) (if (< n 0) (- 0 n) n))
(define (square n) (* n n))

;;; gcd/lcm: variadic, non-negative, exact for exact.  Identities are 0 and 1, so
;;; the no-argument cases fall out of the fold rather than being special-cased.
(define (%gcd2 a b) (if (= b 0) a (%gcd2 b (remainder a b))))
(define (%gcd-fold ns acc)
  (if (null? ns) acc (%gcd-fold (cdr ns) (%gcd2 (abs (car ns)) (abs acc)))))
(define (%lcm-fold ns acc)
  (if (null? ns)
      acc
      (let ([a (abs (car ns))])
        (if (= a 0) 0 (%lcm-fold (cdr ns) (quotient (* acc a) (%gcd2 acc a)))))))
(define (gcd . ns) (%gcd-fold ns 0))
(define (lcm . ns) (%lcm-fold ns 1))

;;; expt.  An exact base with a non-negative exact integer exponent stays EXACT, by
;;; repeated squaring -- so (expt 2 60) is exact and (expt 2 61) traps on overflow
;;; rather than silently going inexact.  A negative exponent has no exact value
;;; here (no rationals), so it returns the inexact one, which is the same 6.2.3
;;; licence `/` already uses for a non-integral exact quotient.  Any inexact
;;; operand routes to %pow (libm).  (expt 0 0) is 1, per 6.2.6.
(define (%expt-exact b e acc)
  (if (= e 0)
      acc
      (%expt-exact (* b b) (quotient e 2) (if (odd? e) (* acc b) acc))))
(define (expt b e)
  (if (exact? e)
      (if (< e 0)
          (%pow b e)
          (if (exact? b) (%expt-exact b e 1) (%expt-exact b e 1.0)))
      (%pow b e)))

;;; exact-integer-sqrt: Newton's method on exact integers, returning TWO values --
;;; the root and the remainder -- through the same `values` the rest of the library
;;; uses.  Stays exact end to end, which is the point of it existing alongside
;;; (scheme inexact)'s `sqrt`.
(define (%isqrt-loop n g)
  (let ([g2 (quotient (+ g (quotient n g)) 2)])
    (if (< g2 g) (%isqrt-loop n g2) g)))
(define (%isqrt n) (if (= n 0) 0 (%isqrt-loop n n)))
(define (exact-integer-sqrt n)
  (let ([s (%isqrt n)]) (values s (- n (* s s)))))

;;; Rounding.  An exact integer is already rounded, so it is returned UNCHANGED --
;;; which is both the R7RS exactness rule and the reason a large-magnitude flonum
;;; never routes through the fixnum range: the inexact arm stays in double.
;;; `round` is round-half-to-EVEN (%flo-round is rint), so 2.5 -> 2.0 and 3.5 -> 4.0.
(define (floor n)    (if (exact? n) n (%flo-floor n)))
(define (ceiling n)  (if (exact? n) n (%flo-ceiling n)))
(define (truncate n) (if (exact? n) n (%flo-truncate n)))
(define (round n)    (if (exact? n) n (%flo-round n)))

;;; The R7RS 6.2.6 division operators, over the truncating and flooring primitives
;;; that already exist -- so all six inherit their argument-domain rules (an
;;; integral flonum is accepted with contagion, anything else non-integer traps)
;;; and their division-by-zero trap, with no second implementation to keep in step.
;;; floor-quotient is derived rather than branched on signs: subtracting the
;;; flooring remainder makes the division exact, so the truncating quotient of the
;;; difference IS the flooring quotient.
(define (truncate-quotient n d) (quotient n d))
(define (truncate-remainder n d) (remainder n d))
(define (floor-remainder n d) (modulo n d))
(define (floor-quotient n d) (quotient (- n (modulo n d)) d))
(define (truncate/ n d) (values (quotient n d) (remainder n d)))
(define (floor/ n d) (values (floor-quotient n d) (modulo n d)))

;;; numerator/denominator, restricted to integer-VALUED arguments: n/1 for an exact
;;; integer and n/1.0 for an integral flonum.  R7RS defines them over rationals,
;;; which Emit does not represent, and 6.2.3 sanctions restricting the domain -- a
;;; best-effort rational reconstruction of a double would be misleading, not useful.
(define (numerator n)
  (if (integer? n) n (error "numerator: not an integer" n)))
(define (denominator n)
  (if (integer? n) (if (exact? n) 1 1.0) (error "denominator: not an integer" n)))

;;; The R7RS spellings of the exactness conversions.  The R5RS names remain, so
;;; both are available and neither is deprecated here.
(define (inexact n) (exact->inexact n))
(define (exact n) (inexact->exact n))

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
;;; HISTORICAL: this was the callee of the parser's eta for a bare `string-append`
;;; in value position.  That special case was retired in favour of the
;;; self-contained `str` fold over raw primcalls (see `*integrable*` in
;;; src/parse.ss), so nothing calls this now; it is private (issue #29) and kept
;;; only because it is harmless and the fold's shape is easier to read beside it.
;;; Written in the common subset -- each `(string-append a b)` here is 2-arg, i.e.
;;; native under Chez and the binary primcall under Emit -- so the prelude still
;;; loads and runs under Chez.
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
  (ns-digits-radix m 10 acc))
;;; The same peel, in any supported radix (change: numeric-conformance).  Digits
;;; above 9 are lowercase, which is what the reader's rd-hex-digit accepts, so the
;;; radix forms round-trip too.
(define (%ns-digit-char d)
  (if (< d 10) (integer->char (+ 48 d)) (integer->char (+ 87 d))))   ; 87 + 10 = #\a
(define (ns-digits-radix m r acc)        ; m <= 0 -> chars of |m| in radix r
  (let ([ch (%ns-digit-char (- 0 (remainder m r)))]
        [rest (quotient m r)])
    (if (= rest 0)
        (cons ch acc)
        (ns-digits-radix rest r (cons ch acc)))))
;;; Flonums route to the runtime formatter (%flonum->string: shortest round-
;;; trippable decimal, always with a '.').  `exact?` gates it -- exact? is true
;;; only for fixnums, so the integer path is unchanged; the flonum branch is
;;; never reached with a fixnum (and so is dead during the bootstrap regen, where
;;; %flonum->string is not yet a known primcall).  (change: inexact-numbers)
;;; The optional radix argument (change: numeric-conformance) takes 2, 8, 10, or 16
;;; for an exact integer.  An inexact number requires radix 10: R7RS 6.2.6 permits
;;; an error for the other radices, which is better than inventing a rendering the
;;; reader could not read back.
(define (%radix-ok? r)
  (if (= r 10) #t (if (= r 16) #t (if (= r 8) #t (= r 2)))))
(define (number->string n . rest)
  (let ([r (if (null? rest) 10 (car rest))])
    (if (%radix-ok? r)
        (if (exact? n)
            (cond
              [(= n 0) "0"]
              [(< n 0) (list->string (cons #\- (ns-digits-radix n r (quote ()))))]
              [else    (list->string (ns-digits-radix (- 0 n) r (quote ())))])
            (if (= r 10)
                (%flonum->string n)
                (error "number->string: radix must be 10 for an inexact number" r)))
        (error "number->string: unsupported radix" r))))

;;; string->number: the INVERSE, and deliberately built from the reader's own
;;; classifiers (rd-numeric?/rd-flonum?/rd-parse-int) rather than a second numeric
;;; grammar that could drift from the one the reader accepts.  Returns #f -- not an
;;; error -- for text that is not a number, per R7RS 6.2.6.  When the radix
;;; prefixes (#x/#b/#o/#e/#i) land in the reader, this inherits them for free.
(define (%digit-in-radix c r)            ; digit value, or #f if not a digit in r
  (let ([v (let ([k (char->integer c)])
             (cond
               [(and (< 47 k) (< k 58)) (- k 48)]      ; 0-9
               [(and (< 96 k) (< k 123)) (- k 87)]     ; a-z
               [(and (< 64 k) (< k 91)) (- k 55)]      ; A-Z
               [else 99]))])
    (if (< v r) v #f)))
(define (%radix-digits s i m r acc)      ; accumulate DOWNWARD (see rd-digits-neg)
  (if (< i m)
      (let ([d (%digit-in-radix (string-ref s i) r)])
        (if d (%radix-digits s (+ i 1) m r (- (* acc r) d)) #f))
      acc))
(define (%string->int s r)               ; signed integer in radix r, or #f
  (let ([m (string-length s)])
    (if (= m 0)
        #f
        (let ([c0 (char->integer (string-ref s 0))])
          (if (= c0 45)                                  ; leading '-'
              (if (< 1 m) (%radix-digits s 1 m r 0) #f)
              (let ([start (if (= c0 43) 1 0)])           ; optional leading '+'
                (if (< start m)
                    (let ([neg (%radix-digits s start m r 0)])
                      (if neg (- 0 neg) #f))
                    #f)))))))
;;; `rd-number` IS the reader's number grammar, prefixes and all (change:
;;; reader-lexical-conformance, design D3), so this shares one grammar with the reader
;;; instead of restating it: `#x1f` parses here because it parses there, and a prefix in
;;; the text beats the `radix` argument for the same reason it does in a source file.
;;; The ONE difference is the one R7RS 6.2.6 requires -- where the reader REPORTS a
;;; number it cannot represent (`1/2`, `#x1.8`), string->number answers #f.  rd-number
;;; says so with a symbol, and a number is never a symbol, so that is the whole test.
(define (string->number s . rest)
  (let ([r (if (null? rest) 10 (car rest))])
    (if (%radix-ok? r)
        (let ([v (rd-number s r)])
          (if (symbol? v) #f v))
        (error "string->number: unsupported radix" r))))

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

;;; Install HANDLER for the dynamic extent of THUNK, returning the thunk's value.
;;; The push/pop rides dynamic-wind, so an escape out of the thunk restores the
;;; chain for free.  This IS R7RS 6.11's `with-exception-handler` -- same signature,
;;; same semantics -- and it is spelled that way rather than `%…` because `guard`'s
;;; template calls it in the IMPORTER's scope, so the name is published either way
;;; (change: scheme-base-declared-surface, issue #29); publishing the R7RS spelling
;;; is a conformance gain instead of an internal leak.  `raise-continuable` is still
;;; absent: a handler that returns normally falls through to the unhandled path.
(define (with-exception-handler handler thunk)
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
                (with-exception-handler
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
;;; and on a raise all come from one place (design D3).  Unsigiled and published as an
;;; EXTENSION (R7RS has no name for it): `parameterize`'s template calls it in the
;;; importer's scope, so it is exported either way (change:
;;; scheme-base-declared-surface, issue #29), and an honest 3-line procedure taking
;;; (params vals thunk) is better than a `%`-name that pretends to be private.
(define (with-parameters params vals thunk)
  (let ((olds (map (lambda (p) (p)) params)))
    (dynamic-wind
      (lambda () (for-each (lambda (p v) (p v)) params vals))
      thunk
      (lambda () (for-each (lambda (p v) (p v #f)) params olds)))))

(define-syntax parameterize
  (syntax-rules ()
    ((_ ((p v) ...) body ...)
     (with-parameters (list p ...) (list v ...) (lambda () body ...)))))

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

;;; --- how the reader reports (change: reader-lexical-conformance, design D2) --
;;; An rd-* procedure cannot RAISE.  The whole reader is homed in (emit internal),
;;; and design D10 of scheme-base-partition keeps `error`/`raise`/`*handlers*` out of
;;; the substrate -- duplicating the handler chain would split it, so a `guard` around
;;; a reader error would stop catching it.  Every rd-* procedure is therefore total:
;;; it returns an index or a (datum . index) pair, never a condition.
;;;
;;; A construct that cannot be completed or read travels outward as a NEGATIVE index.
;;; No valid position is negative, so the `(< i n)` test that already guards every scan
;;; rejects it, and the ENTRY POINTS -- read-from-string, read-all-from-string, and
;;; (scheme read)'s `read`, which live where `error` does -- turn it into an error.  A
;;; consumer that needs a different answer from the same signal gives one: the REPL's
;;; input-completeness probe maps it to "incomplete -- keep typing".
;;;
;;; The sentinel CARRIES the position the construct opened at, so the message can name
;;; it (and can re-extract the offending token from the source text): position p encodes
;;; as -3 - p.  -1 and -2 stay unused here, which is what lets the probe keep its own
;;; fc-incomplete/fc-malformed codes in the same integer channel (src/repl-core.ss).
;;; A failing rd-* result is (REASON . sentinel) -- the pair shape every rd-* returns,
;;; with a symbol in place of the datum saying what went wrong.
(define (rd-fail-code p) (- -3 p))       ; opened at p -> the sentinel index
(define (rd-fail? i) (< i 0))
(define (rd-fail-pos i) (- (- 0 i) 3))   ; the sentinel index -> the position
(define (rd-fail why p) (cons why (rd-fail-code p)))

(define (rd-skip-line s n i)             ; index just past the next newline (or n)
  (if (< i n)
      (if (= (char->integer (string-ref s i)) 10) (+ i 1) (rd-skip-line s n (+ i 1)))
      i))
;;; #| ... |# NESTS (R7RS 7.1.2): the first |# closes only the innermost open block, so
;;; this counts depth rather than scanning for the first close.  p is where the OUTERMOST
;;; #| opened, and is what an unterminated comment reports.
(define (rd-block-open? s n i)           ; "#|" begins at i
  (and (= (char->integer (string-ref s i)) 35)
       (< (+ i 1) n)
       (= (char->integer (string-ref s (+ i 1))) 124)))
(define (rd-skip-block s n i d p)        ; inside a block comment at depth d
  (if (< (+ i 1) n)
      (let ([a (char->integer (string-ref s i))]
            [b (char->integer (string-ref s (+ i 1)))])
        (cond
          [(and (= a 124) (= b 35))                         ; |#  closes one level
           (if (= d 1) (+ i 2) (rd-skip-block s n (+ i 2) (- d 1) p))]
          [(and (= a 35) (= b 124))                         ; #|  opens another
           (rd-skip-block s n (+ i 2) (+ d 1) p)]
          [else (rd-skip-block s n (+ i 1) d p)]))
      (rd-fail-code p)))
;;; A block comment is WHITESPACE (design D1), so it is skipped here rather than
;;; dispatched as a datum -- which makes it work everywhere whitespace already works
;;; and gives the REPL probe the same answer for free, since the probe shares this
;;; helper.  (`#;` cannot live here: discarding a datum needs a full recursive read.)
(define (rd-skip-ws s n i)               ; next index that is not ws or a comment
  (if (and (<= 0 i) (< i n))
      (let ([c (string-ref s i)])
        (cond
          [(rd-ws? c) (rd-skip-ws s n (+ i 1))]
          [(= (char->integer c) 59) (rd-skip-ws s n (rd-skip-line s n (+ i 1)))]
          [(rd-block-open? s n i)
           (let ([j (rd-skip-block s n (+ i 2) 1 i)])
             (if (rd-fail? j) j (rd-skip-ws s n j)))]
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
;;; A negative literal accumulates DOWNWARD rather than being built positive and
;;; negated (change: fixnum-overflow-trap).  The fixnum range is asymmetric --
;;; -2^60 is representable but +2^60 is not -- so the old (- 0 (rd-digits ...))
;;; formed an out-of-range positive for the most negative fixnum and got the right
;;; answer only because it wrapped twice.  Now that overflow traps, that literal
;;; would be unreadable.  Accumulating negatively never leaves the range for any
;;; in-range literal, and an out-of-range one still traps in the same `*`/`-` the
;;; positive side traps in.  `ns-digits` (number->string) and `fixnum-word`
;;; (src/emit.ss) already avoid negating for exactly this reason.
(define (rd-digits-neg tok a m acc)
  (if (< a m)
      (rd-digits-neg tok (+ a 1) m (- (* acc 10) (- (char->integer (string-ref tok a)) 48)))
      acc))
(define (rd-parse-int tok)
  (let ([m (string-length tok)] [c0 (char->integer (string-ref tok 0))])
    (cond
      [(= c0 45) (rd-digits-neg tok 1 m 0)]
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

;;; The three non-finite tokens (change: numeric-conformance, design D8 / GitHub
;;; issue #25).  The PRINTER has always emitted these -- (/ 1.0 0.0) prints as
;;; +inf.0 -- but rd-flonum? requires at least one digit, so they fell through to
;;; string->symbol and a program could not read back its own output: write/read
;;; silently turned a number into an identifier.  They are exact literal strings, so
;;; recognizing them costs one comparison ahead of the classifier.  %string->flonum
;;; is strtod, which reads "inf"/"nan" (and stops before the ".0"), so the VALUES
;;; come from the same converter as every other inexact literal rather than from
;;; arithmetic like (/ 1.0 0.0) that would depend on the host's division.
(define (rd-nonfinite tok)               ; the value, or #f if not one of the three
  (cond [(string=? tok "+inf.0") (%string->flonum "inf")]
        [(string=? tok "-inf.0") (%string->flonum "-inf")]
        [(string=? tok "+nan.0") (%string->flonum "nan")]
        [else #f]))

;;; --- one numeric grammar, entered from two places (design D3) --------------
;;; R7RS 6.2.5 lets a number literal carry at most one RADIX prefix (#b #o #d #x) and
;;; at most one EXACTNESS prefix (#e #i), in either order and either case.  The scanner
;;; below peels them off and hands the body to the classifiers that already exist --
;;; rd-numeric?/rd-parse-int, rd-nonfinite, rd-flonum?/%string->flonum, %string->int --
;;; so no second numeric grammar appears.  Both entry points feed it: rd-atom/rd-hash
;;; for the reader and `string->number` for the procedure, which is what makes "any
;;; token the reader accepts as a number is accepted there identically" true by
;;; construction rather than by review.
;;;
;;; rd-number answers the VALUE or one of three reason symbols, because the substrate
;;; cannot raise (see rd-fail above) and `string->number` must not raise at all -- R7RS
;;; 6.2.6 has it answer #f exactly where the reader reports:
;;;
;;;   rd-not-a-number  not numeric syntax -- the reader interns it as a symbol
;;;   rd-rational      n/m rational literal syntax, which Emit does not represent (D4)
;;;   rd-bad-number    prefixed, but the body does not fit the prefix (#x1.8, #b2, #foo)
(define (rd-radix-letter c)              ; #b #o #d #x -> the radix, else #f
  (let ([k (char->integer c)])
    (cond
      [(or (= k 98) (= k 66)) 2]         ; b B
      [(or (= k 111) (= k 79)) 8]        ; o O
      [(or (= k 100) (= k 68)) 10]       ; d D
      [(or (= k 120) (= k 88)) 16]       ; x X
      [else #f])))
(define (rd-exactness-letter c)          ; #e -> 1 (exact), #i -> 2 (inexact), else #f
  (let ([k (char->integer c)])
    (cond
      [(or (= k 101) (= k 69)) 1]        ; e E
      [(or (= k 105) (= k 73)) 2]        ; i I
      [else #f])))
;;; -> (RADIX EXACTNESS . BODY-INDEX), with #f for an absent prefix; or #f overall when
;;; a prefix is malformed or repeated (#x#x1, #q1, a token that is only "#").
(define (rd-scan-prefixes t m i r x)
  (if (and (< i m) (= (char->integer (string-ref t i)) 35))
      (if (< (+ i 1) m)
          (let ([nr (rd-radix-letter (string-ref t (+ i 1)))])
            (if nr
                (if r #f (rd-scan-prefixes t m (+ i 2) nr x))
                (let ([nx (rd-exactness-letter (string-ref t (+ i 1)))])
                  (if nx
                      (if x #f (rd-scan-prefixes t m (+ i 2) r nx))
                      #f))))
          #f)
      (cons r (cons x i))))
(define (rd-radix-scan t m i r)          ; index past a run of >=0 radix-r digits
  (if (and (< i m) (%digit-in-radix (string-ref t i) r))
      (rd-radix-scan t m (+ i 1) r)
      i))
;;; Rational literal SYNTAX: [sign] digits / digits, spanning the WHOLE body.  Spanning
;;; the whole body -- and requiring a digit before the slash -- is what leaves ordinary
;;; symbols with slashes in them alone: `call/cc` has no radix-10 digit where it would
;;; need one.  Whether the VALUE is representable is deliberately not asked (design D4).
(define (rd-rational-body? t m i r)
  (let ([i0 (if (and (< i m) (rd-sign-char? (string-ref t i))) (+ i 1) i)])
    (let ([i1 (rd-radix-scan t m i0 r)])
      (and (< i0 i1)
           (< i1 m)
           (= (char->integer (string-ref t i1)) 47)                    ; /
           (let ([i2 (rd-radix-scan t m (+ i1 1) r)])
             (and (< (+ i1 1) i2) (= i2 m)))))))
;;; #i is total -- every value this reader produces has an inexact image.  #e is not: it
;;; is exact only where the value is integral, so `#e0.5` names an exact number Emit does
;;; not represent and is reported on the same grounds as `1/2` (design D4).
(define (rd-exactness-apply v x)         ; x: #f none, 1 exact, 2 inexact
  (cond
    [(not x) v]
    [(= x 2) (exact->inexact v)]
    [(exact? v) v]
    [(= v (%flo-truncate v)) (inexact->exact v)]
    [else (quote rd-rational)]))
(define (rd-body-number body r x)
  (if (= r 10)
      ;; radix 10 is the reader's own classifier chain.  The two cheap classifiers run
      ;; first and rd-nonfinite's three string comparisons last, so an ordinary integer
      ;; or decimal pays nothing for them; a non-finite token matches neither classifier
      ;; (rd-flonum? needs a digit), so the order is safe as well as cheaper.
      (cond
        [(rd-numeric? body) (rd-exactness-apply (rd-parse-int body) x)]
        [(rd-flonum? body) (rd-exactness-apply (%string->flonum body) x)]
        [else
         (let ([nf (rd-nonfinite body)])
           (cond
             [(not nf) (quote rd-not-a-number)]
             ;; #e+inf.0 names no exact number; #i+inf.0 and a bare +inf.0 are fine.
             [(and x (= x 1)) (quote rd-bad-number)]
             [else (rd-exactness-apply nf x)]))])
      ;; every other radix is integers only: a decimal point or an exponent is radix-10
      ;; syntax, so `#x1.8` is invalid number syntax rather than an identifier.
      (let ([v (%string->int body r)])
        (if v (rd-exactness-apply v x) (quote rd-not-a-number)))))
;;; The CLASSIFIERS run first and the rational-syntax scan only on their failure.  A token
;;; any classifier accepts holds no slash, so asking about rational syntax first cannot
;;; change the answer -- it only puts a redundant digit scan in front of every integer the
;;; compiler reads of its own source.  (Measured: the ordering is worth ~10% of reader
;;; time under the Chez-hosted host and is inside the noise on the self-hosted one, where
;;; per-call overhead dominates a short scan -- PERFORMANCE.md P5.  It is kept for the
;;; argument above rather than for the measurement.)
(define (rd-number t r0)                 ; token text (prefixes included) -> value/reason
  (let ([m (string-length t)])
    (if (and (< 0 m) (= (char->integer (string-ref t 0)) 35))
        ;; PREFIXED.  Only this path scans and allocates, and the token dispatch already
        ;; separated it out, so the ordinary token below pays nothing for it.
        (let ([p (rd-scan-prefixes t m 0 #f #f)])
          (if (not p)
              (quote rd-bad-number)
              (let ([r (if (car p) (car p) r0)] [x (cadr p)] [b (cddr p)])
                (let ([v (rd-body-number (substring t b m) r x)])
                  (if (eq? v (quote rd-not-a-number))
                      ;; a token that CARRIED a prefix and no classifier took is either
                      ;; rational syntax or simply broken; either way it is reported,
                      ;; never interned.
                      (if (rd-rational-body? t m b r)
                          (quote rd-rational)
                          (quote rd-bad-number))
                      v)))))
        (let ([v (rd-body-number t r0 #f)])
          (if (eq? v (quote rd-not-a-number))
              (if (rd-rational-body? t m 0 r0) (quote rd-rational) v)
              v)))))
(define (rd-number-reason? v)
  (or (eq? v (quote rd-rational)) (eq? v (quote rd-bad-number))))

;;; --- case folding, during tokenization (change: reader-token-path, design D1) ---
;;; `include-ci` folds symbol case.  It used to do that by walking the forms the reader
;;; had already RETURNED (library-include-declarations design D6), which cannot be right:
;;; by then `|MixedCase|` and `MixedCase` are the same interned symbol, so the fold hit
;;; both and R7RS 7.1.1 -- the characters between the bars are the name, literally -- was
;;; violated on every bar-quoted identifier (GitHub issue #61).
;;;
;;; So the fold moved HERE, where the bars are still visible.  The mechanism is entirely
;;; negative space: the CI flag is threaded down the descent to rd-atom and is not passed
;;; to `rd-bar`, so a bar-quoted name has nothing to fold it.  It is applied on rd-atom's
;;; SYMBOL arm only, after the token has been classified, so a fold can never reach the
;;; text a number is parsed from.
;;;
;;; ASCII only: the substrate carries no Unicode case tables (there is no char-downcase
;;; in this file).  The Chez driver's door folds with Chez's own `case-sensitive`, which
;;; DOES fold Unicode, so the two hosts agree on ASCII and diverge above it -- a recorded
;;; limit (design D4), pinned by an ASCII fixture rather than by construction.
(define (rd-fold-char c)                 ; ASCII A-Z -> a-z, everything else unchanged
  (let ([k (char->integer c)])
    (if (and (< 64 k) (< k 91)) (integer->char (+ k 32)) c)))
(define (rd-fold-token tok)
  (let ([m (string-length tok)])
    (let loop ([i 0] [acc (quote ())])
      (if (= i m)
          (list->string (reverse acc))
          (loop (+ i 1) (cons (rd-fold-char (string-ref tok i)) acc))))))

(define (rd-atom s n i ci)               ; token -> number, interned symbol, or a report
  (let ([j (rd-token-end s n i)])
    (if (= i j)
        ;; An EMPTY token: the character here is a delimiter no datum arm claimed.  It
        ;; used to intern the empty symbol and return i unchanged, which spun rd-list
        ;; forever; reporting it is what makes `#;` before a closing paren terminate.
        (rd-fail (quote rd-unexpected) i)
        (let ([tok (substring s i j)])
          (let ([v (rd-number tok 10)])
            (cond
              [(eq? v (quote rd-not-a-number))
               (cons (string->symbol (if ci (rd-fold-token tok) tok)) j)]
              [(rd-number-reason? v) (rd-fail v i)]
              [else (cons v j)]))))))

;;; The token a sentinel position points at, so a report can name what it read.
(define (rd-token-at s n p)
  (if (and (<= 0 p) (< p n)) (substring s p (rd-token-end s n (+ p 1))) ""))

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
;; `open` is the index of the opening " -- carried so the report can name where the string
;; STARTED, which is where the missing delimiter belongs (change: reader-input-termination).
(define (rd-string s n i open)           ; i just past opening "; decodes escapes
  (let loop ([i i] [acc (quote ())])
    (if (< i n)
        (let* ([c (string-ref s i)] [k (char->integer c)])
          (cond
            [(= k 34) (cons (list->string (reverse acc)) (+ i 1))]        ; closing "
            [(= k 92)                                                     ; backslash escape
             ;; The escaped character must EXIST.  A source ending in a dangling backslash
             ;; used to read s[n] -- past the end of the input, and silently, because
             ;; indexed access is unchecked (issue #70).  A dangling \xHH needs no arm of
             ;; its own: rd-hex stops at n, so the loop re-enters and ends below.
             (if (<= n (+ i 1))
                 (rd-fail (quote rd-unterminated-string) open)
                 (let ([e (string-ref s (+ i 1))])
                   (if (= (char->integer e) 120)                         ; \xHH;
                       (let ([hx (rd-hex s n (+ i 2) 0)])
                         (loop (cdr hx) (cons (integer->char (car hx)) acc)))
                       (loop (+ i 2) (cons (rd-str-esc e) acc)))))]       ; \n \t \r \\ \"
            [else (loop (+ i 1) (cons c acc))]))
        ;; NOT end of input: closing the string here fabricates a datum the source does not
        ;; contain, so a truncated file compiled as though complete (issue #66).
        (rd-fail (quote rd-unterminated-string) open))))

(define (rd-hash s n i ci)               ; i just past #
  (if (<= n i)
      (rd-fail (quote rd-eof) (- i 1))                     ; a lone trailing #
      (let ([k (char->integer (string-ref s i))])
        (cond
          [(= k 116) (cons #t (+ i 1))]                        ; #t
          [(= k 102) (cons #f (+ i 1))]                        ; #f
          [(= k 92) (rd-char s n i)]                           ; #\<char> or #\<name>
          ;; ci travels INTO a vector literal: a symbol inside #( ... ) is a symbol the
          ;; read produces, and the old shape-walking fold missed it (design D3).
          ;; `(- i 1)` is the `#`, not the `(`: the construct the author opened is `#(`, so
          ;; that is what the unterminated report has to name.
          [(= k 40) (let ([r (rd-list s n (+ i 1) (quote ()) ci (- i 1))])  ; #( -> vector
                      (if (rd-fail? (cdr r)) r (cons (list->vector (car r)) (cdr r))))]
          ;; #; -- DISCARD the next datum and read the one after it (design D1).  It
          ;; cannot be skipped as whitespace: throwing a datum away needs a full
          ;; recursive read, which rd-skip-ws neither does nor is allowed to fail at.
          ;; Stacking (#;#;a b c -> c) falls out of the recursion.
          [(= k 59)
           (let ([r (rd-datum s n (rd-skip-ws s n (+ i 1)) ci)])
             (if (rd-fail? (cdr r)) r (rd-datum s n (rd-skip-ws s n (cdr r)) ci)))]
          [(and (= k 117)                                        ; #u8( ... ) -> bytevector
                (< (+ i 2) n)
                (= (char->integer (string-ref s (+ i 1))) 56)    ; 8
                (= (char->integer (string-ref s (+ i 2))) 40))   ; (
           (let ([r (rd-list s n (+ i 3) (quote ()) ci (- i 1))])   ; open at the #, as above
             (if (rd-fail? (cdr r)) r (cons (list->bytevector (car r)) (cdr r))))]
          ;; Everything else that begins with # is a PREFIXED NUMBER or nothing at all.
          ;; This arm used to fall through to string->symbol, which is what produced
          ;; `unbound variable x1f` for #x1f and `unbound variable |` for a block
          ;; comment (issues #25, #59); a # token that is not a recognized datum is now
          ;; reported, naming itself.
          [else (let ([j (rd-token-end s n i)])
                  (let ([v (rd-number (substring s (- i 1) j) 10)])
                    (if (rd-number-reason? v) (rd-fail v (- i 1)) (cons v j))))]))))

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

;;; R7RS 7.1.1 bar-quoted identifier: | opens a name that runs to the matching |, with
;;; the \| and \xHH; escapes the standard gives it.  The result is an ORDINARY interned
;;; symbol -- R7RS says there is no distinct type, so (eq? '|foo| 'foo) is #t -- which
;;; makes this a new LEXEME, not a new value.  ( `|` is deliberately NOT added to
;;; rd-delim?: only a LEADING bar opens one, so a symbol like `a|b` still reads whole.)
(define (rd-bar s n i p)                 ; i just past the opening |, which was at p
  (let loop ([i i] [acc (quote ())])
    (if (< i n)
        (let ([c (string-ref s i)])
          (let ([k (char->integer c)])
            (cond
              [(= k 124) (cons (string->symbol (list->string (reverse acc))) (+ i 1))]
              [(and (= k 92) (< (+ i 1) n))                       ; backslash escape
               (let ([e (string-ref s (+ i 1))])
                 (if (= (char->integer e) 120)                    ; \xHH;
                     (let ([hx (rd-hex s n (+ i 2) 0)])
                       (loop (cdr hx) (cons (integer->char (car hx)) acc)))
                     (loop (+ i 2) (cons (rd-str-esc e) acc))))]  ; \| \\ and the rest
              [else (loop (+ i 1) (cons c acc))])))
        (rd-fail (quote rd-bar) p))))

(define (rd-quote s n i ci)              ; 'x -> (quote x)
  (let ([r (rd-datum s n (rd-skip-ws s n i) ci)])
    (if (rd-fail? (cdr r)) r (cons (list (quote quote) (car r)) (cdr r)))))

(define (rd-quasi s n i ci)              ; `x -> (quasiquote x)
  (let ([r (rd-datum s n (rd-skip-ws s n i) ci)])
    (if (rd-fail? (cdr r)) r (cons (list (quote quasiquote) (car r)) (cdr r)))))

(define (rd-unquote s n i ci)            ; ,x -> (unquote x); ,@x -> (unquote-splicing x)
  (if (and (< i n) (= (char->integer (string-ref s i)) 64))     ; @  -> splicing
      (let ([r (rd-datum s n (rd-skip-ws s n (+ i 1)) ci)])
        (if (rd-fail? (cdr r))
            r
            (cons (list (quote unquote-splicing) (car r)) (cdr r))))
      (let ([r (rd-datum s n (rd-skip-ws s n i) ci)])
        (if (rd-fail? (cdr r)) r (cons (list (quote unquote) (car r)) (cdr r))))))

(define (rd-dot? s n j)                  ; a standalone `.` token at j (dotted-pair marker)
  (and (= (char->integer (string-ref s j)) 46)      ; .
       (= (rd-token-end s n (+ j 1)) (+ j 1))))      ; next char is a delimiter -> lone .
(define (rd-append-reverse acc tail)     ; (reverse acc) terminated by tail (improper list)
  (if (null? acc) tail (rd-append-reverse (cdr acc) (cons (car acc) tail))))
(define (rd-datum-comment? s n i)        ; "#;" begins at i
  (and (= (char->integer (string-ref s i)) 35)
       (< (+ i 1) n)
       (= (char->integer (string-ref s (+ i 1))) 59)))
;; `open` is the index of the construct's FIRST character -- the `(` or `[`, and for a vector
;; or bytevector the `#`, so the report can name `#(` / `#u8(` rather than a bare paren.
;;
;; It travels DOWN rather than being attached by the caller on the way out, because rd-list
;; recurses per element: the INNER unterminated construct is the one whose delimiter is
;; missing, and a position attached on the way out would be overwritten by every enclosing
;; list (change: reader-input-termination, design D1).
;;
;; NOTE the divergence from `fc-list` (src/repl-core.ss), which answers `fc-incomplete` for
;; the same text.  That is deliberate and directional, not a duplication to be unified: a
;; host reading a stream can supply another line, a source file cannot.  Unifying the two
;; would destroy multi-line entry at the prompt.
(define (rd-list s n i acc ci open)      ; i after (; read until ) (supports . tail)
  (let ([j (rd-skip-ws s n i)])
    (cond
      [(rd-fail? j) (cons (quote rd-block-comment) j)]
      [(< j n)
       (cond
         [(let ([c (char->integer (string-ref s j))]) (or (= c 41) (= c 93)))
          (cons (reverse acc) (+ j 1))]                                            ; ) or ]
         ;; #; between elements -- including immediately before the closing paren,
         ;; where there is no following element for rd-datum's arm to return.
         [(rd-datum-comment? s n j)
          (let ([r (rd-datum s n (rd-skip-ws s n (+ j 2)) ci)])
            (if (rd-fail? (cdr r)) r (rd-list s n (cdr r) acc ci open)))]
         [(rd-dot? s n j)                                                          ; . tail
          (let ([r (rd-datum s n (rd-skip-ws s n (+ j 1)) ci)])
            (if (rd-fail? (cdr r))
                r
                (let ([j2 (rd-skip-ws s n (cdr r))])
                  (cond
                    [(rd-fail? j2) (cons (quote rd-block-comment) j2)]
                    ;; the close paren this arm steps past must actually BE there
                    [(<= n j2) (rd-fail (quote rd-unterminated-list) open)]
                    [else (cons (rd-append-reverse acc (car r)) (+ j2 1))]))))]     ; past )
         [else (let ([r (rd-datum s n j ci)])
                 (if (rd-fail? (cdr r))
                     r
                     (rd-list s n (cdr r) (cons (car r) acc) ci open)))])]
      ;; NOT end of input: closing the list here fabricates a datum the source does not
      ;; contain, so a truncated file compiled as though complete (issue #66).
      [else (rd-fail (quote rd-unterminated-list) open)])))

(define (rd-datum s n i ci)              ; i at a non-ws char -> (datum . next)
  (if (and (<= 0 i) (< i n))
      (let ([k (char->integer (string-ref s i))])
        (cond
          [(= k 40) (rd-list s n (+ i 1) (quote ()) ci i)]     ; (
          [(= k 91) (rd-list s n (+ i 1) (quote ()) ci i)]     ; [ (brackets = parens)
          [(= k 39) (rd-quote s n (+ i 1) ci)]                 ; '
          [(= k 96) (rd-quasi s n (+ i 1) ci)]                 ; `
          [(= k 44) (rd-unquote s n (+ i 1) ci)]               ; ,
          [(= k 34) (rd-string s n (+ i 1) i)]                 ; "
          [(= k 35) (rd-hash s n (+ i 1) ci)]                  ; #
          ;; NOT given ci: R7RS 7.1.1 makes the characters between the bars the symbol's
          ;; name literally, so a bar-quoted identifier is never folded (issue #61).
          [(= k 124) (rd-bar s n (+ i 1) i)]                   ; |bar quoted identifier|
          [(or (= k 41) (= k 93)) (rd-fail (quote rd-unexpected) i)]   ; a close with no open
          [else (rd-atom s n i ci)]))
      ;; A sentinel travelling outward (an unterminated block comment upstream), or a
      ;; datum the input ended before -- `#;` with nothing after it, say.  Neither is
      ;; raised here (design D2); the entry point reports.
      (if (< i 0) (cons (quote rd-block-comment) i) (rd-fail (quote rd-eof) i))))

;;; --- where the reader's reports become errors (design D2) -------------------
;;; The lexeme layer answers a sentinel because it cannot raise; here `error` is in
;;; scope, so here is where the sentinel is turned into a diagnostic.  The position it
;;; carries is what lets the message name both WHERE and, by re-reading the token at
;;; that position, WHAT.  (`read` in (scheme read) needs this too and cannot import a
;;; private name, so it keeps its own copy -- the arrangement %check-input-port already
;;; has, for the same reason: this is the reader code that raises.)
(define (rd-report s n r)
  (let ([why (car r)] [p (rd-fail-pos (cdr r))])
    (cond
      [(eq? why (quote rd-block-comment))
       (error (quote read) "unterminated block comment #| opened at index" p)]
      [(eq? why (quote rd-bar))
       (error (quote read) "unterminated |identifier| opened at index" p)]
      ;; ONE reason covers (, [, #( and #u8(: the source at p still says which delimiter it
      ;; was, so the message names the construct the author actually opened without four
      ;; reasons carrying identical handling.  Decoded INLINE rather than through a helper
      ;; because rd-report is duplicated into (scheme read) -- a helper would have to join
      ;; *reader-report-shared-with-read* (src/prelude-surface.scm) to travel with it.
      [(eq? why (quote rd-unterminated-list))
       (error (quote read)
              (string-append
               "unterminated "
               (let ([k (char->integer (string-ref s p))])
                 (cond
                   [(= k 91) "list ["]
                   [(and (= k 35) (< (+ p 1) n)
                         (= (char->integer (string-ref s (+ p 1))) 117))   ; #u8(
                    "bytevector #u8("]
                   [(= k 35) "vector #("]
                   [else "list ("]))
               " opened at index")
              p)]
      [(eq? why (quote rd-unterminated-string))
       (error (quote read) "unterminated string \" opened at index" p)]
      [(eq? why (quote rd-eof))
       (error (quote read) "end of input where a datum was expected, at index" p)]
      [(eq? why (quote rd-unexpected))
       (error (quote read) "no datum here, at index" p)]
      [(eq? why (quote rd-rational))
       (error (quote read)
              (string-append "rational literal syntax is not supported -- Emit has no "
                             "exact rationals; write 0.5, or (/ 1 2)")
              (rd-token-at s n p))]
      [else (error (quote read) "unrecognized syntax" (rd-token-at s n p))])))

(define (read-from-string s)
  (let ([n (string-length s)])
    (let ([r (rd-datum s n (rd-skip-ws s n 0) #f)])
      (if (rd-fail? (cdr r)) (rd-report s n r) (car r)))))

;;; --- whole-program read (stdin-source-reader) -----------------------------
;;; Loop the single-datum reader across the whole source: skip inter-form
;;; whitespace/; comments, read a datum, continue from the next position, and
;;; stop at end of input.  Returns the top-level forms in source order (the empty
;;; list for empty or whitespace/comment-only input).  This is what a self-hosted
;;; core uses to turn its input text into the form list it compiles.
;;; TWO entry points over ONE worker, rather than one entry point with an optional
;;; argument (change: reader-token-path, design D1/D2).  An optional argument would cost
;;; every call site its cross-unit direct call (PERFORMANCE.md P9), and the ordinary read
;;; is the compiler's own hot path -- making every read pay for the rare folding one is
;;; backwards.  `-ci` is R7RS's spelling for case-insensitivity (string-ci=?, char-ci=?,
;;; and `include-ci`, which is what this exists for).
(define (read-all-from-string s) (rd-all s #f))
(define (read-all-from-string-ci s) (rd-all s #t))

(define (rd-all s ci)
  (let ([n (string-length s)])
    (let loop ([i (rd-skip-ws s n 0)] [acc (quote ())])
      (cond
        ;; NOT end of input: an unterminated block comment here used to make every form
        ;; after the opening delimiter vanish with no diagnostic (issue #59).
        [(rd-fail? i) (rd-report s n (cons (quote rd-block-comment) i))]
        [(< i n)
         (let ([r (rd-datum s n i ci)])
           (if (rd-fail? (cdr r))
               (rd-report s n r)
               (loop (rd-skip-ws s n (cdr r)) (cons (car r) acc))))]
        [else (reverse acc)]))))

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
    (cond
      ((rd-fail? i) (rd-report s n (cons 'rd-block-comment i)))
      ((>= i n) (%record-set! p 3 n) (eof-object))
      ;; No folding over a port: `include-ci` is the only folding consumer and it reads
      ;; whole source text, not a port (design D3).
      (else (let ((r (rd-datum s n i #f)))
              (if (rd-fail? (cdr r))
                  (rd-report s n r)
                  (begin (%record-set! p 3 (cdr r)) (car r))))))))

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
