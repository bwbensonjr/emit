;;; macro-user-lib.sld -- a LIBRARY importing another library's exported macro
;;; (change: library-macro-export).  The importer of an exported macro is usually a
;;; program; this is the other case, and it goes through compile-library*'s macro merge
;;; rather than compile-program-with-imports'.  `dbl` uses (macro-dup-a)'s `ma`, whose
;;; template reaches macro-dup-a's PRIVATE helper -- so this also proves a resolved
;;; template reference works when the unit doing the expansion is itself a library.
;;;
;;; This fixture avoids derived forms (`when`, `cond`) so it stays focused on merging an
;;; imported library macro into another library's compile-time environment.
(define-library (macro-user-lib)
  (import (scheme base))
  (import (macro-dup-a))
  (export dbl)
  (begin
    (define (dbl x) (+ (ma x) (ma x)))))   ; ma(x) = x+1, so dbl(4) = 10
