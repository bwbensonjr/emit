;;; prog-cond-import.scm -- a program selects its imports by feature. => 42
(cond-expand (emit (import (iset a))) (else (import (iset no-such-library))))
(greet)
