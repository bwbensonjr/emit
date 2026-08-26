; Eq?-keyed tables preserve object identity through every operation and growth,
; while the original constructor remains equal?-keyed.
;   => (2 first second 1 replaced #t pair vector #f 100 #t missing 100 100 100
;       1 structural-second #<hash-table 1>)
(let ((identity (make-eq-hash-table))
      (same (make-eq-hash-table))
      (cycles (make-eq-hash-table))
      (big (make-eq-hash-table))
      (structural (make-hash-table))
      (keys (make-vector 100 #f))
      (first (list 'same))
      (second (list 'same))
      (one (list 'one))
      (pair-cycle (cons 'pair '()))
      (vector-cycle (vector #f)))
  (set-cdr! pair-cycle pair-cycle)
  (vector-set! vector-cycle 0 vector-cycle)

  (hash-table-set! identity first 'first)
  (hash-table-set! identity second 'second)
  (hash-table-set! same one 'original)
  (hash-table-set! same one 'replaced)
  (hash-table-set! cycles pair-cycle 'pair)
  (hash-table-set! cycles vector-cycle 'vector)

  ; Keep every allocated key so retrieval after rehash uses the same identity.
  (let fill ((i 0))
    (if (< i 100)
        (let ((key (list i)))
          (vector-set! keys i key)
          (hash-table-set! big key i)
          (fill (+ i 1)))
        #f))

  ; The equal?-keyed constructor still merges separately allocated equal lists.
  (hash-table-set! structural first 'structural-first)
  (hash-table-set! structural second 'structural-second)

  (let ((all-present
          (let check ((i 0))
            (if (< i 100)
                (and (= (hash-table-ref/default big (vector-ref keys i) -1) i)
                     (check (+ i 1)))
                #t))))
    (let ((pair-hit (hash-table-ref cycles pair-cycle))
          (vector-hit (hash-table-ref cycles vector-cycle)))
      (hash-table-delete! cycles pair-cycle)
      (list
        (hash-table-size identity)
        (hash-table-ref identity first)
        (hash-table-ref identity second)
        (hash-table-size same)
        (hash-table-ref same one)
        (hash-table-contains? cycles vector-cycle)
        pair-hit
        vector-hit
        (hash-table-contains? cycles pair-cycle)
        (hash-table-size big)
        all-present
        (hash-table-ref/default big (list 50) 'missing)
        (length (hash-table-keys big))
        (length (hash-table-values big))
        (length (hash-table->alist big))
        (hash-table-size structural)
        (hash-table-ref structural first)
        (let ((opaque (make-eq-hash-table)))
          (hash-table-set! opaque 'x 1)
          opaque)))))
