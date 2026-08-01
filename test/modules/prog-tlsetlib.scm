;;; prog-tlsetlib.scm -- (101 1001): the top-level command's assignment took effect,
;;; and the unassigned sibling still answers normally.  101 is only observable if the
;;; call to `f` was NOT lowered direct -- see the export-table assertion in the suite.
(import (tlsetlib))
(list (f 1) (g 1))
