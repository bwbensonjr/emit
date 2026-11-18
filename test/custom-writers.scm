;; Generic custom record writers: context, recursion, graphs, and recovery.
(import (scheme base) (scheme write) (scheme read) (scheme file)
        (scheme process-context) (emit write))

(define checks 0)
(define (check actual expected)
  (if (not (equal? actual expected))
      (error "custom writer check failed" (+ checks 1) actual expected))
  (set! checks (+ checks 1)))
(define (fails thunk)
  (guard (e (else #t)) (thunk) #f))
(define (render value . operation)
  (let ((port (open-output-string)))
    ((if (null? operation) write (car operation)) value port)
    (get-output-string port)))

(define-record-type parcel (make-parcel value) parcel?
  (value parcel-value set-parcel-value!))
(define-record-type opaque (make-opaque) opaque?)
(define old (make-parcel 1))
(define calls 0)
(define seen-mode #f)
(define seen-port #f)
(define saved-recur #f)
(define (parcel-writer value port mode recur)
  (set! calls (+ calls 1))
  (set! seen-mode mode)
  (set! seen-port port)
  (set! saved-recur recur)
  (display "<" port)
  (recur (parcel-value value))
  (display ">" port)
  'ignored)

(check (render old) "#<record parcel>")
(check (render (make-opaque)) "#<record opaque>")
(set-record-type-writer! old parcel-writer)
(check (render old) "<1>")
(check (render (make-parcel 2)) "<2>")
(check (render (make-opaque)) "#<record opaque>")
(check (fails (lambda () (set-record-type-writer! 1 parcel-writer))) #t)
(check (fails (lambda () (set-record-type-writer! old 1))) #t)
(check (render old) "<1>")
(check (eqv? old old) #t)
(check (equal? old (make-parcel 1)) #f)
(let ((before calls))
  (equal? old old)
  (eqv? old old)
  (check calls before))
(set! calls 0)
(check (render (list old)) "(<1>)")
(check calls 1)
(check (render (vector old (make-parcel (make-parcel 3)))) "#(<1> <<3>>)")
(check (render '#(1 2)) "#(1 2)")
(check (render (make-parcel "x")) "<\"x\">")
(check seen-mode 'write)
(check (render (make-parcel "x") display) "<x>")
(check seen-mode 'display)
(check (render old write-simple) "<1>")
(check seen-mode 'write-simple)
(check (render old write-shared) "<1>")
(check seen-mode 'write-shared)
(let ((destination (open-output-string)) (unrelated (open-output-string)))
  (parameterize ((current-output-port unrelated))
    (write old destination)
    (check (eq? seen-port destination) #t)
    (check (eq? (current-output-port) unrelated) #t))
  (check (get-output-string destination) "<1>")
  (check (get-output-string unrelated) "")
  (display "still-open" destination)
  (check (get-output-string destination) "<1>still-open"))
(check (fails (lambda () (saved-recur 9))) #t)
(let* ((path (get-environment-variable "EMIT_CUSTOM_WRITER_FILE"))
       (port (open-output-file path)))
  (write old port)
  (check (eq? seen-port port) #t)
  (close-port port)
  (let ((input (open-input-file path)))
    (check (read-line input) "<1>")
    (close-port input)))

;; Child callbacks expire before their enclosing writer returns.
(define-record-type outer (make-outer child) outer? (child outer-child))
(define inner-expired #f)
(set-record-type-writer! (make-outer old)
  (lambda (object port mode recur)
    (recur (outer-child object))
    (set! inner-expired (fails (lambda () (saved-recur 8))))))
(check (render (make-outer old)) "<1>")
(check inner-expired #t)

;; Custom record reentry is bounded, including through ordinary graphs.
(define self (make-parcel #f))
(set-parcel-value! self self)
(check (render self) "<#<cycle parcel>>")
(check (render self write-simple) "<#<cycle parcel>>")
(check (render self write-shared) "<#<cycle parcel>>")
(set-record-type-writer! self
  (lambda (object port mode recur) (write object port)))
(check (render self) "#<cycle parcel>")
(set-record-type-writer! self parcel-writer)
(define first (make-parcel #f))
(define second (make-parcel first))
(set-parcel-value! first second)
(check (render first) "<<#<cycle parcel>>>")
(define through-list (list old))
(set-parcel-value! old through-list)
(check (render through-list) "(<(#<cycle parcel>)>)")
(set-parcel-value! old 1)
(check (render (list old old)) "(<1> <1>)")

;; Nested printing cannot overwrite an outer traversal's labels or destination.
(define cycle (cons 'x '()))
(set-cdr! cycle cycle)
(define-record-type nested (make-nested) nested?)
(define nested-other "")
(set-record-type-writer! (make-nested)
  (lambda (object port mode recur)
    (let ((other (open-output-string)))
      (write cycle other)
      (set! nested-other (get-output-string other)))
    (display "[" port)
    (write 'same-port port)
    (recur 7)
    (display "]" port)))
(check (render (list cycle (make-nested) cycle) write-shared)
       "(#0=(x . #0#) [same-port7] #0#)")
(check nested-other "#0=(x . #0#)")
(let* ((child (list 'a))
       (text (render (list child child) write-shared))
       (copy (read (open-input-string text))))
  (check (eq? (car copy) (car (cdr copy))) #t))

;; Failure and escape must clean up active records and callback lifetimes.
(define-record-type unstable (make-unstable) unstable?)
(define problem (make-unstable))
(define fail-now #t)
(define escaped-recur #f)
(set-record-type-writer! problem
  (lambda (object port mode recur)
    (set! escaped-recur recur)
    (if fail-now
        (begin (display "partial" port) (error "writer-raised"))
        (display "recovered" port))))
(define partial-output (open-output-string))
(check (fails (lambda () (write problem partial-output))) #t)
(check (get-output-string partial-output) "partial")
(check (fails (lambda () (escaped-recur 1))) #t)
(set! fail-now #f)
(check (render problem) "recovered")
(set-record-type-writer! problem
  (lambda (object port mode recur) (car 1)))
(check (fails (lambda () (render problem))) #t)
(set-record-type-writer! problem
  (lambda (object port mode recur) (display "after-trap" port)))
(check (render problem) "after-trap")
(check
  (call/cc
    (lambda (escape)
      (set-record-type-writer! problem
        (lambda (object port mode recur)
          (set! escaped-recur recur)
          (escape 'escaped)))
      (render problem)
      'unreachable))
  'escaped)
(check (fails (lambda () (escaped-recur 1))) #t)
(set-record-type-writer! problem
  (lambda (object port mode recur) (display "after-escape" port)))
(check (render problem) "after-escape")
(set-record-type-writer! old #f)
(check (render old) "#<record parcel>")
(set-record-type-writer! old
  (let ((prefix "captured:"))
    (lambda (object port mode recur)
      (display prefix port)
      (recur (parcel-value object)))))
(check (render (make-parcel 5)) "captured:5")

;; Nested unwinding must preserve the still-active enclosing writer.
(define-record-type item (make-item x) item? (x item-x))
(define-record-type envelope (make-envelope x) envelope? (x envelope-x))
(define child (make-item 4))
(define parent (make-envelope child))
(define saved #f)
(set-record-type-writer! parent
 (lambda (obj p mode recur)
  (set-record-type-writer! child
   (lambda (obj p mode recur) (set! saved recur) (error "inner")))
  (check (fails (lambda () (recur child))) #t)
  (check (fails (lambda () (saved 2))) #t)
  (set-record-type-writer! child
   (lambda (obj p mode recur) (recur (item-x obj))))
  (recur child)
  (let ((answer
    (call/cc (lambda (escape)
      (set-record-type-writer! child
       (lambda (obj p mode recur) (set! saved recur) (escape 'escaped)))
      (recur child)
      'bad))))
   (check answer 'escaped))
  (check (fails (lambda () (saved 2))) #t)
  (set-record-type-writer! child
   (lambda (obj p mode recur) (recur (item-x obj))))
  (recur child)))
(define p (open-output-string))
(write parent p)
(check (get-output-string p) "44")
;; A writer may grow the port table while its destination is in active use.
(set-record-type-writer! child
 (lambda (obj p mode recur)
   (let loop ((n 100)) (if (> n 0) (begin (open-output-string) (loop (- n 1)))))
   (recur (item-x obj))))
(define p2 (open-output-string))
(write child p2)
(check (get-output-string p2) "4")
;; Closing an explicit destination does not turn later writes into memory output.
(set-record-type-writer! child
 (lambda (obj p mode recur) (close-port p) (recur (item-x obj))))
(check (fails (lambda () (write child (open-output-string)))) #t)

;; A retired renderer stays expired while a later same-depth callback is live.
(define retired-recur #f)
(set-record-type-writer! child
 (lambda (obj port mode recur) (set! retired-recur recur) (recur 4)))
(check (render child) "4")
(set-record-type-writer! child
 (lambda (obj port mode recur)
   (check (fails (lambda () (retired-recur 99))) #t)
   (recur 5)))
(check (render child) "5")

;; Grow a nested table while outer shared labels remain live, then reuse it.
(define growth
  (let loop ((n 300) (result '()))
    (if (= n 0) result (loop (- n 1) (cons n result)))))
(set-record-type-writer! parent
 (lambda (obj port mode recur)
   (let* ((text (render (list growth growth) write-shared))
          (copy (read (open-input-string text))))
     (check (eq? (car copy) (car (cdr copy))) #t)
     (check (length (car copy)) 300))
   (recur 7)))
(check (render (list cycle parent cycle) write-shared)
       "(#0=(x . #0#) 7 #0#)")
(check (render '(small after growth)) "(small after growth)")

;; Every supported unwind discards grown nested graph state, not outer labels.
(for-each
 (lambda (kind)
   (set-record-type-writer! parent
    (lambda (obj port mode recur)
      (let ((answer
        (call/cc
         (lambda (escape)
           (set-record-type-writer! problem
            (lambda (obj port mode recur)
              (set! escaped-recur recur)
              ;; The enclosing list's scan has already grown its table.
              (if (eq? kind 'escape) (escape 'escaped)
                  (if (eq? kind 'trap) (car 1) (error "grown-writer")))))
           (fails (lambda () (render (cons problem growth))))))))
        (check answer (if (eq? kind 'escape) 'escaped #t)))
      (check (fails (lambda () (escaped-recur 88))) #t)
      (recur 8)))
   (check (render (list cycle parent cycle) write-shared)
          "(#0=(x . #0#) 8 #0#)")
   (check (render '#(after unwind)) "#(after unwind)"))
 '(raise trap escape))

;; Opaque records and ordinary modes keep working across registration changes.
(set-record-type-writer! child #f)
(for-each
 (lambda (operation)
   (check (render (list child '#(1 2)) operation)
          "(#<record item> #(1 2))"))
 (list write display write-simple write-shared))

(list 'custom-writers-complete checks)
