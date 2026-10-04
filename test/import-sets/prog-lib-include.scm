;;; prog-lib-include.scm -- a library body includes a file that includes again, at top level and deep in a body. => (42 5)
(import (iset inc))
(list (inc-val) (deep))
