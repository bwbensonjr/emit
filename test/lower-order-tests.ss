;;; Source-level label/body associations, not just equal executable results.
(import (chezscheme))
(include "src/match.scm")
(include "src/util.scm")
(include "src/parse.ss")
(include "src/passes/convert-closures.ss")
(include "src/passes/lower.ss")

(define pass 0)
(define fail 0)
(define (check name got want)
  (if (equal? got want)
      (begin (set! pass (+ pass 1)) (printf "  [OK  ] ~a\n" name))
      (begin (set! fail (+ fail 1))
             (printf "  [FAIL] ~a\n  got: ~s\n  expected: ~s\n" name got want))))

(define markers (iota 12))
(define nested
  (map (lambda (n) `(lambda () (lambda () (const ,n)))) markers))
(define (expected-bodies numbers)
  (apply append
    (map (lambda (n i)
           (let ([outer (string-append "code_" (number->string (* i 4)))]
                 [inner (string-append "code_" (number->string (+ 2 (* i 4))))])
             (list (list inner `(const ,n))
                   (list outer `(make-closure ,inner ())))))
         numbers (iota (length numbers)))))

(define (run name expression locals self expected)
  (reset-counter!)
  (set! *unit* program-unit)
  (set! *code-defs* '())
  (set! *known-closures* '((known "known-code" 12 #f #f)))
  (set-import-calls! '((imported "imported-code" 12 #f #f)))
  (lower expression locals '() self)
  (check name
    (map (lambda (code) (list (cadr code) (list-ref code 5)))
         (reverse *code-defs*))
    (expected-bodies expected)))

(printf "lowering visitation order tests\n")
(run "generic operator before wide operands"
     `(call ,(car nested) ,@(cdr nested)) '() #f markers)
(run "known call wide operands" `(call known ,@nested) '(known) #f markers)
(run "self call wide operands" `(call self ,@nested) '()
     '(self "self-code" 12 #f #f) markers)
(run "imported call wide operands" `(call (global-ref imported) ,@nested)
     '() #f markers)
(run "apply operator before wide operands"
     `(apply ,(car nested) ,@(cdr nested)) '() #f markers)
(run "primitive wide operands" `(primcall vector ,@nested) '() #f markers)
(run "binding initializers before body"
     `(let ,(map (lambda (n e) (list (string->symbol (format "x~a" n)) e))
                 (cdr markers) (cdr nested)) ,(car nested))
     '() #f (append (cdr markers) '(0)))
(run "if test before branches" `(if ,@(list-head nested 3)) '() #f '(0 1 2))
(run "sequence left before right" `(seq ,@(list-head nested 2)) '() #f '(0 1))

;; Library initializers have stable outer labels but counter-labelled inner code.
(reset-counter!)
(reset-unit-procs!)
(reset-unit-assigned!)
(let ([p (lower-program
           `(seq (global-set! first ,(car nested))
                 (global-set! second ,(cadr nested))) '(order))])
  (check "top-level initializer spine"
    (map (lambda (code) (list (cadr code) (list-ref code 5))) (cadr p))
    '(("order:code_1" (const 0))
      ("order:code:first" (make-closure "order:code_1" ()))
      ("order:code_4" (const 1))
      ("order:code:second" (make-closure "order:code_4" ())))))
(printf "lowering order: ~a passed, ~a failed\n" pass fail)
(exit (if (= fail 0) 0 1))
