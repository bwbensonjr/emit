(package
  (maintainers "Retropikzel")
  (authors "Daphne Preston-Kendal")
  (version "0.1.3")
  (license MIT)
  (library
    (name
      (srfi 227))
    (path "srfi/227.sld")
    (foreign-depends)
    (cond-expand
      (chicken
        (depends))
      (else
        (depends)))
    (depends
      (scheme base)
      (scheme case-lambda)))
  (manual "index.html")
  (description "SRFI-227 - Optional Arguments")
  (test "test.scm")
  (test-depends
    (scheme base)
    (scheme char)
    (scheme inexact)
    (scheme read)
    (scheme write)
    (scheme process-context)
    (scheme file)
    (scheme cxr)
    (srfi 227)
    (srfi 64)))
