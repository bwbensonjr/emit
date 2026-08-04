;;; emit-libs-body.scm -- manifest for the library-body-declarations suite
;;; (issue #16).  Separate from the main manifest for the reason emit-libs-cycle.scm
;;; and emit-libs-mut.scm are: every door eagerly preloads EVERY library in the
;;; manifest it is handed.  Paths are relative to THIS FILE (change:
;;; manifest-search-path).
((library (emit internal) (source "../../lib/emit/internal.sld"))
 (library (scheme base)   (source "../../lib/scheme/base.sld"))
 (library (cmdlib)      (source "cmdlib.sld"))
 (library (reclib)      (source "reclib.sld"))
 (library (tlsetlib)    (source "tlsetlib.sld")))
