;;; emit-libs-cycle.scm -- manifest for the import-cycle test (change:
;;; module-generalize).  Kept SEPARATE from the main manifest so the REPL's eager
;;; preload of every manifest library does not trip over the deliberate cycle.
;;; Paths are relative to THIS FILE (change: manifest-search-path).
((library (cyc-a) (source "cyc-a.sld"))
 (library (cyc-b) (source "cyc-b.sld")))
