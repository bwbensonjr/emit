;;; prog-cmdlib.scm -- an importer observes (cmdlib)'s body commands.  => (42 1)
;;; 42 proves both commands ran (40 stored, then +2 via a procedure defined between
;;; them); 1 proves the first command ran before the second.
(import (cmdlib))
(list (get) (log-contents))
