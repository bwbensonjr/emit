;;; base.sld -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss
;;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in
;;; src/prelude-surface.scm) and regenerate; guarded by
;;; test/scheme-base-gen-check.sh.
;;;
;;; One member of the prelude's partition: the definitions the declaration
;;; homes here, exporting the declared public ones.  Private helpers and the
;;; derived-form macros stay in the body, where the exported procedures still
;;; call them.  One export per line, so a surface change is a reviewable
;;; one-line diff.
(define-library (scheme base)
  (import (emit internal))
  (export
    and
    or
    when
    unless
    let*
    cond
    case
    do
    list
    caar
    cadr
    cdar
    cddr
    length
    reverse
    append
    map
    memq
    memv
    assq
    member
    assoc
    filter
    fold-left
    fold-right
    for-each
    andmap
    memp
    list?
    zero?
    list-tail
    list-ref
    list-set!
    list-head
    make-list
    iota
    max
    min
    complex?
    exact-integer?
    rational?
    positive?
    negative?
    even?
    odd?
    abs
    square
    gcd
    lcm
    expt
    exact-integer-sqrt
    floor
    ceiling
    truncate
    round
    truncate-quotient
    truncate-remainder
    floor-remainder
    floor-quotient
    truncate/
    floor/
    numerator
    denominator
    inexact
    exact
    void
    string
    char=?
    char<?
    char>?
    char<=?
    char>=?
    string->list
    number->string
    string->number
    error
    dynamic-wind
    call-with-current-continuation
    call/cc
    with-exception-handler
    raise
    error-object?
    error-object-message
    error-object-irritants
    guard
    make-parameter
    with-parameters
    parameterize
    list->vector
    vector
    list->bytevector
    bytevector
    assv
    list-copy
    boolean=?
    symbol=?
    string<?
    string>?
    string<=?
    string>=?
    vector->list
    vector-copy
    vector-append
    vector-fill!
    vector-copy!
    vector-map
    vector-for-each
    string->vector
    vector->string
    string-map
    string-for-each
    string-fill!
    string-copy!
    bytevector-copy
    bytevector-copy!
    bytevector-append
    rationalize
    values
    call-with-values
    make-hash-table
    hash-table?
    hash-table-ref/default
    hash-table-contains?
    hash-table-ref
    hash-table-set!
    hash-table-delete!
    hash-table-size
    hash-table->alist
    hash-table-keys
    hash-table-values
    read-from-string
    read-all-from-string
    read-all-from-string-ci
    port?
    input-port?
    output-port?
    textual-port?
    port-closed?
    input-port-open?
    output-port-open?
    open-input-string
    read-char
    peek-char
    read-line
    read-string
    open-output-string
    get-output-string
    flush-output-port
    close-port
    close-input-port
    close-output-port
    current-output-port
    current-error-port
    current-input-port
    call-with-port
    )
  (begin
    (define-syntax case (syntax-rules (else) ((_ (key ...) clause ...) (let ((k (key ...))) (case k clause ...))) ((_ k) (if #f #f)) ((_ k (else e ...)) (begin e ...)) ((_ k ((d ...) e ...) clause ...) (if (memv k (quote (d ...))) (begin e ...) (case k clause ...)))))
    (define-syntax %do-step (syntax-rules () ((_ x) x) ((_ x s) s)))
    (define-syntax do (syntax-rules () ((_ ((var init step ...) ...) (test result ...) command ...) (letrec ((loop (lambda (var ...) (if test (begin (if #f #f) result ...) (begin command ... (loop (%do-step var step ...) ...)))))) (loop init ...)))))
    (define (list . xs) xs)
    (define (caar x) (car (car x)))
    (define (cadr x) (car (cdr x)))
    (define (cdar x) (cdr (car x)))
    (define (cddr x) (cdr (cdr x)))
    (define (length xs) (let loop ((xs xs) (n 0)) (if (null? xs) n (loop (cdr xs) (+ n 1)))))
    (define (reverse xs) (let loop ((xs xs) (acc (quote ()))) (if (null? xs) acc (loop (cdr xs) (cons (car xs) acc)))))
    (define (%append2 a b) (if (null? a) b (cons (car a) (%append2 (cdr a) b))))
    (define (append . lists) (if (null? lists) (quote ()) (if (null? (cdr lists)) (car lists) (%append2 (car lists) (apply append (cdr lists))))))
    (define (%map1 f xs) (if (null? xs) (quote ()) (cons (f (car xs)) (%map1 f (cdr xs)))))
    (define (%any-null? ls) (if (null? ls) #f (if (null? (car ls)) #t (%any-null? (cdr ls)))))
    (define (%mapn f ls) (if (%any-null? ls) (quote ()) (cons (apply f (%map1 car ls)) (%mapn f (%map1 cdr ls)))))
    (define (map f xs . more) (if (null? more) (%map1 f xs) (%mapn f (cons xs more))))
    (define (memq x xs) (if (null? xs) #f (if (eq? x (car xs)) xs (memq x (cdr xs)))))
    (define (memv x xs) (if (null? xs) #f (if (eqv? x (car xs)) xs (memv x (cdr xs)))))
    (define (assq k xs) (if (null? xs) #f (if (eq? k (car (car xs))) (car xs) (assq k (cdr xs)))))
    (define (member x xs . rest) (if (null? rest) (if (null? xs) #f (if (equal? x (car xs)) xs (member x (cdr xs)))) (member-by x xs (car rest))))
    (define (member-by x xs same?) (if (null? xs) #f (if (same? x (car xs)) xs (member-by x (cdr xs) same?))))
    (define (assoc k xs . rest) (if (null? rest) (if (null? xs) #f (if (equal? k (car (car xs))) (car xs) (assoc k (cdr xs)))) (assoc-by k xs (car rest))))
    (define (assoc-by k xs same?) (if (null? xs) #f (if (same? k (car (car xs))) (car xs) (assoc-by k (cdr xs) same?))))
    (define (filter p xs) (if (null? xs) (quote ()) (if (p (car xs)) (cons (car xs) (filter p (cdr xs))) (filter p (cdr xs)))))
    (define (fold-left f acc xs) (if (null? xs) acc (fold-left f (f acc (car xs)) (cdr xs))))
    (define (fold-right f acc xs) (if (null? xs) acc (f (car xs) (fold-right f acc (cdr xs)))))
    (define (%for-each1 f xs) (if (null? xs) (if #f #f) (begin (f (car xs)) (%for-each1 f (cdr xs)))))
    (define (%for-eachn f ls) (if (%any-null? ls) (if #f #f) (begin (apply f (%map1 car ls)) (%for-eachn f (%map1 cdr ls)))))
    (define (for-each f xs . more) (if (null? more) (%for-each1 f xs) (%for-eachn f (cons xs more))))
    (define (andmap p xs) (if (null? xs) #t (if (p (car xs)) (andmap p (cdr xs)) #f)))
    (define (memp p xs) (if (null? xs) #f (if (p (car xs)) xs (memp p (cdr xs)))))
    (define (list? x) (if (null? x) #t (if (pair? x) (list? (cdr x)) #f)))
    (define (zero? n) (= n 0))
    (define (list-tail xs n) (if (zero? n) xs (list-tail (cdr xs) (- n 1))))
    (define (list-ref xs n) (car (list-tail xs n)))
    (define (list-set! xs n obj) (set-car! (list-tail xs n) obj))
    (define (list-head xs n) (if (zero? n) (quote ()) (cons (car xs) (list-head (cdr xs) (- n 1)))))
    (define (make-list n x) (if (zero? n) (quote ()) (cons x (make-list (- n 1) x))))
    (define (iota n) (let loop ((i 0) (acc (quote ()))) (if (= i n) (reverse acc) (loop (+ i 1) (cons i acc)))))
    (define (%minmax-fold pick xs best inex) (if (null? xs) (if inex (exact->inexact best) best) (%minmax-fold pick (cdr xs) (pick best (car xs)) (if inex #t (inexact? (car xs))))))
    (define (%minmax pick a rest) (%minmax-fold pick rest a (inexact? a)))
    (define (max a . rest) (%minmax (lambda (x y) (if (< x y) y x)) a rest))
    (define (min a . rest) (%minmax (lambda (x y) (if (< y x) y x)) a rest))
    (define (complex? n) (number? n))
    (define (exact-integer? n) (if (exact? n) (integer? n) #f))
    (define (rational? n) (if (number? n) (%finite? n) #f))
    (define (positive? n) (< 0 n))
    (define (negative? n) (< n 0))
    (define (even? n) (= 0 (remainder n 2)))
    (define (odd? n) (if (= 0 (remainder n 2)) #f #t))
    (define (abs n) (if (< n 0) (- 0 n) n))
    (define (square n) (* n n))
    (define (%gcd2 a b) (if (= b 0) a (%gcd2 b (remainder a b))))
    (define (%gcd-fold ns acc) (if (null? ns) acc (%gcd-fold (cdr ns) (%gcd2 (abs (car ns)) (abs acc)))))
    (define (%lcm-fold ns acc) (if (null? ns) acc (let ((a (abs (car ns)))) (if (= a 0) 0 (%lcm-fold (cdr ns) (quotient (* acc a) (%gcd2 acc a)))))))
    (define (gcd . ns) (%gcd-fold ns 0))
    (define (lcm . ns) (%lcm-fold ns 1))
    (define (%expt-exact b e acc) (if (= e 0) acc (%expt-exact (* b b) (quotient e 2) (if (odd? e) (* acc b) acc))))
    (define (expt b e) (if (exact? e) (if (< e 0) (%pow b e) (if (exact? b) (%expt-exact b e 1) (%expt-exact b e 1.0))) (%pow b e)))
    (define (%isqrt-loop n g) (let ((g2 (quotient (+ g (quotient n g)) 2))) (if (< g2 g) (%isqrt-loop n g2) g)))
    (define (%isqrt n) (if (= n 0) 0 (%isqrt-loop n n)))
    (define (exact-integer-sqrt n) (let ((s (%isqrt n))) (values s (- n (* s s)))))
    (define (floor n) (if (exact? n) n (%flo-floor n)))
    (define (ceiling n) (if (exact? n) n (%flo-ceiling n)))
    (define (truncate n) (if (exact? n) n (%flo-truncate n)))
    (define (round n) (if (exact? n) n (%flo-round n)))
    (define (truncate-quotient n d) (quotient n d))
    (define (truncate-remainder n d) (remainder n d))
    (define (floor-remainder n d) (modulo n d))
    (define (floor-quotient n d) (quotient (- n (modulo n d)) d))
    (define (truncate/ n d) (values (quotient n d) (remainder n d)))
    (define (floor/ n d) (values (floor-quotient n d) (modulo n d)))
    (define (numerator n) (if (integer? n) n (error "numerator: not an integer" n)))
    (define (denominator n) (if (integer? n) (if (exact? n) 1 1.0) (error "denominator: not an integer" n)))
    (define (inexact n) (exact->inexact n))
    (define (exact n) (inexact->exact n))
    (define (void) (if #f #f))
    (define (string . cs) (list->string cs))
    (define (%str-concat xs) (if (null? xs) "" (string-append (car xs) (%str-concat (cdr xs)))))
    (define (chr-cmp op a b rest) (if (op (char->integer a) (char->integer b)) (if (null? rest) #t (chr-cmp op b (car rest) (cdr rest))) #f))
    (define (char=? a b . rest) (chr-cmp (lambda (x y) (= x y)) a b rest))
    (define (char<? a b . rest) (chr-cmp (lambda (x y) (< x y)) a b rest))
    (define (char>? a b . rest) (chr-cmp (lambda (x y) (> x y)) a b rest))
    (define (char<=? a b . rest) (chr-cmp (lambda (x y) (<= x y)) a b rest))
    (define (char>=? a b . rest) (chr-cmp (lambda (x y) (>= x y)) a b rest))
    (define (string->list s . rest) (let* ((len (string-length s)) (a (rng-start rest)) (e (rng-end rest len))) (rng-check (quote string->list) a e len) (let loop ((i (- e 1)) (acc (quote ()))) (if (< i a) acc (loop (- i 1) (cons (string-ref s i) acc))))))
    (define (ns-digits m acc) (ns-digits-radix m 10 acc))
    (define (%ns-digit-char d) (if (< d 10) (integer->char (+ 48 d)) (integer->char (+ 87 d))))
    (define (ns-digits-radix m r acc) (let ((ch (%ns-digit-char (- 0 (remainder m r)))) (rest (quotient m r))) (if (= rest 0) (cons ch acc) (ns-digits-radix rest r (cons ch acc)))))
    (define (%radix-ok? r) (if (= r 10) #t (if (= r 16) #t (if (= r 8) #t (= r 2)))))
    (define (number->string n . rest) (let ((r (if (null? rest) 10 (car rest)))) (if (%radix-ok? r) (if (exact? n) (cond ((= n 0) "0") ((< n 0) (list->string (cons #\- (ns-digits-radix n r (quote ()))))) (else (list->string (ns-digits-radix (- 0 n) r (quote ()))))) (if (= r 10) (%flonum->string n) (error "number->string: radix must be 10 for an inexact number" r))) (error "number->string: unsupported radix" r))))
    (define (string->number s . rest) (let ((r (if (null? rest) 10 (car rest)))) (if (%radix-ok? r) (let ((v (rd-number s r))) (if (symbol? v) #f v)) (error "string->number: unsupported radix" r))))
    (define (error a . rest) (if (string? a) (raise (%make-error-object a rest)) (raise (%make-error-object (string-append (symbol->string a) (string-append ": " (car rest))) (cdr rest)))))
    (define *winds* (quote ()))
    (define *handlers* (quote ()))
    (define (%unwind-to target) (if (eq? *winds* target) #t (if (null? *winds*) #t (let ((entry (car *winds*))) (set! *winds* (cdr *winds*)) ((cdr entry)) (%unwind-to target)))))
    (define (dynamic-wind before thunk after) (before) (set! *winds* (cons (cons before after) *winds*)) (let ((r (thunk))) (set! *winds* (cdr *winds*)) (after) r))
    (define (call-with-current-continuation f) (let ((saved-winds *winds*)) (cdr (%run-guarded (lambda () (let ((id (%escape-frame))) (f (lambda (v) (if (%escape-live? id) (begin (%unwind-to saved-winds) (%escape-to id v)) #f) (error (quote call/cc) "continuation invoked outside its extent")))))))))
    (define (call/cc f) (call-with-current-continuation f))
    (define (with-exception-handler handler thunk) (let ((saved *handlers*)) (dynamic-wind (lambda () (set! *handlers* (cons handler saved))) thunk (lambda () (set! *handlers* saved)))))
    (define (raise obj) (if (null? *handlers*) (%raise obj) (let ((h (car *handlers*)) (saved *handlers*)) (set! *handlers* (cdr *handlers*)) (h obj) (set! *handlers* saved) (%raise obj))))
    (define (error-object? x) (%error-object? x))
    (define (error-object-message x) (%error-object-message x))
    (define (error-object-irritants x) (%error-object-irritants x))
    (define-syntax guard (syntax-rules () ((_ (var clause ...) body ...) (let ((%gres (call-with-current-continuation (lambda (%gk) (with-exception-handler (lambda (%gobj) (%gk (cons #t %gobj))) (lambda () (cons #f (begin body ...)))))))) (if (car %gres) (let ((var (cdr %gres))) (%guard-clauses var clause ...)) (cdr %gres))))))
    (define-syntax %guard-clauses (syntax-rules (else =>) ((_ v) (raise v)) ((_ v (else e ...)) (begin e ...)) ((_ v (test => proc) rest ...) (let ((gt test)) (if gt (proc gt) (%guard-clauses v rest ...)))) ((_ v (test) rest ...) (let ((gt test)) (if gt gt (%guard-clauses v rest ...)))) ((_ v (test e ...) rest ...) (if test (begin e ...) (%guard-clauses v rest ...)))))
    (define (make-parameter init . conv) (let ((convert (if (null? conv) (lambda (x) x) (car conv))) (cell (%make-vector 1 0))) (%vector-set! cell 0 ((if (null? conv) (lambda (x) x) (car conv)) init)) (lambda args (if (null? args) (%vector-ref cell 0) (if (null? (cdr args)) (%vector-set! cell 0 (convert (car args))) (%vector-set! cell 0 (car args)))))))
    (define (with-parameters params vals thunk) (let ((olds (map (lambda (p) (p)) params))) (dynamic-wind (lambda () (for-each (lambda (p v) (p v)) params vals)) thunk (lambda () (for-each (lambda (p v) (p v #f)) params olds)))))
    (define-syntax parameterize (syntax-rules () ((_ ((p v) ...) body ...) (with-parameters (list p ...) (list v ...) (lambda () body ...)))))
    (define (list->vector xs) (let ((v (make-vector (length xs) 0))) (let loop ((xs xs) (i 0)) (if (null? xs) v (begin (vector-set! v i (car xs)) (loop (cdr xs) (+ i 1)))))))
    (define (vector . xs) (list->vector xs))
    (define (list->bytevector bs) (let ((bv (make-bytevector (length bs) 0))) (let loop ((bs bs) (i 0)) (if (null? bs) bv (begin (bytevector-u8-set! bv i (car bs)) (loop (cdr bs) (+ i 1)))))))
    (define (bytevector . bs) (list->bytevector bs))
    (define (rng-start rest) (if (pair? rest) (car rest) 0))
    (define (rng-end rest len) (if (and (pair? rest) (pair? (cdr rest))) (car (cdr rest)) len))
    (define (rng-check who s e len) (if (and (<= 0 s) (<= s e) (<= e len)) #t (error "range out of bounds" who s e len)))
    (define (assv key al) (if (null? al) #f (if (eqv? key (car (car al))) (car al) (assv key (cdr al)))))
    (define (list-copy obj) (if (pair? obj) (cons (car obj) (list-copy (cdr obj))) obj))
    (define (boolean=? a b . rest) (eqv-chain? a (cons b rest)))
    (define (symbol=? a b . rest) (eqv-chain? a (cons b rest)))
    (define (eqv-chain? a rest) (if (null? rest) #t (if (eqv? a (car rest)) (eqv-chain? (car rest) (cdr rest)) #f)))
    (define (str-cmp a b) (let ((la (string-length a)) (lb (string-length b))) (let loop ((i 0)) (cond ((and (= i la) (= i lb)) 0) ((= i la) -1) ((= i lb) 1) (else (let ((ca (char->integer (string-ref a i))) (cb (char->integer (string-ref b i)))) (cond ((< ca cb) -1) ((< cb ca) 1) (else (loop (+ i 1))))))))))
    (define (str-chain? ok? a rest) (if (null? rest) #t (if (ok? a (car rest)) (str-chain? ok? (car rest) (cdr rest)) #f)))
    (define (string<? a b . rest) (str-chain? (lambda (x y) (< (str-cmp x y) 0)) a (cons b rest)))
    (define (string>? a b . rest) (str-chain? (lambda (x y) (< 0 (str-cmp x y))) a (cons b rest)))
    (define (string<=? a b . rest) (str-chain? (lambda (x y) (not (< 0 (str-cmp x y)))) a (cons b rest)))
    (define (string>=? a b . rest) (str-chain? (lambda (x y) (not (< (str-cmp x y) 0))) a (cons b rest)))
    (define (vector->list v . rest) (let* ((len (vector-length v)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote vector->list) s e len) (let loop ((i (- e 1)) (acc (quote ()))) (if (< i s) acc (loop (- i 1) (cons (vector-ref v i) acc))))))
    (define (vector-copy v . rest) (let* ((len (vector-length v)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote vector-copy) s e len) (let ((out (make-vector (- e s) 0))) (let loop ((i s)) (if (= i e) out (begin (vector-set! out (- i s) (vector-ref v i)) (loop (+ i 1))))))))
    (define (vector-append . vs) (let ((out (make-vector (vec-total vs) 0))) (let loop ((vs vs) (at 0)) (if (null? vs) out (let* ((v (car vs)) (n (vector-length v))) (let inner ((i 0)) (if (= i n) (loop (cdr vs) (+ at n)) (begin (vector-set! out (+ at i) (vector-ref v i)) (inner (+ i 1))))))))))
    (define (vec-total vs) (if (null? vs) 0 (+ (vector-length (car vs)) (vec-total (cdr vs)))))
    (define (vector-fill! v fill . rest) (let* ((len (vector-length v)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote vector-fill!) s e len) (let loop ((i s)) (if (= i e) (void) (begin (vector-set! v i fill) (loop (+ i 1)))))))
    (define (vector-copy! to at from . rest) (let* ((len (vector-length from)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote vector-copy!) s e len) (rng-check (quote vector-copy!) at (+ at (- e s)) (vector-length to)) (if (< s at) (let loop ((k (- (- e s) 1))) (if (< k 0) (void) (begin (vector-set! to (+ at k) (vector-ref from (+ s k))) (loop (- k 1))))) (let loop ((k 0)) (if (= k (- e s)) (void) (begin (vector-set! to (+ at k) (vector-ref from (+ s k))) (loop (+ k 1))))))))
    (define (vector-map f v . vs) (if (null? vs) (let* ((n (vector-length v)) (out (make-vector n 0))) (let loop ((i 0)) (if (= i n) out (begin (vector-set! out i (f (vector-ref v i))) (loop (+ i 1)))))) (let* ((all (cons v vs)) (n (vec-min-len all)) (out (make-vector n 0))) (let loop ((i 0)) (if (= i n) out (begin (vector-set! out i (apply f (vec-nth all i))) (loop (+ i 1))))))))
    (define (vector-for-each f v . vs) (if (null? vs) (let ((n (vector-length v))) (let loop ((i 0)) (if (= i n) (void) (begin (f (vector-ref v i)) (loop (+ i 1)))))) (let* ((all (cons v vs)) (n (vec-min-len all))) (let loop ((i 0)) (if (= i n) (void) (begin (apply f (vec-nth all i)) (loop (+ i 1))))))))
    (define (vec-min-len vs) (if (null? (cdr vs)) (vector-length (car vs)) (let ((a (vector-length (car vs))) (b (vec-min-len (cdr vs)))) (if (< a b) a b))))
    (define (vec-nth vs i) (if (null? vs) (quote ()) (cons (vector-ref (car vs) i) (vec-nth (cdr vs) i))))
    (define (string->vector s . rest) (let* ((len (string-length s)) (a (rng-start rest)) (e (rng-end rest len))) (rng-check (quote string->vector) a e len) (let ((out (make-vector (- e a) 0))) (let loop ((i a)) (if (= i e) out (begin (vector-set! out (- i a) (string-ref s i)) (loop (+ i 1))))))))
    (define (vector->string v . rest) (let* ((len (vector-length v)) (a (rng-start rest)) (e (rng-end rest len))) (rng-check (quote vector->string) a e len) (list->string (vector->list v a e))))
    (define (string-map f s . ss) (if (null? ss) (list->string (str-map1 f (string->list s))) (list->string (str-mapn f (cons s ss)))))
    (define (str-map1 f cs) (if (null? cs) (quote ()) (cons (f (car cs)) (str-map1 f (cdr cs)))))
    (define (str-mapn f ss) (let ((n (str-min-len ss))) (let loop ((i 0)) (if (= i n) (quote ()) (cons (apply f (str-nth ss i)) (loop (+ i 1)))))))
    (define (string-for-each f s . ss) (if (null? ss) (let ((n (string-length s))) (let loop ((i 0)) (if (= i n) (void) (begin (f (string-ref s i)) (loop (+ i 1)))))) (let* ((all (cons s ss)) (n (str-min-len all))) (let loop ((i 0)) (if (= i n) (void) (begin (apply f (str-nth all i)) (loop (+ i 1))))))))
    (define (str-min-len ss) (if (null? (cdr ss)) (string-length (car ss)) (let ((a (string-length (car ss))) (b (str-min-len (cdr ss)))) (if (< a b) a b))))
    (define (str-nth ss i) (if (null? ss) (quote ()) (cons (string-ref (car ss) i) (str-nth (cdr ss) i))))
    (define (string-fill! s fill . rest) (let* ((len (string-length s)) (a (rng-start rest)) (e (rng-end rest len))) (rng-check (quote string-fill!) a e len) (let loop ((i a)) (if (= i e) (void) (begin (string-set! s i fill) (loop (+ i 1)))))))
    (define (string-copy! to at from . rest) (let* ((len (string-length from)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote string-copy!) s e len) (rng-check (quote string-copy!) at (+ at (- e s)) (string-length to)) (if (< s at) (let loop ((k (- (- e s) 1))) (if (< k 0) (void) (begin (string-set! to (+ at k) (string-ref from (+ s k))) (loop (- k 1))))) (let loop ((k 0)) (if (= k (- e s)) (void) (begin (string-set! to (+ at k) (string-ref from (+ s k))) (loop (+ k 1))))))))
    (define (bytevector-copy bv . rest) (let* ((len (bytevector-length bv)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote bytevector-copy) s e len) (let ((out (make-bytevector (- e s) 0))) (let loop ((i s)) (if (= i e) out (begin (bytevector-u8-set! out (- i s) (bytevector-u8-ref bv i)) (loop (+ i 1))))))))
    (define (bytevector-copy! to at from . rest) (let* ((len (bytevector-length from)) (s (rng-start rest)) (e (rng-end rest len))) (rng-check (quote bytevector-copy!) s e len) (rng-check (quote bytevector-copy!) at (+ at (- e s)) (bytevector-length to)) (if (< s at) (let loop ((k (- (- e s) 1))) (if (< k 0) (void) (begin (bytevector-u8-set! to (+ at k) (bytevector-u8-ref from (+ s k))) (loop (- k 1))))) (let loop ((k 0)) (if (= k (- e s)) (void) (begin (bytevector-u8-set! to (+ at k) (bytevector-u8-ref from (+ s k))) (loop (+ k 1))))))))
    (define (bytevector-append . bvs) (let ((out (make-bytevector (bv-total bvs) 0))) (let loop ((bvs bvs) (at 0)) (if (null? bvs) out (let* ((bv (car bvs)) (n (bytevector-length bv))) (let inner ((i 0)) (if (= i n) (loop (cdr bvs) (+ at n)) (begin (bytevector-u8-set! out (+ at i) (bytevector-u8-ref bv i)) (inner (+ i 1))))))))))
    (define (bv-total bvs) (if (null? bvs) 0 (+ (bytevector-length (car bvs)) (bv-total (cdr bvs)))))
    (define rat-max-denom 1000000)
    (define (rationalize x y) (let ((lo (- x (abs y))) (hi (+ x (abs y)))) (if (and (exact? x) (exact? y)) (rat-exact lo hi) (rat-inexact (exact->inexact lo) (exact->inexact hi)))))
    (define (rat-exact lo hi) (cond ((and (<= lo 0) (<= 0 hi)) 0) ((< 0 lo) (if (<= (rat-ceil lo) hi) (rat-ceil lo) (error "rationalize: no exact rational in range (Emit has no exact rationals)" lo hi))) (else (if (<= lo (rat-floor hi)) (rat-floor hi) (error "rationalize: no exact rational in range (Emit has no exact rationals)" lo hi)))))
    (define (rat-ceil x) x)
    (define (rat-floor x) x)
    (define (rat-inexact lo hi) (if (and (<= lo 0.0) (<= 0.0 hi)) 0.0 (let loop ((d 1)) (if (< rat-max-denom d) (error "rationalize: no rational found within the denominator limit" lo hi) (let ((n (rat-num-in (* lo d) (* hi d)))) (if n (/ (exact->inexact n) (exact->inexact d)) (loop (+ d 1))))))))
    (define (rat-num-in a b) (let ((c (rat-ceil-flo a))) (if (<= (exact->inexact c) b) c #f)))
    (define (rat-ceil-flo x) (let ((f (inexact->exact (floor x)))) (if (< (exact->inexact f) x) (+ f 1) f)))
    (define (values . vs) (if (and (pair? vs) (null? (cdr vs))) (car vs) (%list->mv vs)))
    (define (call-with-values producer consumer) (let ((r (producer))) (if (%mv? r) (apply consumer (%mv->list r)) (consumer r))))
    (define %ht-initial-buckets 8)
    (define %ht-load-factor 3)
    (define (make-hash-table) (%make-hash-table (vector 0 (make-vector %ht-initial-buckets (quote ())) #f)))
    (define (hash-table? x) (%hash-table? x))
    (define (%ht-count ht) (vector-ref (%hash-table-spine ht) 0))
    (define (%ht-buckets ht) (vector-ref (%hash-table-spine ht) 1))
    (define (%ht-set-count! ht n) (vector-set! (%hash-table-spine ht) 0 n))
    (define (%ht-set-buckets! ht b) (vector-set! (%hash-table-spine ht) 1 b))
    (define (%ht-index key nbuckets) (remainder (%hash key) nbuckets))
    (define (%ht-assoc key al) (if (null? al) #f (if (equal? key (car (car al))) (car al) (%ht-assoc key (cdr al)))))
    (define (%ht-remove key al) (if (null? al) (quote ()) (if (equal? key (car (car al))) (cdr al) (cons (car al) (%ht-remove key (cdr al))))))
    (define (hash-table-ref/default ht key default) (let* ((bs (%ht-buckets ht)) (p (%ht-assoc key (vector-ref bs (%ht-index key (vector-length bs)))))) (if p (cdr p) default)))
    (define (hash-table-contains? ht key) (let ((bs (%ht-buckets ht))) (if (%ht-assoc key (vector-ref bs (%ht-index key (vector-length bs)))) #t #f)))
    (define (hash-table-ref ht key) (let* ((bs (%ht-buckets ht)) (p (%ht-assoc key (vector-ref bs (%ht-index key (vector-length bs)))))) (if p (cdr p) (error "hash-table-ref: key not found" key))))
    (define (hash-table-set! ht key val) (let* ((bs (%ht-buckets ht)) (n (vector-length bs)) (i (%ht-index key n)) (al (vector-ref bs i)) (existed (%ht-assoc key al))) (vector-set! bs i (cons (cons key val) (if existed (%ht-remove key al) al))) (if existed #f (begin (%ht-set-count! ht (+ (%ht-count ht) 1)) (if (> (%ht-count ht) (* %ht-load-factor n)) (%ht-grow! ht) #f)))))
    (define (hash-table-delete! ht key) (let* ((bs (%ht-buckets ht)) (i (%ht-index key (vector-length bs))) (al (vector-ref bs i))) (if (%ht-assoc key al) (begin (vector-set! bs i (%ht-remove key al)) (%ht-set-count! ht (- (%ht-count ht) 1))) #f)))
    (define (%ht-grow! ht) (let* ((old (%ht-buckets ht)) (newn (* 2 (vector-length old))) (newb (make-vector newn (quote ())))) (let loop ((i 0)) (if (< i (vector-length old)) (begin (let bloop ((al (vector-ref old i))) (if (null? al) #f (let* ((kv (car al)) (j (%ht-index (car kv) newn))) (vector-set! newb j (cons kv (vector-ref newb j))) (bloop (cdr al))))) (loop (+ i 1))) #f)) (%ht-set-buckets! ht newb)))
    (define (hash-table-size ht) (%ht-count ht))
    (define (%ht-fold-buckets al acc) (if (null? al) acc (cons (cons (car (car al)) (cdr (car al))) (%ht-fold-buckets (cdr al) acc))))
    (define (hash-table->alist ht) (let ((bs (%ht-buckets ht))) (let loop ((i 0) (acc (quote ()))) (if (< i (vector-length bs)) (loop (+ i 1) (%ht-fold-buckets (vector-ref bs i) acc)) acc))))
    (define (hash-table-keys ht) (map car (hash-table->alist ht)))
    (define (hash-table-values ht) (map cdr (hash-table->alist ht)))
    (define (rd-report s n r) (let ((why (car r)) (p (rd-fail-pos (cdr r)))) (cond ((eq? why (quote rd-block-comment)) (error (quote read) "unterminated block comment #| opened at index" p)) ((eq? why (quote rd-bar)) (error (quote read) "unterminated |identifier| opened at index" p)) ((eq? why (quote rd-unterminated-list)) (error (quote read) (string-append "unterminated " (let ((k (char->integer (string-ref s p)))) (cond ((= k 91) "list [") ((and (= k 35) (< (+ p 1) n) (= (char->integer (string-ref s (+ p 1))) 117)) "bytevector #u8(") ((= k 35) "vector #(") (else "list ("))) " opened at index") p)) ((eq? why (quote rd-unterminated-string)) (error (quote read) "unterminated string \" opened at index" p)) ((eq? why (quote rd-eof)) (error (quote read) "end of input where a datum was expected, at index" p)) ((eq? why (quote rd-unexpected)) (error (quote read) "no datum here, at index" p)) ((eq? why (quote rd-rational)) (error (quote read) (string-append "rational literal syntax is not supported -- Emit has no " "exact rationals; write 0.5, or (/ 1 2)") (rd-token-at s n p))) (else (error (quote read) "unrecognized syntax" (rd-token-at s n p))))))
    (define (read-from-string s) (let ((n (string-length s))) (let ((r (rd-datum s n (rd-skip-ws s n 0) #f))) (if (rd-fail? (cdr r)) (rd-report s n r) (car r)))))
    (define (read-all-from-string s) (rd-all s #f))
    (define (read-all-from-string-ci s) (rd-all s #t))
    (define (rd-all s ci) (let ((n (string-length s))) (let loop ((i (rd-skip-ws s n 0)) (acc (quote ()))) (cond ((rd-fail? i) (rd-report s n (cons (quote rd-block-comment) i))) ((< i n) (let ((r (rd-datum s n i ci))) (if (rd-fail? (cdr r)) (rd-report s n r) (loop (rd-skip-ws s n (cdr r)) (cons (car r) acc))))) (else (reverse acc))))))
    (define (port? p) (%record-of-type? p (%port-rtd)))
    (define (input-port? p) (and (port? p) (%record-ref p 1)))
    (define (output-port? p) (and (port? p) (not (%record-ref p 1))))
    (define (textual-port? p) (port? p))
    (define (port-closed? p) (%record-ref p 5))
    (define (input-port-open? p) (and (input-port? p) (not (%record-ref p 5))))
    (define (output-port-open? p) (and (output-port? p) (not (%record-ref p 5))))
    (define (%check-input-port p who) (if (not (input-port? p)) (error who "not an input port" p) (if (%record-ref p 5) (error who "port is closed" p) p)))
    (define (%check-output-port p who) (if (not (output-port? p)) (error who "not an output port" p) (if (%record-ref p 5) (error who "port is closed" p) p)))
    (define (open-input-string s) (%make-port #f #t s 0 #t #f))
    (define (%port-at-eof? p) (>= (%record-ref p 3) (string-length (%port-buf p))))
    (define (read-char p) (%check-input-port p (quote read-char)) (if (%port-at-eof? p) (eof-object) (let ((i (%record-ref p 3))) (%record-set! p 3 (+ i 1)) (string-ref (%port-buf p) i))))
    (define (peek-char p) (%check-input-port p (quote peek-char)) (if (%port-at-eof? p) (eof-object) (string-ref (%port-buf p) (%record-ref p 3))))
    (define (read-line p) (%check-input-port p (quote read-line)) (if (%port-at-eof? p) (eof-object) (let* ((s (%port-buf p)) (n (string-length s))) (let loop ((i (%record-ref p 3))) (if (>= i n) (let ((start (%record-ref p 3))) (%record-set! p 3 n) (substring s start n)) (if (char=? (string-ref s i) #\newline) (let ((start (%record-ref p 3))) (%record-set! p 3 (+ i 1)) (substring s start i)) (loop (+ i 1))))))))
    (define (read-string k p) (%check-input-port p (quote read-string)) (if (%port-at-eof? p) (eof-object) (let* ((s (%port-buf p)) (n (string-length s)) (start (%record-ref p 3)) (end (if (> (+ start k) n) n (+ start k)))) (%record-set! p 3 end) (substring s start end))))
    (define (open-output-string) (let ((h (%port-open-output-string))) (if h (%make-port h #f #f 0 #t #f) (error (quote open-output-string) "cannot open an output string port"))))
    (define (get-output-string p) (if (not (output-port? p)) (error (quote get-output-string) "not an output port" p) (if (not (%record-ref p 4)) (error (quote get-output-string) "not a string port" p) (%port-get-output-string (%record-ref p 0)))))
    (define (flush-output-port p) (%check-output-port p (quote flush-output-port)) (%port-flush (%record-ref p 0)))
    (define (close-port p) (if (not (port? p)) (error (quote close-port) "not a port" p) (if (%record-ref p 5) (if #f #f) (begin (if (not (%record-ref p 1)) (%port-close (%record-ref p 0))) (%record-set! p 5 #t) (if #f #f)))))
    (define (close-input-port p) (if (input-port? p) (close-port p) (error (quote close-input-port) "not an input port" p)))
    (define (close-output-port p) (if (output-port? p) (close-port p) (error (quote close-output-port) "not an output port" p)))
    (define %stdout-port #f)
    (define %stderr-port #f)
    (define %stdin-port #f)
    (define (current-output-port . args) (if (null? args) (begin (if (not %stdout-port) (begin (set! %stdout-port (%make-port 0 #f #f 0 #f #f)) (%set-current-output! 0))) %stdout-port) (let ((p (car args))) (set! %stdout-port p) (%set-current-output! (%record-ref p 0)) (if #f #f))))
    (define (current-error-port . args) (if (null? args) (begin (if (not %stderr-port) (set! %stderr-port (%make-port 1 #f #f 0 #f #f))) %stderr-port) (begin (set! %stderr-port (car args)) (if #f #f))))
    (define (current-input-port . args) (if (null? args) (begin (if (not %stdin-port) (set! %stdin-port (%make-port #f #t #f 0 #f #f))) %stdin-port) (begin (set! %stdin-port (car args)) (if #f #f))))
    (define (call-with-port p proc) (dynamic-wind (lambda () (if #f #f)) (lambda () (proc p)) (lambda () (close-port p))))
    ))
