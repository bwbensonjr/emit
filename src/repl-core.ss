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

(define *repl-env* (make-repl-env))          ; #(name->mangled-sym alist, generation)
(define *repl-macro-env* (quote ()))         ; ((name . transformer) ...)
(define *repl-known* (quote ()))             ; hygiene "known bindings" set
(define *repl-n* 0)                          ; per-form thunk counter (@__repl_N)
(define *repl-libs* (quote ()))              ; loaded units, each the export-table datum
                                             ; (lib-name exports-alist call-rows) compile-library
                                             ; returns -- so a loaded unit's session record IS
                                             ; the import table its dependents need (changes:
                                             ; module-artifacts-vertical-slice,
                                             ; cross-unit-direct-calls)
(define *repl-calls* (quote ()))             ; the session's direct-call table: mangled symbol ->
                                             ; (label . arity), merged from each imported unit's
                                             ; call rows, so an interactive form direct-calls a
                                             ; library procedure exactly as a batch program does
                                             ; (change: cross-unit-direct-calls)
(define *repl-lib-imports* (quote ()))       ; ((lib-name . (import-name ...)) ...) each loaded
                                             ; unit's DIRECT imports -- the run door computes a
                                             ; program's transitive init closure in topological
                                             ; order over this in-memory graph, since the driver's
                                             ; toposort-libs reads files and is Chez-only (change:
                                             ; run-door-user-libraries).

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
;; render it to a plain string.  This text is diagnostic only (the harnesses read
;; it off stderr and discard it), so a best-effort irritant rendering is fine.
(define (repl-irritant->string x)
  (cond
    [(symbol? x) (symbol->string x)]
    [(string? x) x]
    [else "?"]))
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
(define (lone-library-unresolved-msg lib)
  (let loop ([imps (cadr (parse-define-library lib))] [missing (quote ())])
    (if (null? imps)
        (string-append "unresolved import (not baked, not in the manifest): "
                       (join-rendered (reverse missing)))
        (loop (cdr imps)
              (if (assoc (car imps) *repl-libs*)
                  missing
                  (cons (car imps) missing))))))

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
    (let* ([forms (read-all-from-string text)]
           [dl    (parse-define-library (car forms))]
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
       ;; than an enumerated subset -- which is why the REPL keeps using mode 5 (every
       ;; manifest library) instead of mode 9, whose omission is the single hard-coded
       ;; name `(scheme base)` and would miss the substrate.  The REPL DOES reach this
       ;; status now; it did not before it registered the baked set.
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

;; Parse a manifest's text and return its LIBRARY source paths, newline-joined, so
;; the host (which owns file I/O) can read each library source and load it (mode 4).
;; Only `(library ...)` entries are libraries; `(program ...)` entries (emit build
;; targets, change: emit-build-bin-entry) are ignored here -- resolving library
;; imports is unchanged by their presence.
(define (repl-manifest-paths text)
  (let loop ([es (car (read-all-from-string text))] [acc ""])
    (if (null? es)
        acc
        (let* ([e   (car es)]
               [src (and (pair? e) (eq? (car e) (quote library))
                         (cond [(assq (quote source) (cddr e)) => cadr] [else #f]))])
          (loop (cdr es) (if src (string-append acc src "\n") acc))))))

;; Like repl-manifest-paths but OMIT (scheme base): the run door bakes (scheme base)
;; in (mode 8), or omits it entirely under --no-prelude, so it must never be loaded
;; from the manifest -- doing so would emit a duplicate/spurious (scheme base) module
;; (change: run-door-user-libraries).  Used by the run host (mode 9); the REPL host
;; still wants (scheme base) from the manifest and uses mode 5.
;; Each line is "KEY<TAB>PATH" (change: numeric-conformance).  The key is
;; `(mangle name "")` -- the same canonical unit prefix the emitted symbols carry --
;; so the run host can index the manifest by library name using plain string
;; comparison, without re-implementing library-name equality in C++.  It needs that
;; index because the run door now preloads LAZILY: only the libraries in the
;; program's transitive import closure, rather than every entry in the manifest.
(define (repl-manifest-user-paths text)
  (let loop ([es (car (read-all-from-string text))] [acc ""])
    (if (null? es)
        acc
        (let* ([entry  (car es)]
               [is-lib (and (pair? entry) (eq? (car entry) (quote library)))]  ; skip (program ...)
               [name   (and is-lib (cadr entry))]
               [src    (and is-lib
                            (cond [(assq (quote source) (cddr entry)) => cadr] [else #f]))])
          (loop (cdr es)
                (if (and src (not (equal? name (quote (scheme base)))))
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
;; repl-manifest-paths.
(define (repl-manifest-programs text)
  (let loop ([es (car (read-all-from-string text))] [acc ""])
    (if (null? es)
        acc
        (let ([e (car es)])
          (if (and (pair? e) (eq? (car e) (quote program)))
              (let* ([name    (symbol->string (cadr e))]
                     [clauses (cddr e)]
                     [src     (cond [(assq (quote source) clauses) => cadr] [else ""])]
                     [out     (cond [(assq (quote output) clauses) => cadr] [else ""])])
                (loop (cdr es) (string-append acc name "\n" src "\n" out "\n")))
              (loop (cdr es) acc))))))

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
                (cons (quote error) "program imports a library not found in the manifest")
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

(define (fc-hash s n i)                         ; scan after '#'
  (if (< i n)
      (let ([k (char->integer (string-ref s i))])
        (cond
          [(= k 40) (fc-list s n (+ i 1))]                    ; #( vector
          [(= k 92) (fc-char s n (+ i 1))]                    ; #\ char literal
          [else (rd-token-end s n i)]))                       ; #t #f #xNN ...
      fc-incomplete))

(define (fc-prefix s n i)                       ; scan after ' or ` : a datum follows
  (let ([j (rd-skip-ws s n i)])
    (if (< j n) (fc-datum s n j) fc-incomplete)))

(define (fc-unquote s n i)                       ; scan after , or ,@ : a datum follows
  (let ([i2 (if (and (< i n) (= (char->integer (string-ref s i)) 64)) (+ i 1) i)])
    (let ([j (rd-skip-ws s n i2)])
      (if (< j n) (fc-datum s n j) fc-incomplete))))

(define (fc-list s n i)                          ; scan (...) past the open paren
  (let ([j (rd-skip-ws s n i)])
    (if (< j n)
        (let ([k (char->integer (string-ref s j))])
          (cond
            [(or (= k 41) (= k 93)) (+ j 1)]                  ; ) or ] closes
            [else (let ([r (fc-datum s n j)])
                    (if (fc-bad? r) r (fc-list s n r)))]))
        fc-incomplete)))

(define (fc-datum s n i)                         ; scan one datum at i (i < n, past ws)
  (let ([k (char->integer (string-ref s i))])
    (cond
      [(or (= k 40) (= k 91)) (fc-list s n (+ i 1))]          ; ( or [
      [(or (= k 41) (= k 93)) fc-malformed]                   ; unbalanced ) or ]
      [(= k 34) (fc-string s n (+ i 1))]                      ; "
      [(or (= k 39) (= k 96)) (fc-prefix s n (+ i 1))]        ; ' or `
      [(= k 44) (fc-unquote s n (+ i 1))]                     ; ,
      [(= k 35) (fc-hash s n (+ i 1))]                        ; #
      [else (rd-token-end s n i)])))                          ; atom -> to delimiter

;; Host-facing result is a plain integer the host decodes via rt_fixnum_value:
;;   >= 0  complete -- that many leading bytes are the first datum
;;   -1    incomplete (need more input)   -2  malformed
;; (an integer, not the spike's (complete . n)|symbol shape, so the C++ host
;; branches on one fixnum's sign with no pair/symbol destructuring.)
(define (form-complete-code s)
  (let ([n (string-length s)])
    (let ([i (rd-skip-ws s n 0)])
      (if (< i n) (fc-datum s n i) fc-incomplete))))

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
      (set-source-home! (vector-ref s 8)))))
(define (repl-save-state!)
  (repl-state-set! (vector *repl-env* *repl-macro-env* *repl-known* *repl-n* counter
                           *repl-libs* *repl-lib-imports* *repl-calls* (source-home))))

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
             [(= mode 5) (repl-manifest-paths (repl-input))]     ; manifest text -> paths
             [(= mode 6) (repl-autoimport-scheme-base)]          ; auto-import (scheme base)
             [(= mode 7) (compile-program-text (repl-input))]    ; run door: whole program
             [(= mode 8) (run-register-baked-set)]               ; run door: the baked set
             [(= mode 9) (repl-manifest-user-paths (repl-input))] ; run door: manifest paths sans (scheme base)
             [(= mode 10) (repl-manifest-programs (repl-input))]  ; emit build door: program entries
             [(= mode 11) (repl-library-exports-text (repl-input))] ; emit lib door: export table
             [(= mode 12) (repl-source-imports (repl-input))]     ; run door: a source's imports
             [(= mode 13) (repl-set-source-home (repl-input))]    ; every door: the next source's path
             [else       (compile-one-form-text (repl-input))])])
      (repl-save-state!)
      result)))
