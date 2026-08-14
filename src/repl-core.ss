;;; repl-core.ss -- the interactive REPL orchestration, in the compiled core.
;;;
;;; Change: repl-embedded-incremental.  This is the incremental, stateful half of
;;; the compiler that used to live in the Chez driver (`run-repl`, compile.ss).
;;; Ported here it compiles under Emit itself, so the interactive `--repl`
;;; runs its compilation in-process (no Chez, no per-form subprocess) -- the same
;;; embedding Path A that `emit run` uses for batch.
;;;
;;; It is assembled ONLY into the REPL embedded compiler (tools/assemble-core.ss
;;; --repl-entry), after the pure core (parse/expand/passes/emit/core.ss) whose
;;; functions it drives: make-repl-env, expand, normalize-define, define-form?,
;;; define-syntax-form?, define-name, parse-define-syntax, repl-lower-form(*),
;;; repl-register-define!, repl-lcode, emit-repl-module, emit-repl-batch, union*,
;;; *core-keywords*/*prims*/*extra-op-keywords*, and read-all-from-string.
;;;
;;; SESSION STATE lives as top-level mutable globals: being A-linked in one host
;;; process, they persist across the host's repeated `scheme_entry` calls -- which
;;; is exactly the incremental-compilation state `run-repl` threaded by hand.
;;; The form/gensym counter (*repl-n*) is initialized once by init-session and
;;; only ever incremented, never reset per form (run-repl's @__repl_N discipline).

;; #(name->mangled-sym alist, generation)
(define *repl-env* (make-repl-env))

;; ((name . transformer) ...)
(define *repl-macro-env* (quote ()))

;; hygiene "known bindings" set
(define *repl-known* (quote ()))

;; per-form thunk counter (@__repl_N)
(define *repl-n* 0)

;; Loaded units, each the export-table datum (lib-name exports-alist call-rows)
;; compile-library returns -- so a loaded unit's session record IS the import table
;; its dependents need (changes: module-artifacts-vertical-slice,
;; cross-unit-direct-calls).
(define *repl-libs* (quote ()))

;; The session's direct-call table: mangled symbol -> (label . arity), merged from
;; each imported unit's call rows, so an interactive form direct-calls a library
;; procedure exactly as a batch program does (change: cross-unit-direct-calls).
(define *repl-calls* (quote ()))

;; ((lib-name . (import-name ...)) ...) each loaded unit's DIRECT imports -- the run
;; door computes a program's transitive init closure in topological order over this
;; in-memory graph, since the driver's toposort-libs reads files and is Chez-only
;; (change: run-door-user-libraries).
(define *repl-lib-imports* (quote ()))

;; register a define-syntax in the session (mirrors run-repl's note-syntax!)
(define (repl-note-syntax! form)
  (set! *repl-macro-env* (cons (parse-define-syntax form) *repl-macro-env*))
  (set! *repl-known* (cons (cadr form) *repl-known*)))

;; expand a define's INIT (not its raw signature -- expanding the raw form would
;; treat a dotted param list like `(f . xs)` as an application), then rebuild a
;; simple (define name expanded-init); expand any other form whole.  (run-repl's
;; expand-form.)
(define (repl-expand-form form)
  (if (define-form? form)
      (let ([nd (normalize-define form)])
        (list (quote define) (car nd) (expand (cadr nd) *repl-macro-env* *repl-known*)))
      (expand form *repl-macro-env* *repl-known*)))

;; --- error rendering (for the host to report a compile error on stderr) -----
;; A raised object is normally an R7RS error object ("who: message" + irritants);
;; render it to a plain string.
;;
;; The "best-effort irritant rendering is fine" rationale this carried is what aged
;; (change: reader-datum-parity; issue #52).  The harnesses do discard the text, but
;; USERS do not, and the `?` this fell through to swallowed the one part of the message
;; the user typed -- `(import (bad))` reported "imported library not loaded ?", dropping
;; the library name.  It falls through to render-datum-loose instead, which fixes every
;; LIST irritant on every door at once rather than one call site: render-datum moved to
;; src/core.ss during module-frontend-diagnostics for exactly this reason.
;;
;; The LOOSE renderer, not the strict one: strict raises for a character with no portable
;; external representation, and raising while formatting an error message would replace a
;; diagnostic with a secondary failure (design D4).
;;
;; The symbol/string/number arms stay ahead of it: they are the common irritants and the
;; hot path, and a bare symbol must render as its name rather than acquire quoting.
(define (repl-irritant->string x)
  (cond
    [(symbol? x) (symbol->string x)]
    [(string? x) x]
    ;; A NUMBER renders too (change: reader-lexical-conformance): the reader's reports
    ;; name a source position, and rendering that as "?" told the user nothing about
    ;; where the unterminated comment opened.  Every other numeric irritant gains from
    ;; the same arm.
    [(number? x) (number->string x)]
    [else (render-datum-loose x)]))
(define (repl-irritants->string xs)
  (if (null? xs)
      ""
      (string-append " "
        (string-append (repl-irritant->string (car xs))
                       (repl-irritants->string (cdr xs))))))
(define (repl-error->string e)
  (if (error-object? e)
      (string-append (error-object-message e)
                     (repl-irritants->string (error-object-irritants e)))
      "error"))

;; --- compile one entered form (run-repl's `feed`, minus the host framing) ---
;; Snapshot all session state, compile the form under an in-language `guard`, and
;; on a raised error restore the snapshot so a bad form never corrupts the session
;; (design D3).  Returns a (status . payload) pair the host destructures:
;;   (ok     . (ir-text . entry-name))   host JITs + looks up entry-name
;;   (error  . message-string)           host reports on stderr; session continues
;;   (syntax . registered-name)          a define-syntax was registered
(define (compile-one-form form)
  (let ([s0 (vector-ref *repl-env* 0)]
        [s1 (vector-ref *repl-env* 1)]
        [sme *repl-macro-env*]
        [sk *repl-known*]
        [sn *repl-n*])
    (guard (e (#t (vector-set! *repl-env* 0 s0)
                  (vector-set! *repl-env* 1 s1)
                  (set! *repl-macro-env* sme)
                  (set! *repl-known* sk)
                  (set! *repl-n* sn)
                  (cons (quote error) (repl-error->string e))))
      (cond
        ;; A define-library at the prompt is not an expression: ordinary parsing reads it
        ;; as an application over internal defines and reports a malformed body, a message
        ;; about the misparse rather than the limit (issue #49, change:
        ;; module-frontend-diagnostics).  Raised, not returned, so it takes the same
        ;; recoverable path as every other compile-time error -- the guard above restores
        ;; the session snapshot and the host returns to the prompt (design D6).  Whether
        ;; the prompt SHOULD accept one is #49's own question; this states what it does.
        [(define-library-form? form)
         (error 'define-library
                (string-append "libraries are not defined at the prompt: "
                               (render-datum (cadr form))
                               " -- a library is imported, named in the manifest"))]
        [(define-syntax-form? form)
         (repl-note-syntax! form)
         (cons (quote syntax) (symbol->string (cadr form)))]
        [(import-form? form)
         ;; (import (L) ...): merge each library's exports into the session scope
         ;; as imported bindings; the unit is already loaded (mode 4) so no module
         ;; is emitted here (change: module-artifacts-vertical-slice).
         (for-each
           (lambda (lib)
             (unless (repl-import! lib)
               (error 'repl "imported library not loaded" lib)))
           (cdr form))
         (cons (quote import) "")]
        [else
         (let ([dn (define-name form)])
           (when dn (set! *repl-known* (cons dn *repl-known*)))
           ;; --dump in the REPL: the entered form IS the unit under inspection, and
           ;; every stage is tagged with the form's identity -- its define name, else
           ;; its session index -- since these passes run once per form (design D8,
           ;; change: emit-dump-stages).
           (let* ([d  (dump-tagged (make-dumper #f)
                                   (if dn
                                       (string-append "define " (symbol->string dn))
                                       (string-append "form " (number->string (+ *repl-n* 1)))))]
                  ;; the slots the session already has, snapshotted BEFORE this form
                  ;; registers its own define -- so a `set!` of an existing global
                  ;; references its slot instead of re-defining it (issue #5).
                  [prior (map cdr (vector-ref *repl-env* 0))]
                  [il (repl-lower-form *repl-env* (repl-expand-form form))])
             (d "parse+rename" il)
             ;; the session's imported procedures are direct-callable from this form
             ;; (change: cross-unit-direct-calls); set per form, so nothing an earlier
             ;; library load left behind can leak into a session with no imports.
             (set-import-calls! *repl-calls*)
             (let ([lc (repl-lcode il d)])
               (let ([m (emit-repl-module lc (+ *repl-n* 1) prior)])
                 (set! *repl-n* (+ *repl-n* 1))
                 (cons (quote ok) (cons (car m) (cadr m)))))))]))))

;; text -> (status . payload).  Read exactly one form from the host-supplied text
;; (the host already sliced it to one complete form via form-complete?), then
;; compile it.  Wrapped in the same guard so a reader error also degrades to an
;; error status rather than aborting the session.
(define (compile-one-form-text text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let ([forms (read-all-from-string text)])
      (if (null? forms)
          (cons (quote error) "empty form")
          (compile-one-form (car forms))))))

;; --- prelude as one startup batch (run-repl's load-prelude!) ----------------
;; Load the standard library as ONE mutually-recursive group: collect its macros,
;; pre-register every define name (so forward/mutual references resolve), lower
;; each body reusing those symbols, and emit a single combined module whose
;; globals later interactive forms resolve against.  The interactive thunk counter
;; starts ABOVE the batch's @__repl_1..N range so names never collide in the JIT.
;; Returns the batch IR text (its entry is @scheme_entry -- the host looks it up
;; and calls it once to initialize the prelude's global slots).
(define (repl-load-prelude! forms)
  (for-each
    (lambda (f)
      (cond [(define-syntax-form? f) (repl-note-syntax! f)]
            [(define-form? f)
             (set! *repl-known* (cons (define-name f) *repl-known*))
             (repl-register-define! *repl-env* f)]
            [else (if #f #f)]))
    forms)
  ;; The prelude batch is not the unit under inspection, so its stages appear only at
  ;; the all-units dump level (design D7) -- otherwise every REPL start would bury the
  ;; session under the standard library's lowering.
  (let ([progs (fold-left
                 (lambda (acc f)
                   (if (define-form? f)
                       (let* ([d  (dump-tagged (make-dumper (quote (scheme base)))
                                               (string-append "define "
                                                              (symbol->string (define-name f))))]
                              [il (repl-lower-form* *repl-env* (repl-expand-form f) #f)])
                         (d "parse+rename" il)
                         (cons (repl-lcode il d) acc))
                       acc))
                 (quote ()) forms)])
    (set! *repl-n* (length progs))
    ;; A DISTINCT entry name (not scheme_entry): the host links the compiler's own
    ;; @scheme_entry, so the prelude batch's entry must be uniquely named for the
    ;; host's JIT->lookup to find THIS module.  Kept in sync with host.cpp.
    (emit-repl-batch-named (reverse progs) "__repl_prelude")))

;; Initialize a fresh session and return the prelude batch IR (or "" when
;; PRELUDE-SRC is empty, i.e. --no-prelude).  Seeds the base known-names set
;; exactly as run-repl did.  Called once by the host at startup.
(define (init-session prelude-src)
  (reset-counter!)                             ; monotonic gensym for @code_N labels
  (set! *repl-env* (make-repl-env))
  (set! *repl-macro-env* (quote ()))
  ;; include the intrinsic integrable prims (cons, +, car, …) so a macro template
  ;; that mentions one is treated as a known binding and not hygiene-renamed --
  ;; mirrors compute-known on the batch path (change: first-class-primitives).
  (set! *repl-known* (union* (list *core-keywords* *prims* *extra-op-keywords*
                                   (map car *integrable*))))
  (set! *repl-n* 0)
  (set! *repl-libs* (quote ()))
  (set! *repl-calls* (quote ()))
  (set! *repl-lib-imports* (quote ()))
  ;; Stage 3 (module-prelude-scheme-base): the prelude's PROCEDURES now come from the
  ;; (scheme base) library -- the host preloads it and then calls mode 6 to auto-import
  ;; it into the session scope.  init only merges the derived-form MACROS (the
  ;; compile-time half), emitting NO procedure batch, so it returns "".  --no-prelude
  ;; passes "" here, so no macros are merged and no auto-import happens.
  (let ([forms (read-all-from-string prelude-src)])
    (for-each (lambda (f) (when (define-syntax-form? f) (repl-note-syntax! f))) forms)
    ""))

;; Auto-import (scheme base) into the session scope after the host has preloaded it
;; (mode 6).  Merges its exports so later forms resolve prelude procedures to the
;; loaded library's external globals.  Returns (ok . "") or (error . msg) so the host
;; can warn if the standard library was not on the manifest.
(define (repl-autoimport-scheme-base)
  (if (repl-import! (quote (scheme base)))
      (cons (quote ok) "")
      (cons (quote error) "(scheme base) not loaded (missing from manifest?)")))

;; --- library import (both-doors REPL half; change: module-artifacts-vertical-slice)
;; Merge a loaded library's exports into the session scope: each external name
;; maps to the exporter's mangled global symbol, so a later form resolves it to an
;; `external global` the JIT binds to the already-loaded unit (design D3).  Returns
;; #f if the named library was not loaded (mode 4) first.
(define (repl-import! lib-name)
  (let ([entry (assoc lib-name *repl-libs*)])
    (and entry
         (begin
           (for-each
             (lambda (e)                     ; e = (external-name . mangled-string)
               (vector-set! *repl-env* 0
                 (cons (cons (car e) (string->symbol (cdr e)))
                       (vector-ref *repl-env* 0)))
               ;; the imported name is a "known" binding, so a derived-form macro
               ;; may introduce a reference to it (e.g. `case` -> `memv`) without
               ;; hygiene renaming it away (change: module-prelude-scheme-base).
               (set! *repl-known* (cons (car e) *repl-known*)))
             (cadr entry))
           ;; and its direct-callable procedures, keyed by the same mangled symbol a
           ;; later form will resolve to (change: cross-unit-direct-calls).  A
           ;; redefinition does not disturb these: it binds the NAME to a fresh
           ;; program global (x.gN), which is not in this table, so the redefined
           ;; name goes back to an indirect call while forms compiled earlier keep
           ;; direct-calling the library slot they captured.
           (set! *repl-calls*
                 (append (import-tables->call-alist (list entry)) *repl-calls*))
           ;; ...and its compile-time interface (change: library-macro-export, design D7):
           ;; the exported transformers join the session's macro environment so a LATER
           ;; form may use an imported macro, and the mangled bindings their templates
           ;; reference join the environment (mapping to themselves, so they lower as
           ;; external globals) and the known set.  All three are session state, so an
           ;; imported macro persists across forms exactly as an imported procedure does,
           ;; and is restored with the rest of the state when a form's compile fails.
           (let ([refs (import-tables->macro-refs (list entry))])
             ;; appended, not consed: a `define-syntax` entered at the prompt goes on the
             ;; FRONT (repl-note-syntax!), so the session's own macro shadows an imported
             ;; keyword of the same spelling.
             (set! *repl-macro-env*
                   (append *repl-macro-env* (import-tables->macro-env (list entry))))
             (for-each (lambda (k) (set! *repl-known* (cons k *repl-known*)))
                       (import-tables->macro-keywords (list entry)))
             (for-each
               (lambda (s)
                 (vector-set! *repl-env* 0 (cons (cons s s) (vector-ref *repl-env* 0)))
                 (set! *repl-known* (cons s *repl-known*)))
               refs))
           #t))))

;; Assemble the import tables (list (name export-alist call-rows) ...) for a library's
;; direct imports from the already-loaded units in *repl-libs* (change:
;; module-generalize).  Returns #f if any import is not loaded yet, so the host
;; can defer this library and retry after its dependencies load (topological order
;; emerges from the fixpoint preload).
(define (repl-import-tables imports)
  (let loop ([imps imports] [acc '()])
    (if (null? imps)
        (reverse acc)
        (let ([entry (assoc (car imps) *repl-libs*)])
          (and entry
               ;; the session record IS the export table (name exports calls), so it
               ;; is handed to the core as-is (change: cross-unit-direct-calls).
               (loop (cdr imps) (cons entry acc)))))))

;; --- a lone define-library's import environment (modes 7 and 11) ---------------
;; (change: baked-set-on-every-door).  Both the unit-emitting mode and the
;; export-table mode compile ONE library that is not part of a program's closure, and
;; both must resolve its declared imports the same way or the table would describe a
;; different resolution than the emitted unit does.  Returns the export tables for the
;; library's declared imports, or #f when one of them is not loaded in this session --
;; which for `emit lib` means "neither baked nor named in the manifest".
;;
;; Before this, both passed '() and an import resolved to nothing: a library declaring
;; `(import (scheme base))` failed with `unbound variable map`, and -- the quieter half
;; -- a library importing a library that does not exist compiled SILENTLY, while a
;; program importing one was correctly rejected.
(define (lone-library-tables lib)
  (repl-import-tables (cadr (parse-define-library lib))))

;; Name the unresolved imports, so the diagnostic says which library is missing rather
;; than that something is.  Each name is rendered on its own -- `(nope)`, not the `((nope))`
;; a rendered LIST of names would give, which reads like one nested library name.
;;
;; Takes the import NAMES, not a library form, because both callers need it and only one
;; has a form: the lone-library path (mode 7 / `emit lib`) parses them out of the
;; define-library, and the PROGRAM path already holds them as `direct` (change:
;; manifest-empty-guards; issue #63).  The program path used to report the constant
;; "program imports a library not found in the manifest", naming nothing -- while the
;; library path two hundred lines away named the library correctly, so the same failure
;; read differently depending on which door found it.  module-system already required the
;; name ("the resulting failure SHALL be reported by import resolution, naming the
;; unresolved library"); only the library half implemented it.
(define (unresolved-imports-msg imps0)
  (let loop ([imps imps0] [missing (quote ())])
    (if (null? imps)
        (string-append "unresolved import (not baked, not in the manifest): "
                       (join-rendered (reverse missing)))
        (loop (cdr imps)
              (if (assoc (car imps) *repl-libs*)
                  missing
                  (cons (car imps) missing))))))
(define (lone-library-unresolved-msg lib)
  (unresolved-imports-msg (cadr (parse-define-library lib))))

;; Render each datum and join with ", ".
(define (join-rendered ds)
  (let loop ([ds ds] [acc ""] [first? #t])
    (if (null? ds)
        acc
        (loop (cdr ds)
              (string-append acc (if first? "" ", ") (render-datum (car ds)))
              #f))))

;; Compile a library from its source text (host read the file): parse the
;; define-library, resolve its imports against already-loaded units, compile the
;; unit, remember its exports, and return (ok . (ir . init-symbol)) so the host
;; addIRModules the unit and runs its one-shot @"L:__init" once.  If a direct
;; import is not loaded yet, return (deferred . name) so the host retries later
;; (change: module-generalize).  The session gensym counter is preserved across
;; the compile: library code labels are @"L:code_N" (qualified, so a per-library
;; reset is safe), but interactive forms and the prelude share the unqualified
;; @code_N namespace, so the session counter must stay monotonic.
(define (repl-load-library-text text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    ;; Start this library's include record empty (change: chez-free-unit-pipeline, design
    ;; D7).  BEFORE parse-define-library, which is where the include family runs, and on
    ;; every attempt: a library that returns `deferred` is re-submitted after its
    ;; dependencies load, and the record must describe the attempt that succeeded rather
    ;; than the union of all of them.  Mode 16 reads it back.
    (reset-includes-read!)
    (let* ([forms (read-all-from-string text)]
           ;; A source that holds NO DATUM cannot yield the define-library this needs, and
           ;; (car '()) is unchecked -- it faulted the door instead of reporting (change:
           ;; manifest-empty-guards; issue #63).  Raise into the guard above rather than
           ;; return early, so the path prefix the host adds is the same one every other
           ;; library error gets.  Byte-empty sources never arrive here (the host folds an
           ;; empty read into "cannot read library source"), but a comment-only one does.
           ;; Unlike an entryless MANIFEST, which is benign, this is an error: see
           ;; manifest-entries.
           [dl    (if (null? forms)
                      (error 'library "source holds no define-library form")
                      (parse-define-library (car forms)))]
           [name  (car dl)]
           [tables (repl-import-tables (cadr dl))])   ; #f if a dep is not loaded yet
      (cond
       ;; Already loaded -> skip (no module).  EVERY door registers the baked set (mode 8)
       ;; before preloading the manifest, and a manifest may name a baked member -- the
       ;; repository's own emit-libs.scm names both, because the Chez driver resolves them
       ;; from there.  This guard is what makes such an entry a no-op rather than a
       ;; duplicate module (changes: run-door-user-libraries, baked-set-on-every-door).
       ;;
       ;; The test is by library NAME, so it covers whatever the partition holds rather
       ;; than an enumerated subset.  It is now a BACKSTOP rather than the mechanism: mode 9
       ;; omits every baked member from the preload list in the first place (change:
       ;; chez-free-unit-pipeline), so a manifest entry for one no longer reaches this at
       ;; all through a door's preload.  It still fires for an interactive `(import ...)`
       ;; of a baked member, and it is what keeps a stale cache entry or a hand-driven mode
       ;; 4 from adding a duplicate module.
       [(assoc name *repl-libs*) (cons (quote already) name)]
       [(not tables) (cons (quote deferred) name)]    ; retry after dependencies load
       [else
        (let ([saved counter])
          ;; A manifest library loaded to satisfy an import is not the unit under
          ;; inspection: level 3 (--dump-all) only, and named in its headers.
          (let ([res (compile-library (car dl) (cadr dl) (caddr dl) (cadddr dl) tables
                                     (make-dumper name))])
            (set! counter saved)                      ; undo compile-library's reset-counter!
            (set! *repl-libs* (cons (cadr res) *repl-libs*))   ; the export table itself
            ;; record this unit's DIRECT imports for the run door's init-closure
            ;; topological sort (change: run-door-user-libraries).
            (set! *repl-lib-imports* (cons (cons name (cadr dl)) *repl-lib-imports*))
            (cons (quote ok) (cons (car res) (mangle name "__init")))))]))))

;; The manifest's ENTRY LIST: its single top-level form, or () when the text holds no
;; datum -- a zero-byte file, whitespace only, or comments only (change:
;; manifest-empty-guards; issue #63).  The pair test is the whole point: `car` of a
;; non-pair is unchecked by design (core-language, "the runtime applies the SAME
;; unchecked semantics ... e.g. `(car x)` for a non-pair `x`"), so the three parsers
;; below used to SEGFAULT the door on a datum-free manifest rather than diagnose it.
;;
;; It has to be decided HERE and not in the host, because "empty" means "no datum" and
;; whitespace and comments are the READER's grammar: a byte-length test in C++ passes a
;; comment-only manifest straight through, and re-implementing the comment grammar there
;; would be a second reader.
;;
;; An entryless manifest is BENIGN -- module-system requires that finding no manifest at
;; all stay non-fatal, and a manifest that declares nothing resolves the same set.  That
;; is the opposite of a datum-free library SOURCE, which cannot yield the define-library
;; its caller needs and is an error (see repl-load-library-text).
;;
;; The form is returned AS READ, without checking it is a list: the three parsers below
;; walk it with `(pair? es)` rather than `(null? es)`, which terminates on a proper list's
;; (), on an IMPROPER one's non-pair tail, and immediately on a manifest that is a bare
;; symbol or number.  Those shapes segfaulted too -- `hello`, `42`, `(a . b)` all reached
;; a (car NON-PAIR) -- and one predicate makes the walk total instead of enumerating them.
;;
;; MORE THAN ONE FORM IS AN ERROR (change: reader-input-termination; issue #67).  A manifest
;; is exactly one form -- the list of entries -- and `(cdr forms)` used to be dropped in
;; silence, so the natural mistake of writing one parenthesized group per entry (which LOOKS
;; like a list of entries and READS as several) left the later entries unresolvable.  It then
;; surfaced as an unresolved import naming the importer, blaming the program for a mistake in
;; the manifest.
;;
;; Rejecting rather than CONCATENATING the forms is a grammar decision, not just a guard
;; (design D5): concatenation would make the mistake work, but it widens the documented
;; grammar and is the direction that cannot be taken back.  Admitting it later is additive.
;;
;; The count is named here and the PATH is named by the host: modes 5/9/10 receive only the
;; text, because the host owns file I/O -- and it holds the path at each call site, which
;; matters when a chain has listed three candidates in the narration.
;; More than one top-level form?  -> how many, else #f.  The RULE lives here once; the
;; WORDING differs by channel below, because each prepends its own context -- mode 10's host
;; prints "emit: manifest PATH ..." while a raise prints "manifest: ...".
(define (manifest-extra-forms forms)
  (if (and (pair? forms) (pair? (cdr forms))) (length forms) #f))

(define (manifest-entries text)
  (let ([forms (read-all-from-string text)])
    (if (pair? forms)
        (let ([k (manifest-extra-forms forms)])
          ;; Modes 5 and 9 return a bare string and have nowhere to put a status, so this
          ;; RAISES; mode 10 carries an (ok . _) / (error . MSG) pair and reports through it.
          (if k
              (error (quote manifest)
                     "a manifest is one top-level form (the list of entries); this one holds"
                     k)
              (car forms)))
        (quote ()))))                             ; no datum: an empty manifest, as above

;; Mode 5 -- `repl-manifest-paths`, every (library ...) entry's source path including the
;; baked members -- is RETIRED (change: chez-free-unit-pipeline, design D3).  The REPL host
;; was its only caller and now uses mode 9 like every other door.  The number stays reserved
;; rather than renumbering 6-15 downward: a mode number is a wire protocol between
;; src/emit.cpp and this file, which regen compiles independently, so a gap costs this
;; comment while a renumber costs a window in which the host and the core disagree about
;; what mode 7 means.

;; The manifest's USER libraries: every (library ...) entry that is not a member of the
;; baked set.  A baked member is compiled into the binary and registered by mode 8, or
;; deliberately absent under --no-prelude, so it must never be loaded from the manifest --
;; doing so would emit a duplicate/spurious module, or (under --no-prelude) compile a
;; standard library the session has decided not to have (change: run-door-user-libraries;
;; chez-free-unit-pipeline, issue #101).
;;
;; The test is baked-set MEMBERSHIP, not the single name `(scheme base)` it used to
;; hard-code.  The baked set is a PARTITION -- (emit internal) as well as (scheme base) --
;; and this repository's own emit-libs.scm names both, for the Chez driver.  With one name
;; hard-coded the substrate leaked through the same hole the standard library did: eagerly
;; on the REPL door, on demand on the run door.
;;
;; EVERY door uses this now (change: chez-free-unit-pipeline, design D1).  The REPL used to
;; take the whole manifest through mode 5, which is why `emit repl --no-prelude` compiled
;; (scheme base) from the manifest and then bound none of it -- 1.14 s of work performed and
;; discarded against a 0.024 s floor (issue #101).  Mode 5 is retired; see below.
;;
;; Each line is "KEY<TAB>PATH" (change: numeric-conformance).  The key is
;; `(mangle name "")` -- the same canonical unit prefix the emitted symbols carry --
;; so the run host can index the manifest by library name using plain string
;; comparison, without re-implementing library-name equality in C++.  It needs that
;; index because the run door now preloads LAZILY: only the libraries in the
;; program's transitive import closure, rather than every entry in the manifest.
(define (repl-manifest-user-paths text)
  (let loop ([es (manifest-entries text)] [acc ""])
    (if (not (pair? es))                    ; total: (), an improper tail, or a non-list manifest
        acc
        (let* ([entry  (car es)]
               [is-lib (and (pair? entry) (eq? (car entry) (quote library)))]  ; skip (program ...)
               [name   (and is-lib (cadr entry))]
               [src    (and is-lib
                            (cond [(assq (quote source) (cddr entry)) => cadr] [else #f]))])
          (loop (cdr es)
                (if (and src (not (baked-member? name)))
                    (string-append acc (mangle name "") "\t" src "\n")
                    acc))))))

;; A SOURCE TEXT's direct imports, one canonical key per line (change:
;; numeric-conformance).  Serves both shapes the run door's lazy preload walks:
;; a PROGRAM (its leading `(import ...)` forms, via the same collect-imports the
;; compile paths use) and a LIBRARY .sld (its `import` declaration, via the same
;; parse-define-library that loading one uses).  Answering for both from one entry
;; point is what lets the host walk the closure outward -- program, then each .sld it
;; reaches -- without the core doing any I/O.  Keys match repl-manifest-user-paths.
;;
;; This is a pure query: it reads and parses, and registers nothing.
;;
;; It also DIAGNOSES nothing.  The two parsers it borrows now reject what the module
;; front end does not implement -- an import set, an unrecognized declaration (change:
;; module-frontend-diagnostics) -- and this mode's contract is a plain string, so a raise
;; here would escape uncaught and abort the door before the compile that owns the
;; diagnostic ever ran: the user would see the message with no door prefix and a dead
;; process, which is exactly the abort design D6 rules out.  A source whose imports
;; cannot be read simply has none to preload; the guarded compile that follows reports
;; it, once, through its door.
(define (repl-source-imports text)
  (guard (e (#t ""))
    (let* ([forms (read-all-from-string text)]
           [lib?  (and (pair? forms) (pair? (car forms))
                       (eq? (car (car forms)) (quote define-library)))]
           [names (if lib?
                      (cadr (parse-define-library (car forms)))
                      (car (collect-imports forms)))])
      (let loop ([ns names] [acc ""])
        (if (null? ns)
            acc
            (loop (cdr ns) (string-append acc (mangle (car ns) "") "\n")))))))

;; Where the source the host is ABOUT to submit came from (change:
;; library-include-declarations, design D4).  The core is handed source TEXT and never a
;; path, so an `include` in that text would otherwise have nothing to resolve against but
;; the working directory -- the door-parity failure `manifest-search-path` and
;; `baked-set-on-every-door` each had to fix once.  The host calls this before modes 4, 7,
;; 11, and 12; "" means the source has no path (it came from standard input) and its
;; relative includes resolve against the current directory.
;;
;; It is a MODE rather than an environment variable because it is per-source state in a
;; persistent session, not a process-wide flag like EMIT_DUMP_LEVEL: a home left in the
;; environment would silently outlive the compile that set it.
(define (repl-set-source-home path)
  (set-source-home! path)
  (cons (quote ok) ""))

;; List the manifest's PROGRAM entries for the emit build door (Chez-free; change:
;; emit-build-bin-entry).  Each `(program NAME (source S) [(output O)])` entry yields
;; THREE newline-separated lines -- NAME, S, and O (O empty when there is no
;; (output ...) clause) -- so the host (`emit run --resolve-program`) can select
;; one by name and hand its source to `emit build`.  Library entries are
;; ignored (this lists programs, not libraries); uses only \n, mirroring
;; repl-manifest-user-paths.
;;
;; Returns (status . payload) -- the convention modes 4 and 8 already use, for which the
;; host has status_of/door_msg -- rather than a bare string (change:
;; manifest-empty-guards; issue #63).  `emit build` needs an entryless manifest to be
;; DISTINGUISHABLE from one declaring libraries but no program: both yield zero triples,
;; but the first means "you have not written your manifest yet" and the second means
;; "you wrote libraries but no program", and only the reader can tell them apart.  A
;; sentinel line was the alternative and shares a namespace with program names.
;; NOTE this does NOT route through `manifest-entries`: it needs the (ok . _) / (error . MSG)
;; pair, and manifest-entries raises.  That difference is why the form-count RULE is factored
;; into `manifest-extra-forms` and applied here separately -- consolidating only two of the
;; three parsers is what let a two-form manifest through this door after the other two
;; rejected it, so mode 10 narrated a build it then abandoned (change: reader-input-termination).
;;
;; The guard is what lets the HOST name the manifest: it prints "emit: manifest PATH <msg>",
;; and the core is handed only text.  Without it a truncated manifest reported the reader's
;; raise with no file attached, and every door's narration had already listed the candidates.
(define (repl-manifest-programs text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
   (let ([forms (read-all-from-string text)])
    (if (null? forms)
        (cons (quote error) "declares no entries")
      (let ([k (manifest-extra-forms forms)])
       (if k
        (cons (quote error)
              (string-append "holds " (number->string k)
                             " top-level forms; a manifest is one form (the list of entries)"))
        (let loop ([es (car forms)] [acc ""])
          (if (not (pair? es))              ; total: (), an improper tail, or a non-list manifest
              (cons (quote ok) acc)
              (let ([e (car es)])
                (if (and (pair? e) (eq? (car e) (quote program)))
                    (let* ([name    (symbol->string (cadr e))]
                           [clauses (cddr e)]
                           [src     (cond [(assq (quote source) clauses) => cadr] [else ""])]
                           [out     (cond [(assq (quote output) clauses) => cadr] [else ""])])
                      (loop (cdr es) (string-append acc name "\n" src "\n" out "\n")))
                    (loop (cdr es) acc)))))))))))

;; --- run door: run an importing program in-process (change: run-door-user-libraries) ---
;; The run host preloads user libraries (mode 4, WITHOUT running __init) and registers
;; the baked (scheme base) (mode 8), then mode 7 compiles the whole program against them.
;; It is a FRESH whole-program compile calling the SAME compile-program-with-imports the
;; AOT door drives, so the emitted program module is byte-identical to the AOT prog.ll.

;; Append (scheme base) to a program's imports unless already present -- the run-door
;; equivalent of the driver's with-scheme-base, matching its direct-import order so the
;; toposort (and thus the program module) agrees byte-for-byte.  Under --no-prelude
;; (host sets EMIT_NO_PRELUDE, read by %no-prelude?) the prelude is not implied, exactly
;; as the driver's with-scheme-base gates on prelude?.
(define (run-with-scheme-base imports)
  (if (or (%no-prelude?) (member (quote (scheme base)) imports))
      imports
      (append imports (list (quote (scheme base))))))

;; Transitive import closure of ROOTS over *repl-lib-imports*, in dependency
;; (topological) order -- deepest dependency first, each once.  Same DFS post-order as
;; the driver's toposort-libs, so init-libs (and the program module) match.  A name on
;; the current DFS path is a back-edge -> import cycle.  A name with no recorded imports
;; (e.g. baked (scheme base), or a leaf) is treated as a leaf.
(define (run-visit-lib name path seen)
  (cond
    [(member name seen) seen]
    [(member name path) (error 'run "import cycle among libraries" name)]
    [else
     (let ([imps (cond [(assoc name *repl-lib-imports*) => cdr] [else (quote ())])])
       (cons name (run-visit-libs imps (cons name path) seen)))]))
(define (run-visit-libs names path seen)
  (if (null? names)
      seen
      (run-visit-libs (cdr names) path (run-visit-lib (car names) path seen))))
(define (run-closure-order roots)
  (reverse (run-visit-libs roots (quote ()) (quote ()))))

;; Mode 8: build the BAKED SET from the baked-in prelude source and register every member
;; as a loaded unit (its export table + its declared imports), returning
;; (ok . (ir . init-symbol)) so the host JIT-adds the modules WITHOUT running any __init --
;; the program's @scheme_entry inits them in topo order, exactly as a fresh AOT executable
;; does.  The set is baked in, not read from the manifest (design D6), so a plain program
;; needs no manifest and no files.
;;
;; `ir` is the members' modules joined by *emit-unit-boundary*, because a partition emits
;; more than one and they cannot share an LLVM module -- each emits a fixed @__apply0 and
;; string globals from a reset counter (change: scheme-base-partition).  The host splits on
;; the same marker it already uses for the library/program split.
;;
;; The init field is every member's __init symbol, newline-joined in the SAME dependency
;; order as the modules (compile-baked-set returns its tables in that order).  A door that
;; emits a program ignores this and lets the program's @scheme_entry drive the __inits; the
;; REPL door has no program entry, so its host runs them itself, in this order, once
;; (change: baked-set-on-every-door).  It used to be (scheme base)'s symbol alone, "kept
;; for protocol compatibility" -- the run door reads only the car of this pair, so widening
;; the cdr leaves it untouched.
(define (run-register-baked-set)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let* ([prelude-forms (read-forms-from-string *prelude-source*)]
           ;; the auto-imported standard library: incidental to the program, level 3 only.
           [baked (compile-baked-set prelude-forms (make-dumper (quote (scheme base))))])
      (for-each
        (lambda (p)                                  ; p = (LIBRARY-NAME . EXPORT-TABLE)
          (set! *repl-libs* (cons (cdr p) *repl-libs*))          ; the export table itself
          ;; the run door's init-closure topological sort reads these (run-closure-order),
          ;; so a baked member that imports another must declare it here too.
          (set! *repl-lib-imports*
                (cons (cons (car p) (baked-entry-imports (car p))) *repl-lib-imports*)))
        (cdr baked))
      (cons (quote ok)
            (cons (car baked)
                  (baked-init-symbols (map car (cdr baked))))))))

;; Every baked member's __init symbol, newline-joined in the order given -- one line per
;; module the host is about to add, so the host can pair them positionally.
(define (baked-init-symbols names)
  (let loop ([ns names] [acc ""] [first? #t])
    (if (null? ns)
        acc
        (loop (cdr ns)
              (string-append acc (if first? "" "\n") (mangle (car ns) "__init"))
              #f))))

;; --- artifact cache: registering a library without compiling it --------------------
;; (change: baked-set-artifact-cache.)  A cached library needs four things to enter a
;; session: its NAME, its DIRECT IMPORTS, its EXPORT TABLE, and its `__init` symbol.  Only
;; the table is what `emit lib` already writes -- the imports are not in it, because a
;; table is keyed on what a library *exports*, not on what it depends on, and the run
;; door's init-closure toposort needs the dependencies (run-closure-order).  So a cache
;; entry carries a metadata datum of its own alongside the unit IR.
;;
;; The IR is deliberately absent from both modes below.  Registration does not read it --
;; it only publishes tables and imports -- so the module text stays entirely the host's
;; business, which keeps the core free of the entry's file layout as well as of its I/O.

;; Mode 14: register every library in a cache entry's metadata, in the order given, with
;; no compilation.  This leaves exactly what mode 8 (baked set) or mode 4 (one library)
;; leaves behind, which is what makes a cache-seeded session indistinguishable from a
;; compiled one (spec: artifact-cache, "The cache never changes what a door produces").
;;
;; Returns the `__init` symbols newline-joined in order -- for a single-member entry that
;; is the one symbol mode 4 returns, so ONE mode serves the baked set and a user library
;; alike and neither host path needs a shape of its own.
;;
;; Every row is validated BEFORE anything is registered.  A malformed entry must leave the
;; session untouched so the caller can fall back to compiling from source (spec: "refused
;; rather than half-registered"); validating as we go would leave a half-seeded session
;; that no fallback could repair.
;;
;; DEPENDENCY ORDER is part of that validation (change: chez-free-unit-pipeline).  A row may
;; be registered only once every library it imports is registered -- already in the session,
;; or earlier in this same entry, which is how the baked set's members satisfy each other.
;; Otherwise this returns (deferred . NAME), mode 4's status for exactly the same condition,
;; so a host that reaches libraries in manifest order retries in its existing fixpoint loop
;; and cannot run a cached unit's __init before the unit it reads globals from has run its
;; own.  Without this the cache would be order-blind precisely where compiling was not.
(define (repl-register-cached-libs meta-text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let ([data (read-all-from-string meta-text)])
      (if (null? data)
          (error 'cache "cache metadata holds no datum")
          (let* ([rows (car data)]
                 [_    (check-cached-rows rows)]
                 [unmet (rows-unmet-import rows)])
            (if unmet
                (cons (quote deferred) unmet)
                (begin
                  (register-cached-rows rows)
                  (cons (quote ok) (baked-init-symbols (map car rows))))))))))

;; The name of the first row whose imports are not all satisfiable, or #f.  "Satisfiable"
;; means registered in the session already or supplied by a row at or before this one.
(define (rows-unmet-import rows)
  (let loop ([rs rows] [have (quote ())])
    (if (null? rs)
        #f
        (let* ([row  (car rs)]
               [name (car row)]
               [have (cons name have)])
          (if (imports-satisfied? (cadr row) have)
              (loop (cdr rs) have)
              name)))))

(define (imports-satisfied? imports have)
  (cond [(null? imports) #t]
        [(or (member (car imports) have) (assoc (car imports) *repl-libs*))
         (imports-satisfied? (cdr imports) have)]
        [else #f]))

;; Every row is (NAME IMPORTS TABLE INIT), and the table's own car must be the name it is
;; filed under -- a table paired with the wrong name would resolve imports to another
;; library's symbols, which is the one corruption that would not announce itself.
(define (check-cached-rows rows)
  (if (null? rows)
      #t
      (let ([row (car rows)])
        (if (not (and (pair? row) (pair? (cdr row))
                      (pair? (cddr row)) (pair? (cdddr row))))
            (error 'cache "malformed cache metadata row" row)
            (let ([name (car row)] [table (caddr row)])
              (if (not (and (pair? table) (equal? (car table) name)))
                  (error 'cache "cache metadata row's table does not match its name" name)
                  (check-cached-rows (cdr rows))))))))

;; Publish each row.  An already-registered library is left alone rather than duplicated,
;; the same tolerance mode 4's `already` status provides: every door registers the baked
;; set before preloading a manifest, and a manifest may name a baked member.  Its `__init`
;; is still reported, because every baked module is linked regardless and each `__init` is
;; one-shot guarded -- the same reason `run-register-baked-set` names them all.
(define (register-cached-rows rows)
  (if (null? rows)
      #t
      (let* ([row  (car rows)]
             [name (car row)])
        (if (not (assoc name *repl-libs*))
            (begin
              (set! *repl-libs* (cons (caddr row) *repl-libs*))
              (set! *repl-lib-imports*
                    (cons (cons name (cadr row)) *repl-lib-imports*))))
        (register-cached-rows (cdr rows)))))

;; Mode 15: the metadata datum for libraries already registered in THIS session, ready for
;; the host to persist beside their IR.  NAMES-TEXT is "" for the whole baked set, in the
;; dependency order the partition declares; otherwise it is newline-joined canonical unit
;; KEYS -- "demo.util", the prefix the unit's symbols carry -- which is how the host names a
;; library everywhere else (mode 9's index, mode 17's input).  It was a rendered list of
;; library-name datums while the baked set was the only client; keys keep library-name
;; equality in the core rather than asking the host to render a datum it never parsed
;; (change: chez-free-unit-pipeline).
;;
;; This is a pure query over state mode 8 or mode 4 has already established, which is the
;; point: it runs *after* the compile and so costs no second compilation to produce what
;; the cache needs.
(define (repl-cached-libs-text names-text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let ([names (if (string=? names-text "")
                     (map car (baked-library-entries))
                     (keys->registered-names names-text))])
      (cons (quote ok) (render-datum (map cached-lib-row names))))))

;; Newline-joined unit keys -> the library names they are registered under.  A key with no
;; registered library RAISES rather than being skipped: the caller is about to persist an
;; entry described by this list, and a silently shorter list would file a unit's IR under
;; metadata that does not mention it.
(define (keys->registered-names text)
  (let loop ([ls (split-lines text)] [acc (quote ())])
    (if (null? ls)
        (reverse acc)
        (let ([name (registered-name-of-key (car ls))])
          (if (not name)
              (error 'cache "no registered library keyed" (car ls))
              (loop (cdr ls) (cons name acc)))))))

;; TEXT's non-empty lines, in order.  The newline-joined-lines convention several modes
;; already use in both directions; this is its reader.
(define (split-lines text)
  (let loop ([i 0] [start 0] [acc (quote ())])
    (cond
      [(>= i (string-length text))
       (reverse (if (> i start) (cons (substring text start i) acc) acc))]
      [(char=? (string-ref text i) #\newline)
       (loop (+ i 1) (+ i 1)
             (if (> i start) (cons (substring text start i) acc) acc))]
      [else (loop (+ i 1) start acc)])))

(define (cached-lib-row name)
  (let ([table (assoc name *repl-libs*)])
    (if (not table)
        (error 'cache "library is not registered in this session" name)
        (list name (cached-lib-imports name) table (mangle name "__init")))))

;; A registered library's direct imports, read from the session rather than from the
;; partition declaration, so this serves a user library and a baked member identically.
(define (cached-lib-imports name)
  (cond [(assoc name *repl-lib-imports*) => cdr]
        [else (quote ())]))

;; Mode 16: the SOURCE FILES the most recent library registration read -- the library's own
;; source (the path the door named through mode 13) followed by every file the include
;; family opened for it, in read order, newline-joined (change: chez-free-unit-pipeline,
;; design D5/D7).
;;
;; This is the second half of a disk-sourced library's cache key.  The compiler half is the
;; running executable; this half is the content of the files the unit was built from, and a
;; unit that `include`s is not described by its .sld alone.  The host digests these and
;; stores the list IN the entry, which is what lets a later process validate an entry
;; without compiling anything: it re-digests the files the entry names.
;;
;; Like modes 11 and 15, a pure query over state a previous mode established -- no
;; compilation, no I/O.  Scoped to ONE registration: mode 4 resets the record before
;; parsing, so two libraries including the same fragment each report it.
;;
;; The library's own source comes first because it is the only file the reader never opened
;; (the door read it and handed over the text), so the record would otherwise omit exactly
;; the file a reader of the entry would expect to see named.  Empty when the door submitted
;; source with no path (standard input), in which case the caller has nothing to key on and
;; must not cache.
(define (repl-library-sources-text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let ([home (source-home)])
      (cons (quote ok)
            (fold-left (lambda (acc p) (string-append acc p "\n"))
                       (if (string=? home "") "" (string-append home "\n"))
                       (includes-read))))))

;; --- the ship door's tree-shake (change: chez-free-unit-pipeline, design D9) ---
;; Mode 17: recompile ONE registered library, keeping only the bindings a program's emitted
;; IR actually reaches, and return the pruned unit for the host to link in place of the full
;; one.  This is the Chez driver's AOT tree-shake (src/compile.ss's build-modular-artifacts*)
;; made available to `emit build`, which until now linked whole units and delivered ~2.3x the
;; bytes for the same program (docs/PERFORMANCE.md P8).
;;
;; INPUT, three parts, because the core does no I/O and cannot fetch any of them itself:
;;
;;   <mangled unit key>\n            which library, in the same "scheme.base" key mode 9
;;                                   hands the host, so no library-name parsing in C++
;;   <library source text>           for a user library; EMPTY for a baked member, whose
;;                                   source is *prelude-source* and needs no door
;;   ; ==EMIT-UNIT-BOUNDARY==\n      the marker the host already splits module streams on
;;   <the program's emitted IR>      what the roots are read out of
;;
;; RETURNS (ok . (ir . init-symbol)) -- mode 4's shape, so the host substitutes the pruned
;; module for the full one positionally -- or (keep . NAME) when the library must NOT be
;; pruned, or (error . msg).
;;
;; PRUNABILITY: a unit is prunable exactly when no OTHER registered library imports it.  On
;; this door the session IS the program's import closure (the run door preloads lazily, and
;; `emit build` reaches this through the same seeding), so the Chez driver's two-part rule --
;; a direct import of the program that no other unit imports -- reduces to its second half:
;; something must import a library that is present, and if no unit does, the program does.
;; The rule itself is unchanged and is the sound one: a unit kept full may reference a
;; binding in a unit that was pruned, so only leaves of the closure may lose bindings.  This
;; is why `(emit internal)` stays whole (`(scheme base)` imports it) and why a program that
;; imports a user library which imports `(scheme base)` shakes only the user library.
;;
;; A raise is reported WITH the key it was shaking.  A door that gets "kept whole (...)"
;; for every unit needs to know whether the reason was this library's own compile or the
;; protocol never naming a registered library at all, and the two read identically without
;; it -- which cost an afternoon the first time.
(define (repl-shake-library input)
  (shake-at! "start")
  (guard (e (#t (cons (quote error)
                      (string-append "shaking " (shake-input-key input)
                                     " [" *shake-step* "]: "
                                     (repl-error->string e)))))
    (let* ([nl   (str-index input #\newline)]
           [key  (if (>= nl 0) (substring input 0 nl) "")]
           [rest (if (>= nl 0) (substring input (+ nl 1) (string-length input)) "")]
           [bpos (str-search rest *emit-unit-boundary*)]
           [src  (if (>= bpos 0) (substring rest 0 bpos) "")]
           [prog (if (>= bpos 0)
                     (substring rest (+ bpos (string-length *emit-unit-boundary*))
                                (string-length rest))
                     rest)]
           [name (begin (shake-at! "resolve") (registered-name-of-key key))])
      (cond
        [(not name) (cons (quote error) (string-append "no registered library keyed " key))]
        [(begin (shake-at! "prunable") (imported-by-another? name))
         (cons (quote keep) name)]
        [else (shake-registered-library name src prog)]))))

;; The key line of mode 17's input, for a diagnostic that must not itself raise.
(define (shake-input-key input)
  (let ([nl (str-index input #\newline)])
    (if (>= nl 0) (substring input 0 nl) "?")))

;; The registered library whose canonical unit prefix is KEY, or #f.  Matching on the
;; mangled key rather than on a library name datum keeps library-name equality in the core,
;; where mode 9 already put it, instead of in the host.
(define (registered-name-of-key key)
  (let loop ([ls *repl-lib-imports*])
    (cond [(null? ls) #f]
          [(string=? (mangle (car (car ls)) "") key) (car (car ls))]
          [else (loop (cdr ls))])))

;; Does any OTHER registered library import NAME?
(define (imported-by-another? name)
  (let loop ([ls *repl-lib-imports*])
    (cond [(null? ls) #f]
          [(and (not (equal? (car (car ls)) name))
                (member name (cdr (car ls))))
           #t]
          [else (loop (cdr ls))])))

;; Recompile NAME against the roots PROG's IR imposes.  The declaration comes from the
;; partition for a baked member and from the door's source text for a user library -- the
;; two ways a library body reaches this compiler, and the reason a cache-seeded session can
;; still shake: mode 14 registers from prebuilt IR and retains no body forms, but the baked
;; source is compiled INTO this binary and a user library's file is one read away.
;;
;; The pruned table is DISCARDED rather than published: the program was already compiled
;; against the full table (mode 7 runs first), and republishing a smaller one would leave the
;; session describing a library that no longer matches what its importers resolved against.
;; Each step is LABELLED, because every way this can fail arrives at the door as one
;; string and the door can only report it -- "kept whole (match: no matching clause 0)"
;; names neither the step nor the library, and the first bug here cost an afternoon of
;; four-minute self-compiles to place.
;;
;; A PLAIN VARIABLE, not a nested `guard` around each step: the mode already runs inside
;; one guard, and a second one inside its dynamic extent is exactly the shape this compiler
;; has the least coverage of.  Debugging a shake is no time to be discovering that.
(define *shake-step* "")
(define (shake-at! who) (set! *shake-step* who))

(define (shake-registered-library name src prog)
  ;; The recompile re-runs this library's `include` declarations, so the record mode 16
  ;; reports must describe THIS read and not the preload's -- the door caches the pruned
  ;; unit against the same source closure a full unit entry is keyed on.
  (reset-includes-read!)
  (let* ([_       (shake-at! "parse")]
         [dl      (if (baked-member? name)
                      (parse-define-library
                        (partition-library-form
                          (assoc name *prelude-libraries*)
                          (read-forms-from-string *prelude-source*)))
                      (if (string=? src "")
                          (error "no source text for library" name)
                          (parse-define-library (car (read-all-from-string src)))))]
         [_       (shake-at! "imports")]
         [tables  (repl-import-tables (cadr dl))]
         [_       (shake-at! "candidates")]
         [cands   (append (map cdr (caddr dl))
                          (ct-own-refs (table-ct-half (assoc name *repl-libs*))))]
         [_       (shake-at! "roots")]
         [roots   (program-root-internals prog name cands)]
         [saved   counter]
         [_       (shake-at! "compile")]
         [res     (compile-library (car dl) (cadr dl) (caddr dl) (cadddr dl)
                                   (if tables tables (quote ())) no-dump roots)])
    (set! counter saved)                        ; undo compile-library's reset-counter!
    (shake-at! "")
    (cons (quote ok) (cons (car res) (mangle name "__init")))))

;; Mode 7: compile a whole program that may import user libraries.  direct imports are
;; the program's explicit imports plus (scheme base) (run-with-scheme-base); their export
;; tables come from the preloaded units (repl-import-tables), and init-libs is the
;; transitive closure in topo order (run-closure-order).  Returns (ok . (ir . entry)) --
;; the program module's entry is @scheme_entry (its JITDylib definition wins over the
;; linked-in compiler's) -- or (error . msg) if an import is not loaded/known.
(define (compile-program-text text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let ([user-forms (read-all-from-string text)])
      (cond
       ;; A lone define-library is compiled as a single unit -- no baked (scheme base),
       ;; no program entry (matches compile-source-rehomed).  The host emits/JITs just
       ;; this module; the 'library status tells it to drop the baked base + preloaded
       ;; units it set up for the program case.  (Used by `emit run --emit < lib.sld`.)
       ;; A lone define-library IS the unit under inspection here (this is `emit lib`'s
       ;; and `emit run --emit < lib.sld`'s path), so it dumps at the ordinary level.
       ;;
       ;; Its imports resolve against the SESSION (mode 8's baked members plus the
       ;; manifest units the host preloaded), which is what lets a library importing
       ;; (scheme base) or another manifest library compile here at all
       ;; (change: baked-set-on-every-door).
       [(single-define-library user-forms)
        => (lambda (lib)
             (let ([tables (lone-library-tables lib)])
               (if (not tables)
                   (cons (quote error) (lone-library-unresolved-msg lib))
                   (cons (quote library)
                         (cons (compile-library-form lib (make-dumper #f) tables)
                               "scheme_entry")))))]
       [else
        (let ([direct (run-with-scheme-base (car (collect-imports user-forms)))])
          (let ([tables (repl-import-tables direct)])
            (if (not tables)
                ;; `direct` already holds the import names -- name them, as the lone-library
                ;; path does (change: manifest-empty-guards; issue #63).
                (cons (quote error) (unresolved-imports-msg direct))
                (cons (quote ok)
                      (cons (compile-program-with-imports
                              (prelude-macro-forms (read-forms-from-string *prelude-source*))
                              user-forms tables (run-closure-order direct)
                              (make-dumper #f))     ; the program: the unit under inspection
                            "scheme_entry")))))]))))

;; --- emit lib door: a library's export table as readable text (mode 11) ------
;; (change: emit-cli-unification, design D3).  `emit lib` writes a library's unit
;; artifact: the `.ll` comes from the emit path (mode 7's single-define-library
;; branch); this mode surfaces the `.exports` sidecar the AOT door's artifact cache
;; expects -- the (NAME ((external . "mangled") ...) ((external "label" arity) ...))
;; datum that compile-library
;; computes but only the Chez driver used to write out.  We compile the lone library
;; the SAME way compile-library-form does (mode 7's 'library path) and return its
;; export table (cadr of compile-library's result), keeping one compile-unit core.

;; Render a library NAME (a list of symbols, e.g. (foo bar)) to its basename
;; "foo.bar" -- the artifact filename stem, matching mangle's dotting and the Chez
;; driver's lib-basename.
(define (lib-name->basename name)
  (let loop ([parts (cdr name)] [acc (symbol->string (car name))])
    (if (null? parts)
        acc
        (loop (cdr parts) (string-append acc "." (symbol->string (car parts)))))))

;; `render-datum` -- which renders the export-table datum, matching what the Chez
;; driver's `write` produces for (NAME export-table) -- lives in core.ss: the module
;; front end's diagnostics name the form the user wrote, and a form has to be rendered
;; INTO the message to survive every door (change: module-frontend-diagnostics).  One
;; renderer, two consumers.

;; Mode 11: compile a lone define-library source and return (ok . payload) where
;; payload is "<basename>\n<export-datum>" -- the host writes <basename>.exports from
;; the datum and names the sibling <basename>.ll (emitted via mode 7).  (error . msg)
;; if the source is not a single define-library or fails to compile.  Uses '() import
;; tables, exactly like compile-library-form, so the export table matches the emitted
;; unit (compile-library is deterministic).
(define (repl-library-exports-text text)
  (guard (e (#t (cons (quote error) (repl-error->string e))))
    (let* ([forms (read-all-from-string text)]
           [lib   (single-define-library forms)])
      ;; A define-library that is not alone gets the SAME diagnostic mode 7 gives it,
      ;; rather than this mode's blunter "not a single define-library"
      ;; (change: module-frontend-diagnostics).
      (check-library-position forms)
      (if (not lib)
          (cons (quote error) "source is not a single define-library")
          ;; The SAME import tables mode 7 resolves for this library (lone-library-tables),
          ;; not '(): the export table must describe the resolution the emitted unit has,
          ;; and a library importing (scheme base) could not be compiled here at all while
          ;; this passed '() (change: baked-set-on-every-door).
          (let ([tables (lone-library-tables lib)])
            (if (not tables)
                (cons (quote error) (lone-library-unresolved-msg lib))
                ;; no-dump deliberately: this mode recompiles the SAME library mode 7 just
                ;; compiled, purely to recover its export table, so narrating here would
                ;; print every stage of `emit lib --dump` a second time.
                (let* ([dl   (parse-define-library lib)]
                       [res  (compile-library (car dl) (cadr dl) (caddr dl) (cadddr dl)
                                              tables no-dump)]
                       ;; (name export-table call-rows [compile-time-interface]) -- the
                       ;; fourth field appears only for a library that exports a macro
                       ;; (change: library-macro-export).  `render-datum` renders whatever
                       ;; compile-library returns, and the Chez driver writes its artifact
                       ;; through the SAME renderer, so the two doors' bytes agree by
                       ;; construction rather than by two implementations agreeing.
                       [nt   (cadr res)]
                       [name (car nt)])
                  (cons (quote ok)
                        (string-append (lib-name->basename name) "\n"
                                       (render-datum nt))))))))))

;; --- the input-completeness probe (design D4(b); archived OpenSpec change
;;     repl-embedded-incremental) ---------------------------------------------
;; Does the host's accumulated buffer start with a complete datum yet?  An
;; EOF-aware scanner mirroring the reader's structure -- it reuses the reader's
;; own lexeme helpers (rd-ws?/rd-delim?/rd-skip-ws/rd-token-end) so the two can't
;; drift.  The internal fc-* helpers return a byte index just past the datum, or a
;; negative sentinel (fc-incomplete/fc-malformed); form-complete-code exposes that
;; integer to the host directly (see its doc).
(define fc-incomplete -1)
(define fc-malformed -2)
(define (fc-bad? r) (< r 0))

(define (fc-string s n i)                     ; scan "..." past the opening quote
  (if (< i n)
      (let ([k (char->integer (string-ref s i))])
        (cond
          [(= k 34) (+ i 1)]                                  ; closing "
          [(= k 92) (if (< (+ i 1) n) (fc-string s n (+ i 2)) fc-incomplete)]
          [else (fc-string s n (+ i 1))]))
      fc-incomplete))

(define (fc-char s n i)                        ; scan #\<char|name>; force 1 char in
  (if (< i n) (rd-token-end s n (+ i 1)) fc-incomplete))

;; The shared `rd-skip-ws` reports an unterminated block comment with a NEGATIVE index
;; carrying the position it opened at (change: reader-lexical-conformance, design D2).
;; Here that means INCOMPLETE -- "keep typing" -- not malformed, which is what lets a
;; block comment be typed across lines at the prompt.  Every place the probe skips
;; whitespace goes through this so the mapping happens exactly once.
(define (fc-skip-ws s n i)
  (let ([j (rd-skip-ws s n i)]) (if (< j 0) fc-incomplete j)))

;; |bar quoted identifier| -- a datum EXTENT like a string, with the same two escapes,
;; and unterminated the same way (design D7).
(define (fc-bar s n i)
  (if (< i n)
      (let ([k (char->integer (string-ref s i))])
        (cond
          [(= k 124) (+ i 1)]                                 ; closing |
          [(= k 92) (if (< (+ i 1) n) (fc-bar s n (+ i 2)) fc-incomplete)]
          [else (fc-bar s n (+ i 1))]))
      fc-incomplete))

;; #; -- the datum this position yields is the one AFTER the discarded datum, so the
;; probe reads two and reports the second's extent.
(define (fc-discard s n i)
  (let ([j (fc-skip-ws s n i)])
    (if (fc-bad? j)
        j
        (if (< j n)
            (let ([r (fc-datum s n j)])
              (if (fc-bad? r)
                  r
                  (let ([j2 (fc-skip-ws s n r)])
                    (if (fc-bad? j2)
                        j2
                        (if (< j2 n) (fc-datum s n j2) fc-incomplete)))))
            fc-incomplete))))

(define (fc-hash s n i)                         ; scan after '#'
  (if (< i n)
      (let ([k (char->integer (string-ref s i))])
        (cond
          [(= k 40) (fc-list s n (+ i 1))]                    ; #( vector
          [(= k 92) (fc-char s n (+ i 1))]                    ; #\ char literal
          ;; Both comment forms must be mirrored HERE, not only in rd-skip-ws (design
          ;; D5): the shared skipper covers a comment in LEADING position, but the probe
          ;; walks the rest of the form itself.  Without this, `(list 1 #;2` would be
          ;; reported malformed where the reader calls it incomplete -- the two
          ;; disagreeing about the same text, which is the failure the sharing prevents.
          [(= k 59) (fc-discard s n (+ i 1))]                 ; #; datum comment
          [(= k 124)                                          ; #| block comment
           (let ([j (fc-skip-ws s n (- i 1))])
             (if (fc-bad? j) j (if (< j n) (fc-datum s n j) fc-incomplete)))]
          [else (rd-token-end s n i)]))                       ; #t #f #xNN ...
      fc-incomplete))

(define (fc-prefix s n i)                       ; scan after ' or ` : a datum follows
  (let ([j (fc-skip-ws s n i)])
    (if (fc-bad? j) j (if (< j n) (fc-datum s n j) fc-incomplete))))

(define (fc-unquote s n i)                       ; scan after , or ,@ : a datum follows
  (let ([i2 (if (and (< i n) (= (char->integer (string-ref s i)) 64)) (+ i 1) i)])
    (let ([j (fc-skip-ws s n i2)])
      (if (fc-bad? j) j (if (< j n) (fc-datum s n j) fc-incomplete)))))

;; DELIBERATELY DIVERGENT from `rd-list` (src/prelude.scm), which REPORTS an unterminated
;; list where this answers `fc-incomplete` (change: reader-input-termination, design D4).
;; The two are not a duplication to be unified: a host reading a stream can supply another
;; line, so "keep typing" is the useful answer; a source file cannot, so a diagnostic naming
;; what was left open is.  Unify them and multi-line entry at the prompt stops working --
;; test/repl-interactive-tests.sh `list-across-lines` is the case that catches it.
(define (fc-list s n i)                          ; scan (...) past the open paren
  (let ([j (fc-skip-ws s n i)])
    (if (fc-bad? j)
        j
        (if (< j n)
            (let ([k (char->integer (string-ref s j))])
              (cond
                [(or (= k 41) (= k 93)) (+ j 1)]              ; ) or ] closes
                ;; #; between elements, including right before the close, where there
                ;; is no following element for fc-hash's arm to scan.
                [(and (= k 35) (< (+ j 1) n)
                      (= (char->integer (string-ref s (+ j 1))) 59))
                 (let ([j2 (fc-skip-ws s n (+ j 2))])
                   (if (fc-bad? j2)
                       j2
                       (if (< j2 n)
                           (let ([r (fc-datum s n j2)])
                             (if (fc-bad? r) r (fc-list s n r)))
                           fc-incomplete)))]
                [else (let ([r (fc-datum s n j)])
                        (if (fc-bad? r) r (fc-list s n r)))]))
            fc-incomplete))))

(define (fc-datum s n i)                         ; scan one datum at i (i < n, past ws)
  (let ([k (char->integer (string-ref s i))])
    (cond
      [(or (= k 40) (= k 91)) (fc-list s n (+ i 1))]          ; ( or [
      [(or (= k 41) (= k 93)) fc-malformed]                   ; unbalanced ) or ]
      [(= k 34) (fc-string s n (+ i 1))]                      ; "
      [(or (= k 39) (= k 96)) (fc-prefix s n (+ i 1))]        ; ' or `
      [(= k 44) (fc-unquote s n (+ i 1))]                     ; ,
      [(= k 35) (fc-hash s n (+ i 1))]                        ; #
      [(= k 124) (fc-bar s n (+ i 1))]                        ; |bar quoted identifier|
      [else (rd-token-end s n i)])))                          ; atom -> to delimiter

;; Host-facing result is a plain integer the host decodes via rt_fixnum_value:
;;   >= 0  complete -- that many leading bytes are the first datum
;;   -1    incomplete (need more input)   -2  malformed
;; (an integer, not the spike's (complete . n)|symbol shape, so the C++ host
;; branches on one fixnum's sign with no pair/symbol destructuring.)
(define (form-complete-code s)
  (let ([n (string-length s)])
    (let ([i (fc-skip-ws s n 0)])
      (if (fc-bad? i) i (if (< i n) (fc-datum s n i) fc-incomplete)))))

;; --- cross-call state persistence -------------------------------------------
;; The assembled program is one @scheme_entry, so *repl-env* etc. are locals
;; re-created on every host call.  Bundle them into a vector held in the runtime
;; (repl-state-ref / repl-state-set!), restoring into the working globals at entry
;; and saving them back before returning, so the session persists across calls.
;; `counter` (util.ss's gensym counter) MUST persist too: @code_N labels are
;; module-global, so the counter has to stay monotonic across forms or two forms'
;; code labels collide in the JIT.  (repl-state-ref) is #f before the first save.
(define (repl-restore-state!)
  (let ([s (repl-state-ref)])
    (when (vector? s)
      (set! *repl-env* (vector-ref s 0))
      (set! *repl-macro-env* (vector-ref s 1))
      (set! *repl-known* (vector-ref s 2))
      (set! *repl-n* (vector-ref s 3))
      (set! counter (vector-ref s 4))
      (set! *repl-libs* (vector-ref s 5))
      (set! *repl-lib-imports* (vector-ref s 6))
      (set! *repl-calls* (vector-ref s 7))
      ;; The door's source home (change: library-include-declarations, design D4).  It
      ;; rides the state vector for the same reason the rest of this does: the assembled
      ;; program's globals are re-created on every host call, so a home set by mode 13
      ;; would be gone by the time mode 4/7/11/12 needed it.
      (set-source-home! (vector-ref s 8))
      ;; And the record of what the include family READ, for exactly the same reason: mode
      ;; 4 fills it and mode 16 reads it back, one host call later (change:
      ;; chez-free-unit-pipeline).  Without this the record is always empty by the time it
      ;; is asked for, so a library's cache entry would be keyed on its .sld alone and an
      ;; edit to an included file would not invalidate it -- the one failure this whole
      ;; tracker exists to prevent, and invisible under Chez, whose globals persist.
      (set-includes-read! (vector-ref s 9)))))
(define (repl-save-state!)
  (repl-state-set! (vector *repl-env* *repl-macro-env* *repl-known* *repl-n* counter
                           *repl-libs* *repl-lib-imports* *repl-calls* (source-home)
                           (includes-read))))

;; --- the dispatched embedded entry (design D2) -------------------------------
;; The host sets (repl-mode)/(repl-input) via rt_repl_set, then calls this ccc
;; `scheme_entry` (the assembled program's trailing expression).  One entry, four
;; operations, so the existing single-scheme_entry emission is reused unchanged:
;;   0 init-session no prelude   1 init-session with the baked-in *prelude-source*
;;   2 form-complete?            3 compile-one-form
;;   4 load-library (source text -> unit IR + __init)   5 manifest text -> source paths
;;   6 auto-import (scheme base) into the session (after the host preloads it, Stage 3)
;;   7 run door: compile a whole program with imports  8 run door: register baked (scheme base)
;;   9 run door: manifest text -> "KEY\tPATH" per user library (omitting (scheme base))
;;  10 emit build door: manifest text -> program entries (NAME/source/output triples)
;;  11 emit lib door: library source -> "<basename>\n<export-table datum>"
;;  12 run door: a source text -> the library keys it imports (for the lazy preload)
;;  13 where the NEXT source submitted came from, so its includes resolve beside it
;;  14 artifact cache: metadata datum -> register those libraries, no compilation
;;  15 artifact cache: "" (baked set) or names -> the metadata datum to persist
;; State is restored before and saved after each op (init modes seed it fresh).
(define (repl-dispatch)
  (repl-restore-state!)
  (let ([mode (repl-mode)])
    (let ([result
           (cond
             [(= mode 0) (init-session "")]
             [(= mode 1) (init-session *prelude-source*)]
             [(= mode 2) (form-complete-code (repl-input))]
             [(= mode 4) (repl-load-library-text (repl-input))]  ; load a library unit
             ;; 5 is RETIRED (chez-free-unit-pipeline): every door uses mode 9.
             [(= mode 6) (repl-autoimport-scheme-base)]          ; auto-import (scheme base)
             [(= mode 7) (compile-program-text (repl-input))]    ; run door: whole program
             [(= mode 8) (run-register-baked-set)]               ; run door: the baked set
             [(= mode 9) (repl-manifest-user-paths (repl-input))] ; every door: manifest's user libraries
             [(= mode 10) (repl-manifest-programs (repl-input))]  ; emit build door: program entries
             [(= mode 11) (repl-library-exports-text (repl-input))] ; emit lib door: export table
             [(= mode 12) (repl-source-imports (repl-input))]     ; run door: a source's imports
             [(= mode 13) (repl-set-source-home (repl-input))]    ; every door: the next source's path
             [(= mode 14) (repl-register-cached-libs (repl-input))] ; cache: register prebuilt units
             [(= mode 15) (repl-cached-libs-text (repl-input))]   ; cache: metadata to persist
             [(= mode 16) (repl-library-sources-text)]           ; cache: a library's source files
             [(= mode 17) (repl-shake-library (repl-input))]     ; emit build door: prune a unit
             [else       (compile-one-form-text (repl-input))])])
      (repl-save-state!)
      result)))
