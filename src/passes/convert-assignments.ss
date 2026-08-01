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

;; Every symbol occurring in reference position in `e`.  The IL is alpha-renamed
;; before this pass, so a name identifies its binding uniquely and no scope
;; tracking is needed.
(define (il-refs e)
  (define (r e) (il-refs e))
  (define (r* es) (union* (map r es)))
  (match e
    [(const ,d) '()]
    [,x (guard (symbol? x)) (list x)]
    [(global-ref ,s) '()]
    [(global-set! ,s ,rhs) (r rhs)]
    [(set! ,x ,rhs) (union (list x) (r rhs))]
    [(if ,a ,b ,c) (r* (list a b c))]
    [(seq ,a ,b) (r* (list a b))]
    [(primcall ,op . ,args) (r* args)]
    [(lambda ,params ,body) (r body)]
    [(let ,binds ,body) (union (r* (map cadr binds)) (r body))]
    [(letrec ,binds ,body) (union (r* (map cadr binds)) (r body))]
    [(apply ,f . ,args) (r* (cons f args))]
    [(call ,f . ,args) (r* (cons f args))]))

(define (il-lambda? e) (and (pair? e) (eq? (car e) 'lambda)))

;; Split one letrec group three ways, in binding order (P7).  `assigned` is the
;; set of names the PROGRAM assigns -- not the set that ends up boxed, which is
;; what this computes.
;;
;;   keep  -- an unassigned lambda: stays in the letrec, lowered as a closure
;;            block, so recursion and `simplify`'s inlining are unaffected
;;   plain -- an unassigned non-lambda whose initializer references nothing in the
;;            group except an EARLIER plain binding: an ordinary nested `let`
;;            binding, no location at all
;;   boxed -- everything else: a '()-box filled by `set-box!` in binding order
;;
;; The `plain` test is what it is because of where each part is emitted: plain
;; bindings nest OUTSIDE, so their initializers run before the closures exist and
;; before any box is filled.  Referencing an earlier plain binding is therefore
;; fine and anything else in the group is not.  A binding that fails the test is
;; boxed, which is always correct -- the rule only ever trades precision away.
(define (classify-letrec binds assigned)
  (let ([names (map car binds)])
    (let loop ([bs binds] [plain '()] [boxed '()] [keep '()])
      (if (null? bs)
          (list (reverse plain) (reverse boxed) (reverse keep))
          (let ([b (car bs)])
            (cond
              [(mem? (car b) assigned) (loop (cdr bs) plain (cons b boxed) keep)]
              [(il-lambda? (cadr b))   (loop (cdr bs) plain boxed (cons b keep))]
              [(null? (filter (lambda (x)
                                (and (mem? x names) (not (mem? x (map car plain)))))
                              (il-refs (cadr b))))
               (loop (cdr bs) (cons b plain) boxed keep)]
              [else (loop (cdr bs) plain (cons b boxed) keep)]))))))

;; the letrec bindings that end up boxed, program-wide -- these need `unbox` at
;; every reference, exactly like an assigned variable
(define (find-letrec-boxed e assigned)
  (define (fb e) (find-letrec-boxed e assigned))
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
     (union (map car (cadr (classify-letrec binds assigned)))
            (union (binds-of binds) (fb body)))]
    [(apply ,f . ,args) (union (fb f) (union* (map fb args)))]
    [(call ,f . ,args) (union (fb f) (union* (map fb args)))]))

(define (convert-assignments prog)
  (define assigned (find-assigned prog))
  (define boxed-names (union assigned (find-letrec-boxed prog assigned)))
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
      ;; The three-way split (see classify-letrec).  What stays in the letrec is
      ;; always all-lambda, which is what `lower` requires; the rest becomes plain
      ;; nested `let` bindings or '()-boxes.  Three histories meet here:
      ;;   * ASSIGNED (issue #8) -- a letrec binder that IS set! must be boxed.
      ;;     This pass used to assume letrec names never are, so references still
      ;;     became `(unbox f)` against a binder that was never boxed, i.e. against
      ;;     the raw closure (rt_unbox reads word 0 = its CODE POINTER).
      ;;   * NON-LAMBDA (issue #9) -- `lower` lowers a letrec group through the
      ;;     two-phase closure-block protocol, which only makes sense for lambdas.
      ;;   * NEITHER (P7) -- a non-lambda binding that is never assigned and whose
      ;;     initializer needs nothing from the group does not need a location at
      ;;     all.  It used to get one anyway, which is why `(define n 1)` cost a
      ;;     heap box and an `unbox` per read: `build-program` desugared it to
      ;;     `set!`, so it merely LOOKED assigned.  build-program now hands over a
      ;;     plain letrec group and this is where the question is settled.
      [(letrec ,binds ,body)
       (let* ([c     (classify-letrec binds assigned)]
              [plain (car c)] [boxed (cadr c)] [keep (caddr c)]
              ;; innermost: fill the boxes in binding order, then the body
              [filled (fold-right
                        (lambda (b acc)
                          `(seq (primcall set-box! ,(car b) ,(cvt (cadr b))) ,acc))
                        (cvt body) boxed)]
              ;; the closure block, if any lambda survived unassigned
              [with-fns (if (null? keep)
                            filled
                            `(letrec ,(map (lambda (b) (list (car b) (cvt (cadr b)))) keep)
                               ,filled))]
              [with-boxes (if (null? boxed)
                              with-fns
                              `(let ,(map (lambda (b)
                                            (list (car b) '(primcall box (const ()))))
                                          boxed)
                                 ,with-fns))])
         ;; plain bindings nest OUTSIDE, in binding order, so a later initializer
         ;; can read an earlier one and letrec* order is preserved
         (fold-right (lambda (b acc) `(let ((,(car b) ,(cvt (cadr b)))) ,acc))
                     with-boxes plain))]
      [(apply ,f . ,args) `(apply ,(cvt f) ,@(map cvt args))]
      [(call ,f . ,args) `(call ,(cvt f) ,@(map cvt args))]))
  (cvt prog))
