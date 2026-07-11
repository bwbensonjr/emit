;;; parse.ss -- read source into the core IL, then alpha-rename.  (Included into
;;; compile.ss; assumes (match) and (util) are imported.)
;;;
;;; Core IL:
;;;   (const d) | x | (if e e e) | (lambda (x ...) e) | (call e e ...)
;;;   (primcall op e ...) | (let ([x e] ...) e) | (letrec ([x e] ...) e)
;;;   (seq e e) | (set! x e)
;;;
;;; Primitive names are reserved keywords (not rebindable) in the M1 subset.

(define *prims* '(+ - * = < cons car cdr null? pair? eq?))
(define (prim? op) (and (memq op *prims*) #t))

;; ---- parse: s-expr -> core IL ----
(define (parse-program sexp) (parse-expr sexp))

(define (parse-expr e)
  (cond
    [(and (integer? e) (exact? e)) `(const ,e)]
    [(boolean? e) `(const ,e)]
    [(null? e) `(const ())]
    [(symbol? e) e]
    [(pair? e)
     (match e
       [(quote ,d) `(const ,d)]
       [(if ,a ,b ,c) `(if ,(parse-expr a) ,(parse-expr b) ,(parse-expr c))]
       [(lambda ,params . ,body) `(lambda ,params ,(parse-body body))]
       [(let ,binds . ,body) `(let ,(map parse-bind binds) ,(parse-body body))]
       [(letrec ,binds . ,body) `(letrec ,(map parse-bind binds) ,(parse-body body))]
       [(begin . ,body) (parse-body body)]
       [(set! ,x ,rhs) `(set! ,x ,(parse-expr rhs))]
       [(,op . ,args) (guard (prim? op)) `(primcall ,op ,@(map parse-expr args))]
       [(,f . ,args) `(call ,(parse-expr f) ,@(map parse-expr args))])]
    [else (error 'parse "bad expression" e)]))

(define (parse-bind b) (list (car b) (parse-expr (cadr b))))

(define (parse-body body)  ; non-empty list of source forms -> one core expr
  (let loop ([es (map parse-expr body)])
    (cond
      [(null? es) `(const ())]
      [(null? (cdr es)) (car es)]
      [else `(seq ,(car es) ,(loop (cdr es)))])))

;; ---- alpha-rename: make every bound variable globally unique ----
(define (rename-program e) (rename e '()))

(define (rename e env)               ; env: alist old -> new
  (define (look x) (let ([p (assq x env)]) (if p (cdr p) x)))
  (define (R e) (rename e env))
  (match e
    [(const ,d) e]
    [,x (guard (symbol? x)) (look x)]
    [(if ,a ,b ,c) `(if ,(R a) ,(R b) ,(R c))]
    [(seq ,a ,b) `(seq ,(R a) ,(R b))]
    [(set! ,x ,rhs) `(set! ,(look x) ,(R rhs))]
    [(primcall ,op . ,args) `(primcall ,op ,@(map R args))]
    [(call ,f . ,args) `(call ,(R f) ,@(map R args))]
    [(lambda ,params ,body)
     (let* ([new (map fresh-name params)]
            [env2 (append (map cons params new) env)])
       `(lambda ,new ,(rename body env2)))]
    [(let ,binds ,body)
     (let* ([xs (map car binds)]
            [es (map (lambda (b) (R (cadr b))) binds)]     ; rhs in outer env
            [new (map fresh-name xs)]
            [env2 (append (map cons xs new) env)])
       `(let ,(map list new es) ,(rename body env2)))]
    [(letrec ,binds ,body)
     (let* ([xs (map car binds)]
            [new (map fresh-name xs)]
            [env2 (append (map cons xs new) env)]
            [es (map (lambda (b) (rename (cadr b) env2)) binds)])  ; rhs in new env
       `(letrec ,(map list new es) ,(rename body env2)))]))
