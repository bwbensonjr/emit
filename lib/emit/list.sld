;;; list.sld -- GENERATED from src/prelude.scm by tools/gen-scheme-base.ss
;;; -- DO NOT EDIT BY HAND.  Edit src/prelude.scm (or the partition in
;;; src/prelude-surface.scm) and regenerate; guarded by
;;; test/scheme-base-gen-check.sh.
;;;
;;; One member of the prelude's partition: the definitions the declaration
;;; homes here, exporting the declared public ones.  Private helpers and the
;;; derived-form macros stay in the body, where the exported procedures still
;;; call them.  One export per line, so a surface change is a reviewable
;;; one-line diff.
(define-library (emit list)
  (import (emit internal))
  (export
    filter
    fold-right
    iota
    )
  (begin
    ))
