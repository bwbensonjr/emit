;;; prog-macro-dupname.scm -- drives the double-binding rejection
;;; (change: library-macro-export, design D3).  The build must fail while LOADING the
;;; library, naming `f`; the program itself is unremarkable.
(import (macro-dupname-lib))
(f 1)
