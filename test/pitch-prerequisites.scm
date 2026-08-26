;;; Focused integration fixture for the audited Pitch/R7RS intersection.
;;; This is deliberately not Pitch code; it only exercises the standard shapes
;;; the later port will consume.
(import (scheme base)
        (scheme case-lambda)
        (scheme char)
        (scheme process-context)
        (scheme write))

(define dispatch
  (case-lambda
    (() 'zero)
    ((x) x)
    ((x y . rest) (list x y rest))
    (args (length args))))

(define warning-result
  (with-exception-handler
    (lambda (warning) (if (string? warning) 42 0))
    (lambda () (+ (raise-continuable "replace token") 23))))

(define shared-text
  (let ((port (open-output-string)) (node (list 'shared)))
    (write-shared (list node node) port)
    (get-output-string port)))

(list (list (dispatch) (dispatch 'one) (dispatch 'a 'b 'c 'd))
      (list (char-alphabetic? #\x03bb)
            (char-whitespace? #\x2003)
            (digit-value #\x0664)
            (char-general-category #\x03bb)
            (string-foldcase "Straße"))
      warning-result
      (command-line)
      shared-text)
