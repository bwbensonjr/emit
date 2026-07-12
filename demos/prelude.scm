; prelude standard-library procedures (list, map, reverse, append, length),
; available with no local definitions — they come from src/prelude.scm.
(append (map (lambda (x) (* x x)) (list 1 2 3))   ; (1 4 9)
        (reverse (list 4 5 6)))                    ; (6 5 4)  => (1 4 9 6 5 4)
