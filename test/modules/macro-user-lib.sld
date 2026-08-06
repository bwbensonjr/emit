;;; macro-user-lib.sld -- a LIBRARY importing another library's exported macro
;;; (change: library-macro-export).  The importer of an exported macro is usually a
;;; program; this is the other case, and it goes through compile-library*'s macro merge
;;; rather than compile-program-with-imports'.  `dbl` uses (macro-dup-a)'s `ma`, whose
;;; template reaches macro-dup-a's PRIVATE helper -- so this also proves a resolved
;;; template reference works when the unit doing the expansion is itself a library.
;;;
;;; Note what this fixture must NOT do: use a derived form (`when`, `cond`).  A library
;;; body does not get the baked macro set at all (issue #55), which is a pre-existing gap
;;; unrelated to macro export.
(define-library (macro-user-lib)
  (import (macro-dup-a))
  (export dbl)
  (begin
    (define (dbl x) (+ (ma x) (ma x)))))   ; ma(x) = x+1, so dbl(4) = 10
