;;; prog-only.scm -- only keeps the named export. => 42
(import (only (iset a) greet))
(greet)
