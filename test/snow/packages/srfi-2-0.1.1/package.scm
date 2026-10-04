(package
  (maintainers "Retropikzel")
  (authors "Marc Nieper-Wißkirchen")
  (version "0.1.1")
  (license MIT-0)
  (library
    (name
      (srfi 2))
    (path "srfi/2.sld")
    (foreign-depends)
    (depends
      (scheme base)
      (scheme write)))
  (manual "index.html")
  (description "SRFI-2 - AND-LET*: an AND with local bindings, a guarded LET* special form")
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
    (srfi 2)
    (srfi 64)))
