;;; emit-libs.scm -- default library manifest (change: module-prelude-scheme-base).
;;; (scheme base) is the standard library: the prelude's procedures, re-homed as a
;;; real module and auto-imported into every program/REPL session (unless
;;; --no-prelude).  Its source is generated from src/prelude.scm.
;;;
;;; (scheme inexact) is the second standard library (change: numeric-conformance) and
;;; the first entry here that is NOT auto-imported: a program reaches it only through
;;; an explicit `(import (scheme inexact))`.  It is hand-written, not generated, and
;;; is resolved/compiled/linked by the ordinary module machinery -- which is the point
;;; of shipping it this way rather than baking it in beside the prelude.
((library (scheme base)    (source "lib/scheme/base.sld"))
 (library (scheme inexact) (source "lib/scheme/inexact.sld")))
