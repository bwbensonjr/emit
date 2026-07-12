;;; compile.ss -- driver for the core-lambda-slice compiler.
;;;
;;; Usage (run from the repo root):
;;;   chez --libdirs src --script src/compile.ss SRC.scm [-o OUT] [--dump]
;;;
;;; Reads the top-level forms from SRC.scm (a sequence of `define`s and
;;; expressions), runs the pipeline (dumping the IL after each stage to stderr
;;; with --dump), emits OUT.ll, and links it with the C runtime + libgc into the
;;; executable OUT.

(import (chezscheme) (match) (util))

(include "src/parse.ss")
(include "src/passes/expand.ss")
(include "src/passes/recognize-let.ss")
(include "src/passes/convert-assignments.ss")
(include "src/passes/convert-closures.ss")
(include "src/passes/lower.ss")
(include "src/emit.ss")

(define runtime-c "src/runtime/runtime.c")
(define gc-inc "/opt/homebrew/include")
(define gc-lib "/opt/homebrew/lib")

(define (read-program path)   ; -> ordered list of all top-level forms
  (let ([p (open-input-file path)])
    (let loop ([forms '()])
      (let ([e (read p)])
        (if (eof-object? e)
            (begin (close-port p) (reverse forms))
            (loop (cons e forms)))))))

(define (dump stage form)
  (fprintf (current-error-port) ";; ==== after ~a ====\n" stage)
  (pretty-print form (current-error-port))
  (newline (current-error-port)))

;; --- prelude (standard library prepended to every program) ---------------
(define prelude-path "src/prelude.scm")

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

(define (compile-file src ll dump? prelude?)
  (reset-counter!)
  (let* ([user-forms (read-program src)]
         [forms (if prelude?
                    (with-prelude (read-program prelude-path) user-forms)
                    user-forms)]
         [top   (collect-toplevel forms)]
         [expd  (expand top)]
         [core  (rename-program (parse-program expd))]
         [a     (recognize-let core)]
         [b     (convert-assignments a)]
         [c     (convert-closures b)]
         [d     (lower-program c)]
         [text  (emit-program d)])
    (when dump?
      (dump "collect-toplevel" top) (dump "expand" expd)
      (dump "parse+rename" core) (dump "recognize-let" a)
      (dump "convert-assignments" b) (dump "convert-closures" c) (dump "lower" d))
    (let ([out (open-output-file ll 'replace)]) (display text out) (close-port out))))

;; --- backends -----------------------------------------------------------
;; One emitted OUT.ll drives three exits.  AOT stays on the system clang
;; (unchanged).  The JIT and bitcode exits use the pinned LLVM 22 tools by
;; absolute path (Homebrew keg, off PATH).
(define llvm-bin "/opt/homebrew/opt/llvm@22/bin/")
(define (tool t) (string-append llvm-bin t))
(define gc-dylib (string-append gc-lib "/libgc.dylib"))
(define (sh who cmd)
  (unless (zero? (system cmd)) (error 'compile (string-append who " failed") cmd)))

(define (require-llvm-tools)
  (for-each
    (lambda (t)
      (unless (file-exists? (tool t))
        (error 'compile
               (string-append "required LLVM 22 tool not found: " (tool t)
                              "  (install with: brew install llvm@22)"))))
    '("lli" "llvm-as" "llvm-link" "clang")))

;; AOT (default): textual IR -> native exe via the system clang.  Unchanged.
(define (link ll exe)
  (sh "clang" (string-append "clang -I" gc-inc " -L" gc-lib " " runtime-c " " ll " -lgc -o " exe)))

;; Bitcode: assemble OUT.ll -> OUT.bc (the inspectable/opt-able artifact),
;; then codegen the .bc + runtime to a native exe (LLVM 22 clang).
(define (emit-bitcode ll bc)
  (sh "llvm-as" (string-append (tool "llvm-as") " " ll " -o " bc)))
(define (build-bitcode-exe bc exe)
  (sh "clang(bc)"
      (string-append (tool "clang") " -I" gc-inc " -L" gc-lib " " runtime-c " " bc " -lgc -o " exe)))

;; JIT: assemble the program, compile the runtime to bitcode, llvm-link them
;; (so the C main + rt_* join the module), and run in-process via lli with
;; libgc loaded.  lli executes the linked module's main.
(define (run-jit ll base)
  (let ([pbc (string-append base ".bc")]
        [rbc (string-append base ".rt.bc")]
        [cbc (string-append base ".combined.bc")])
    (sh "llvm-as"    (string-append (tool "llvm-as") " " ll " -o " pbc))
    (sh "clang-emit" (string-append (tool "clang") " -I" gc-inc " -emit-llvm -c " runtime-c " -o " rbc))
    (sh "llvm-link"  (string-append (tool "llvm-link") " " pbc " " rbc " -o " cbc))
    (sh "lli"        (string-append (tool "lli") " -load=" gc-dylib " " cbc))))

(define (strip-ext s)
  (let ([i (let loop ([i (- (string-length s) 1)])
             (cond [(< i 0) #f] [(char=? (string-ref s i) #\.) i] [else (loop (- i 1))]))])
    (if i (substring s 0 i) s)))

;; --- argument handling ---
(define (main args)
  (let loop ([args args] [src #f] [out #f] [dump? #f] [backend "aot"] [prelude? #t])
    (cond
      [(null? args)
       (unless src (error 'compile "usage: compile.ss SRC.scm [-o OUT] [--dump] [--backend aot|jit|bitcode] [--no-prelude]"))
       (let* ([out (or out (strip-ext src))] [ll (string-append out ".ll")])
         (compile-file src ll dump? prelude?)
         (case (string->symbol backend)
           [(aot)
            (link ll out)
            (fprintf (current-error-port) "wrote ~a and ~a\n" ll out)]
           [(bitcode)
            (require-llvm-tools)
            (let ([bc (string-append out ".bc")])
              (emit-bitcode ll bc)
              (build-bitcode-exe bc out)
              (fprintf (current-error-port) "wrote ~a, ~a and ~a\n" ll bc out))]
           [(jit)
            (require-llvm-tools)
            (run-jit ll out)]
           [else (error 'compile "unknown backend (want aot|jit|bitcode)" backend)]))]
      [(string=? (car args) "-o") (loop (cddr args) src (cadr args) dump? backend prelude?)]
      [(string=? (car args) "--dump") (loop (cdr args) src out #t backend prelude?)]
      [(string=? (car args) "--backend") (loop (cddr args) src out dump? (cadr args) prelude?)]
      [(string=? (car args) "--no-prelude") (loop (cdr args) src out dump? backend #f)]
      [else (loop (cdr args) (car args) out dump? backend prelude?)])))

(main (command-line-arguments))
