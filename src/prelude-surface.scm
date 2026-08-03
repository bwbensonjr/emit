;;; prelude-surface.scm -- the DECLARED public surface of (scheme base)
;;; (change: scheme-base-declared-surface, GitHub issue #29).
;;;
;;; src/prelude.scm is the source of truth for what (scheme base) CONTAINS.  This
;;; file is the source of truth for what it EXPORTS.  Both derivations of the export
;;; list read THIS file, so they cannot disagree:
;;;
;;;   tools/gen-scheme-base.ss   (Chez) writes the committed lib/scheme/base.sld,
;;;                              which the Chez driver resolves via the manifest
;;;   scheme-base-library-form   (src/core.ss) the portable derivation used by
;;;                              `emit run` / `emit build` / the run door, from the
;;;                              baked-in prelude source with no filesystem
;;;
;;; The export list is the prelude's top-level defines in SOURCE ORDER minus
;;; *scheme-base-private*.  Order therefore comes from the prelude, not from here:
;;; the arrangement of the lists below is free and can be regrouped or re-commented
;;; without moving a byte of emitted IR.  Do not "tidy" them into sorted order and
;;; assume the freedom holds for a list of EXPORTS -- it holds because this is a set
;;; to SUBTRACT.
;;;
;;; A private name stays in the library BODY (the exported procedures call it) and
;;; only leaves the `export` list, so it is not in scope in every user program and is
;;; not an API commitment.  Emitting the library is export-agnostic, so curating this
;;; list leaves scheme.base.ll byte-identical; only importing PROGRAM modules change,
;;; each losing one `external global` declaration per dropped export.
;;;
;;; This file rides the flat compiler core (CORE_FLAT in tools/regen.sh, the include
;;; block in src/compile.ss), so its cost is interned symbols in the three COMPILER
;;; binaries -- never in scheme.base.ll, and never in a user binary.  That is why the
;;; declaration lives here rather than as a quoted list inside the prelude itself.
;;;
;;; The exported surface has three tiers, documented in docs/MODULES.md:
;;;
;;;   R7RS       names R7RS-small defines.  (Some of them R7RS places in a library
;;;              other than (scheme base) -- the depth-3+ cxr forms are (scheme cxr),
;;;              `read` is (scheme read), the file procedures are (scheme file).
;;;              Recorded conformance debt; not re-litigated by this change.)
;;;   extension  Emit additions with no R7RS home: filter, fold-left, fold-right,
;;;              andmap, memp, iota, list-head, void, list->bytevector, port-closed?,
;;;              read-from-string, read-all-from-string, with-parameters and the
;;;              hash-table-* family.  Published deliberately, spelled R6RS/SRFI.
;;;   unstable   *scheme-base-unstable* below: exported ONLY because something
;;;              outside the library must resolve the name.  No stability guarantee,
;;;              not documented as API, may change or disappear.
;;;
;;; Adding a prelude definition forces a visibility decision: one that is neither
;;; listed private here nor present in the committed export list fails
;;; test/scheme-base-surface-check.sh (Chez-free, in run-all-tests.sh).

;;; Exported, but NOT API.  Every entry needs its reason on this list.
;;;   rd-skip-ws   -- the REPL's input-completeness probe (src/repl-core.ss:528-600)
;;;   rd-token-end    deliberately reuses the reader's own lexeme helpers so the two
;;;                   cannot drift, and it is compiler source compiled as a program that
;;;                   auto-imports (scheme base).  Duplicating the lexeme rules there is
;;;                   exactly what that code's comment forbids, and hoisting the ~70-line
;;;                   probe into the prelude would grow scheme.base.ll -- linked into
;;;                   EVERY user binary -- to save two names.
;;;
;;; The other two names that used to live here were the helpers `guard` and
;;; `parameterize` expand to.  A macro template is instantiated in the IMPORTER's scope,
;;; so every name it mentions must be exported under exactly that spelling -- `rename`
;;; cannot hide one, since it keys the import table by the EXTERNAL name and leaves the
;;; template's spelling unresolvable.  Since they are published either way, they were
;;; renamed to honest public spellings: `%with-handler` -> `with-exception-handler` (R7RS
;;; 6.11, a conformance gain) and `%with-parameters` -> `with-parameters` (an extension).
;;; The principled way to shrink this list further is to resolve prelude macro-template
;;; names hygienically against the library's INTERNAL bindings; until then, two names.
(define *scheme-base-unstable* '(rd-skip-ws rd-token-end))

;;; NOT exported.  In the library body -- the exported procedures call them -- but out
;;; of the export list, so they are not in scope in every user program and are not an
;;; API commitment.  Adding a prelude define without listing it here (or publishing it
;;; deliberately) fails test/scheme-base-surface-check.sh.
(define *scheme-base-private*
  '(;; list/utility helpers
    %append2 %map1 %any-null? %mapn %for-each1 %for-eachn
    ;; numeric folds and kernels (R7RS 6.2)
    %minmax-fold %minmax %gcd2 %gcd-fold %lcm-fold %expt-exact %isqrt-loop %isqrt
    ;; string helper -- dead in-tree; the comments at src/parse.ss:151 and
    ;; src/passes/expand.ss:338 that claim otherwise are stale
    %str-concat
    ;; character comparison kernel (unsigiled by history, not by intent)
    chr-cmp
    ;; number->string / string->number internals (ns-digits* likewise unsigiled)
    ns-digits ns-digits-radix %ns-digit-char %radix-ok?
    %digit-in-radix %radix-digits %string->int
    ;; dynamic-extent state and unwinding
    *winds* *handlers* %unwind-to
    ;; hash-table representation
    %ht-initial-buckets %ht-load-factor %ht-count %ht-buckets %ht-set-count!
    %ht-set-buckets! %ht-index %ht-assoc %ht-remove %ht-grow! %ht-fold-buckets
    ;; the in-language reader (issue #25 will change these; they are not API).
    ;; rd-skip-ws / rd-token-end are the two exceptions, declared unstable above.
    rd-ws? rd-digit? rd-delim? rd-skip-line rd-all-digits? rd-numeric? rd-digits
    rd-digits-neg rd-parse-int rd-dotchar? rd-exp-char? rd-sign-char? rd-scan-digits
    rd-flonum? rd-nonfinite rd-atom rd-hex-digit rd-hex rd-str-esc rd-string rd-hash
    rd-char-name rd-char rd-quote rd-quasi rd-unquote rd-dot? rd-append-reverse
    rd-list rd-datum
    ;; port representation
    %port-rtd-cell %port-rtd %make-port %check-input-port %check-output-port %port-buf
    %port-at-eof? %stdout-port %stderr-port %stdin-port))
