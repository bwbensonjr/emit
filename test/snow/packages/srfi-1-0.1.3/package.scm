(package
  (maintainers "Retropikzel")
  (authors "Olin Shivers")
  (version "0.1.3")
  (license MIT)
  (library
    (name
      (srfi 1))
    (path "srfi/1.sld")
    (foreign-depends)
    (depends
      (scheme base)
      (scheme cxr)
      (srfi 8)
      (srfi 227)))
  (manual "index.html")
  (description "SRFI-1 - List Library")
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
    (srfi 1)
    (srfi 64)))
