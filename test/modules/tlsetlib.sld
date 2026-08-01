;;; tlsetlib.sld -- a library whose body assigns its own top-level binding from a
;;; TOP-LEVEL command (changes: library-toplevel-set + library-body-declarations).
;;;
;;; library-toplevel-set (issue #14) permitted the assignment but could only reach it
;;; from inside a procedure body, because a top-level `set!` is a command and commands
;;; were dropped (issue #16).  This is the interaction fixture for both, and it caught
;;; a real defect: a top-level `(set! f (lambda ...))` sits in the same IL position as
;;; a define's initializer, so `lower-top` handed it the stable label `tlset:code:f` a
;;; SECOND time and clang rejected the unit ("invalid redefinition of function").
;;; Only a definition may take that label -- hence `definition?`.
;;;
;;; `g` is the control: same fixed-arity shape, never assigned, so it keeps its
;;; direct-call row while `f` loses its.
(define-library (tlsetlib)
  (export f g)
  (begin
    (define (f x) (%+ x 1))
    (set! f (lambda (x) (%+ x 100)))
    (define (g x) (%+ x 1000))))
