;;; emit-libs.scm -- default library manifest (change: module-prelude-scheme-base).
;;; (scheme base) is the standard library: the prelude's procedures, re-homed as a
;;; real module and auto-imported into every program/REPL session (unless
;;; --no-prelude).  Its source is generated from src/prelude.scm.
((library (scheme base) (source "lib/scheme/base.sld")))
