(package
  (maintainers "Retropikzel")
  (authors "Per Bothner" "Alex Shinn" "Álvaro Castro-Castilla" "Mark H Weaver" "Taylan Ulrich Bayırlı/Kammer")
  (version "0.1.7")
  (license MIT)
  (library
    (name
      (srfi 64))
    (path "srfi/64.sld")
    (foreign-depends)
    (cond-expand
      (loko
        (depends
          (scheme base)
          (scheme case-lambda)
          (scheme complex)
          (scheme file)
          (scheme process-context)
          (scheme read)
          (scheme write)
          (srfi 1)))
      ((library (scheme complex))
        (depends
          (scheme base)
          (scheme case-lambda)
          (scheme complex)
          (scheme eval)
          (scheme file)
          (scheme process-context)
          (scheme read)
          (scheme write)
          (srfi 1)))
      (else
        (depends
          (scheme base)
          (scheme case-lambda)
          (scheme eval)
          (scheme file)
          (scheme process-context)
          (scheme read)
          (scheme write)
          (srfi 1))))
    (cond-expand
      (chicken
        (depends))
      (stklos
        (depends))
      (else
        (depends)))
    (cond-expand
      (guile
        (depends
          (guile)))
      (else
        (depends)))
    (depends))
  (manual "index.html")
  (description "SRFI-64 - SRFI 64: A Scheme API for test suites")
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
    (srfi 64)))
