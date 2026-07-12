;;; expand.ss -- source->source expansion of derived forms into core forms.
;;; Runs after collect-toplevel and before parse.  A deliberate rehearsal for
;;; the eventual syntax-rules expander: each derived form has one fixed rewrite
;;; into the core language (if / let / letrec / begin / application).
;;;
;;;   (cond [t b...] ... [else e...]) -> nested if / begin
;;;   (and e ...) (or e ...)          -> short-circuit if chains (or binds a temp)
;;;   (when t b...) (unless t b...)   -> if + begin
;;;   (let* ([x e]...) b...)          -> nested let
;;;   (let name ([x e]...) b...)      -> letrec + immediate call
;;;
;;; quoted data is left untouched; every other subform is recursed into so
;;; derived forms nest freely.  Fresh names (for `or`) come from the shared
;;; rename counter, reset per program.

(define (expand e)
  (if (not (pair? e))
      e                                    ; atoms, symbols, literals: unchanged
      (case (car e)
        [(quote)  e]                        ; do not descend into quoted data
        [(cond)   (expand-cond (cdr e))]
        [(and)    (expand-and (cdr e))]
        [(or)     (expand-or (cdr e))]
        [(when)   (expand-when (cadr e) (cddr e))]
        [(unless) (expand-unless (cadr e) (cddr e))]
        [(let*)   (expand-let* (cadr e) (cddr e))]
        [(let)    (if (symbol? (cadr e))    ; named let
                      (expand-named-let (cadr e) (caddr e) (cdddr e))
                      (expand-let-form 'let (cadr e) (cddr e)))]
        [(letrec) (expand-let-form 'letrec (cadr e) (cddr e))]
        [(lambda) `(lambda ,(cadr e) ,@(map expand (cddr e)))]
        [(+ - *) (expand-arith (car e) (cdr e))]
        [(= < > <= >=) (expand-compare (car e) (cdr e))]
        ;; if / begin / set! / primcall / application: recurse into every
        ;; position (operators and operands, never binding lists).
        [else     (map expand e)])))

;; N-ary arithmetic -> nested binary forms.  Operands are expanded first (so
;; nested derived forms / nested arithmetic fold correctly), then left-folded so
;; operands evaluate left-to-right and `-` subtracts in order.  Identities:
;; (+) -> 0, (*) -> 1, (- a) -> (- 0 a).  (-) with no args is an arity error.
;; The two-operand case reduces to (op a b) unchanged, so existing binary calls
;; are byte-for-byte identical.
(define (expand-arith op args)
  (let ([xs (map expand args)])
    (case op
      [(+) (cond [(null? xs) 0]
                 [(null? (cdr xs)) (car xs)]
                 [else (fold-arith op xs)])]
      [(*) (cond [(null? xs) 1]
                 [(null? (cdr xs)) (car xs)]
                 [else (fold-arith op xs)])]
      [(-) (cond [(null? xs) (error 'expand "(-) requires at least one argument")]
                 [(null? (cdr xs)) `(- 0 ,(car xs))]
                 [else (fold-arith op xs)])])))

;; Left-associative fold of >=2 already-expanded operands into nested binary
;; applications: (op (op (op a b) c) d) ...
(define (fold-arith op xs)
  (let loop ([acc (list op (car xs) (cadr xs))] [rest (cddr xs)])
    (if (null? rest)
        acc
        (loop (list op acc (car rest)) (cdr rest)))))

;; N-ary comparisons -> single-evaluation chained (pairwise) comparisons.
;; Operands are expanded first, then each is bound to a fresh temp (interior
;; operands appear in two pairs, and <=/>= reference each operand twice, so
;; every operand is bound exactly once to guarantee single, left-to-right
;; evaluation -- the same reason `or` binds a temp).  The chain is the
;; short-circuiting conjunction of the adjacent pairwise tests; each pairwise
;; test reduces to the existing binary `<` / `=` primitives (> swaps operands;
;; <=/>= combine the two).  Fewer than two operands compare vacuously true.
(define (expand-compare op args)
  (let ([xs (map expand args)])
    (if (or (null? xs) (null? (cdr xs)))
        #t                                  ; (op) or (op a) -> #t
        (let ([temps (map (lambda (x) (fresh-name 'cmp)) xs)])
          (bind-temps temps xs (compare-chain op temps))))))

;; Nested single-binding lets so operands evaluate strictly left to right:
;; (let ([t1 e1]) (let ([t2 e2]) ... body)).
(define (bind-temps temps exprs body)
  (if (null? temps)
      body
      `(let ([,(car temps) ,(car exprs)])
         ,(bind-temps (cdr temps) (cdr exprs) body))))

;; Short-circuiting conjunction of the pairwise tests over adjacent temps.
(define (compare-chain op temps)
  (and-core
    (let loop ([ts temps])
      (if (null? (cdr ts))
          '()
          (cons (cmp-pair op (car ts) (cadr ts)) (loop (cdr ts)))))))

;; `and` over already-core boolean expressions, lowered to an `if` chain
;; (mirrors expand-and but its operands are final, so it is not re-expanded).
(define (and-core ps)
  (cond [(null? ps) #t]
        [(null? (cdr ps)) (car ps)]
        [else `(if ,(car ps) ,(and-core (cdr ps)) #f)]))

;; One pairwise comparison of two temp variables, reduced to `<` / `=`.  The
;; temps may be referenced twice (<=/>=) without re-evaluating operands.
(define (cmp-pair op x y)
  (case op
    [(=)  `(= ,x ,y)]
    [(<)  `(< ,x ,y)]
    [(>)  `(< ,y ,x)]
    [(<=) `(if (< ,x ,y) #t (= ,x ,y))]
    [(>=) `(if (< ,y ,x) #t (= ,x ,y))]))

(define (expand-cond clauses)
  (if (null? clauses)
      #f
      (let ([cl (car clauses)])
        (cond
          [(eq? (car cl) 'else)
           `(begin ,@(map expand (cdr cl)))]
          [(null? (cdr cl))
           (error 'expand "cond bare-test clause not supported yet" cl)]
          [(eq? (cadr cl) '=>)
           (error 'expand "cond => clause not supported yet" cl)]
          [else
           `(if ,(expand (car cl))
                (begin ,@(map expand (cdr cl)))
                ,(expand-cond (cdr clauses)))]))))

(define (expand-and args)
  (cond
    [(null? args) #t]
    [(null? (cdr args)) (expand (car args))]
    [else `(if ,(expand (car args)) ,(expand-and (cdr args)) #f)]))

(define (expand-or args)
  (cond
    [(null? args) #f]
    [(null? (cdr args)) (expand (car args))]
    [else
     (let ([t (fresh-name 'or)])
       `(let ([,t ,(expand (car args))])
          (if ,t ,t ,(expand-or (cdr args)))))]))

(define (expand-when test body)
  `(if ,(expand test) (begin ,@(map expand body)) #f))

(define (expand-unless test body)
  `(if ,(expand test) #f (begin ,@(map expand body))))

(define (expand-let* binds body)
  (if (null? binds)
      `(begin ,@(map expand body))
      (let ([b (car binds)])
        `(let ([,(car b) ,(expand (cadr b))])
           ,(expand-let* (cdr binds) body)))))

(define (expand-let-form head binds body)
  `(,head ,(map (lambda (b) (list (car b) (expand (cadr b)))) binds)
          ,@(map expand body)))

(define (expand-named-let name binds body)
  `(letrec ([,name (lambda ,(map car binds) ,@(map expand body))])
     (,name ,@(map (lambda (b) (expand (cadr b))) binds))))
