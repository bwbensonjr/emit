;;; core.ss -- the pure compiler core: source forms (or text) -> LLVM IR text.
;;;
;;; This is the self-hosting target: text in -> IR text out.  It performs NO
;;; file, subprocess, or external-port I/O.  Everything effectful -- reading the
;;; source file, reading the prelude, supplying the host target-triple header,
;;; writing the .ll, and invoking the C toolchain / JIT -- lives in the driver
;;; (compile.ss).  Keeping that surface out of the core means self-hosting never
;;; has to bring the filesystem or subprocess API into the language.
;;;
;;; FLAT SOURCE (change: self-hosting-completion): this file is concatenation-
;;; ready.  The passes are NOT `(include ...)`d here -- they are separate flat
;;; files concatenated ahead of this one by the ordered-`cat` assembly (see the
;;; Makefile `regen` recipe / `src/README.md`).  The reader is the in-language
;;; `read-all-from-string` (defined in the prelude), so the core needs no ports.
;;; The Chez-hosted driver/tests include the same flat files (no separate library
;;; tree), so there is one live source.

;; --- reader (self-hostable; no ports) ------------------------------------
;; `read-all-from-string` is provided by the prelude (which is prepended to every
;; program the compiler compiles, including the compiler's own source).
(define (read-forms-from-string str) (read-all-from-string str))

;; --- prelude assembly (pure list ops over already-read forms) ------------

;; name defined by a top-level (define ...) form, or #f for a non-define form
(define (define-name f)
  (and (pair? f) (eq? (car f) 'define)
       (let ([sig (cadr f)]) (if (pair? sig) (car sig) sig))))


;; prepend prelude forms to the user's, dropping any prelude define whose name
;; the user also defines (user-wins shadowing, so the prelude never clobbers).
(define (with-prelude prelude-forms user-forms)
  (let ([user-names (filter (lambda (x) x) (map define-name user-forms))])
    (append
      (filter (lambda (f)
                (let ([n (define-name f)])
                  (not (and n (memq n user-names)))))
              prelude-forms)
      user-forms)))

;; names bound at the top level (prelude + program), used both as the hygiene
;; "known bindings" set and, with the fixed keyword/primitive sets, to decide
;; which template identifiers a macro is allowed to introduce.
(define (compute-known macro-env runtime-forms)
  (union* (list *core-keywords* *prims* *extra-op-keywords*
                (map car *integrable*)     ; intrinsic integrable prims are universally known
                (map car macro-env)
                (filter (lambda (x) x) (map define-name runtime-forms)))))

;; --- the pipeline: forms -> IR text (no target header) -------------------
;; `dump` is an injected side-channel: the driver passes an effectful stderr
;; dumper under --dump; every other caller passes `no-dump` so the core stays
;; pure.  The core never touches a port itself.
(define (no-dump stage form) (if #f #f))

(define (compile-forms forms dump)
  ;; This and compile-program-with-imports are the TWO pipelines a program reaches, on
  ;; every door, so a misplaced define-library is caught for all of them in exactly two
  ;; places rather than at each entry point (change: module-frontend-diagnostics).
  (check-library-position forms)
  (reset-counter!)
  (set-import-calls! '())            ; no imports on this path (change: cross-unit-direct-calls)
  (let* ([me+rf (collect-define-syntax forms)]
         [macro-env (car me+rf)] [runtime-forms (cadr me+rf)])
    (let* ([known (compute-known macro-env runtime-forms)]
           [top   (collect-toplevel runtime-forms)]
           [expd  (expand top macro-env known)]
           [core  (inline-primitives (rename-program (parse-program expd)))]
           [a     (recognize-let core)]
           [b     (convert-assignments a)]
           [s     (simplify b)]
           [c     (convert-closures s)]
           [d     (lower-program c program-unit)])
      (dump "collect-toplevel" top) (dump "expand" expd)
      (dump "parse+rename" core) (dump "recognize-let" a)
      (dump "convert-assignments" b) (dump "simplify" s)
      (dump "convert-closures" c) (dump "lower" d)
      (emit-program d))))

;; a source whose only top-level form is a (define-library ...) is a library unit
;; (change: module-artifacts-vertical-slice); it compiles to a unit module, not a
;; program, through the SAME embedded --emit path programs use -- so a unit's bytes
;; are identical whether emitted for the AOT door or loaded into the REPL door.
(define (single-define-library forms)
  (and (pair? forms) (null? (cdr forms)) (define-library-form? (car forms))
       (car forms)))
;; Compile a lone define-library to its unit.  `tables` is optional and holds the export
;; tables of the libraries this one imports; it defaults to '() so that a caller with
;; nothing resolved is unchanged.
;;
;; It did NOT used to be a parameter, and hardcoding '() was the bug: EVERY lone-library
;; path resolved no imports, so a library declaring `(import (scheme base))` failed with
;; `unbound variable map` on `emit lib` AND on `emit run --emit < lib.sld` -- while the
;; same library compiled fine as a dependency of a program, which is the path that
;; supplies tables (change: baked-set-on-every-door).  Who can resolve what differs by
;; caller, which is why this takes them rather than resolving them itself:
;;   compile-source-rehomed  the baked set, compiled in-core (no I/O available)
;;   modes 7 and 11          the session -- baked members plus the manifest's preloaded
;;                           libraries -- which is the only path that can resolve an
;;                           import of another MANIFEST library, since the core reads no files
(define (compile-library-form form dump . opt)
  (let ([dl     (parse-define-library form)]
        [tables (if (pair? opt) (car opt) '())])
    (car (compile-library (car dl) (cadr dl) (caddr dl) (cadddr dl) tables dump))))

;; convenience: source text -> IR text (no prelude, no header).  This is the
;; core's self-hosting-facing contract; the driver adds prelude/header/toolchain.
;; `dump` is optional (change: emit-dump-stages): the Chez-free entries pass the dumper
;; they build from the host-forwarded level, and every other caller -- including the
;; Chez driver, which never links dump.ss at all -- gets `no-dump` as before.
(define (compile-source-string str . opt)
  (let ([forms (read-forms-from-string str)]
        [dump  (if (pair? opt) (car opt) no-dump)])
    (cond
      [(single-define-library forms) => (lambda (lib) (compile-library-form lib dump))]
      [else (compile-forms forms dump)])))

;; source text + prelude text -> IR text (no header).  The prelude-aware sibling
;; of compile-source-string: it applies the same user-wins shadowing the batch
;; driver does (with-prelude), but takes the prelude as *text* rather than
;; reading a file, so it stays free of filesystem/subprocess I/O.  Used by the
;; embedded compiler (change: path-a-embedding), whose entry bakes the prelude
;; source in as a string constant and passes the user program on stdin.  A lone
;; define-library is compiled as a unit (prelude-free in Stage 1).
(define (compile-source-with-prelude prelude-str user-str)
  (let ([forms (read-forms-from-string user-str)])
    (cond
      [(single-define-library forms) => (lambda (lib) (compile-library-form lib no-dump))]
      [else
       (compile-forms
         (with-prelude (read-forms-from-string prelude-str) forms)
         no-dump)])))

;; --- prelude re-homed as (scheme base) for the embedded runner (change:
;; embedded-runner-rehome) ---------------------------------------------------
;; The Chez-free runner (emit run / emit build) re-homes the prelude the way
;; the Chez driver does, but with no manifest and no filesystem: it builds the
;; (scheme base) library from the BAKED-IN prelude source, compiles it to a unit,
;; and compiles the user program auto-importing it.  A program and a library each
;; emit a fixed @__apply0 and string globals from a reset counter, which would
;; collide in a single LLVM module, so the two modules are returned SEPARATELY,
;; joined by a boundary marker the host splits on -- mirroring the driver's
;; separate-unit linking, so the emitted program module is byte-identical to the
;; driver's prog.ll.

;; A line that cannot occur in emitted core IR (the core emits no `;` comments),
;; so the host splits the two modules unambiguously.
(define *emit-unit-boundary* "; ==EMIT-UNIT-BOUNDARY==\n")

;; The names LIB exports: the prelude's top-level defines in SOURCE ORDER, kept when the
;; partition assigns them to LIB (src/prelude-surface.scm -- the surface is DECLARED, not
;; derived; change: scheme-base-declared-surface, issue #29, partitioned by
;; scheme-base-partition).  Order comes from the prelude, so this and
;; tools/gen-scheme-base.ss produce the same list in the same order from the same two
;; files -- which is what keeps the run door's program module byte-identical to the
;; driver's prog.ll -- and the declaration's own arrangement cannot move emitted IR.
(define (library-export-names lib prelude-forms)
  (filter (lambda (n) (and n (prelude-exports? lib n)))
          (map define-name prelude-forms)))

;; The forms LIB's body holds: the prelude definitions the partition homes in LIB, plus
;; EVERY derived-form macro (change: scheme-base-partition).  The macros are the
;; prelude's compile-time half -- collect-define-syntax lifts them out before anything is
;; lowered, so carrying them in each member's body costs no emitted code, and a member
;; whose procedures use `cond`/`case` internally (the reader does) can compile at all.
(define (library-body-forms lib prelude-forms)
  (filter (lambda (f)
            (let ((n (define-name f)))
              (if n (prelude-defines? lib n) (define-syntax-form? f))))
          prelude-forms))

;; One partition member as a define-library form: its declared exports, the body forms
;; homed in it, and an import of each member it depends on.  Built with cons/list (not
;; quasiquote) to stay in the plainest self-hostable subset.  Mirrors
;; tools/gen-scheme-base.ss, but in the portable core -- the baked-in prelude source is
;; the single source of truth, so no lib/scheme/*.sld read.
(define (partition-library-form entry prelude-forms)
  (let ((lib     (car entry))
        (imports (caddr entry)))
    (cons 'define-library
          (cons lib
                (cons (cons 'export (library-export-names lib prelude-forms))
                      (if (null? imports)
                          (list (cons 'begin (library-body-forms lib prelude-forms)))
                          (cons (cons 'import imports)
                                (list (cons 'begin
                                            (library-body-forms lib prelude-forms))))))))))

;; The baked members, in dependency order: the libraries compiled into the compiler
;; binaries from the baked-in prelude source, which therefore need no manifest.
(define (baked-library-entries)
  (filter (lambda (e) (cadr e)) *prelude-libraries*))

;; Is LIB a member of the baked set -- reachable with no manifest and no files?
(define (baked-member? lib)
  (let ([e (assoc lib *prelude-libraries*)])
    (if (and e (cadr e)) #t #f)))

;; The libraries LIB imports, as declared by the partition ('() for an unknown name).
(define (baked-entry-imports lib)
  (let ([e (assoc lib *prelude-libraries*)])
    (if e (caddr e) '())))

;; Every baked member's name in dependency order -- the init order a program's
;; @scheme_entry drives.  Each __init is one-shot guarded and every baked module is
;; linked regardless, so naming them all is correct rather than merely safe: a member the
;; program does not reach initializes to no observable effect (change:
;; scheme-base-partition).
(define (baked-init-order)
  (map car (baked-library-entries)))

;; A program's OWN imports that name a baked member, other than the auto-imported
;; (scheme base).  This is how the compiler's flat source reaches (emit internal): the
;; substrate holds the compositional accessors its passes call and the lexeme helpers the
;; REPL's input-completeness probe reuses, and one `import` beats editing 48 call sites
;; under the self-hosting fixed point (design D6).
;; A named library that is NOT a baked member cannot be resolved on this door -- it has no
;; manifest and no filesystem -- so it is dropped here and its names fail as unbound
;; variables, which is what this door did with every import before.
(define (baked-imports-of user-forms)
  (filter (lambda (l)
            (let ([e (assoc l *prelude-libraries*)])
              (and e (cadr e) (not (equal? l '(scheme base))))))
          (car (collect-imports user-forms))))

;; the prelude's derived-form macros (its compile-time half), merged into a user
;; program's macro-env at expand time -- the same set the Chez driver merges.
(define (prelude-macro-forms prelude-forms)
  (filter define-syntax-form? prelude-forms))

;; source text + prelude text -> two IR modules (no header) joined by the boundary
;; marker: the (scheme base) library IR, the marker, then the program IR (which
;; references scheme.base:* as external globals).  The re-homed sibling of
;; compile-source-with-prelude: instead of prepending the prelude's definitions it
;; compiles (scheme base) from the baked-in prelude source and compiles the program
;; importing it via compile-program-with-imports -- the SAME core path the Chez
;; driver drives, so the program module is byte-identical to the driver's.  A lone
;; define-library is still compiled as one unit (a library does not auto-import the
;; prelude), returning a single module with no marker.
;; `dump` and `base-dump` are optional (change: emit-dump-stages): the program is the
;; unit under inspection, while the auto-imported (scheme base) it compiles on the way
;; is incidental, so the two get SEPARATE dumpers -- the caller decides whether the
;; standard library's stages appear at all (design D7).
(define (compile-source-rehomed prelude-str user-str . opt)
  (let ([user-forms (read-forms-from-string user-str)]
        [dump       (if (pair? opt) (car opt) no-dump)]
        [base-dump  (if (and (pair? opt) (pair? (cdr opt))) (cadr opt) no-dump)])
    (cond
      ;; A lone define-library: emit ONLY its own module, but resolve its imports against
      ;; the baked set first, so a library declaring `(import (scheme base))` compiles here
      ;; the way it does as a program's dependency (change: baked-set-on-every-door).  The
      ;; unit RESOLVES against (scheme base) without EMITTING it -- that is what "a lone
      ;; define-library compiles to a single unit with no baked base" has always meant.
      ;; An import this door cannot resolve (a manifest library) is filtered out below and
      ;; its names then fail as unbound, exactly as they do for a program on this door.  The
      ;; host-driven modes 7/11 resolve against the session instead and REPORT such an
      ;; import, which is the path `emit lib` and `emit run` actually take.
      [(single-define-library user-forms)
       => (lambda (lib)
            ;; Its DECLARED imports, from the parsed define-library -- not collect-imports,
            ;; which scans top-level forms and would not see a declaration nested inside
            ;; define-library; and not baked-imports-of, which drops (scheme base) because a
            ;; PROGRAM auto-imports it while a library must name it.
            (let ([imports (filter baked-member? (cadr (parse-define-library lib)))])
              (if (null? imports)
                  (compile-library-form lib dump)      ; nothing to resolve: as before
                  (let ([baked (compile-baked-set (read-forms-from-string prelude-str)
                                                  base-dump)])
                    (compile-library-form
                      lib dump
                      (map (lambda (l) (baked-table l baked)) imports))))))]
      [else
       (let* ([prelude-forms (read-forms-from-string prelude-str)]
              ;; Compile the baked set in dependency order, threading each member's
              ;; export table forward so a later member can import an earlier one
              ;; (change: scheme-base-partition).
              [baked      (compile-baked-set prelude-forms base-dump)]
              ;; What is in SCOPE for the program: the auto-imported (scheme base), plus
              ;; whichever other baked members the program names itself.
              [direct     (cons '(scheme base) (baked-imports-of user-forms))]
              [prog-ir    (compile-program-with-imports
                            (prelude-macro-forms prelude-forms)
                            user-forms
                            (map (lambda (l) (baked-table l baked)) direct)
                            (baked-init-order) dump)])
         (string-append (car baked) *emit-unit-boundary* prog-ir))])))

;; Compile every baked partition member in dependency order.  Returns
;; (IR-TEXT (LIBRARY-NAME . EXPORT-TABLE) ...), where IR-TEXT is the members' modules
;; joined by the unit boundary -- the program's own module is appended by the caller.
;; A member is compiled against the export tables of the members it imports, which are
;; already built because *prelude-libraries* is in dependency order.
(define (compile-baked-set prelude-forms base-dump)
  (let loop ([entries (baked-library-entries)] [ir ""] [tables '()] [first? #t])
    (if (null? entries)
        (cons ir (reverse tables))
        (let* ([entry   (car entries)]
               [dl      (parse-define-library (partition-library-form entry prelude-forms))]
               [imports (map (lambda (l) (table-of l tables)) (cadr dl))]
               [res     (compile-library (car dl) (cadr dl) (caddr dl) (cadddr dl)
                                         imports base-dump)])
          (loop (cdr entries)
                (if first?
                    (car res)
                    (string-append ir *emit-unit-boundary* (car res)))
                (cons (cons (car entry) (cadr res)) tables)
                #f)))))

;; The export table a member published, looked up in an alist of (NAME . TABLE).  A
;; miss means *prelude-libraries* is not in dependency order -- a member was compiled
;; before something it imports.
(define (table-of lib tables)
  (let ([e (assoc lib tables)])
    (if e (cdr e) (error 'compile "baked library not compiled before use" lib))))

;; The export table a compiled baked member published, by library name.
(define (baked-table lib baked) (table-of lib (cdr baked)))

;; shared back half of the pipeline for one core-IL expression.  The REPL feeds
;; forms through this incrementally (against a persistent env); batch compilation
;; runs the same passes over a whole program in `compile-forms`.
;;
;; The mid-pipeline passes run HERE on the per-form paths, which is why they were
;; invisible to `--dump` before: the whole-program `compile-forms` dumps them, but the
;; REPL and library paths reach them through this back half.  `dump` is the same
;; injected side-channel `compile-forms` takes -- optional, so a caller with nothing to
;; narrate (and the Chez driver, which never dumps per form) is unchanged
;; (change: emit-dump-stages).
;; The REPL always passes #t for `definition?`: the stable-label path it selects is
;; inert in the program unit (`*unit*` is the empty prefix), so a session form gets the
;; same lowering either way (change: library-body-declarations).
(define (repl-lcode il . opt)
  (lcode-passes il program-unit (if (pair? opt) (car opt) no-dump) #t))

;; ============================================================================
;; Module artifacts: define-library / import / export (change:
;; module-artifacts-vertical-slice).  The pure core turns forms + an in-memory
;; import environment into IR text + an export table; the driver/host owns all
;; file/manifest/link effects.
;; ============================================================================

(define (define-library-form? f) (and (pair? f) (eq? (car f) 'define-library)))
(define (import-form? f) (and (pair? f) (eq? (car f) 'import)))

;; --- naming the offending form in a diagnostic (change: module-frontend-diagnostics) ---
;; Render a datum to a readable string: symbols by name, strings quoted (nothing here
;; needs escaping -- mangled targets are plain identifiers and a source path carries no
;; quotes), proper lists as (a b c), dotted pairs as (a . b).  Enough for an export
;; table and for naming a form the front end rejects; anything else renders "?".
;;
;; It lives HERE, ahead of both consumers, because a diagnostic must name the form on
;; EVERY door: an error's irritants reach the Chez-free doors through
;; repl-error->string, which renders a LIST irritant as "?", so a form the user wrote
;; has to be rendered INTO the message rather than passed beside it.
(define (render-datum x)
  (cond
    [(string? x) (string-append "\"" x "\"")]
    [(symbol? x) (symbol->string x)]
    [(null? x) "()"]
    [(pair? x) (string-append "(" (render-list-body x) ")")]
    ;; the call rows carry an arity (change: cross-unit-direct-calls)
    [(number? x) (number->string x)]
    [else "?"]))
(define (render-list-body p)
  (let ([a (render-datum (car p))] [d (cdr p)])
    (cond
      [(null? d) a]
      [(pair? d) (string-append a " " (render-list-body d))]
      [else (string-append a " . " (render-datum d))])))

;; A short, BOUNDED name for a form in a diagnostic: its head keyword when it has one,
;; else the whole form rendered.  Bounded on purpose -- a rejected declaration may carry
;; the library's entire body (a `cond-expand` wrapping everything), and a diagnostic
;; that reprints it is unreadable.  Import specs are named in full instead (see
;; check-import-spec): they are small by construction and the transform is the point.
(define (form-label f)
  (if (and (pair? f) (symbol? (car f)))
      (symbol->string (car f))
      (render-datum f)))

;; --- rejecting what the module front end does not implement ------------------
;; (change: module-frontend-diagnostics; issues #45, #18 item 3, #48, #49.)
;; Modules v0 drew its boundaries in the spec but built nothing that says no, so an
;; unsupported form was not rejected -- it was reclassified, and whatever the
;; reclassification broke second is what got reported: an import set became a library
;; NAME (reported as a missing manifest entry, or as an unresolved/cyclic import), an
;; unrecognized declaration became a body form (reported as an unbound variable), and a
;; misplaced define-library became an application over internal defines (reported as a
;; malformed body).  Each guard below sits exactly where the wrong assumption is made
;; (design D1) and raises the ordinary recoverable compile-time error the REPL already
;; catches, reports, and returns to the prompt from (design D6).

;; The import-set transforms R7RS defines.  None is supported in this stage; `rename` is
;; rejected only HERE, in import position, because `(rename internal external)` is legal
;; in an `export` declaration (design D4).
(define *import-set-keywords* (quote (only except prefix rename)))

(define (import-set-spec? spec)
  (and (pair? spec) (symbol? (car spec))
       (memq (car spec) *import-set-keywords*) #t))

;; ONE validator, called by BOTH paths that turn an import spec into a library name --
;; the program path (collect-imports) and the library path (parse-define-library) -- so
;; the message for a given form cannot depend on where it was written (design D5).  The
;; whole spec is named: it is what the user typed and it is short.
(define (check-import-spec spec)
  (when (import-set-spec? spec)
    (error 'import
           (string-append "import sets are not supported: " (render-datum spec)
                          " -- imports are whole-library, as (import (library name))"))))

;; The remaining R7RS library declarations: recognized, and not implemented in this
;; stage (issue #18).  Kept distinct from an unrecognized declaration because the user's
;; next move differs -- one is waiting on Emit, the other is a mistake (design D2).
(define *unsupported-library-declarations*
  (quote (include include-ci include-library-declarations cond-expand)))

;; The `[else]` arm of parse-define-library's declaration `cond`.  It used to cons the
;; declaration onto the body, which is how `(cond-expand (else (begin (define (f x) x))))`
;; came to report "export of a name the library does not define f".  No schedule is
;; promised here (design D7): #18 owns when these land.
(define (reject-library-declaration d)
  (if (and (pair? d) (symbol? (car d))
           (memq (car d) *unsupported-library-declarations*))
      (error 'define-library
             (string-append (form-label d)
                            " is an R7RS library declaration this stage does not support"))
      (error 'define-library
             (string-append (form-label d)
                            " is not a library declaration -- a declaration is"
                            " (export ...), (import ...) or (begin ...)"))))

;; Does any of FORMS declare a library?  Used only to tell a MISPLACED define-library
;; from a source that has none.
(define (any-define-library-form? forms)
  (cond
    [(null? forms) #f]
    [(define-library-form? (car forms)) #t]
    [else (any-define-library-form? (cdr forms))]))

;; A define-library is compiled as a library unit only where a library unit is what the
;; door produces: as the sole top-level form of a source (single-define-library).  Where
;; that does not hold, say so -- ordinary expression parsing knows no `define-library`
;; form, so it reads one as an application whose operands are internal defines and
;; reports `internal defines with no following body expression ?`, a message about an
;; artifact of the misparse (issue #49).
(define (check-library-position forms)
  (when (and (not (single-define-library forms)) (any-define-library-form? forms))
    (error 'define-library
           (string-append "a define-library must be the only form in its source: "
                          (render-datum (library-form-name forms))))))

;; The name of the first define-library among FORMS (for the diagnostic above).
(define (library-form-name forms)
  (cond
    [(null? forms) (quote ())]
    [(define-library-form? (car forms)) (cadr (car forms))]
    [else (library-form-name (cdr forms))]))

;; An export spec is either a bare name `n` or a rename `(rename internal external)`
;; (change: module-generalize).  Normalize each to a pair (external . internal): the
;; external name is what importers see (the export-table key); the internal name is
;; what the library defines and what the emitted symbol is based on.  A bare name is
;; (n . n).  The symbol is ALWAYS the internal name, so rename is pure table
;; indirection with no new emission logic.
(define (normalize-export spec)
  (if (pair? spec)                          ; (rename internal external)
      (cons (caddr spec) (cadr spec))       ; (external . internal)
      (cons spec spec)))                    ; bare: external == internal

;; (define-library (name ...) decl ...) -> (list name imports exports body-forms).
;; decls: (export spec ...) | (import (L) ...) | (begin form ...).  Anything else is
;; REJECTED by name (reject-library-declaration) rather than absorbed into the body --
;; the `[else]` arm used to cons it on, which is what made an unsupported declaration
;; surface as somebody else's error (change: module-frontend-diagnostics, #18 item 3).
;; Each export is normalized to an (external . internal) pair (see normalize-export).
;; Each import spec is checked here, so EVERY caller of this parser -- the batch doors,
;; the REPL's library loader, the driver -- rejects an import set identically (design D5).
(define (parse-define-library form)
  (let ([name (cadr form)])
    (let loop ([ds (cddr form)] [imps '()] [exps '()] [body '()])
      (if (null? ds)
          (list name (reverse imps) (reverse exps) (reverse body))
          (let ([d (car ds)])
            (cond
              [(and (pair? d) (eq? (car d) 'export))
               (loop (cdr ds) imps (append (reverse (map normalize-export (cdr d))) exps) body)]
              [(and (pair? d) (eq? (car d) 'import))
               (for-each check-import-spec (cdr d))
               (loop (cdr ds) (append (reverse (cdr d)) imps) exps body)]
              [(and (pair? d) (eq? (car d) 'begin))
               (loop (cdr ds) imps exps (append (reverse (cdr d)) body))]
              [else (reject-library-declaration d)]))))))

;; Split a program's top-level forms into (list imported-libs runtime-forms);
;; each imported-lib is a library name like (mylib).  An import SET is rejected here,
;; before the spec is read as a library name -- by the same validator the library path
;; calls, so one form gets one message on both (design D5).
(define (collect-imports forms)
  (let loop ([fs forms] [imps '()] [rt '()])
    (cond
      [(null? fs) (list (reverse imps) (reverse rt))]
      [(import-form? (car fs))
       (for-each check-import-spec (cdr (car fs)))
       (loop (cdr fs) (append (reverse (cdr (car fs))) imps) rt)]
      [else (loop (cdr fs) imps (cons (car fs) rt))])))

;; Normalize a library body: replace each `(define-record-type ...)` with the
;; (define <name> <init>) forms its group lowers to, spliced in place (change:
;; library-body-declarations, issue #16, design D2).  This calls the SAME
;; `record-type-bindings` that `collect-toplevel` splices for a program
;; (src/parse.ss), so a library handles the form the way a program already does
;; rather than a second way -- and no record form reaches `repl-lower-form*`'s
;; generation-mangling arm, which would give a unit's record bindings `pt-x.g0`
;; instead of the plain name the export table mangles.
;;
;; The descriptor's name is a gensym, so it must be identical in the whole and the
;; pruned compile: this runs after `reset-counter!` over the same body list in both,
;; so the counter is in the same state when it is reached.
;;
;; Everything downstream therefore sees only defines and commands.
(define (splice-record-types forms)
  (let loop ([fs forms] [acc (quote ())])
    (cond
      [(null? fs) (reverse acc)]
      [(record-type-form? (car fs))
       (loop (cdr fs)
             (fold-left (lambda (a b) (cons (list 'define (car b) (cadr b)) a))
                        acc (record-type-bindings (car fs))))]
      [else (loop (cdr fs) (cons (car fs) acc))])))

;; A body form's defined name, or #f when it defines none -- a COMMAND (change:
;; library-body-declarations).  After splice-record-types those are the only two cases.
(define (body-form-name f) (and (define-form? f) (car (normalize-define f))))

;; The dump tag for one body form: its name, or a positional tag for a command, which
;; has none.  `i` is the form's position in the unit's body, so a command's tag reads
;; the same in the whole and the pruned compile (a command is never pruned).
(define (body-form-tag nm i)
  (if nm (symbol->string nm) (string-append "command " (number->string i))))

;; Expand + lower ONE of a library's top-level body forms, with every stage of its own
;; lowering observable and tagged (change: emit-dump-stages -- `compile-library` took a
;; `dump` but never used it, so libraries dumped nothing on any host).  Order of effects
;; is unchanged: expand, then lower, then narrate.
(define (unit-def-lcode env f macro-env known unit dump i)
  (unit-lcode-tagged env (expand-unit-form f macro-env known) unit dump
                     (body-form-tag (body-form-name f) i)
                     (and (define-form? f) #t)))

;; The shared tail: lower one already-expanded unit form, narrating its parse+rename
;; result and each mid-pipeline stage under a `define <name>` tag.
(define (unit-lcode-tagged env form unit dump name definition?)
  (let* ([d  (dump-tagged dump (string-append (if definition? "define " "") name))]
         [il (repl-lower-form* env form #f)])
    (d "parse+rename" il)
    (unit-lcode il unit d definition?)))

;; expand one top-level form (define init, or a bare expression) against macro-env
(define (expand-unit-form f macro-env known)
  (if (and (pair? f) (eq? (car f) 'define))
      (let ([nd (normalize-define f)])
        `(define ,(car nd) ,(expand (cadr nd) macro-env known)))
      (expand f macro-env known)))

;; lower one core-IL expression for a unit named `unit` (code labels get @"L:..").
;; `definition?` (second optional, default #t) distinguishes a top-level DEFINITION
;; from a COMMAND; only the former's `global-set!` is an initializer entitled to the
;; stable, name-derived code label (change: library-body-declarations).
(define (unit-lcode il unit . opt)
  (lcode-passes il unit
                (if (pair? opt) (car opt) no-dump)
                (or (null? opt) (null? (cdr opt)) (cadr opt))))

;; A per-form view of a dumper (design D8): tag every stage NAME this dumper is given,
;; so the stages of a pass that runs once per top-level form can be told apart --
;; `;; ==== after convert-closures [define fact] ====`.  Carrying the tag in the stage
;; string keeps the dump protocol at (stage form), so it works with ANY dumper: the
;; in-language one, and the Chez driver's two-argument `dump` unchanged.  Pure Scheme
;; with no %-ops, so this stays host-agnostic (change: emit-dump-stages).
(define (dump-tagged dump tag)
  (if (eq? dump no-dump)
      no-dump                                    ; nothing to narrate: no allocation
      (lambda (stage form) (dump (string-append stage " [" tag "]") form))))

;; The mid-pipeline pass sequence shared by both per-form back halves, with each stage
;; observable (change: emit-dump-stages).  Named stages match `compile-forms`, so one
;; splitter reads a dump from any path; `dump` is `no-dump` in every caller that is not
;; narrating, which makes this exactly the old one-liner.
(define (lcode-passes il unit dump definition?)
  (let* ([a (recognize-let il)]
         [b (convert-assignments a)]
         [s (simplify b)]
         [c (convert-closures s)]
         [d (lower-program c unit definition?)])
    (dump "recognize-let" a) (dump "convert-assignments" b)
    (dump "simplify" s) (dump "convert-closures" c) (dump "lower" d)
    d))

;; An import environment is an alist external-name -> mangled-symbol, built from a
;; list of imported libraries' export tables (each `(name ((ext . mangled) ...) calls)`,
;; as returned by compile-library).  The mangled string is interned to a symbol so
;; resolution can emit it as a (global-ref sym); because that symbol is already
;; unit-qualified (`b:add1`), emit does not re-mangle it and it becomes an external
;; global.  Shared by compile-library (transitive lib->lib imports) and
;; compile-program-with-imports (change: module-generalize).
(define (import-tables->env-alist import-tables)
  (map (lambda (p) (cons (car p) (string->symbol (cdr p))))
       (apply append (map cadr import-tables))))

;; The direct-call view of the same tables (change: cross-unit-direct-calls): an
;; alist mangled-symbol -> (label . arity), keyed the way `lower` sees an imported
;; reference -- as the `(global-ref sym)` the resolver produced -- so a call through
;; one can be recognized as having a statically known callee.  Built by joining each
;; table's CALL rows (external label arity) against its export alist on the external
;; name.  A table with no call rows contributes nothing, so importing only values
;; lowers exactly as before.
(define (import-tables->call-alist import-tables)
  (apply append
    (map (lambda (t)
           (let ([exports (cadr t)])
             (map (lambda (c)
                    (cons (string->symbol (cdr (assq (car c) exports)))
                          (cons (cadr c) (caddr c))))
                  (caddr t))))
         import-tables)))

;; The export table's CALL rows for a unit just lowered (change:
;; cross-unit-direct-calls): for each export whose top-level initializer `lower`
;; hoisted as a FIXED-ARITY lambda, its external name, the stable code label lower
;; assigned it, and that arity -- everything an importer needs to emit a direct call
;; with no access to the library's source.  `procs` is lower's own record of what it
;; emitted (`unit-procs`), so the table can never advertise a label the unit does not
;; define.  A value export, or a procedure of variable arity, gets no row and calls
;; to it stay indirect -- and so does a binding the unit ASSIGNS, which `unit-procs`
;; filters out, since its slot can hold a different closure after __init (change:
;; library-toplevel-set, issue #14).
(define (export-call-rows exports procs)
  (filter (lambda (x) x)
          (map (lambda (e)
                 (let ([p (assq (cdr e) procs)])
                   (and p (list (car e) (cadr p) (caddr p)))))
               exports)))

;; Compile a library's declarations into (list ir-text export-table).
;;   name          : library name (list of symbol parts)
;;   exports       : (external . internal) pairs (see normalize-export)
;;   body-forms    : the library's top-level defines (a mutually-recursive group)
;;   import-tables : the export tables of the libraries THIS library imports (its
;;                   direct dependencies); '() for an import-free library.
;; export-table : (list name ((external-name . mangled-string) ...)
;;                     ((external-name code-label arity) ...))
;; -- the symbol rows every importer needs, then the CALL rows for the exports whose
;; initializer is a fixed-arity lambda, which let an importer emit a direct call to
;; the procedure's code (change: cross-unit-direct-calls).
;; A library may import other libraries (change: module-generalize): its body
;; resolves those imports' exports as external globals, exactly as a program does.
;; Libraries do not share the prelude (that is Stage 3), so the body uses
;; primitives / core forms / imported bindings only.
;; --- reachability tree-shaking (change: aot-release-profile) -----------------
;; Closed-world (AOT-only) pruning of unreachable library bindings.  Conservative
;; and SOUND: we over-approximate a binding's dependencies by every symbol that
;; appears anywhere in its expanded body (intersected with the unit's own define
;; names).  Local shadowing can only ADD a false dependency -> keep an extra
;; binding, never drop a needed one.  Computed post-expansion so macro-introduced
;; references are visible.  Unit-general: it walks any define->define reference
;; graph from an explicit root set.
(define (all-symbols form)                 ; every symbol appearing in an s-expr
  (cond [(symbol? form) (list form)]
        [(pair? form) (append (all-symbols (car form)) (all-symbols (cdr form)))]
        [else '()]))

(define (reachable-names roots dep-alist)  ; transitive closure of roots over deps
  (let loop ([work roots] [seen '()])
    (cond [(null? work) seen]
          [(memq (car work) seen) (loop (cdr work) seen)]
          [else
           (let ([deps (cond [(assq (car work) dep-alist) => cdr] [else '()])])
             (loop (append deps (cdr work)) (cons (car work) seen)))])))

;; `keep-roots` (optional): when #f (default), compile the WHOLE library unchanged
;; -- byte-identical to before, so the REPL/JIT door and committed artifacts are
;; unaffected.  When a list of internal names, emit ONLY the bindings transitively
;; reachable from those roots (the closed-world AOT tree-shake).
(define (compile-library name imports exports body-forms import-tables dump . opt)
  (compile-library* name imports exports body-forms import-tables dump
                    (if (pair? opt) (car opt) #f)))

(define (compile-library* name imports exports body-forms import-tables dump keep-roots)
  (reset-counter!)
  (reset-unit-procs!)                ; this unit's own call interface (cross-unit-direct-calls)
  (reset-unit-assigned!)             ; ...minus what it assigns (library-toplevel-set)
  (set-import-calls! (import-tables->call-alist import-tables))   ; calls INTO its dependencies
  (let* ([me+rf (collect-define-syntax body-forms)]
         [macro-env (car me+rf)]
         [runtime (cadr me+rf)]
         [import-env-alist (import-tables->env-alist import-tables)]
         ;; imported external names are "known" too (see compile-program-with-imports),
         ;; so a macro introducing one is not hygiene-renamed away.
         ;; EVERY body form is lowered, in source order (change: library-body-declarations,
         ;; issue #16).  `defs` used to be (filter define-form? runtime), which silently
         ;; dropped a command and made define-record-type unusable in a library.  After
         ;; splice-record-types the body holds only defines and commands -- and it is
         ;; computed BEFORE `known`, so a record's binding names count as known
         ;; identifiers and hygiene does not rename references to them away.
         [body  (splice-record-types runtime)]
         [known (union (compute-known macro-env body) (map car import-env-alist))]
         [defined-names (map (lambda (p) (car (normalize-define p)))
                             (filter define-form? body))]
         [env   (make-repl-env)])
    ;; validate each export's INTERNAL name is defined at the library's top level.
    ;; A name bound by a `define-syntax` is NOT undefined -- collect-define-syntax lifted
    ;; it into `macro-env` above, out of the runtime body this check computes
    ;; `defined-names` from.  Reporting it as undefined described that lifting rather than
    ;; the user's error, so consult the macro-env we are already holding and say what is
    ;; actually wrong (change: module-frontend-diagnostics, issue #48, design D3).
    (for-each
      (lambda (e)
        (unless (memq (cdr e) defined-names)
          (if (assq (cdr e) macro-env)
              (error 'compile-library
                     "a library cannot export a macro (exports are procedures in this stage)"
                     (cdr e))
              (error 'compile-library
                     "export of a name the library does not define" (cdr e)))))
      exports)
    ;; seed the import environment FIRST, so the unit's own defines (registered
    ;; next, consed on top) shadow an imported name of the same spelling.
    (vector-set! env 0 import-env-alist)
    ;; phase 1: register every top-level define (plain names) for mutual reference.
    ;; A command defines nothing, so it registers nothing and is simply skipped.
    (for-each (lambda (f) (when (define-form? f) (unit-register-define! env f))) body)
    ;; phase 2: lower each define body as one mutually-recursive group (register? #f).
    ;; Use fold-left (left-to-right in BOTH hosts), not map: the gensym counter is
    ;; mutated per form, and Chez's map vs the prelude's map apply in different
    ;; orders -- which would diverge the AOT-door and REPL-door units.  fold-left
    ;; keeps a library's emitted bytes identical across doors (dev->ship fidelity).
    (if (not keep-roots)
        ;; DEFAULT PATH (dev/REPL/JIT + committed artifacts): whole unit, unchanged.
        ;; The fold carries the form's 1-based position alongside the accumulator, so a
        ;; command (which has no name) can be tagged positionally in the dump.
        (let ([progs (reverse
                       (cadr
                         (fold-left
                           (lambda (st f)
                             (list (+ (car st) 1)
                                   (cons (unit-def-lcode env f macro-env known name dump
                                                         (car st))
                                         (cadr st))))
                           (list 1 (quote ())) body)))]
              ;; export table keys on the EXTERNAL name; the symbol is the INTERNAL name
              ;; mangled to this unit (rename is pure indirection).
              [export-table (map (lambda (e) (cons (car e) (mangle name (cdr e)))) exports)])
          (list (emit-library-batch progs name)
                (list name export-table (export-call-rows exports (unit-procs)))))
        ;; PRUNED PATH (closed-world AOT tree-shake): expand each body form ONCE,
        ;; compute the define->define reference graph, keep only what's reachable from
        ;; the roots, and lower/emit just those (in original order, so __init order is
        ;; preserved).  fold-left = left-to-right in both hosts (deterministic).
        ;;
        ;; Each entry is (name-or-#f position expanded-form); #f marks a COMMAND, which
        ;; defines no name and so cannot be reached BY one (change:
        ;; library-body-declarations, design D3).
        (let* ([expanded (reverse
                           (cadr
                             (fold-left
                               (lambda (st f)
                                 (list (+ (car st) 1)
                                       (cons (list (body-form-name f) (car st)
                                                   (expand-unit-form f macro-env known))
                                             (cadr st))))
                               (list 1 (quote ())) body)))]
               [unit-refs (lambda (ne)          ; this unit's own names the form mentions
                            (filter (lambda (s) (memq s defined-names))
                                    (all-symbols (caddr ne))))]
               [dep-alist (map (lambda (ne) (cons (car ne) (unit-refs ne)))
                               (filter car expanded))]
               ;; A command's effects are not modelled by reachability, so it is ALWAYS
               ;; kept -- and whatever it references must become a root, or the shake
               ;; could prune a binding a surviving command calls into a link-time
               ;; undefined symbol.
               [cmd-roots (apply append (map unit-refs (filter (lambda (ne) (not (car ne)))
                                                               expanded)))]
               [reachable (reachable-names (append keep-roots cmd-roots) dep-alist)]
               [kept    (filter (lambda (ne)
                                  (or (not (car ne)) (memq (car ne) reachable)))
                                expanded)]
               [progs   (reverse
                          (fold-left
                            (lambda (acc ne)
                              (cons (unit-lcode-tagged env (caddr ne) name dump
                                                       (body-form-tag (car ne) (cadr ne))
                                                       (and (car ne) #t))
                                    acc))
                            (quote ()) kept))]
               ;; the KEPT exports; both the symbol rows and the call rows are drawn
               ;; from this one list, so the pruned table is exactly the full table
               ;; restricted to what survived -- same names, same mangled symbols, and
               ;; (because the labels are name-derived) the same labels.
               [kept-exports (filter (lambda (e) (memq (cdr e) reachable)) exports)]
               [export-table (map (lambda (e) (cons (car e) (mangle name (cdr e))))
                                  kept-exports)])
          (list (emit-library-batch progs name)
                (list name export-table (export-call-rows kept-exports (unit-procs))))))))

;; Compile a program that imports libraries.  import-tables is a list of the
;; program's DIRECT imports' export tables (as returned by compile-library); the
;; program resolves imported free identifiers to the exporter's external globals.
;; init-libs is the WHOLE transitive import closure in dependency (topological)
;; order (change: module-generalize) -- the units whose one-shot __init the
;; program's @scheme_entry runs, deepest dependency first, before the body.  When
;; init-libs is #f the program's direct imports are used (single-stage callers).
;; Returns IR text.
(define (compile-program-with-imports prelude-forms user-forms import-tables init-libs dump)
  (check-library-position user-forms)   ; the importing half of compile-forms' guard
  (let* ([imp+rt (collect-imports user-forms)]
         [imported-libs (car imp+rt)]
         [runtime-user (cadr imp+rt)]
         [import-env-alist (import-tables->env-alist import-tables)] ; (ext . mangled-sym)
         [forms (with-prelude prelude-forms runtime-user)])
    (reset-counter!)
    ;; a call to one of these imports' fixed-arity procedures lowers to a direct call
    ;; to its code label (change: cross-unit-direct-calls).
    (set-import-calls! (import-tables->call-alist import-tables))
    (let* ([me+rf (collect-define-syntax forms)]
           [macro-env (car me+rf)] [runtime (cadr me+rf)]
           ;; Imported external names are "known" bindings too, so a derived-form
           ;; macro (e.g. `case`) may introduce a reference to one (e.g. `memv`)
           ;; without hygiene renaming it away (change: module-prelude-scheme-base).
           [known (union (compute-known macro-env runtime) (map car import-env-alist))]
           [top   (collect-toplevel runtime)]
           [expd  (expand top macro-env known)]
           [core0 (rename-program (parse-program expd))]
           [core  (inline-primitives
                    (if (null? import-env-alist)
                        core0
                        (resolve-globals core0 (vector import-env-alist 0))))]
           [a (recognize-let core)]
           [b (convert-assignments a)]
           [s (simplify b)]
           [c (convert-closures s)]
           [d (lower-program c program-unit)])
      ;; every stage, not just the four this path used to show: it runs the same
      ;; recognize-let/convert-assignments/simplify/convert-closures ladder as
      ;; compile-forms, and this is the path EVERY door takes once (scheme base) is
      ;; auto-imported (change: emit-dump-stages).
      (dump "collect-toplevel" top) (dump "expand" expd)
      (dump "parse+rename+imports" core) (dump "recognize-let" a)
      (dump "convert-assignments" b) (dump "simplify" s)
      (dump "convert-closures" c) (dump "lower" d)
      (emit-program-with-imports d (or init-libs imported-libs) (map cdr import-env-alist)))))
