;;; prog-base-except.scm -- an explicit (scheme base) set narrows the implicit import: map is unbound.
(import (except (scheme base) map))
(map car '((1)))
