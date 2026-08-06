;;; emit-libs-macdup.scm -- manifest for the double-binding rejection test (change:
;;; library-macro-export, design D3).  Kept SEPARATE from the main manifest for the same
;;; reason as emit-libs-cycle.scm: the REPL preloads every manifest library eagerly, so a
;;; deliberately-invalid library in the shared manifest would make every session in these
;;; suites report it at startup.
;;; Paths are relative to THIS FILE (change: manifest-search-path).
;;; (scheme base) and the substrate are named because the CHEZ driver has no baked set and
;;; the program auto-imports the prelude; the Chez-free doors ignore these entries.
((library (emit internal)     (source "../../lib/emit/internal.sld"))
 (library (scheme base)       (source "../../lib/scheme/base.sld"))
 (library (macro-dupname-lib) (source "macro-dupname-lib.sld")))
