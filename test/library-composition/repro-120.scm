(import (scheme base) (composition repro macro source))
(define f (with-case-lambda (() 1) ((x) x)))
(write (list (f) (f 5)))
(newline)
