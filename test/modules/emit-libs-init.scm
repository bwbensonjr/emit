;;; emit-libs-init.scm -- manifest for the deferred-initialization fixtures (change:
;;; defer-manifest-library-init).  Its own manifest rather than entries in
;;; test/modules/emit-libs.scm: (init-raise) raises from its body, and keeping it out of
;;; the shared manifest keeps every other suite's session independent of whether a
;;; library that cannot initialize is merely *registered* alongside them.
((library (emit internal) (source "../../lib/emit/internal.sld"))
 (library (scheme base)   (source "../../lib/scheme/base.sld"))
 (library (init-count)    (source "init-count.sld"))
 (library (init-outer)    (source "init-outer.sld"))
 (library (init-raise)    (source "init-raise.sld"))
 (library (chain-a)       (source "chain-a.sld"))
 (library (chain-b)       (source "chain-b.sld")))
