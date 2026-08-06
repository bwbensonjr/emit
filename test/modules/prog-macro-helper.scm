;;; prog-macro-helper.scm -- uses a macro whose template reaches the exporting
;;; library's private helper and private macro (change: library-macro-export).
;;; The program defines its OWN `helper` with a different meaning: if the template's
;;; reference resolved in the importer instead of the exporter, this would silently
;;; compute the wrong answer rather than fail to link.
;;; twice(5) = helper(%inc(5)) = helper(6) = 18.
(import (macro-helper-lib))
(define (helper x) 0)
(twice 5)
