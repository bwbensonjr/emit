; `case` (matching clause + else fall-through) and the cxr combinators
; (caar/cadr/caddr/cadar plus a cdar), summed to one deterministic result.
;
; The depth-3 forms live in (scheme cxr), which R7RS-small is where they belong and
; where Emit now puts them too (change: scheme-base-partition, issue #33); the depth-2
; forms caar/cadr/cdar/cddr stay in the auto-imported (scheme base), so this demo needs
; the import for `caddr` and `cadar` but not for the others.
(import (scheme cxr))

(define (classify n)
  (case n
    ((0) 100)
    ((1 2 3) 200)
    ((4 5) 300)
    (else 999)))

(define data '((1 2) 3 4 5))

(+ (classify 2)                     ; 200  matches (1 2 3)
   (classify 5)                     ; 300  matches (4 5)
   (classify 42)                    ; 999  else
   (caar data)                      ; 1    (car (car data))
   (cadr data)                      ; 3    (car (cdr data))
   (caddr data)                     ; 4    (car (cddr data))
   (car (cdar data))                ; 2    (cdar data = (2))
   (cadar data))                    ; 2    (car (cdr (car data)))
