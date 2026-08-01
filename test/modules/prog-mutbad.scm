;;; prog-mutbad.scm -- imports (mutbad), whose body assigns an imported binding.
;;; Expected to FAIL at library-load time, not to run.
(import (mutbad))
(clobber)
