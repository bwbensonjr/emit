;;; prelude-surface.scm -- the DECLARED public surface of (scheme base)
;;; (change: scheme-base-declared-surface, GitHub issue #29).
;;;
;;; src/prelude.scm is the source of truth for what (scheme base) CONTAINS.  This
;;; file is the source of truth for what it EXPORTS.  Both derivations of the export
;;; list read THIS file, so they cannot disagree:
;;;
;;;   tools/gen-scheme-base.ss   (Chez) writes the committed lib/**/*.sld, which the Chez
;;;                              driver and the REPL door resolve via the manifest
;;;   partition-library-form     (src/core.ss) the portable derivation used by
;;;   + compile-baked-set        `emit run` / `emit build` / the run door, from the
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
;;;
;;; --- the PARTITION (change: scheme-base-partition, issue #33) ------------------
;;;
;;; This file no longer declares only what is HIDDEN; it declares WHERE EACH NAME
;;; GOES.  The prelude is one source compiled into a SET of libraries, and the map
;;; below says which of them exports each definition.
;;;
;;; The partition is TOTAL, written as a default plus exceptions so that adding an
;;; ordinary prelude procedure still requires no edit here:
;;;
;;;   in *prelude-assignments*      -> the homes listed there
;;;   else in *scheme-base-private* -> defined by (scheme base), exported by nothing
;;;   else                          -> defined AND exported by (scheme base)
;;;
;;; So *scheme-base-private* is not a second mechanism: it is shorthand for the single
;;; home `((scheme base) private)`, which is why one lookup answers both questions.
;;;
;;; A name MAY be assigned to two libraries, which emits an independent definition
;;; into each.  That is not duplication for its own sake: it is how a definition can
;;; serve an internal consumer and a standard library at once, given that a library
;;; can only export a name it DEFINES (compile-library*, src/core.ss) -- there is no
;;; re-export.
;;;
;;; HOME and VISIBILITY are separate axes, decided per library: `(LIBRARY private)`
;;; puts the definition in that library's body while leaving it out of that library's
;;; export list.  *scheme-base-private* is the "hidden everywhere" default; the marker
;;; is the per-library exception to it, and exists because a member sometimes needs a
;;; name that another member is the one to publish.  See home-library / home-exports?
;;; below for the full rule.
;;;
;;; ORDERING: the arrangement of the lists below is still free, because order comes
;;; from the prelude's own definition order, not from here.  But the OLD reason for
;;; that freedom ("it holds because this is a set to SUBTRACT") no longer applies --
;;; *prelude-assignments* is a set to LOOK UP, and a name listed twice in it would be
;;; a rotted declaration, caught by the generator's checks rather than silently
;;; winning.  Do not rely on the subtraction argument when editing.

;;; --- the `unstable` export tier is GONE (change: scheme-base-partition, closes #32) --
;;;
;;; It held exactly two names, `rd-skip-ws` and `rd-token-end`, exported from
;;; (scheme base) "ONLY because something outside the library must resolve the name".
;;; That something was never a macro template -- it is src/repl-core.ss, the REPL's
;;; input-completeness probe, which reuses the reader's own lexeme helpers so the two
;;; cannot drift, and which is COMPILER source compiled as a program.  So the two were
;;; the same category as the compiler's `caddr` calls: names on a public export list
;;; only because the compiler had no other way to reach them.
;;;
;;; It has one now.  The compiler imports (emit internal) directly, so both names moved
;;; into the substrate with the rest of the reader and left (scheme base)'s export list
;;; -- which empties the tier rather than shrinking it.  The rule the tier existed to
;;; encode survives as a plain fact about the partition: a name reaches a public export
;;; list because R7RS puts it there or because Emit publishes it deliberately, never
;;; because an internal consumer needs it.
;;;
;;; (The other two names that once lived here were the helpers `guard` and `parameterize`
;;; expand to.  A macro template is instantiated in the IMPORTER's scope, so every name it
;;; mentions must be exported under exactly that spelling -- `rename` cannot hide one,
;;; since it keys the import table by the EXTERNAL name and leaves the template's spelling
;;; unresolvable.  Since they are published either way, they were renamed to honest public
;;; spellings: `%with-handler` -> `with-exception-handler` (R7RS 6.11, a conformance gain)
;;; and `%with-parameters` -> `with-parameters` (an extension).  A prelude macro template
;;; that mentions a name still forces that name public; that is unchanged, and the
;;; principled fix -- resolving template names hygienically against the library's INTERNAL
;;; bindings -- is still the way to shrink it.)

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
    ;; ALL of them now, including rd-skip-ws / rd-token-end, which used to be the two
    ;; `unstable` exceptions and are ordinary internals again -- their one outside
    ;; consumer, the REPL's input-completeness probe, imports (emit internal) instead.
    ;; Note what this list means once the reader is re-homed by *prelude-assignments*
    ;; below: it says "(scheme base) does not export these", which is still exactly
    ;; right, and is what keeps them out of test/scheme-base-surface-check.sh's expected
    ;; surface.  Where they are DEFINED is the assignment's business, not this list's.
    rd-ws? rd-digit? rd-delim? rd-skip-line rd-skip-ws rd-token-end
    rd-all-digits? rd-numeric? rd-digits
    rd-digits-neg rd-parse-int rd-dotchar? rd-exp-char? rd-sign-char? rd-scan-digits
    rd-flonum? rd-nonfinite rd-atom rd-hex-digit rd-hex rd-str-esc rd-string rd-hash
    rd-char-name rd-char rd-quote rd-quasi rd-unquote rd-dot? rd-append-reverse
    rd-list rd-datum
    ;; port representation
    %port-rtd-cell %port-rtd %make-port %check-input-port %check-output-port %port-buf
    %port-at-eof? %stdout-port %stderr-port %stdin-port))

;;; The libraries this prelude is partitioned into, in DEPENDENCY ORDER -- a member is
;;; emitted, linked and initialized after everything it imports.  Each entry:
;;;
;;;   (LIBRARY-NAME BAKED? (IMPORTED-LIBRARY ...) OUTPUT-PATH)
;;;
;;; BAKED? #t means the member is compiled into the compiler binaries from the baked-in
;;; prelude source and needs NO manifest, which is what lets a program that imports only
;;; (scheme base) -- or nothing -- run in a directory with no emit-libs.scm.  Anything
;;; (scheme base) imports inherits that requirement and must also be baked.
;;; OUTPUT-PATH is where tools/gen-scheme-base.ss writes the member's .sld.
;;;
;;; (emit internal) is the SUBSTRATE (design D1/D2): the shared private machinery that
;;; (scheme base) and the relocated standard libraries both stand on.  It is named
;;; outside the (scheme ...) namespace R7RS reserves for the standard, is NOT
;;; auto-imported -- which is what keeps it out of scope in an ordinary program, and so
;;; what preserves issue #29's privacy guarantee -- and carries no stability guarantee.
;;; It is baked because (scheme base) imports it and (scheme base) must resolve with no
;;; manifest; it is ALSO written to disk and listed in emit-libs.scm because the REPL door
;;; resolves (scheme base) from the manifest (src/emit.cpp, mode 5 -> mode 4), so
;;; base.sld's import of it has to resolve there too.
(define *prelude-libraries*
  '(((emit internal) #t ()                "lib/emit/internal.sld")
    ((scheme base)   #t ((emit internal)) "lib/scheme/base.sld")))

;;; Assignment EXCEPTIONS to the default of (scheme base); see the partition notes in
;;; the header.  Each entry is (NAME HOME ...), one HOME per library whose BODY defines
;;; the name; two homes means the definition is emitted independently into both.
;;;
;;; A HOME is one of:
;;;
;;;   LIBRARY            the library defines it AND exports it
;;;   (LIBRARY private)  the library's body defines it, its export list omits it
;;;
;;; The two are told apart by shape: a library name is a list of SYMBOLS, so its car is
;;; a symbol, while a (LIBRARY private) home's car is the library name -- a pair.
;;;
;;; The per-home `private` marker exists because a member may need a name that ANOTHER
;;; member exports.  (emit internal) defines `length` and `reverse` for its own body,
;;; but (scheme base) exports them, and (scheme read) / (scheme file) / the compiler's
;;; own source import BOTH libraries -- one name offered by two imports resolves to
;;; whichever import-tables->env-alist happens to list first (src/core.ss), silently,
;;; rather than being reported.  So the borrower defines without exporting.
;;;
;;; An assignment OVERRIDES *scheme-base-private*, so a name may appear in both: the
;;; reader helpers stay on that list, which is what keeps them out of (scheme base)'s
;;; export list and out of test/scheme-base-surface-check.sh's expected surface, while
;;; their assignment re-homes them in the substrate, which does export them.  The
;;; substrate is kept non-API by NOT being auto-imported (design D1), not by hiding
;;; names from itself -- a name it holds but does not export would be unreachable.

;;; Give every NAME the same HOMES.  The three groups below differ only in their homes,
;;; and the reason for each group is the interesting part, so they are written as three
;;; declarations rather than as fifty-four hand-repeated entries.
(define (prelude-assign* names homes)
  (map (lambda (n) (cons n homes)) names))

;;; The SUBSTRATE's own contents, in three groups.
;;;
;;; 1. Re-homed in (emit internal) and exported by it; (scheme base) imports what it used
;;;    to define.  This is the reader and the port REPRESENTATION -- the machinery
;;;    (scheme read) and (scheme file) will need once they exist, which is the whole
;;;    reason the substrate exists.
;;;
;;;    %port-rtd-cell and %port-rtd must stay TOGETHER and in exactly ONE library.  A
;;;    record type descriptor is compared by object identity (rt_make_record_type,
;;;    src/runtime/runtime.c), so a second cell would mint a second, DISJOINT port type
;;;    and a port from (scheme file) would fail (scheme base)'s `port?`.  And the cell is
;;;    written only by %port-rtd, which therefore has to sit beside it: a unit's globals
;;;    are written only by its own __init, so assigning an imported binding is refused
;;;    (assign-global, src/parse.ss).
;;;
;;;    NOT here, deliberately (design D10): %check-input-port / %check-output-port.  They
;;;    are the only names in this group that RAISE, and `error` reaches `raise` reaches
;;;    *handlers* -- which can neither come down here (base's `with-exception-handler`
;;;    assigns it, and see above) nor be duplicated (that would split the handler chain,
;;;    so a `guard` around a port error would stop catching it).  They are stateless, so
;;;    the library that needs one defines its own: (scheme base) today, (scheme read) too
;;;    once `read` moves.  %port-at-eof? and the three std-port cells stay for the simpler
;;;    reason that nothing down here needs them.
(define *substrate-rehomed*
  '(;; the in-language reader, entry point last
    rd-ws? rd-digit? rd-delim? rd-skip-line rd-skip-ws rd-token-end
    rd-all-digits? rd-numeric? rd-digits rd-digits-neg rd-parse-int
    rd-dotchar? rd-exp-char? rd-sign-char? rd-scan-digits rd-flonum? rd-nonfinite
    rd-atom rd-hex-digit rd-hex rd-str-esc rd-string rd-hash rd-char-name rd-char
    rd-quote rd-quasi rd-unquote rd-dot? rd-append-reverse rd-list rd-datum
    ;; the port representation
    %port-rtd-cell %port-rtd %make-port %port-buf))

;;; 2. Defined in BOTH libraries and exported by both -- the compositional accessors R7RS
;;;    puts in (scheme cxr).  The substrate carries them for the COMPILER, whose passes
;;;    call caddr/cadddr/cdddr at 48 sites across nine CORE_FLAT files and which would
;;;    otherwise need 48 edits under the self-hosting fixed point (design D6).  Nine
;;;    one-line wrappers over car/cdr, and the on-disk (scheme cxr) will define its own.
;;;    (scheme base) still exports them at this step; step 5 is where it stops.
(define *substrate-cxr*
  '(caaar caadr cadar caddr cdaar cdadr cddar cdddr cadddr))

;;; 3. Defined in the substrate but NOT exported by it, and exported by (scheme base) as
;;;    always -- the base-exported names the substrate's own body reaches.  The substrate
;;;    is the LOWER layer, so it cannot import (scheme base) back; anything its body calls
;;;    has to be defined in it.  This is that debt, in full: %make-port needs `list`,
;;;    rd-string/rd-list need `reverse`, rd-hash needs `list->vector`/`list->bytevector`,
;;;    those need `length`, and group 2's wrappers are built on the depth-2 four.
;;;    Nine definitions, every one a short loop or a one-liner -- categorically unlike
;;;    duplicating the reader, which is what design D1 refused.
;;;    They are `private` HERE and only here: (scheme base) is the library that publishes
;;;    these names, and anything importing both members must not be offered two.
(define *substrate-borrowed*
  '(caar cadr cdar cddr length list reverse list->vector list->bytevector))

(define *prelude-assignments*
  (append
    (prelude-assign* *substrate-rehomed*  '((emit internal)))
    (prelude-assign* *substrate-cxr*      '((emit internal) (scheme base)))
    (prelude-assign* *substrate-borrowed* '(((emit internal) private) (scheme base)))))

;;; The library a HOME names, and whether that home publishes the name.
(define (home-library h) (if (pair? (car h)) (car h) h))
(define (home-exports? h) (if (pair? (car h)) #f #t))

;;; NAME's homes, as HOME specs -- the one lookup the whole partition rests on.  Every
;;; prelude definition has at least one home, including a private one: a private helper
;;; still has to live in the body of the library whose exported procedures call it.
(define (prelude-home-specs name)
  (let ((e (assq name *prelude-assignments*)))
    (cond (e (cdr e))
          ((memq name *scheme-base-private*) '(((scheme base) private)))
          (else '((scheme base))))))

;;; The libraries whose body DEFINES name.  Home and visibility are separate axes, which
;;; is what lets a name move to another library (a new home) while staying hidden, or be
;;; defined in two libraries and exported by only one of them.
(define (prelude-homes-of name)
  (map home-library (prelude-home-specs name)))

;;; Does LIB export NAME?  LIB must be one of the name's homes -- a library can only
;;; export what it defines (compile-library*, src/core.ss) -- and that home must not
;;; carry the `private` marker.  Used by BOTH derivations, the portable one in
;;; src/core.ss and the Chez generator, so they cannot disagree about where a name lives.
(define (prelude-exports? lib name)
  (let loop ((hs (prelude-home-specs name)))
    (cond ((null? hs) #f)
          ((equal? (home-library (car hs)) lib) (home-exports? (car hs)))
          (else (loop (cdr hs))))))

;;; Does LIB's body define NAME?
(define (prelude-defines? lib name)
  (if (member lib (prelude-homes-of name)) #t #f))
