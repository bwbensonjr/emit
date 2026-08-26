; Identity hashing is stable across allocation and does not traverse a cyclic
; key.  The allocation count keeps the intervening work observable.
;   => (#t #t #t 1000)
(let ((key (cons 'key '())))
  (set-cdr! key key)
  (let ((before (%eq-hash key)))
    (let ((allocated
            (let loop ((i 0) (xs '()))
              (if (< i 1000)
                  (loop (+ i 1) (cons i xs))
                  (length xs)))))
      (list (integer? before)
            (= before (%eq-hash key))
            (= (%eq-hash key) (%eq-hash key))
            allocated))))
