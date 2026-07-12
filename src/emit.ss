;;; emit.ss (tasks 5.1-5.4) -- lower L-code to textual LLVM IR (opaque ptrs).
;;;
;;; Value = i64 tagged word (matches src/runtime/runtime.c).  Every Scheme
;;; function shares ONE prototype so musttail is legal (LLVM requires matching
;;; caller/callee prototypes): tailcc i64 (i64 self, i64 a0 ... i64 a{K-1}),
;;; K = max arity in the program; calls pad missing args with 0.  self is the
;;; called closure (arg0), from which free variables are loaded.  The top-level
;;; @scheme_entry is ccc (called from C main); its calls are regular, not tail.

;; --- output state (reset per program) ---
(define emit-lines '())
(define (emit! s) (set! emit-lines (cons s emit-lines)))
(define temp-n 0)
(define lbl-n 0)
(define current-bb "entry")
(define (fresh-temp) (set! temp-n (+ temp-n 1)) (string-append "%t" (number->string temp-n)))
(define (fresh-bb base) (set! lbl-n (+ lbl-n 1)) (string-append base (number->string lbl-n)))
(define (start-bb name) (emit! (string-append name ":")) (set! current-bb name))
(define (reset-emit!) (set! temp-n 0) (set! lbl-n 0) (set! emit-lines '()) (set! current-bb "entry"))

;; --- constants and primitives (must match runtime.c tags) ---
(define (encode-const d)
  (cond
    [(and (integer? d) (exact? d)) (number->string (* d 8))]  ; fixnum: n<<3
    [(eq? d #t) "9"]                                          ; TRUE_V
    [(eq? d #f) "1"]                                          ; FALSE_V
    [(null? d) "2"]                                           ; NIL_V
    [else (error 'emit "bad const" d)]))

(define prim-table
  '((+ "rt_add") (- "rt_sub") (* "rt_mul") (= "rt_num_eq") (< "rt_lt")
    (cons "rt_cons") (car "rt_car") (cdr "rt_cdr")
    (null? "rt_null_p") (pair? "rt_pair_p") (eq? "rt_eq_p")
    (box "rt_box") (unbox "rt_unbox") (set-box! "rt_set_box")))

;; --- string helpers ---
(define (comma-join lst)
  (cond [(null? lst) ""]
        [(null? (cdr lst)) (car lst)]
        [else (string-append (car lst) ", " (comma-join (cdr lst)))]))
(define (i64s ops) (comma-join (map (lambda (o) (string-append "i64 " o)) ops)))
(define (label-line? l)
  (let ([n (string-length l)]) (and (> n 0) (char=? (string-ref l (- n 1)) #\:))))
(define (lines->string lines)
  (apply string-append
    (map (lambda (l) (if (label-line? l) (string-append l "\n") (string-append "  " l "\n")))
         lines)))

;; --- expression emission: ev returns an operand; et terminates the block ---
(define (ev e env cp tc?)
  (match e
    [(const ,d) (encode-const d)]
    [(local ,x) (cdr (assq x env))]
    [(free-ref ,i) (load-free cp i)]
    [(if ,a ,b ,c) (ev-if a b c env cp tc?)]
    [(seq ,a ,b) (ev a env cp tc?) (ev b env cp tc?)]
    [(let ,binds ,body)
     (let* ([ops (map (lambda (b) (ev (cadr b) env cp tc?)) binds)]
            [env2 (append (map (lambda (b op) (cons (car b) op)) binds ops) env)])
       (ev body env2 cp tc?))]
    [(primcall ,op . ,args)
     (emit-primcall op (map (lambda (a) (ev a env cp tc?)) args))]
    [(make-closure ,label ,caps)
     (emit-make-closure label (map (lambda (c) (ev c env cp tc?)) caps))]
    [(closure-block ,entries ,body)
     (ev body (emit-closure-block entries env cp tc?) cp tc?)]
    [(app ,f ,args)
     (emit-app (ev f env cp tc?) (map (lambda (a) (ev a env cp tc?)) args) #f tc?)]))

(define (et e env cp tc?)
  (match e
    [(if ,a ,b ,c) (et-if a b c env cp tc?)]
    [(seq ,a ,b) (ev a env cp tc?) (et b env cp tc?)]
    [(let ,binds ,body)
     (let* ([ops (map (lambda (b) (ev (cadr b) env cp tc?)) binds)]
            [env2 (append (map (lambda (b op) (cons (car b) op)) binds ops) env)])
       (et body env2 cp tc?))]
    [(closure-block ,entries ,body)
     (et body (emit-closure-block entries env cp tc?) cp tc?)]
    [(app ,f ,args)
     (emit-app (ev f env cp tc?) (map (lambda (a) (ev a env cp tc?)) args) #t tc?)]
    [else (emit! (string-append "ret i64 " (ev e env cp tc?)))]))

(define (ev-if a b c env cp tc?)
  (let ([tv (ev a env cp tc?)]
        [tl (fresh-bb "then")] [el (fresh-bb "else")] [ml (fresh-bb "merge")]
        [cmp (fresh-temp)])
    (emit! (string-append cmp " = icmp ne i64 " tv ", 1"))   ; != FALSE_V
    (emit! (string-append "br i1 " cmp ", label %" tl ", label %" el))
    (start-bb tl)
    (let ([bv (ev b env cp tc?)] [bbb current-bb])
      (emit! (string-append "br label %" ml))
      (start-bb el)
      (let ([cv (ev c env cp tc?)] [bbc current-bb])
        (emit! (string-append "br label %" ml))
        (start-bb ml)
        (let ([r (fresh-temp)])
          (emit! (string-append r " = phi i64 [ " bv ", %" bbb " ], [ " cv ", %" bbc " ]"))
          r)))))

(define (et-if a b c env cp tc?)
  (let ([tv (ev a env cp tc?)]
        [tl (fresh-bb "then")] [el (fresh-bb "else")] [cmp (fresh-temp)])
    (emit! (string-append cmp " = icmp ne i64 " tv ", 1"))
    (emit! (string-append "br i1 " cmp ", label %" tl ", label %" el))
    (start-bb tl) (et b env cp tc?)
    (start-bb el) (et c env cp tc?)))

(define (load-free cp i)
  (let ([b (fresh-temp)] [p (fresh-temp)] [g (fresh-temp)] [v (fresh-temp)])
    (emit! (string-append b " = and i64 " cp ", -8"))
    (emit! (string-append p " = inttoptr i64 " b " to ptr"))
    (emit! (string-append g " = getelementptr i64, ptr " p ", i64 " (number->string (+ i 1))))
    (emit! (string-append v " = load i64, ptr " g))
    v))

(define (emit-primcall op ops)
  (let ([entry (assq op prim-table)] [t (fresh-temp)])
    (unless entry (error 'emit "unknown prim" op))
    (emit! (string-append t " = call i64 @" (cadr entry) "(" (i64s ops) ")"))
    t))

;; allocate {code_ptr, cap...}, tag TAG_CLOSURE (4)
(define (emit-alloc-closure label caps-count)
  (let ([raw (fresh-temp)] [p (fresh-temp)])
    (emit! (string-append raw " = call i64 @rt_alloc_words(i64 " (number->string (+ caps-count 1)) ")"))
    (emit! (string-append p " = inttoptr i64 " raw " to ptr"))
    (emit! (string-append "store i64 ptrtoint (ptr @" label " to i64), ptr " p))
    (values raw p)))

(define (store-cap p i op)
  (let ([g (fresh-temp)])
    (emit! (string-append g " = getelementptr i64, ptr " p ", i64 " (number->string i)))
    (emit! (string-append "store i64 " op ", ptr " g))))

(define (emit-make-closure label capops)
  (let-values ([(raw p) (emit-alloc-closure label (length capops))])
    (let loop ([i 1] [cs capops]) (unless (null? cs) (store-cap p i (car cs)) (loop (+ i 1) (cdr cs))))
    (let ([c (fresh-temp)]) (emit! (string-append c " = or i64 " raw ", 4")) c)))

;; two-phase: allocate + tag all, bind names, then fill env slots (may ref siblings)
(define (emit-closure-block entries env cp tc?)
  (let* ([allocs
          (map (lambda (ent)
                 (let-values ([(raw p) (emit-alloc-closure (cadr ent) (length (caddr ent)))])
                   (let ([c (fresh-temp)])
                     (emit! (string-append c " = or i64 " raw ", 4"))
                     (list (car ent) p (caddr ent) c))))   ; name, base-ptr, caps, tagged
               entries)]
         [env2 (append (map (lambda (a) (cons (car a) (cadddr a))) allocs) env)])
    (for-each
      (lambda (a)
        (let loop ([i 1] [cs (caddr a)])
          (unless (null? cs)
            (store-cap (cadr a) i (ev (car cs) env2 cp tc?))
            (loop (+ i 1) (cdr cs)))))
      allocs)
    env2))

;; indirect closure call; tail? => terminate with (musttail if tc?) call + ret
(define (emit-app fop aops tail? tc?)
  (let ([b (fresh-temp)] [bp (fresh-temp)] [code (fresh-temp)] [fp (fresh-temp)])
    (emit! (string-append b " = and i64 " fop ", -8"))
    (emit! (string-append bp " = inttoptr i64 " b " to ptr"))
    (emit! (string-append code " = load i64, ptr " bp))
    (emit! (string-append fp " = inttoptr i64 " code " to ptr"))
    (let* ([args (pad-args aops *arity*)]
           ;; argc+overflow calling convention: self, argc (actual arg count),
           ;; a0..a{K-1} (padded), overflow (null until variadic/apply exist).
           [callargs (comma-join
                       (append
                         (list (string-append "i64 " fop)
                               (string-append "i64 " (number->string (length aops))))
                         (map (lambda (o) (string-append "i64 " o)) args)
                         (list "ptr null")))]
           [r (fresh-temp)])
      (if tail?
          (begin
            (emit! (string-append r " = " (if tc? "musttail " "") "call tailcc i64 " fp "(" callargs ")"))
            (emit! (string-append "ret i64 " r))
            #f)
          (begin
            (emit! (string-append r " = call tailcc i64 " fp "(" callargs ")"))
            r)))))

(define *arity* 0)  ; K, set per program
(define (pad-args aops k)
  (append aops (make-list (max 0 (- k (length aops))) "0")))

;; --- top-level assembly ---
(define (max-arity defs)
  (fold-left (lambda (m d) (match d [(code ,l ,s ,params ,b) (max m (length params))])) 0 defs))

(define (rt-declarations)
  (string-append
   "declare i64 @rt_alloc_words(i64)\n"
   "declare i64 @rt_cons(i64, i64)\n"
   "declare i64 @rt_car(i64)\n"
   "declare i64 @rt_cdr(i64)\n"
   "declare i64 @rt_box(i64)\n"
   "declare i64 @rt_unbox(i64)\n"
   "declare i64 @rt_set_box(i64, i64)\n"
   "declare i64 @rt_add(i64, i64)\n"
   "declare i64 @rt_sub(i64, i64)\n"
   "declare i64 @rt_mul(i64, i64)\n"
   "declare i64 @rt_num_eq(i64, i64)\n"
   "declare i64 @rt_lt(i64, i64)\n"
   "declare i64 @rt_null_p(i64)\n"
   "declare i64 @rt_pair_p(i64)\n"
   "declare i64 @rt_eq_p(i64, i64)\n\n"))

(define (emit-code-def def k)
  (match def
    [(code ,label ,self ,params ,body)
     (set! emit-lines '()) (set! current-bb "entry")
     (let ([argdecls (comma-join
                       (append
                         (list "i64 %self" "i64 %argc")
                         (map (lambda (i) (string-append "i64 %a" (number->string i))) (iota k))
                         (list "ptr %overflow")))]  ; argc+overflow CC; both unused until variadic/apply
           [env (map (lambda (p i) (cons p (string-append "%a" (number->string i))))
                     params (iota (length params)))])
       (start-bb "entry")
       (et body env "%self" #t)
       (string-append "define tailcc i64 @" label "(" argdecls ") {\n"
                      (lines->string (reverse emit-lines)) "}\n\n"))]))

(define (emit-entry entry)
  (set! emit-lines '()) (set! current-bb "entry")
  (start-bb "entry")
  (et entry '() #f #f)                    ; ccc, no closure, regular calls
  (string-append "define i64 @scheme_entry() {\n" (lines->string (reverse emit-lines)) "}\n"))

(define (emit-program prog)
  (reset-emit!)
  (match prog
    [(program ,defs ,entry)
     (set! *arity* (max-arity defs))
     (string-append (rt-declarations)
                    (apply string-append (map (lambda (d) (emit-code-def d *arity*)) defs))
                    (emit-entry entry))]))
