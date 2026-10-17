;; A completed, passing suite must still fail acceptance when its child fails.
(test-begin "intentional")
(test-assert #t)
(test-end "intentional")
(exit 7)
