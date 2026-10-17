(import (scheme base) (scheme char) (scheme inexact) (scheme read) (scheme write) (scheme process-context) (scheme file) (scheme cxr) (srfi 1) (srfi 64))

(define (list-sort less? xs) (if (null? xs) (quote ()) (let insert ((x (car xs)) (xs (list-sort less? (cdr xs)))) (if (null? xs) (list x) (let ((y (car xs)) (ys (cdr xs))) (if (less? x y) (cons x xs) (cons y (insert x ys))))))))

(define (written x) (cond-expand (r7rs (call-with-port (open-output-string) (lambda (out) (write x out) (get-output-string out)))) (else (call-with-output-string (lambda (out) (write x out))))))

(define (symbol<? a b) (string<? (symbol->string a) (symbol->string b)))

(define (call-with-false-on-error proc) (guard (_ (else #f)) (proc)))

(test-begin "srfi-1")

(test-equal (quote (a)) (cons (quote a) (quote ())))

(test-equal (quote ((a) b c d)) (cons (quote (a)) (quote (b c d))))

(test-equal (quote ("a" b c)) (cons "a" (quote (b c))))

(test-equal (quote (a . 3)) (cons (quote a) 3))

(test-equal (quote ((a b) . c)) (cons (quote (a b)) (quote c)))

(test-equal (quote (a 7 c)) (list (quote a) (+ 3 4) (quote c)))

(test-equal (quote ()) (list))

(test-equal (quote (a b c)) (xcons (quote (b c)) (quote a)))

(test-equal (quote (1 2 3 . 4)) (cons* 1 2 3 4))

(test-equal 1 (cons* 1))

(test-equal (quote (c c c c)) (make-list 4 (quote c)))

(test-equal (quote (0 1 2 3)) (list-tabulate 4 values))

(test-equal (quote (0 1 2 3 4)) (iota 5))

(test-equal #t (pair? (quote (a . b))))

(test-equal #t (pair? (quote (a b c))))

(test-equal #f (pair? (quote ())))

(test-equal #f (pair? (quote #(a b))))

(test-equal #f (pair? 7))

(test-equal #f (pair? (quote a)))

(test-equal #t (list= eq?))

(test-equal #t (list= eq? (quote (a))))

(test-equal #f (list= = (quote (1 2)) (quote (1 2 3))))

(test-equal #f (list= = (quote (1 2 3)) (quote (1 2))))

(test-equal (quote a) (car (quote (a b c))))

(test-equal (quote (b c)) (cdr (quote (a b c))))

(test-equal (quote (a)) (car (quote ((a) b c d))))

(test-equal (quote (b c d)) (cdr (quote ((a) b c d))))

(test-equal (quote 1) (car (quote (1 . 2))))

(test-equal (quote 2) (cdr (quote (1 . 2))))

(test-error (car (quote ())))

(test-error (cdr (quote ())))

(test-equal 1 (first (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 2 (second (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 3 (third (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 4 (fourth (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 5 (fifth (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 6 (sixth (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 7 (seventh (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 8 (eighth (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 9 (ninth (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal 10 (tenth (quote (1 2 3 4 5 6 7 8 9 10))))

(test-equal (quote c) (list-ref (quote (a b c d)) 2))

(test-equal (quote c) (third (quote (a b c d e))))

(test-equal (quote (a b)) (take (quote (a b c d e)) 2))

(test-equal (quote (c d e)) (drop (quote (a b c d e)) 2))

(test-equal (quote (1 2)) (take (quote (1 2 3 . d)) 2))

(test-equal (quote (3 . d)) (drop (quote (1 2 3 . d)) 2))

(test-equal (quote (1 2 3)) (take (quote (1 2 3 . d)) 3))

(test-equal (quote d) (drop (quote (1 2 3 . d)) 3))

(test-equal (quote (d e)) (take-right (quote (a b c d e)) 2))

(test-equal (quote (a b c)) (drop-right (quote (a b c d e)) 2))

(test-equal (quote (2 3 . d)) (take-right (quote (1 2 3 . d)) 2))

(test-equal (quote (1)) (drop-right (quote (1 2 3 . d)) 2))

(test-equal (quote d) (take-right (quote (1 2 3 . d)) 0))

(test-equal (quote (1 2 3)) (drop-right (quote (1 2 3 . d)) 0))

(test-equal (list (quote (a b c)) (quote (d e f g h))) (call-with-values (lambda () (split-at (quote (a b c d e f g h)) 3)) list))

(test-equal (quote c) (last (quote (a b c))))

(test-equal (quote (c)) (last-pair (quote (a b c))))

(test-equal (quote (x y)) (append (quote (x)) (quote (y))))

(test-equal (quote (a b c d)) (append (quote (a)) (quote (b c d))))

(test-equal (quote (a (b) (c))) (append (quote (a (b))) (quote ((c)))))

(test-equal (quote (a b c . d)) (append (quote (a b)) (quote (c . d))))

(test-equal (quote a) (append (quote ()) (quote a)))

(test-equal (quote (x y)) (append (quote (x y))))

(test-equal (quote ()) (append))

(test-equal (quote (c b a)) (reverse (quote (a b c))))

(test-equal (quote ((e (f)) d (b c) a)) (reverse (quote (a (b c) d (e (f))))))

(test-equal (quote ((one 1 odd) (two 2 even) (three 3 odd))) (zip (quote (one two three)) (quote (1 2 3)) (quote (odd even odd even odd even odd even))))

(test-equal (quote ((1) (2) (3))) (zip (quote (1 2 3))))

(test-equal (list (quote (1 2 3)) (quote (one two three))) (call-with-values (lambda () (unzip2 (quote ((1 one) (2 two) (3 three))))) list))

(test-equal 3 (count even? (quote (3 1 4 1 5 9 2 5 6))))

(test-equal 3 (count < (quote (1 2 4 8)) (quote (2 4 6 8 10 12 14 16))))

(test-equal (quote (c 3 b 2 a 1)) (fold cons* (quote ()) (quote (a b c)) (quote (1 2 3 4 5))))

(test-equal (quote (a 1 b 2 c 3)) (fold-right cons* (quote ()) (quote (a b c)) (quote (1 2 3 4 5))))

(test-equal (quote ((a b c) (b c) (c))) (pair-fold-right cons (quote ()) (quote (a b c))))

(test-equal (quote ((a b c) (1 2 3) (b c) (2 3) (c) (3))) (pair-fold-right cons* (quote ()) (quote (a b c)) (quote (1 2 3))))

(test-equal (quote (b e h)) (map cadr (quote ((a b) (d e) (g h)))))

(test-equal (quote (1 4 27 256 3125)) (map (lambda (n) (expt n n)) (quote (1 2 3 4 5))))

(test-equal (quote (5 7 9)) (map + (quote (1 2 3)) (quote (4 5 6))))

(test-assert (member (let ((count 0)) (map (lambda (ignored) (set! count (+ count 1)) count) (quote (a b)))) (quote ((1 2) (2 1))) equal?))

(test-equal (quote #(0 1 4 9 16)) (let ((v (make-vector 5))) (for-each (lambda (i) (vector-set! v i (* i i))) (quote (0 1 2 3 4))) v))

(test-equal (quote (1 -1 3 -3 8 -8)) (append-map (lambda (x) (list x (- x))) (quote (1 3 8))))

(test-equal (quote (1 -1 3 -3 8 -8)) (apply append (map (lambda (x) (list x (- x))) (quote (1 3 8)))))

(test-equal (quote (1 -1 3 -3 8 -8)) (append-map! (lambda (x) (list x (- x))) (quote (1 3 8))))

(test-equal (quote (1 -1 3 -3 8 -8)) (apply append! (map (lambda (x) (list x (- x))) (quote (1 3 8)))))

(test-equal "pair-for-each-1" (quote ((a b c) (b c) (c))) (let ((a (quote ()))) (pair-for-each (lambda (x) (set! a (cons x a))) (quote (a b c))) (reverse a)))

(test-equal (quote (1 9 49)) (filter-map (lambda (x) (and (number? x) (* x x))) (quote (a 1 b 3 c 7))))

(test-equal (quote (0 8 8 -4)) (filter even? (quote (0 7 8 8 43 -4))))

(test-equal (list (quote (one four five)) (quote (2 3 6))) (call-with-values (lambda () (partition symbol? (quote (one 2 3 four five 6)))) list))

(test-equal (quote (7 43)) (remove even? (quote (0 7 8 8 43 -4))))

(test-equal 2 (find even? (quote (1 2 3))))

(test-equal #t (any even? (quote (1 2 3))))

(test-equal #f (find even? (quote (1 7 3))))

(test-equal #f (any even? (quote (1 7 3))))

(test-equal 4 (find even? (quote (3 1 4 1 5 9))))

(test-equal #f (every odd? (quote (1 2 3))))

(test-equal #t (every < (quote (1 2 3)) (quote (4 5 6))))

(test-equal (quote (-8 -5 0 0)) (find-tail even? (quote (3 1 37 -8 -5 0 0))))

(test-equal (quote #f) (find-tail even? (quote (3 1 37 -5))))

(test-equal (quote (2 18)) (take-while even? (quote (2 18 3 10 22 9))))

(test-equal (quote (3 10 22 9)) (drop-while even? (quote (2 18 3 10 22 9))))

(test-equal (list (quote (2 18)) (quote (3 10 22 9))) (call-with-values (lambda () (span even? (quote (2 18 3 10 22 9)))) list))

(test-equal (list (quote (3 1)) (quote (4 1 5 9))) (call-with-values (lambda () (break even? (quote (3 1 4 1 5 9)))) list))

(test-equal #t (any integer? (quote (a 3 b 2.7))))

(test-equal #f (any integer? (quote (a 3.1 b 2.7))))

(test-equal #t (any < (quote (3 1 4 1 5)) (quote (2 7 1 8 2))))

(test-equal 2 (list-index even? (quote (3 1 4 1 5 9))))

(test-equal 1 (list-index < (quote (3 1 4 1 5 9 2 5 6)) (quote (2 7 1 8 2))))

(test-equal #f (list-index = (quote (3 1 4 1 5 9 2 5 6)) (quote (2 7 1 8 2))))

(test-equal (quote (a b c)) (memq (quote a) (quote (a b c))))

(test-equal (quote (b c)) (memq (quote b) (quote (a b c))))

(test-equal #f (memq (quote a) (quote (b c d))))

(test-equal #f (memq (list (quote a)) (quote (b (a) c))))

(test-equal (quote ((a) c)) (member (list (quote a)) (quote (b (a) c))))

(test-equal (quote (101 102)) (memv 101 (quote (100 101 102))))

(test-equal (quote (a b c z)) (delete-duplicates (quote (a b a c a b c z))))

(test-equal (quote ((a . 3) (b . 7) (c . 1))) (delete-duplicates (quote ((a . 3) (b . 7) (a . 9) (c . 1))) (lambda (x y) (eq? (car x) (car y)))))

(let ((e (quote ((a 1) (b 2) (c 3))))) (test-equal (quote (a 1)) (assq (quote a) e)) (test-equal (quote (b 2)) (assq (quote b) e)) (test-equal #f (assq (quote d) e)) (test-equal #f (assq (list (quote a)) (quote (((a)) ((b)) ((c)))))) (test-equal (quote ((a))) (assoc (list (quote a)) (quote (((a)) ((b)) ((c)))))) (test-equal (quote (5 7)) (assv 5 (quote ((2 3) (5 7) (11 13))))))

(test-equal #t (lset<= eq? (quote (a)) (quote (a b a)) (quote (a b c c))))

(test-equal #t (lset<= eq?))

(test-equal #t (lset<= eq? (quote (a))))

(test-equal #f (lset= eq? (quote (a)) (quote ())))

(test-equal #f (lset= eq? (quote ()) (quote (a))))

(test-equal #t (lset= eq? (quote (b e a)) (quote (a e b)) (quote (e e b a))))

(test-equal #t (lset= eq?))

(test-equal #t (lset= eq? (quote (a))))

(test-equal #f (lset= = (quote (2 1)) (quote (2 1 0))))

(test-equal #t (lset<= = (quote (2 1)) (quote (2 1 0))))

(test-equal #f (lset<= = (quote (2 1 0)) (quote (2 1))))

(test-equal (quote (u o i a b c d c e)) (lset-adjoin eq? (quote (a b c d c e)) (quote a) (quote e) (quote i) (quote o) (quote u)))

(test-equal (quote (u o i a b c d e)) (lset-union eq? (quote (a b c d e)) (quote (a e i o u))))

(test-equal (quote (x a a c)) (lset-union eq? (quote (a a c)) (quote (x a x))))

(test-equal (quote ()) (lset-union eq?))

(test-equal (quote (a b c)) (lset-union eq? (quote (a b c))))

(test-equal (quote (a e)) (lset-intersection eq? (quote (a b c d e)) (quote (a e i o u))))

(test-equal (quote (a x a)) (lset-intersection eq? (quote (a x y a)) (quote (x a x z))))

(test-equal (quote (a b c)) (lset-intersection eq? (quote (a b c))))

(test-equal (quote (b c d)) (lset-difference eq? (quote (a b c d e)) (quote (a e i o u))))

(test-equal (quote (a b c)) (lset-difference eq? (quote (a b c))))

(test-equal #t (lset= eq? (quote (d c b i o u)) (lset-xor eq? (quote (a b c d e)) (quote (a e i o u)))))

(test-equal (quote ()) (lset-xor eq?))

(test-equal (quote (a b c d e)) (lset-xor eq? (quote (a b c d e))))

(test-end "srfi-1")

(exit 0)
