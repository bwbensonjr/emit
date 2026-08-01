;;; prog-mutlib.scm -- an importer observes (mutlib)'s assignments to its own
;;; top-level bindings (issue #14).  => (2 101 101 8 701 1001)
;;;
;;; The two `f` calls are the test that matters: they are the same call site shape
;;; before and after `bump`, so a second value of 2 would mean the call was lowered
;;; to a direct call on `mutlib:code:f` and kept running the closure the slot held at
;;; link time -- the silent misdispatch the withheld export row exists to prevent.
(import (mutlib))

(define f-before (f 1))
(define h-before (h 1))
(bump)
(bump-h)
(list f-before (f 1) (call-f 1) h-before (h 1) (g 1))
