;;; filesystem-directory-check.scm -- create-directory and delete-directory against a
;;; real tree (change: emit-pkg).  Shared by emit run and a standalone executable.
;;; The fixture ROOT holds tree/{a,sub/b,link -> ../outside}, outside/keep, and
;;; linkdir -> outside.
(import (scheme base) (scheme write) (scheme process-context) (emit filesystem))

(define root (cadr (command-line)))
(define (at name) (string-append root "/" name))

(define (outcome thunk)
  (guard (e ((file-error? e) 'file-error))
    (thunk)
    'ok))

(define (show label value)
  (display label)
  (display " ")
  (write value)
  (newline))

(show "create-new" (outcome (lambda () (create-directory (at "made")))))
(show "created-is-directory" (file-directory? (at "made")))
(show "create-existing" (outcome (lambda () (create-directory (at "made")))))
(show "create-without-parent" (outcome (lambda () (create-directory (at "no/parent")))))
(show "delete-empty" (outcome (lambda () (delete-directory (at "made")))))
(show "deleted-is-gone" (file-directory? (at "made")))
(show "delete-non-empty" (outcome (lambda () (delete-directory (at "tree")))))
(show "non-empty-remains" (file-directory? (at "tree/sub")))
(show "delete-linked-path" (outcome (lambda () (delete-directory (at "linkdir") #t))))
(show "linked-path-remains" (file-symbolic-link? (at "linkdir")))
(show "delete-tree" (outcome (lambda () (delete-directory (at "tree") #t))))
(show "tree-is-gone" (file-directory? (at "tree")))
(show "link-target-kept" (directory-list (at "outside")))
(show "delete-missing" (outcome (lambda () (delete-directory (at "tree")))))
