;;; prog-base-both.scm -- auto-imported (scheme base) alongside an explicit module
;;; import; (scheme base) must link exactly once. => 143
(import (mylib))
(+ (greet) (length (list 1)))    ; greet=142 (mylib) + length via (scheme base)=1
