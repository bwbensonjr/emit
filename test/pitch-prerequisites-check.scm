(import (scheme base)
        (scheme case-lambda)
        (scheme char)
        (scheme process-context)
        (scheme write))

(define (check name actual expected)
  (if (equal? actual expected) #t (error name "mismatch" actual expected)))

;;; The three issue #91 shapes are intentionally literal here.
(define any-arity
  (case-lambda (() 'zero) ((x) x) ((x y) (cons x y)) (args args)))
(define rest-arity
  (case-lambda (() '(zero)) ((x) (list 'one x)) ((x . xs) (cons 'many xs))))
(define dead-clause
  (case-lambda ((x . y) 'many) (() 'none) (foo 'unreachable)))
(define first-match
  (case-lambda ((x . rest) 'first) ((x y) 'second)))
(define multi
  (case-lambda ((x) (values x (+ x 1)))))

(check 'case-lambda
       (list (any-arity) (any-arity 7) (any-arity 1 2 3)
             (rest-arity 1 2 3) (dead-clause) (dead-clause 1 2)
             (first-match 1 2)
             (let ((captured 9))
               ((case-lambda ((x) (+ captured x))) 1))
             (call-with-values (lambda () (multi 8)) list)
             (guard (e (#t 'caught)) ((case-lambda (() 'no)) 1)))
       '(zero 7 (1 2 3) (many 2 3) none many first 10 (8 9) caught))

(check 'unicode-properties
       (list (char-alphabetic? #\x03bb)
             (char-alphabetic? #\x05b0)
             (char-numeric? #\x0664)
             (char-whitespace? #\x2003)
             (char-upper-case? #\x039b)
             (char-lower-case? #\x03bb)
             (digit-value #\3)
             (digit-value #\x0664)
             (digit-value #\x0ae6)
             (digit-value #\x03bb))
       '(#t #t #t #t #t #t 3 4 0 #f))

(check 'unicode-simple-case
       (list (char-upcase #\x03bb) (char-downcase #\x039b)
             (char-foldcase #\x212a) (char-upcase #\x2603)
             (char-ci=? #\x039b #\x03bb)
             (char-ci<? #\A #\b #\C)
             (char-ci>? #\c #\B #\a)
             (char-ci<=? #\a #\A #\b)
             (char-ci>=? #\c #\B #\a)
             (char-ci<=? #\c #\B #\d))
       (list #\x039b #\x03bb #\k #\x2603 #t #t #t #t #t #f))

(check 'unicode-full-case
       (list (string-upcase "Straße")
             (string-downcase "İ")
             (string-foldcase "Straße")
             (string-foldcase (string-foldcase "Straße"))
             (string-ci=? "Straße" "STRASSE")
             (string-ci<? "A" "b" "C")
             (string-ci>? "c" "B" "a")
             (string-ci<=? "a" "A" "b")
             (string-ci>=? "c" "B" "a")
             (string-ci<? "a" "aa")
             (string-ci<=? "c" "B" "d"))
       (list "STRASSE" (string #\i #\x0307) "strasse" "strasse"
             #t #t #t #t #t #t #f))
(define long-fold (string-foldcase (make-string 10000 #\x212a)))
(check 'unicode-long-linear-case
       (list (string-length long-fold) (string-ref long-fold 0)
             (string-ref long-fold 9999))
       (list 10000 #\k #\k))

(define handled '())
(define wind-state '())
(define continuable-values
  (with-exception-handler
    (lambda (e)
      (set! handled (cons e handled))
      (if (eq? e 'many) (values 4 5) 42))
    (lambda ()
      (dynamic-wind
        (lambda () (set! wind-state (cons 'before wind-state)))
        (lambda ()
          (check 'continuable-warning (+ (raise-continuable 'one) 23) 65)
          (check 'continuable-wind-still-active (reverse wind-state) '(before))
          (call-with-values (lambda () (raise-continuable 'many)) list))
        (lambda () (set! wind-state (cons 'after wind-state)))))))
(check 'continuable-values continuable-values '(4 5))
(check 'continuable-chain (reverse handled) '(one many))
(check 'continuable-winds (reverse wind-state) '(before after))
(define nested-chain '())
(define nested-result
  (with-exception-handler
    (lambda (e) (set! nested-chain (cons e nested-chain)) 7)
    (lambda ()
      (with-exception-handler
        (lambda (e)
          (set! nested-chain (cons e nested-chain))
          (raise-continuable 'outer))
        (lambda () (raise-continuable 'inner))))))
(check 'continuable-nested-result nested-result 7)
(check 'continuable-nested-chain (reverse nested-chain) '(inner outer))
(check 'ordinary-raise-unchanged
       (guard (e ((eq? e 'ordinary) 'caught)) (raise 'ordinary)) 'caught)

(define shared (list 'x))
(define cycle (cons 'a '()))
(set-cdr! cycle cycle)
(define (render proc obj)
  (let ((p (open-output-string))) (proc obj p) (get-output-string p)))
(define (render-current proc obj)
  (let ((p (open-output-string)))
    (parameterize ((current-output-port p)) (proc obj))
    (get-output-string p)))
(check 'writers
       (list (render write (list shared shared))
             (render write-simple (list shared shared))
             (render write-shared (list shared shared))
             (render-current write-simple (list shared shared))
             (render-current write-shared (list shared shared))
             (render write cycle)
             (render display "a\"b"))
       '("((x) (x))" "((x) (x))" "(#0=(x) #0#)"
         "((x) (x))" "(#0=(x) #0#)" "#0=(a . #0#)" "a\"b"))
(define mixed-text (render write-shared (vector shared shared)))
(define mixed-read (read-from-string mixed-text))
(check 'shared-pair-vector-text mixed-text "#(#0=(x) #0#)")
(check 'shared-pair-vector-identity
       (eq? (vector-ref mixed-read 0) (vector-ref mixed-read 1)) #t)

(check 'environment (get-environment-variable "EMIT_PITCH_TEST") "present")
(check 'missing-environment
       (get-environment-variable "EMIT_PITCH_TEST_MISSING_934751") #f)
(check 'environment-shape
       (let loop ((xs (get-environment-variables)))
         (if (null? xs) #t
             (and (pair? (car xs)) (string? (caar xs)) (string? (cdar xs))
                  (loop (cdr xs)))))
       #t)

;;; command-line snapshots must not alias mutable Scheme strings.
(define first-command-line (command-line))
(define original-command (string-copy (car first-command-line)))
(string-set! (car first-command-line) 0 #\X)
(check 'command-line-snapshot (car (command-line)) original-command)
(check 'command-line-arguments (cdr (command-line)) '("--check" "" "-x"))

(display "pitch prerequisites: ok\n")
