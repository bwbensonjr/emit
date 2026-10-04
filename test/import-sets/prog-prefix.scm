;;; prog-prefix.scm -- prefix renames every export. => 42
(import (prefix (iset a) a:))
(a:greet)
