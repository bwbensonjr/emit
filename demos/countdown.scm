; deep tail recursion: must run in bounded stack (musttail)
(letrec ([loop (lambda (n) (if (= n 0) 999 (loop (- n 1))))])
  (loop 10000000))
