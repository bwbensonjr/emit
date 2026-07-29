;; entry-embed.scm -- the embedded batch compiler's entry (change:
;; embedded-runner-rehome).  Reads the program from stdin and returns emitted IR.
;; With the prelude enabled (the default) it re-homes the prelude as the auto-
;; imported library (scheme base), returning the (scheme base) module + a boundary
;; marker + the program module (the host splits and links/JITs both).  With
;; --no-prelude (forwarded by the host via EMIT_NO_PRELUDE, read by %no-prelude?)
;; it emits only the program, leaving prelude names unbound -- matching the Chez
;; driver's --no-prelude.
;;
;; The dumpers are built HERE, at the entry, not in the pure core (change:
;; emit-dump-stages, design D3): reading the host-forwarded EMIT_DUMP_LEVEL and writing
;; stderr are effects, so they stay out of core.ss.  The program is the unit under
;; inspection (#f); the (scheme base) compiled on the way is incidental, so it is named
;; and its stages appear only at the all-units level (design D7).
(if (%no-prelude?)
    (compile-source-string (read-all-stdin) (make-dumper #f))
    (compile-source-rehomed *prelude-source* (read-all-stdin)
                            (make-dumper #f)
                            (make-dumper (quote (scheme base)))))
