;;; convert-assignments.ss (task 3.2) -- remove set! by boxing variables that need
;;; a mutable location.
;;;   ref x        => (primcall unbox x)      [x boxed]
;;;   (set! x e)   => (primcall set-box! x e)
;;;   binder of boxed x: rename to temp, (primcall box temp) just inside body
;;; Boxes are ordinary primcalls (rt_box/rt_unbox/rt_set_box), lowering to a
;;; dedicated 1-slot box object at runtime (design R2).
;;;
;;; TWO things put a variable in a box:
;;;   * it is `set!` somewhere (the original job of this pass), and
;;;   * it is letrec-bound to something that is not a lambda (issue #9) -- `lower`
;;;     lowers a letrec group through the two-phase closure-block protocol, which
;;;     only makes sense for lambdas, so a non-lambda binding is given a location
;;;     instead and filled in binding order.
;;; Either way the binding leaves the letrec group (see the letrec clause below),
;;; so what reaches `lower` as a closure block is always all-lambda.

(define (find-assigned e)
  (define (fa e) (find-assigned e))
  (match e
    [(const ,d) '()]
    [,x (guard (symbol? x)) '()]
    [(if ,a ,b ,c) (union (fa a) (union (fa b) (fa c)))]
    [(seq ,a ,b) (union (fa a) (fa b))]
    [(set! ,x ,rhs) (union (list x) (fa rhs))]
    [(global-ref ,s) '()]
    [(global-set! ,s ,rhs) (fa rhs)]
    [(primcall ,op . ,args) (union* (map fa args))]
    [(lambda ,params ,body) (fa body)]
    [(let ,binds ,body) (union (union* (map (lambda (b) (fa (cadr b))) binds)) (fa body))]
    [(letrec ,binds ,body) (union (union* (map (lambda (b) (fa (cadr b))) binds)) (fa body))]
    [(apply ,f . ,args) (union (fa f) (union* (map fa args)))]
    [(call ,f . ,args) (union (fa f) (union* (map fa args)))]))

;; letrec-bound names whose initializer is not a lambda (issue #9).  Collected
;; globally by name, which is sound because the IL is alpha-renamed before this
;; pass -- the same assumption `find-assigned` already makes.
(define (find-letrec-boxed e)
  (define (fb e) (find-letrec-boxed e))
  (define (binds-of bs) (union* (map (lambda (b) (fb (cadr b))) bs)))
  (match e
    [(const ,d) '()]
    [,x (guard (symbol? x)) '()]
    [(if ,a ,b ,c) (union (fb a) (union (fb b) (fb c)))]
    [(seq ,a ,b) (union (fb a) (fb b))]
    [(set! ,x ,rhs) (fb rhs)]
    [(global-ref ,s) '()]
    [(global-set! ,s ,rhs) (fb rhs)]
    [(primcall ,op . ,args) (union* (map fb args))]
    [(lambda ,params ,body) (fb body)]
    [(let ,binds ,body) (union (binds-of binds) (fb body))]
    [(letrec ,binds ,body)
     (union (map car (filter (lambda (b) (not (il-lambda? (cadr b)))) binds))
            (union (binds-of binds) (fb body)))]
    [(apply ,f . ,args) (union (fb f) (union* (map fb args)))]
    [(call ,f . ,args) (union (fb f) (union* (map fb args)))]))

(define (il-lambda? e) (and (pair? e) (eq? (car e) 'lambda)))

(define (convert-assignments prog)
  (define assigned (find-assigned prog))
  (define boxed-names (union assigned (find-letrec-boxed prog)))
  (define (asgd? x) (mem? x boxed-names))
  ;; rename assigned binders to temps, box them at the top of the (converted)
  ;; body; return (list new-binders new-body)
  (define (rebind xs body)
    (let loop ([xs xs] [nx '()] [as '()] [ts '()])
      (if (null? xs)
          (let ([nx (reverse nx)] [as (reverse as)] [ts (reverse ts)])
            (if (null? as)
                (list nx body)
                (list nx
                  `(let ,(map (lambda (a t) (list a `(primcall box ,t))) as ts) ,body))))
          (let ([x (car xs)])
            (if (asgd? x)
                (let ([t (fresh-name x)]) (loop (cdr xs) (cons t nx) (cons x as) (cons t ts)))
                (loop (cdr xs) (cons x nx) as ts))))))
  (define (cvt e)
    (match e
      [(const ,d) e]
      [,x (guard (symbol? x)) (if (asgd? x) `(primcall unbox ,x) x)]
      [(global-ref ,s) e]
      [(global-set! ,s ,rhs) `(global-set! ,s ,(cvt rhs))]
      [(set! ,x ,rhs) `(primcall set-box! ,x ,(cvt rhs))]
      [(if ,a ,b ,c) `(if ,(cvt a) ,(cvt b) ,(cvt c))]
      [(seq ,a ,b) `(seq ,(cvt a) ,(cvt b))]
      [(primcall ,op . ,args) `(primcall ,op ,@(map cvt args))]
      [(lambda ,params ,body)                    ; params may be variadic
       (let ([rest (param-rest params)])
         (let* ([nx+body (rebind (param-names params) (cvt body))]
                [nx (car nx+body)] [body^ (cadr nx+body)])
           (if rest
               (let ([nrest  (list-ref nx (- (length nx) 1))]
                     [nfixed (list-head nx (- (length nx) 1))])
                 `(lambda ,(rebuild-params nfixed nrest) ,body^))
               `(lambda ,nx ,body^))))]
      [(let ,binds ,body)
       (let ([xs (map car binds)] [es (map (lambda (b) (cvt (cadr b))) binds)])
         (let* ([nx+body (rebind xs (cvt body))]
                [nx (car nx+body)] [body^ (cadr nx+body)])
           `(let ,(map list nx es) ,body^)))]
      ;; Split the group: bindings that need no box stay in the letrec, so
      ;; recursive functions keep their closure-block lowering (and stay inlinable
      ;; by `simplify`); the rest move to an enclosing `let` of boxes filled by
      ;; `set-box!` inside the letrec body, in binding order.  That is the shape
      ;; `build-program` already uses for mixed top-level defines.
      ;;
      ;; Two kinds of binding take the boxed path, for different reasons:
      ;;   * ASSIGNED (issue #8).  The pass used to assume letrec names are never
      ;;     set! and skip rebinding them -- but `find-assigned` does report them,
      ;;     so every reference still became `(unbox f)` and every assignment
      ;;     `(set-box! f e)` against a binder that was never boxed.  Those ran on
      ;;     the raw closure (rt_unbox reads word 0 = its CODE POINTER), so
      ;;     calling a redefined top-level function crashed.
      ;;   * NON-LAMBDA (issue #9).  `lower` lowers a letrec group through the
      ;;     two-phase closure-block protocol, which only makes sense for lambdas;
      ;;     it used to reject anything else with an internal `match` failure, so
      ;;     `(letrec ((x (car (list 1 2)))) x)` -- legal R7RS -- crashed the
      ;;     compiler.  A location holds the value instead.
      ;;
      ;; What stays in the letrec is therefore always all-lambda, which is what
      ;; `lower` requires.  Hoisting those lambdas ahead of the boxed initializers
      ;; is unobservable because creating a closure is pure and cannot read what it
      ;; captures; the boxed ones keep their source order among themselves, which
      ;; is the left-to-right initialization R7RS `letrec*` specifies.  A boxed
      ;; binding starts as '(), so an initializer that reads a later one -- an
      ;; error under R7RS -- sees '() rather than crashing.
      [(letrec ,binds ,body)
       (let ([boxed (filter (lambda (b) (asgd? (car b))) binds)]
             [keep  (filter (lambda (b) (not (asgd? (car b)))) binds)])
         (if (null? boxed)
             `(letrec ,(map (lambda (b) (list (car b) (cvt (cadr b)))) binds) ,(cvt body))
             (let* ([filled (fold-right
                              (lambda (b acc)
                                `(seq (primcall set-box! ,(car b) ,(cvt (cadr b))) ,acc))
                              (cvt body) boxed)]
                    [inner (if (null? keep)
                               filled
                               `(letrec ,(map (lambda (b) (list (car b) (cvt (cadr b)))) keep)
                                  ,filled))])
               `(let ,(map (lambda (b) (list (car b) '(primcall box (const ())))) boxed)
                  ,inner))))]
      [(apply ,f . ,args) `(apply ,(cvt f) ,@(map cvt args))]
      [(call ,f . ,args) `(call ,(cvt f) ,@(map cvt args))]))
  (cvt prog))
