;; R7RS exceptions subset: guard / raise / error objects (r7rs-exceptions-subset).
;; Each element exercises a different path; the last is a nested re-raise.
(list
  (guard (e ((symbol? e) e)) (raise 'boom))                        ; caught non-error object
  (guard (e (#t 'unreached) (else 'used-else)) 7)                  ; no raise -> body value
  (guard (e ((error-object? e) (error-object-message e)))          ; R7RS error object
    (error "bad thing" 1 2))
  (guard (e ((error-object? e) (error-object-irritants e)))        ; irritants preserved
    (error "bad thing" 1 2))
  (guard (outer (#t (list 'outer outer)))                          ; inner re-raises -> outer
    (guard (inner ((eq? inner 'x) 'inner-x)) (raise 'y))))
