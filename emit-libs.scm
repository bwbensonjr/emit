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
;;;
;;; (emit internal) is the SUBSTRATE (change: scheme-base-partition, design D1/D5): the
;;; private machinery -- the port representation and the in-language reader -- that
;;; (scheme base) and the relocated standard libraries both stand on.  It is NOT API and
;;; carries no stability guarantee; it lives outside the `(scheme ...)` namespace R7RS
;;; reserves for the standard precisely to say so, and nothing auto-imports it, so listing
;;; it here does not put a single name into a user program's scope.
;;;
;;; Native commands register baked members from their embedded generated forms before
;;; consulting filesystem providers. These entries therefore resolve to the existing
;;; baked members without loading a second copy. The Chez driver consumes the same
;;; generated library files. The substrate is ordered first for readability; its
;;; dependency on initialization order is declared by each library.
;;;
;;; (emit list) is a PUBLIC but non-standard ordinary library.  It exposes Emit's
;;; `filter`, `fold-right`, and `iota` helpers without making them part of (scheme base).
;;; The definitions stay in (emit internal) for compiler use; this library re-exports
;;; those same bindings.
;;;
;;; (emit filesystem) is a PUBLIC but non-standard ordinary library.  Its four narrow
;;; host operations are explicit imports so directory traversal and atomic replacement
;;; do not leak into (scheme base) or the R7RS (scheme file) surface.
;;; (scheme cxr) / (scheme read) / (scheme file) hold the sixteen names R7RS-small places
;;; outside (scheme base) (change: scheme-base-partition, issue #33).  Like
;;; (scheme inexact) they are ordinary libraries reached only by an explicit import -- but
;;; unlike it they are GENERATED from src/prelude.scm by tools/gen-scheme-base.ss, because
;;; the prelude stays the single source of truth for what those procedures ARE.  They import
;;; the baked members: (scheme base) for the ordinary procedures they stand on, and
;;; (emit internal) for the private port/reader machinery.
((library (emit internal) (source "lib/emit/internal.sld"))
  (library (emit list) (source "lib/emit/list.sld"))
  (library (emit filesystem) (source "lib/emit/filesystem.sld"))
  (library (scheme base) (source "lib/scheme/base.sld"))
  (library (scheme inexact) (source "lib/scheme/inexact.sld"))
  (library (scheme case-lambda) (source "lib/scheme/case-lambda.sld"))
  (library (scheme char) (source "lib/scheme/char.sld"))
  (library (scheme process-context) (source "lib/scheme/process-context.sld"))
  (library (scheme write) (source "lib/scheme/write.sld"))
  (library (scheme cxr) (source "lib/scheme/cxr.sld"))
  (library (scheme read) (source "lib/scheme/read.sld"))
  (library (scheme file) (source "lib/scheme/file.sld")))
