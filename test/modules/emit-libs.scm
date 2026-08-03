;;; emit-libs.scm -- library manifest for the module suites.
;;; (changes: module-artifacts-vertical-slice, module-generalize).  Maps each
;;; library name to its source file and (optionally) an artifact directory;
;;; artifacts default under build/lib when the entry omits `artifacts`.  Entry
;;; order is irrelevant: the build resolves the transitive closure and orders it
;;; topologically (dependencies before dependents).  Note chain-a is listed BEFORE
;;; its dependency chain-b, and dia-a/dia-b before dia-c, on purpose.
;;;
;;; Paths here are relative to THIS FILE, not to the invocation (change:
;;; manifest-search-path): the sibling .sld files are bare names, and the repo's own
;;; lib/ is reached with ../../.  That rule is what lets an INSTALLED manifest name
;;; lib/scheme/base.sld and find it beside itself; these fixtures exercise it.
((library (scheme base) (source "../../lib/scheme/base.sld"))
 (library (mylib)      (source "mylib.sld"))
 (library (liba)       (source "liba.sld"))
 (library (libb)       (source "libb.sld"))
 (library (chain-a)    (source "chain-a.sld"))
 (library (chain-b)    (source "chain-b.sld"))
 (library (dia-a)      (source "dia-a.sld"))
 (library (dia-b)      (source "dia-b.sld"))
 (library (dia-c)      (source "dia-c.sld"))
 (library (rename-lib) (source "rename-lib.sld"))
 (library (varlib)     (source "varlib.sld"))
 ;; program (emit build) entries: name -> source + delivered executable
 ;; (change: emit-build-bin-entry).  Ignored by library import resolution.
 (program mylib-app    (source "prog-mylib.scm") (output "../../build/mylib-app"))
 (program greet-app    (source "prog-mylib.scm")))
