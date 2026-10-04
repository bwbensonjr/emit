(package
  (maintainers "Retropikzel")
  (authors "John David Stone")
  (version "0.1.2")
  (license MIT)
  (library
    (name
      (srfi 8))
    (path "srfi/8.sld")
    (foreign-depends)
    (depends
      (scheme base)))
  (manual "index.html")
  (description "SRFI-8 - receive: Binding to multiple values")
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
    (srfi 8)
    (srfi 64)))
