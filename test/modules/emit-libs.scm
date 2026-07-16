;;; emit-libs.scm -- library manifest for the Stage 1 slice
;;; (change: module-artifacts-vertical-slice).  Maps each library name to its
;;; source file and (optionally) an artifact directory; artifacts default under
;;; build/lib when the entry omits `artifacts`.
((library (mylib) (source "test/modules/mylib.sld"))
 (library (liba)  (source "test/modules/liba.sld"))
 (library (libb)  (source "test/modules/libb.sld")))
