;;; emit-libs-body.scm -- manifest for the library-body-declarations suite
;;; (issue #16).  Separate from the main manifest for the reason emit-libs-cycle.scm
;;; and emit-libs-mut.scm are: every door eagerly preloads EVERY library in the
;;; manifest it is handed.
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (cmdlib)      (source "test/modules/cmdlib.sld"))
 (library (reclib)      (source "test/modules/reclib.sld"))
 (library (tlsetlib)    (source "test/modules/tlsetlib.sld")))
