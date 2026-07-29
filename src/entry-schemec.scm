;; entry-schemec.scm -- the batch text->IR filter compiler's entry.  IR on stdout;
;; the stage dump (built here from the host-forwarded EMIT_DUMP_LEVEL, change:
;; emit-dump-stages) goes to stderr, so `schemec > out.ll` is unaffected by dumping.
(display (compile-source-string (read-all-stdin) (make-dumper #f)))
