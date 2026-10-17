;;; Focused SRFI 1/SRFI 227 acceptance input.
;;; Expected result: (6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))
(import (prefix (srfi 1) s1:)
        (srfi 227))

(define optional-value (opt-lambda (x (y 9)) (list x y)))

(list (s1:fold + 0 '(1 2 3))
      (s1:filter even? '(1 2 3 4))
      (s1:append-map (lambda (x) (list x (* 10 x))) '(1 2 3))
      (s1:caddr '(1 2 3 4))
      (s1:iota 4 2)
      (optional-value 'x)
      (optional-value 'x 10))
