;;; prog-base-prefix-hidden.scm -- a prefixed (scheme base) leaves no unprefixed map: unbound.
(import (prefix (scheme base) b:))
(map (b:lambda (x) x) (b:quote (1)))
