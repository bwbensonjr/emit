;;; prog-features.scm -- `features` reports the advertised identifiers, and every one of
;;; them selects its cond-expand clause. => (#t #t #t)
(list (and (memq 'emit (features)) #t)
      (and (memq 'r7rs (features)) #t)
      (and (memq 'srfi-0 (features)) #t))
