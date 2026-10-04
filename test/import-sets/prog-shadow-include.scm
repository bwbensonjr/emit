;;; prog-shadow-include.scm -- a parameter named include shadows the keyword. => 1
(define (k include) (include "x"))
(k (lambda (s) (string-length s)))
