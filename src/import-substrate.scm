;;; import-substrate.scm -- the compiler's own import of (emit internal)
;;; (change: scheme-base-partition, design D6/D8).
;;;
;;; The compiler's sources are compiled as ORDINARY PROGRAMS that auto-import
;;; (scheme base) -- it is library zero for its own build.  But it uses two groups of
;;; names that R7RS-small does not put in (scheme base), and that Emit therefore does not
;;; export from it:
;;;
;;;   * the compositional accessors caddr / cadddr / cdddr, which R7RS places in
;;;     (scheme cxr).  The passes call them at 48 sites across nine of the flat core
;;;     files.
;;;   * rd-state, rd-label-scan, rd-skip-ws and rd-token-end, the reader helpers which
;;;     the REPL's input-completeness probe (src/repl-core.ss) deliberately reuses so
;;;     directives, datum labels, and token extent cannot drift from the real reader.
;;;
;;; Both groups live in the internal substrate, so ONE import resolves them -- instead of
;;; 48 edits under the self-hosting fixed point, and instead of keeping names on a public
;;; export list only because the compiler needs them (which is what the retired `unstable`
;;; tier was doing, issue #32).
;;;
;;; This file rides the Chez-FREE assembly only (CORE_FLAT in tools/regen.sh and
;;; test/self-host-fixpoint.sh).  The Chez-hosted driver `include`s the flat core into Chez
;;; and evaluates it, where these names are Chez's own or are not needed at all, and where
;;; an `(import (emit internal))` would name a library Chez has never heard of -- so
;;; src/compile.ss's include block deliberately omits this file, exactly as it omits
;;; src/dump.ss.
;;;
;;; The substrate resolves BAKED on the doors that build the baked set from the compiler's
;;; baked-in prelude source, and through the manifest on the doors that resolve
;;; (scheme base) that way -- so this import costs no manifest requirement that
;;; (scheme base) did not already impose.
(import (emit internal))
