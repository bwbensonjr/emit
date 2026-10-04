;;; prog-base-prefix-hidden.scm -- a prefixed (scheme base) leaves no unprefixed map: unbound.
(import (prefix (scheme base) b:))
(map (lambda (x) x) '(1))
