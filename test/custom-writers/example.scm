;; Keep this fixture synchronized with docs/CUSTOM-WRITERS.md.
(import (scheme base) (emit write))

(define-record-type point
  (make-point x y)
  point?
  (x point-x)
  (y point-y))

(set-record-type-writer! (make-point 0 0)
  (lambda (value port mode recur)
    (display "(point " port)
    (recur (point-x value))
    (display " " port)
    (recur (point-y value))
    (display ")" port)))

(list (make-point 2 3) (vector (make-point 4 5)))
