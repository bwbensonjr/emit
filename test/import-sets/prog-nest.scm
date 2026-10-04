;;; prog-nest.scm -- nested sets: prefix over only. => 42
(import (prefix (only (iset a) greet) m:))
(m:greet)
