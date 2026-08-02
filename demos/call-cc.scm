; escape continuations and dynamic-wind (change: dynamic-extent).  call/cc here
; captures an ESCAPE continuation -- valid only within the extent of the call/cc
; that made it -- which is enough for early exit, and enough to make cleanup
; observable.  Each element below is a different way out of a dynamic-wind, and
; each trace proves the `after` thunk ran anyway (innermost first).

; early exit: abandon the for-each as soon as the predicate holds
(define (first-big xs)
  (call/cc (lambda (return)
             (for-each (lambda (x) (if (> x 2) (return x))) xs)
             'none)))

; a continuation never invoked: call/cc just returns the procedure's value
(define (no-escape) (call/cc (lambda (k) 'fell-through)))

; recording winds: each returns the trace of the steps that actually ran
(define (trace-normal)
  (let ([log '()])
    (define (note x) (set! log (cons x log)))
    (dynamic-wind (lambda () (note 'before))
                  (lambda () (note 'body))
                  (lambda () (note 'after)))
    (reverse log)))

; escaping past two winds: both afters run, inner before outer, before the
; call/cc return point is reached
(define (trace-escape)
  (let ([log '()])
    (define (note x) (set! log (cons x log)))
    (call/cc (lambda (k)
               (dynamic-wind (lambda () (note 'outer-before))
                             (lambda ()
                               (dynamic-wind (lambda () (note 'inner-before))
                                             (lambda () (k 'escaped))
                                             (lambda () (note 'inner-after))))
                             (lambda () (note 'outer-after)))))
    (reverse log)))

; a raise crossing a wind: the after thunk runs BEFORE the guard clause sees the
; object, so the trace is already complete when the handler records the catch
(define (trace-raise)
  (let ([log '()])
    (define (note x) (set! log (cons x log)))
    (guard (e (#t (note 'caught)))
      (dynamic-wind (lambda () (note 'before))
                    (lambda () (raise 'boom))
                    (lambda () (note 'after))))
    (reverse log)))

(list (first-big (list 1 2 3 4))   ; 3
      (no-escape)                  ; fell-through
      (trace-normal)               ; (before body after)
      (trace-escape)               ; (outer-before inner-before inner-after outer-after)
      (trace-raise))               ; (before after caught)
