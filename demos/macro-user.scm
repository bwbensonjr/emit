; user-defined macros via define-syntax / syntax-rules:
;   swap!  -- a set!-based macro with an introduced temporary
;   my+    -- recursive ellipsis (variadic, expands to nested +)
;   my-let -- ellipsis over binding pairs ((n v) ...) -> immediate lambda
(define-syntax swap!
  (syntax-rules ()
    ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))

(define-syntax my+
  (syntax-rules ()
    ((_) 0)
    ((_ e rest ...) (+ e (my+ rest ...)))))

(define-syntax my-let
  (syntax-rules ()
    ((_ ((n v) ...) body ...) ((lambda (n ...) body ...) v ...))))

(define x 10)
(define y 3)
(swap! x y)                                     ; x=3, y=10
(list x y                                       ; 3 10
      (my+ 1 2 3 4)                             ; 10
      (my-let ((a 5) (b 6)) (+ a b)))           ; 11  -> (3 10 10 11)
