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
;;; It is listed because the manifest-driven doors need it, not for a user's benefit.  The
;;; doors that build the baked set from the compiler's baked-in prelude source resolve both
;;; it and (scheme base) with no files at all; the REPL door and the Chez driver resolve
;;; (scheme base) from THIS manifest, and base.sld imports the substrate, so without an
;;; entry those doors would have no standard library.  It is ordered first for readability;
;;; the loader is fixpoint-driven and does not depend on manifest order.
((library (emit internal)  (source "lib/emit/internal.sld"))
 (library (scheme base)    (source "lib/scheme/base.sld"))
 (library (scheme inexact) (source "lib/scheme/inexact.sld")))
