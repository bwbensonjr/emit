;;; internal.sld -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss
;;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in
;;; src/prelude-surface.scm) and regenerate; guarded by
;;; test/scheme-base-gen-check.sh.
;;;
;;; One member of the prelude's partition: the definitions the declaration
;;; homes here, exporting the declared public ones.  Private helpers and the
;;; derived-form macros stay in the body, where the exported procedures still
;;; call them.  One export per line, so a surface change is a reviewable
;;; one-line diff.
(define-library (emit internal)
  (export
    and
    or
    when
    unless
    let*
    cond
    caaar
    caadr
    cadar
    caddr
    cdaar
    cdadr
    cddar
    cdddr
    cadddr
    %digit-in-radix
    %radix-digits
    %string->int
    rd-ws?
    rd-digit?
    rd-delim?
    rd-fail-code
    rd-fail?
    rd-fail-pos
    rd-fail
    rd-skip-line
    rd-block-open?
    rd-skip-block
    rd-skip-ws
    rd-token-end
    rd-all-digits?
    rd-numeric?
    rd-digits
    rd-digits-neg
    rd-parse-int
    rd-dotchar?
    rd-exp-char?
    rd-sign-char?
    rd-scan-digits
    rd-flonum?
    rd-nonfinite
    rd-radix-letter
    rd-exactness-letter
    rd-scan-prefixes
    rd-radix-scan
    rd-rational-body?
    rd-exactness-apply
    rd-body-number
    rd-number
    rd-number-reason?
    rd-fold-char
    rd-fold-token
    rd-atom
    rd-token-at
    rd-hex-digit
    rd-hex
    rd-str-esc
    rd-string
    rd-hash
    rd-char-name
    rd-char
    rd-bar
    rd-quote
    rd-quasi
    rd-unquote
    rd-dot?
    rd-append-reverse
    rd-datum-comment?
    rd-list
    rd-datum
    %port-rtd-cell
    %port-rtd
    %make-port
    %port-buf
    )
  (begin
    (define-syntax and (syntax-rules () ((_) #t) ((_ e) e) ((_ e1 e2 ...) (if e1 (and e2 ...) #f))))
    (define-syntax or (syntax-rules () ((_) #f) ((_ e) e) ((_ e1 e2 ...) (let ((t e1)) (if t t (or e2 ...))))))
    (define-syntax when (syntax-rules () ((_ test e ...) (if test (begin e ...)))))
    (define-syntax unless (syntax-rules () ((_ test e ...) (if test (if #f #f) (begin e ...)))))
    (define-syntax let* (syntax-rules () ((_ () body ...) (begin body ...)) ((_ ((x v) rest ...) body ...) (let ((x v)) (let* (rest ...) body ...)))))
    (define-syntax cond (syntax-rules (else =>) ((_) (if #f #f)) ((_ (else e ...)) (begin e ...)) ((_ (test => proc) rest ...) (let ((t test)) (if t (proc t) (cond rest ...)))) ((_ (test) rest ...) (let ((t test)) (if t t (cond rest ...)))) ((_ (test e ...) rest ...) (if test (begin e ...) (cond rest ...)))))
    (define (list . xs) xs)
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
    (define (length xs) (let loop ((xs xs) (n 0)) (if (null? xs) n (loop (cdr xs) (+ n 1)))))
    (define (reverse xs) (let loop ((xs xs) (acc (quote ()))) (if (null? xs) acc (loop (cdr xs) (cons (car xs) acc)))))
    (define (cadddr x) (car (cdddr x)))
    (define (%digit-in-radix c r) (let ((v (let ((k (char->integer c))) (cond ((and (< 47 k) (< k 58)) (- k 48)) ((and (< 96 k) (< k 123)) (- k 87)) ((and (< 64 k) (< k 91)) (- k 55)) (else 99))))) (if (< v r) v #f)))
    (define (%radix-digits s i m r acc) (if (< i m) (let ((d (%digit-in-radix (string-ref s i) r))) (if d (%radix-digits s (+ i 1) m r (- (* acc r) d)) #f)) acc))
    (define (%string->int s r) (let ((m (string-length s))) (if (= m 0) #f (let ((c0 (char->integer (string-ref s 0)))) (if (= c0 45) (if (< 1 m) (%radix-digits s 1 m r 0) #f) (let ((start (if (= c0 43) 1 0))) (if (< start m) (let ((neg (%radix-digits s start m r 0))) (if neg (- 0 neg) #f)) #f)))))))
    (define (list->vector xs) (let ((v (make-vector (length xs) 0))) (let loop ((xs xs) (i 0)) (if (null? xs) v (begin (vector-set! v i (car xs)) (loop (cdr xs) (+ i 1)))))))
    (define (list->bytevector bs) (let ((bv (make-bytevector (length bs) 0))) (let loop ((bs bs) (i 0)) (if (null? bs) bv (begin (bytevector-u8-set! bv i (car bs)) (loop (cdr bs) (+ i 1)))))))
    (define (rd-ws? c) (let ((k (char->integer c))) (or (= k 32) (or (= k 9) (or (= k 10) (= k 13))))))
    (define (rd-digit? c) (let ((k (char->integer c))) (and (< 47 k) (< k 58))))
    (define (rd-delim? c) (let ((k (char->integer c))) (or (rd-ws? c) (or (= k 40) (or (= k 41) (or (= k 91) (or (= k 93) (or (= k 34) (= k 59)))))))))
    (define (rd-fail-code p) (- -3 p))
    (define (rd-fail? i) (< i 0))
    (define (rd-fail-pos i) (- (- 0 i) 3))
    (define (rd-fail why p) (cons why (rd-fail-code p)))
    (define (rd-skip-line s n i) (if (< i n) (if (= (char->integer (string-ref s i)) 10) (+ i 1) (rd-skip-line s n (+ i 1))) i))
    (define (rd-block-open? s n i) (and (= (char->integer (string-ref s i)) 35) (< (+ i 1) n) (= (char->integer (string-ref s (+ i 1))) 124)))
    (define (rd-skip-block s n i d p) (if (< (+ i 1) n) (let ((a (char->integer (string-ref s i))) (b (char->integer (string-ref s (+ i 1))))) (cond ((and (= a 124) (= b 35)) (if (= d 1) (+ i 2) (rd-skip-block s n (+ i 2) (- d 1) p))) ((and (= a 35) (= b 124)) (rd-skip-block s n (+ i 2) (+ d 1) p)) (else (rd-skip-block s n (+ i 1) d p)))) (rd-fail-code p)))
    (define (rd-skip-ws s n i) (if (and (<= 0 i) (< i n)) (let ((c (string-ref s i))) (cond ((rd-ws? c) (rd-skip-ws s n (+ i 1))) ((= (char->integer c) 59) (rd-skip-ws s n (rd-skip-line s n (+ i 1)))) ((rd-block-open? s n i) (let ((j (rd-skip-block s n (+ i 2) 1 i))) (if (rd-fail? j) j (rd-skip-ws s n j)))) (else i))) i))
    (define (rd-token-end s n i) (if (< i n) (if (rd-delim? (string-ref s i)) i (rd-token-end s n (+ i 1))) i))
    (define (rd-all-digits? tok a m) (if (< a m) (if (rd-digit? (string-ref tok a)) (rd-all-digits? tok (+ a 1) m) #f) #t))
    (define (rd-numeric? tok) (let ((m (string-length tok))) (and (< 0 m) (let ((c0 (char->integer (string-ref tok 0)))) (cond ((rd-digit? (string-ref tok 0)) (rd-all-digits? tok 0 m)) ((or (= c0 45) (= c0 43)) (and (< 1 m) (rd-all-digits? tok 1 m))) (else #f))))))
    (define (rd-digits tok a m acc) (if (< a m) (rd-digits tok (+ a 1) m (+ (* acc 10) (- (char->integer (string-ref tok a)) 48))) acc))
    (define (rd-digits-neg tok a m acc) (if (< a m) (rd-digits-neg tok (+ a 1) m (- (* acc 10) (- (char->integer (string-ref tok a)) 48))) acc))
    (define (rd-parse-int tok) (let ((m (string-length tok)) (c0 (char->integer (string-ref tok 0)))) (cond ((= c0 45) (rd-digits-neg tok 1 m 0)) ((= c0 43) (rd-digits tok 1 m 0)) (else (rd-digits tok 0 m 0)))))
    (define (rd-dotchar? c) (= (char->integer c) 46))
    (define (rd-exp-char? c) (let ((k (char->integer c))) (or (= k 101) (= k 69))))
    (define (rd-sign-char? c) (let ((k (char->integer c))) (or (= k 43) (= k 45))))
    (define (rd-scan-digits tok a m) (if (and (< a m) (rd-digit? (string-ref tok a))) (rd-scan-digits tok (+ a 1) m) a))
    (define (rd-flonum? tok) (let ((m (string-length tok))) (and (< 0 m) (let ((i0 (if (rd-sign-char? (string-ref tok 0)) 1 0))) (let ((i1 (rd-scan-digits tok i0 m))) (let ((i2 (if (and (< i1 m) (rd-dotchar? (string-ref tok i1))) (+ i1 1) i1))) (let ((had-dot (< i1 i2))) (let ((i3 (rd-scan-digits tok i2 m))) (and (or (< i0 i1) (< i2 i3)) (let ((i4 (if (and (< i3 m) (rd-exp-char? (string-ref tok i3))) (let ((i5 (if (and (< (+ i3 1) m) (rd-sign-char? (string-ref tok (+ i3 1)))) (+ i3 2) (+ i3 1)))) (let ((i6 (rd-scan-digits tok i5 m))) (if (< i5 i6) i6 -1))) i3))) (and (< -1 i4) (= i4 m) (or had-dot (< i3 i4)))))))))))))
    (define (rd-nonfinite tok) (cond ((string=? tok "+inf.0") (%string->flonum "inf")) ((string=? tok "-inf.0") (%string->flonum "-inf")) ((string=? tok "+nan.0") (%string->flonum "nan")) (else #f)))
    (define (rd-radix-letter c) (let ((k (char->integer c))) (cond ((or (= k 98) (= k 66)) 2) ((or (= k 111) (= k 79)) 8) ((or (= k 100) (= k 68)) 10) ((or (= k 120) (= k 88)) 16) (else #f))))
    (define (rd-exactness-letter c) (let ((k (char->integer c))) (cond ((or (= k 101) (= k 69)) 1) ((or (= k 105) (= k 73)) 2) (else #f))))
    (define (rd-scan-prefixes t m i r x) (if (and (< i m) (= (char->integer (string-ref t i)) 35)) (if (< (+ i 1) m) (let ((nr (rd-radix-letter (string-ref t (+ i 1))))) (if nr (if r #f (rd-scan-prefixes t m (+ i 2) nr x)) (let ((nx (rd-exactness-letter (string-ref t (+ i 1))))) (if nx (if x #f (rd-scan-prefixes t m (+ i 2) r nx)) #f)))) #f) (cons r (cons x i))))
    (define (rd-radix-scan t m i r) (if (and (< i m) (%digit-in-radix (string-ref t i) r)) (rd-radix-scan t m (+ i 1) r) i))
    (define (rd-rational-body? t m i r) (let ((i0 (if (and (< i m) (rd-sign-char? (string-ref t i))) (+ i 1) i))) (let ((i1 (rd-radix-scan t m i0 r))) (and (< i0 i1) (< i1 m) (= (char->integer (string-ref t i1)) 47) (let ((i2 (rd-radix-scan t m (+ i1 1) r))) (and (< (+ i1 1) i2) (= i2 m)))))))
    (define (rd-exactness-apply v x) (cond ((not x) v) ((= x 2) (exact->inexact v)) ((exact? v) v) ((= v (%flo-truncate v)) (inexact->exact v)) (else (quote rd-rational))))
    (define (rd-body-number body r x) (if (= r 10) (cond ((rd-numeric? body) (rd-exactness-apply (rd-parse-int body) x)) ((rd-flonum? body) (rd-exactness-apply (%string->flonum body) x)) (else (let ((nf (rd-nonfinite body))) (cond ((not nf) (quote rd-not-a-number)) ((and x (= x 1)) (quote rd-bad-number)) (else (rd-exactness-apply nf x)))))) (let ((v (%string->int body r))) (if v (rd-exactness-apply v x) (quote rd-not-a-number)))))
    (define (rd-number t r0) (let ((m (string-length t))) (if (and (< 0 m) (= (char->integer (string-ref t 0)) 35)) (let ((p (rd-scan-prefixes t m 0 #f #f))) (if (not p) (quote rd-bad-number) (let ((r (if (car p) (car p) r0)) (x (cadr p)) (b (cddr p))) (let ((v (rd-body-number (substring t b m) r x))) (if (eq? v (quote rd-not-a-number)) (if (rd-rational-body? t m b r) (quote rd-rational) (quote rd-bad-number)) v))))) (let ((v (rd-body-number t r0 #f))) (if (eq? v (quote rd-not-a-number)) (if (rd-rational-body? t m 0 r0) (quote rd-rational) v) v)))))
    (define (rd-number-reason? v) (or (eq? v (quote rd-rational)) (eq? v (quote rd-bad-number))))
    (define (rd-fold-char c) (let ((k (char->integer c))) (if (and (< 64 k) (< k 91)) (integer->char (+ k 32)) c)))
    (define (rd-fold-token tok) (let ((m (string-length tok))) (let loop ((i 0) (acc (quote ()))) (if (= i m) (list->string (reverse acc)) (loop (+ i 1) (cons (rd-fold-char (string-ref tok i)) acc))))))
    (define (rd-atom s n i ci) (let ((j (rd-token-end s n i))) (if (= i j) (rd-fail (quote rd-unexpected) i) (let ((tok (substring s i j))) (let ((v (rd-number tok 10))) (cond ((eq? v (quote rd-not-a-number)) (cons (string->symbol (if ci (rd-fold-token tok) tok)) j)) ((rd-number-reason? v) (rd-fail v i)) (else (cons v j))))))))
    (define (rd-token-at s n p) (if (and (<= 0 p) (< p n)) (substring s p (rd-token-end s n (+ p 1))) ""))
    (define (rd-hex-digit c) (let ((k (char->integer c))) (cond ((and (< 47 k) (< k 58)) (- k 48)) ((and (< 96 k) (< k 103)) (- k 87)) ((and (< 64 k) (< k 71)) (- k 55)) (else 0))))
    (define (rd-hex s n i acc) (if (< i n) (if (= (char->integer (string-ref s i)) 59) (cons acc (+ i 1)) (rd-hex s n (+ i 1) (+ (* acc 16) (rd-hex-digit (string-ref s i))))) (cons acc i)))
    (define (rd-str-esc c) (let ((k (char->integer c))) (cond ((= k 110) (integer->char 10)) ((= k 116) (integer->char 9)) ((= k 114) (integer->char 13)) (else c))))
    (define (rd-string s n i open) (let loop ((i i) (acc (quote ()))) (if (< i n) (let* ((c (string-ref s i)) (k (char->integer c))) (cond ((= k 34) (cons (list->string (reverse acc)) (+ i 1))) ((= k 92) (if (<= n (+ i 1)) (rd-fail (quote rd-unterminated-string) open) (let ((e (string-ref s (+ i 1)))) (if (= (char->integer e) 120) (let ((hx (rd-hex s n (+ i 2) 0))) (loop (cdr hx) (cons (integer->char (car hx)) acc))) (loop (+ i 2) (cons (rd-str-esc e) acc)))))) (else (loop (+ i 1) (cons c acc))))) (rd-fail (quote rd-unterminated-string) open))))
    (define (rd-hash s n i ci) (if (<= n i) (rd-fail (quote rd-eof) (- i 1)) (let ((k (char->integer (string-ref s i)))) (cond ((= k 116) (cons #t (+ i 1))) ((= k 102) (cons #f (+ i 1))) ((= k 92) (rd-char s n i)) ((= k 40) (let ((r (rd-list s n (+ i 1) (quote ()) ci (- i 1)))) (if (rd-fail? (cdr r)) r (cons (list->vector (car r)) (cdr r))))) ((= k 59) (let ((r (rd-datum s n (rd-skip-ws s n (+ i 1)) ci))) (if (rd-fail? (cdr r)) r (rd-datum s n (rd-skip-ws s n (cdr r)) ci)))) ((and (= k 117) (< (+ i 2) n) (= (char->integer (string-ref s (+ i 1))) 56) (= (char->integer (string-ref s (+ i 2))) 40)) (let ((r (rd-list s n (+ i 3) (quote ()) ci (- i 1)))) (if (rd-fail? (cdr r)) r (cons (list->bytevector (car r)) (cdr r))))) (else (let ((j (rd-token-end s n i))) (let ((v (rd-number (substring s (- i 1) j) 10))) (if (rd-number-reason? v) (rd-fail v (- i 1)) (cons v j)))))))))
    (define (rd-char-name tok) (cond ((string=? tok "space") (integer->char 32)) ((string=? tok "newline") (integer->char 10)) ((string=? tok "tab") (integer->char 9)) ((string=? tok "return") (integer->char 13)) ((string=? tok "nul") (integer->char 0)) ((string=? tok "null") (integer->char 0)) ((string=? tok "delete") (integer->char 127)) ((string=? tok "altmode") (integer->char 27)) ((string=? tok "esc") (integer->char 27)) (else (string-ref tok 0))))
    (define (rd-char s n i) (let* ((cs (+ i 1)) (end (rd-token-end s n (+ cs 1))) (tok (substring s cs end))) (if (= (string-length tok) 1) (cons (string-ref s cs) end) (cons (rd-char-name tok) end))))
    (define (rd-bar s n i p) (let loop ((i i) (acc (quote ()))) (if (< i n) (let ((c (string-ref s i))) (let ((k (char->integer c))) (cond ((= k 124) (cons (string->symbol (list->string (reverse acc))) (+ i 1))) ((and (= k 92) (< (+ i 1) n)) (let ((e (string-ref s (+ i 1)))) (if (= (char->integer e) 120) (let ((hx (rd-hex s n (+ i 2) 0))) (loop (cdr hx) (cons (integer->char (car hx)) acc))) (loop (+ i 2) (cons (rd-str-esc e) acc))))) (else (loop (+ i 1) (cons c acc)))))) (rd-fail (quote rd-bar) p))))
    (define (rd-quote s n i ci) (let ((r (rd-datum s n (rd-skip-ws s n i) ci))) (if (rd-fail? (cdr r)) r (cons (list (quote quote) (car r)) (cdr r)))))
    (define (rd-quasi s n i ci) (let ((r (rd-datum s n (rd-skip-ws s n i) ci))) (if (rd-fail? (cdr r)) r (cons (list (quote quasiquote) (car r)) (cdr r)))))
    (define (rd-unquote s n i ci) (if (and (< i n) (= (char->integer (string-ref s i)) 64)) (let ((r (rd-datum s n (rd-skip-ws s n (+ i 1)) ci))) (if (rd-fail? (cdr r)) r (cons (list (quote unquote-splicing) (car r)) (cdr r)))) (let ((r (rd-datum s n (rd-skip-ws s n i) ci))) (if (rd-fail? (cdr r)) r (cons (list (quote unquote) (car r)) (cdr r))))))
    (define (rd-dot? s n j) (and (= (char->integer (string-ref s j)) 46) (= (rd-token-end s n (+ j 1)) (+ j 1))))
    (define (rd-append-reverse acc tail) (if (null? acc) tail (rd-append-reverse (cdr acc) (cons (car acc) tail))))
    (define (rd-datum-comment? s n i) (and (= (char->integer (string-ref s i)) 35) (< (+ i 1) n) (= (char->integer (string-ref s (+ i 1))) 59)))
    (define (rd-list s n i acc ci open) (let ((j (rd-skip-ws s n i))) (cond ((rd-fail? j) (cons (quote rd-block-comment) j)) ((< j n) (cond ((let ((c (char->integer (string-ref s j)))) (or (= c 41) (= c 93))) (cons (reverse acc) (+ j 1))) ((rd-datum-comment? s n j) (let ((r (rd-datum s n (rd-skip-ws s n (+ j 2)) ci))) (if (rd-fail? (cdr r)) r (rd-list s n (cdr r) acc ci open)))) ((rd-dot? s n j) (let ((r (rd-datum s n (rd-skip-ws s n (+ j 1)) ci))) (if (rd-fail? (cdr r)) r (let ((j2 (rd-skip-ws s n (cdr r)))) (cond ((rd-fail? j2) (cons (quote rd-block-comment) j2)) ((<= n j2) (rd-fail (quote rd-unterminated-list) open)) (else (cons (rd-append-reverse acc (car r)) (+ j2 1)))))))) (else (let ((r (rd-datum s n j ci))) (if (rd-fail? (cdr r)) r (rd-list s n (cdr r) (cons (car r) acc) ci open)))))) (else (rd-fail (quote rd-unterminated-list) open)))))
    (define (rd-datum s n i ci) (if (and (<= 0 i) (< i n)) (let ((k (char->integer (string-ref s i)))) (cond ((= k 40) (rd-list s n (+ i 1) (quote ()) ci i)) ((= k 91) (rd-list s n (+ i 1) (quote ()) ci i)) ((= k 39) (rd-quote s n (+ i 1) ci)) ((= k 96) (rd-quasi s n (+ i 1) ci)) ((= k 44) (rd-unquote s n (+ i 1) ci)) ((= k 34) (rd-string s n (+ i 1) i)) ((= k 35) (rd-hash s n (+ i 1) ci)) ((= k 124) (rd-bar s n (+ i 1) i)) ((or (= k 41) (= k 93)) (rd-fail (quote rd-unexpected) i)) (else (rd-atom s n i ci)))) (if (< i 0) (cons (quote rd-block-comment) i) (rd-fail (quote rd-eof) i))))
    (define %port-rtd-cell #f)
    (define (%port-rtd) (if %port-rtd-cell %port-rtd-cell (begin (set! %port-rtd-cell (%make-record-type "port")) %port-rtd-cell)))
    (define (%make-port handle input? buf pos string? closed?) (%make-record (%port-rtd) (list handle input? buf pos string? closed?)))
    (define (%port-buf p) (let ((b (%record-ref p 2))) (if b b (let ((s (%read-all-stdin))) (%record-set! p 2 s) s))))
    ))
