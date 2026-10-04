;;; main.scm -- a program includes its definitions from a sibling file, which resolves
;;; beside THIS file whatever the working directory. => 42
(include "defs.scm")
(f 1)
