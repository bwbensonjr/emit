;;; P9 call-dominated benchmark: three million one-argument number->string calls.
(let loop ((i 0) (total 0))
  (if (= i 3000000)
      total
      (loop (+ i 1)
            (+ total (string-length (number->string i))))))
