;;; emit-libs-mut.scm -- manifest for the library top-level `set!` suite (change:
;;; library-toplevel-set, issue #14).  Kept SEPARATE from the main manifest for the
;;; same reason emit-libs-cycle.scm is: every door eagerly preloads EVERY library in
;;; the manifest it is given, so the deliberately-failing (mutbad)/(mutprim) fixtures
;;; would break unrelated suites.  Those two get their own throwaway manifests in the
;;; suite, next to the diagnostic each one is expected to produce.  Paths are
;;; relative to THIS FILE (change: manifest-search-path).
((library (emit internal) (source "../../lib/emit/internal.sld"))
 (library (scheme base)   (source "../../lib/scheme/base.sld"))
 (library (mutlib)      (source "mutlib.sld")))
