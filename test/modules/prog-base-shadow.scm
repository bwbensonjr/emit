;;; prog-base-shadow.scm -- a user define shadows the auto-imported prelude name. => mine
(define (map f xs) 'mine)
(map (lambda (x) x) (list 1 2 3))
