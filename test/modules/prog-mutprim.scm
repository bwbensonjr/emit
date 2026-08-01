;;; prog-mutprim.scm -- imports (mutprim), whose body assigns a primitive.
;;; Expected to FAIL at library-load time, not to run.
(import (mutprim))
(clobber)
