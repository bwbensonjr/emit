;;; pkg.scm -- the program `emit pkg` runs (change: emit-pkg).  All of the package
;;; manager is the shipped (emit pkg) library, which the shared cache precompiles;
;;; this driver only hands it the command line the host prepared.
(import (scheme base) (scheme process-context) (emit pkg))
(pkg-main (command-line))
