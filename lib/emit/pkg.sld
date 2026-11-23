;;; pkg.sld -- the emit pkg package manager (change: emit-pkg).
;;;
;;; Installs packages from the emit-packages collection into the user library root.
;;; `emit pkg` runs tools/pkg.scm, which calls pkg-main with (command-line); the host
;;; puts --emit-version and --data-dir ahead of the user's arguments, so the running
;;; version and the user root have exactly one source each.
;;;
;;; State lives under DATA (= $XDG_DATA_HOME/emit or ~/.local/share/emit):
;;;   lib/              the user library root; installed files are placed here
;;;   packages/N.scm    committed record of package N: its source and owned files
;;;   packages/N.pending  journal of an operation on N that has not committed
;;;   .pkg-lock/        held by the one writer allowed at a time
;;;   .pkg-tmp/         staging for one invocation, on the same filesystem as lib/
;;;
;;; Every writer locks, recovers any pending journal, runs every check, and only then
;;; writes: journal, place each file by rename, commit the record, clean up.  It never
;;; writes through a symbolic link and never touches a file it does not own.
(define-library (emit pkg)
  (import
    (scheme base)
    (scheme char)
    (scheme read)
    (scheme write)
    (scheme file)
    (scheme process-context)
    (emit filesystem)
    (emit process))
  (export pkg-main)
  (begin
    (define collection-repository "bwbensonjr/emit-packages")
    (define collection-branch "main")

    ;; ---------------------------------------------------------------- failures
    ;; A failure carries its exit status: 2 for usage errors, 1 for everything else.
    (define-record-type pkg-failure (make-pkg-failure status message) pkg-failure?
      (status pkg-failure-status)
      (message pkg-failure-message))

    (define (fail . parts) (raise (make-pkg-failure 1 (apply string-append parts))))

    (define (usage-fail . parts)
      (raise (make-pkg-failure 2 (apply string-append parts))))

    ;; --------------------------------------------------------------- narration
    (define verbosity
      (let ((level (get-environment-variable "EMIT_VERBOSITY")))
        (cond
          ((not level) 'default)
          ((member level '("quiet" "q" "0")) 'quiet)
          ((member level '("verbose" "v" "2")) 'verbose)
          (else 'default))))

    (define (emit-line port parts)
      (for-each (lambda (part) (display part port)) parts)
      (newline port)
      (flush-output-port port))

    ;; say: a principal action.  vsay: per-file detail.  complain: always shown.
    (define (say . parts)
      (unless (eq? verbosity 'quiet) (emit-line (current-error-port) parts)))

    (define (vsay . parts)
      (when (eq? verbosity 'verbose) (emit-line (current-error-port) parts)))

    (define (complain . parts)
      (emit-line (current-error-port) (cons "emit pkg: " parts)))

    ;; ---------------------------------------------------------- string helpers
    (define (string-prefix? prefix s)
      (and (<= (string-length prefix) (string-length s))
           (string=? prefix (substring s 0 (string-length prefix)))))

    (define (string-suffix? suffix s)
      (let ((n (string-length s)) (k (string-length suffix)))
        (and (<= k n) (string=? suffix (substring s (- n k) n)))))

    (define (split-string s ch)
      (let loop ((i 0) (start 0) (parts '()))
        (cond
          ((= i (string-length s)) (reverse (cons (substring s start i) parts)))
          ((char=? (string-ref s i) ch)
            (loop (+ i 1) (+ i 1) (cons (substring s start i) parts)))
          (else (loop (+ i 1) start parts)))))

    (define (join-strings parts separator)
      (if (null? parts)
          ""
          (let loop ((rest (cdr parts)) (out (car parts)))
            (if (null? rest)
                out
                (loop (cdr rest) (string-append out separator (car rest)))))))

    (define (trim s)
      (let* ((n (string-length s))
             (start (let loop ((i 0))
                      (if (and (< i n) (char-whitespace? (string-ref s i)))
                          (loop (+ i 1))
                          i)))
             (end (let loop ((i n))
                    (if (and (> i start) (char-whitespace? (string-ref s (- i 1))))
                        (loop (- i 1))
                        i))))
        (substring s start end)))

    (define (hex-commit? s)
      (and (= (string-length s) 40)
           (let loop ((i 0))
             (or (= i 40)
                 (and (memv (string-ref s i) (string->list "0123456789abcdef"))
                      (loop (+ i 1)))))))

    (define (short-commit commit) (substring commit 0 12))

    ;; Insertion into an ordered list; the lists here are a handful of names.
    (define (sort-strings strings)
      (define (insert s sorted)
        (cond
          ((null? sorted) (list s))
          ((string<? s (car sorted)) (cons s sorted))
          (else (cons (car sorted) (insert s (cdr sorted))))))
      (let loop ((rest strings) (sorted '()))
        (if (null? rest) sorted (loop (cdr rest) (insert (car rest) sorted)))))

    (define (remove-duplicates strings)
      (let loop ((rest strings) (seen '()))
        (cond
          ((null? rest) (reverse seen))
          ((member (car rest) seen) (loop (cdr rest) seen))
          (else (loop (cdr rest) (cons (car rest) seen))))))

    (define (count-label n singular plural)
      (string-append (number->string n) " " (if (= n 1) singular plural)))

    ;; ------------------------------------------------------------ path helpers
    (define (path . parts) (join-strings parts "/"))

    (define (parent-path p)
      (let loop ((i (- (string-length p) 1)))
        (cond
          ((< i 1) "/")
          ((char=? (string-ref p i) #\/) (substring p 0 i))
          (else (loop (- i 1))))))

    ;; A declared file must stay beneath lib/: relative, no empty, `.`, or `..` part.
    (define (safe-relative-path? p)
      (and (> (string-length p) 0)
           (not (char=? (string-ref p 0) #\/))
           (let loop ((parts (split-string p #\/)))
             (or (null? parts)
                 (and (not (member (car parts) '("" "." ".."))) (loop (cdr parts)))))))

    ;; Whether anything at all is at P, including a dangling link.
    (define (path-present? p)
      (or (file-symbolic-link? p) (file-directory? p) (file-exists? p)))

    (define (current-directory)
      (or (let ((pwd (get-environment-variable "PWD")))
            (and pwd (> (string-length pwd) 0) (char=? (string-ref pwd 0) #\/) pwd))
          (call-with-values (lambda () (program-output "pwd" '()))
                            (lambda (status text)
                              (if (= status 0)
                                  (trim text)
                                  (fail "cannot read the current directory"))))))

    (define (absolute-path p)
      (if (and (> (string-length p) 0) (char=? (string-ref p 0) #\/))
          p
          (path (current-directory) p)))

    ;; Create P and any missing parents.  Another process creating one first is fine.
    (define (make-directories p)
      (unless (file-directory? p)
        (let ((parent (parent-path p)))
          (unless (string=? parent p) (make-directories parent)))
        (guard (e ((file-error? e) (unless (file-directory? p)
                                     (fail "cannot create directory " p))))
          (create-directory p))))

    ;; ------------------------------------------------------------- file content
    (define (read-text p)
      (call-with-input-file p
                            (lambda (port)
                              (let ((out (open-output-string)))
                                (let loop ()
                                  (let ((chunk (read-string 4096 port)))
                                    (if (eof-object? chunk)
                                        (get-output-string out)
                                        (begin (write-string chunk out) (loop)))))))))

    (define (write-text p text)
      (call-with-output-file p (lambda (port) (write-string text port))))

    (define (read-datum p)
      (guard (e ((error-object? e)
                  (fail "cannot read " p ": " (error-object-message e))))
        (let ((datum (call-with-input-file p read)))
          (if (eof-object? datum) (fail p " is empty") datum))))

    ;; Write TEXT to P through a sibling temporary and one rename.
    (define (write-atomically p text)
      (let ((temporary (string-append p ".tmp")))
        (write-text temporary text)
        (replace-file temporary p)))

    ;; --------------------------------------------------------------- versions
    ;; "X.Y.Z" -> (X Y Z); #f when it is not dot-separated decimal digits.
    (define (parse-version s)
      (let ((parts (split-string s #\.)))
        (let loop ((rest parts) (out '()))
          (cond
            ((null? rest) (reverse out))
            ((and (> (string-length (car rest)) 0)
                  (let digits ((cs (string->list (car rest))))
                    (or (null? cs) (and (char-numeric? (car cs)) (digits (cdr cs))))))
              (loop (cdr rest) (cons (string->number (car rest)) out)))
            (else #f)))))

    (define (version<? a b)
      (cond
        ((and (null? a) (null? b)) #f)
        ((null? a) (version<? '(0) b))
        ((null? b) (version<? a '(0)))
        ((< (car a) (car b)) #t)
        ((> (car a) (car b)) #f)
        (else (version<? (cdr a) (cdr b)))))

    ;; -------------------------------------------------------- package metadata
    ;; A package.scm form, validated into an association list with string values:
    ;; name version summary license minimum files.
    (define (clause form key)
      (let ((found (assq key (cdr form)))) (and found (cdr found))))

    (define (single-string form key file)
      (let ((value (clause form key)))
        (cond
          ((not value) #f)
          ((and (pair? value) (string? (car value)) (null? (cdr value))) (car value))
          (else (fail file ": malformed (" (symbol->string key) " ...) clause")))))

    (define (library-name->path name file)
      (unless (and (list? name) (pair? name)) (fail file ": malformed library name"))
      (string-append
        (join-strings (map (lambda (part)
                             (cond
                               ((symbol? part) (symbol->string part))
                               ((and (integer? part) (exact? part) (>= part 0))
                                 (number->string part))
                               (else (fail file ": malformed library name"))))
                           name)
                      "/")
        ".sld"))

    (define (load-package tree name)
      (let ((file (path tree "packages" name "package.scm")))
        (unless (file-exists? file) (fail "package " name " is not in the collection"))
        (let ((form (read-datum file)))
          (unless (and (pair? form) (eq? (car form) 'package) (list? form))
            (fail file ": not a (package ...) form"))
          (let* ((declared (clause form 'name))
                 (version (single-string form 'version file))
                 (minimum
                   (let ((emit (clause form 'emit)))
                     (and emit
                          (let ((m (assq 'minimum emit)))
                            (and m (pair? (cdr m)) (string? (cadr m)) (cadr m))))))
                 (libraries (or (clause form 'libraries) '()))
                 (extra (or (clause form 'files) '()))
                 (files (remove-duplicates
                          (append
                            (map (lambda (lib) (library-name->path lib file)) libraries)
                            extra))))
            (unless (and (pair? declared)
                         (symbol? (car declared))
                         (string=? (symbol->string (car declared)) name))
              (fail file ": (name ...) does not match its directory " name))
            (unless version (fail file ": no (version ...)"))
            (when (and minimum (not (parse-version minimum)))
              (fail file ": malformed minimum Emit version " minimum))
            (when (null? files) (fail file ": declares no libraries"))
            (for-each (lambda (f)
                        (unless (and (string? f) (safe-relative-path? f))
                          (fail file
                                ": unsafe file path "
                                (if (string? f) f "(not a string)"))))
                      files)
            (list (cons 'name name)
                  (cons 'version version)
                  (cons 'summary (or (single-string form 'summary file) ""))
                  (cons 'license (or (single-string form 'license file) ""))
                  (cons 'minimum minimum)
                  (cons 'files files))))))

    (define (meta-ref meta key) (cdr (assq key meta)))

    (define (collection-names tree)
      (let ((dir (path tree "packages")))
        (unless (file-directory? dir)
          (fail tree " is not an emit-packages tree (no packages/ directory)"))
        (sort-strings (let loop ((entries (directory-list dir)) (out '()))
                        (cond
                          ((null? entries) out)
                          ((file-exists? (path dir (car entries) "package.scm"))
                            (loop (cdr entries) (cons (car entries) out)))
                          (else (loop (cdr entries) out)))))))

    ;; ------------------------------------------------------------ the records
    ;; (emit-package (format 1) (name N) (version V) (license L)
    ;;               (source (commit SHA) | (directory DIR)) (files F ...))
    (define (record->text name version license source files)
      (let ((out (open-output-string)))
        (write-string "(emit-package\n  (format 1)\n  (name " out)
        (write-string name out)
        (write-string ")\n  (version " out)
        (write version out)
        (write-string ")\n  (license " out)
        (write license out)
        (write-string ")\n  (source " out)
        (write source out)
        (write-string ")\n  (files" out)
        (for-each (lambda (f) (write-string "\n    " out) (write f out)) files)
        (write-string "))\n" out)
        (get-output-string out)))

    (define (read-record file)
      (let ((form (read-datum file)))
        (unless (and (pair? form) (eq? (car form) 'emit-package) (list? form))
          (fail file ": not a package record"))
        (let ((name (clause form 'name))
              (version (clause form 'version))
              (source (clause form 'source))
              (files (clause form 'files)))
          (unless (and name (pair? name) (symbol? (car name)) version files source)
            (fail file ": incomplete package record"))
          (list (cons 'name (symbol->string (car name)))
                (cons 'version (car version))
                (cons 'license (let ((l (clause form 'license))) (if l (car l) "")))
                (cons 'source (car source))
                (cons 'files files)))))

    (define (record-names state suffix)
      (if (file-directory? state)
          (sort-strings
            (let loop ((entries (directory-list state)) (out '()))
              (cond
                ((null? entries) out)
                ((and (string-suffix? suffix (car entries))
                      (> (string-length (car entries)) (string-length suffix)))
                  (loop (cdr entries)
                        (cons (substring (car entries)
                                         0
                                         (- (string-length (car entries))
                                            (string-length suffix)))
                              out)))
                (else (loop (cdr entries) out)))))
          '()))

    (define (installed-records state)
      (map (lambda (name) (read-record (path state (string-append name ".scm"))))
           (record-names state ".scm")))

    ;; ((file . owner) ...) over every committed record.
    (define (ownership records)
      (apply append
             (map (lambda (record)
                    (map (lambda (f) (cons f (meta-ref record 'name)))
                         (meta-ref record 'files)))
                  records)))

    (define (source->text source)
      (cond
        ((and (pair? source) (eq? (car source) 'commit)) (cadr source))
        ((and (pair? source) (eq? (car source) 'directory)) (cadr source))
        (else "unknown")))

    ;; ------------------------------------------------------------ the layout
    (define (layout data)
      (list (cons 'data data)
            (cons 'root (path data "lib"))
            (cons 'state (path data "packages"))
            (cons 'lock (path data ".pkg-lock"))
            (cons 'tmp (path data ".pkg-tmp"))))

    (define (at layout key) (cdr (assq key layout)))

    (define (refuse-link p)
      (when (file-symbolic-link? p)
        (fail p
              " is a symbolic link; emit pkg never writes through one.  A user library"
              " root linked to a checkout is managed by hand: remove the link to let"
              " emit pkg manage the root, or keep updating the checkout yourself")))

    ;; Every existing component from DATA down to DATA/REL must be a real directory or,
    ;; for the last one, a real file.
    (define (refuse-links-below base relative)
      (let loop ((parts (split-string relative #\/)) (here base))
        (unless (null? parts)
          (let ((next (path here (car parts))))
            (refuse-link next)
            (when (file-directory? next) (loop (cdr parts) next))))))

    (define (check-managed-directories lay)
      (refuse-link (at lay 'data))
      (refuse-link (at lay 'root))
      (refuse-link (at lay 'state))
      (refuse-link (at lay 'tmp)))

    ;; ---------------------------------------------------------- lock + recovery
    (define (with-lock lay thunk)
      (make-directories (at lay 'data))
      (refuse-link (at lay 'data))
      (guard (e ((file-error? e)
                  (fail "another emit pkg holds the lock "
                        (at lay 'lock)
                        "; if no emit pkg is running, a killed one left it: remove that"
                        " directory and retry")))
        (create-directory (at lay 'lock)))
      (vsay "lock " (at lay 'lock))
      (dynamic-wind
        (lambda () #f)
        thunk
        (lambda ()
          (when (file-directory? (at lay 'tmp))
            (guard (e ((file-error? e) (complain "cannot remove " (at lay 'tmp))))
              (delete-directory (at lay 'tmp) #t)))
          (guard (e ((file-error? e) (complain "cannot release the lock "
                                               (at lay 'lock))))
            (delete-directory (at lay 'lock)))
          ;; A refused first command leaves no empty data directory behind.
          (when (null? (directory-list (at lay 'data)))
            (delete-directory (at lay 'data))))))

    ;; Remove DIR and its parents while they are empty, stopping at STOP.
    (define (prune-empty-directories dir stop)
      (let loop ((dir dir))
        (when (and (string-prefix? (string-append stop "/") dir)
                   (file-directory? dir)
                   (not (file-symbolic-link? dir))
                   (null? (directory-list dir)))
          (delete-directory dir)
          (loop (parent-path dir)))))

    (define (delete-owned-file lay relative)
      (let ((target (path (at lay 'root) relative)))
        (when (or (file-symbolic-link? target) (file-exists? target))
          (vsay "  delete " target)
          (delete-file target))
        (prune-empty-directories (parent-path target) (at lay 'root))))

    ;; A pending journal means an operation stopped between its first placement and
    ;; its commit.  Its package's files are a mix of old and new, so recovery removes
    ;; every file the journal lists that no OTHER package owns, along with the
    ;; package's record: the package is uninstalled, never left half-updated.
    (define (recover lay)
      (for-each
        (lambda (name)
          (let* ((pending (path (at lay 'state) (string-append name ".pending")))
                 (journal (read-record pending))
                 (committed (path (at lay 'state) (string-append name ".scm")))
                 (others
                   (let loop ((records (installed-records (at lay 'state))) (out '()))
                     (cond
                       ((null? records) out)
                       ((string=? (meta-ref (car records) 'name) name)
                         (loop (cdr records) out))
                       (else (loop (cdr records) (cons (car records) out))))))
                 (owned (ownership others))
                 (files (meta-ref journal 'files)))
            (for-each (lambda (f)
                        (refuse-links-below (at lay 'root) f)
                        (unless (assoc f owned) (delete-owned-file lay f)))
                      files)
            (when (file-exists? committed) (delete-file committed))
            (delete-file pending)
            (say "recover "
                 name
                 " -> removed  [interrupted operation; "
                 (count-label (length files) "file" "files")
                 "; install it again]")))
        (record-names (at lay 'state) ".pending")))

    ;; --------------------------------------------------------------- sources
    (define (on-path? program)
      (let ((search (or (get-environment-variable "PATH") "")))
        (let loop ((dirs (split-string search #\:)))
          (and (pair? dirs)
               (or (let ((candidate (path (if (string=? (car dirs) "") "." (car dirs))
                                          program)))
                     (and (file-exists? candidate) (not (file-directory? candidate))))
                   (loop (cdr dirs)))))))

    (define (require-tools tools)
      (let ((missing (let loop ((rest tools) (out '()))
                       (cond
                         ((null? rest) (reverse out))
                         ((on-path? (car rest)) (loop (cdr rest) out))
                         (else (loop (cdr rest) (cons (car rest) out)))))))
        (unless (null? missing)
          (fail "this command needs "
                (join-strings missing " and ")
                " on PATH; install "
                (if (null? (cdr missing)) "it" "them")
                ", or use --from DIR with an"
                " emit-packages checkout"))))

    (define (run-checked program args what)
      (let ((status (run-program program args)))
        (unless (= status 0)
          (fail what
                " failed: "
                program
                " exited with status "
                (number->string status)))))

    ;; The test override: both variables or neither.
    (define (override)
      (let ((archive (get-environment-variable "EMIT_PKG_ARCHIVE"))
            (commit (get-environment-variable "EMIT_PKG_COMMIT")))
        (cond
          ((and archive commit)
            (unless (hex-commit? commit)
              (usage-fail
                "EMIT_PKG_COMMIT must be a 40-character lowercase hex commit"))
            (cons archive commit))
          ((or archive commit)
            (usage-fail
              "EMIT_PKG_ARCHIVE and EMIT_PKG_COMMIT are set together or not at all"))
          (else #f))))

    (define (resolve-commit)
      (let ((url (string-append "https://api.github.com/repos/"
                                collection-repository
                                "/commits/"
                                collection-branch)))
        (call-with-values
          (lambda ()
            (program-output "curl"
                            (list "-fsSL"
                                  "--proto"
                                  "=https"
                                  "-H"
                                  "Accept: application/vnd.github.sha"
                                  url)))
          (lambda (status text)
            (unless (= status 0)
              (fail
                "resolving "
                collection-repository
                " "
                collection-branch
                " failed: curl exited with status "
                (number->string status)
                "; check the network, or use --from DIR with an emit-packages checkout"))
            (let ((commit (trim text)))
              (unless (hex-commit? commit)
                (fail "resolving "
                      collection-repository
                      " "
                      collection-branch
                      " returned something that is not a commit"))
              commit)))))

    ;; Download and unpack the collection into STAGE; returns (tree . (commit SHA)).
    (define (fetch-collection stage)
      (let* ((forced (override))
             (commit (if forced (cdr forced) (resolve-commit)))
             (url (if forced
                      (car forced)
                      (string-append "https://codeload.github.com/"
                                     collection-repository
                                     "/tar.gz/"
                                     commit)))
             (archive (path stage "collection.tar.gz"))
             (unpacked (path stage "collection")))
        (say "resolve "
             collection-repository
             " "
             collection-branch
             " -> "
             (short-commit commit)
             (if forced "  [EMIT_PKG_COMMIT]" ""))
        (run-checked
          "curl"
          (list "-fsSL" "--proto" (if forced "=https,file" "=https") "-o" archive url)
          (string-append "downloading " url))
        (create-directory unpacked)
        (run-checked "tar"
                     (list "-xzf" archive "-C" unpacked)
                     "unpacking the collection")
        (let ((entries (directory-list unpacked)))
          (unless (and (= (length entries) 1)
                       (file-directory? (path unpacked (car entries))))
            (fail
              "the collection archive does not hold exactly one top-level directory"))
          (vsay "unpack " archive " -> " (path unpacked (car entries)))
          (cons (path unpacked (car entries)) (list 'commit commit)))))

    ;; A --from DIR source; no network and no curl or tar.
    (define (local-collection dir)
      (let ((tree (absolute-path dir)))
        (unless (file-directory? tree) (fail "--from " dir " is not a directory"))
        (say "source " tree "  [local tree]")
        (cons tree (list 'directory tree))))

    ;; -------------------------------------------------------- compatibility
    (define (compatible? emit-version meta)
      (let ((minimum (meta-ref meta 'minimum)) (running (parse-version emit-version)))
        (or (not minimum)
            (not running)
            (not (version<? running (parse-version minimum))))))

    ;; -------------------------------------------------------------- install
    ;; Plan one package: its metadata, staged files, and the files its old record
    ;; owned.  Every check happens here; nothing under lib/ is touched.
    (define (plan-package lay tree source emit-version name owned planned)
      (let* ((meta (load-package tree name))
             (files (meta-ref meta 'files))
             (minimum (meta-ref meta 'minimum)))
        (unless (compatible? emit-version meta)
          (fail "package "
                name
                " "
                (meta-ref meta 'version)
                " needs Emit "
                minimum
                " or newer; this is Emit "
                emit-version))
        (for-each (lambda (f)
                    (let ((from (path tree "lib" f)))
                      (unless (and (file-exists? from) (not (file-directory? from)))
                        (fail "package "
                              name
                              " declares "
                              f
                              ", which is missing from the source"))))
                  files)
        (for-each
          (lambda (f)
            (let ((target (path (at lay 'root) f))
                  (owner (assoc f owned))
                  (clash (let loop ((others planned))
                           (cond
                             ((null? others) #f)
                             ((member f (cdr (assq 'files (car others))))
                               (cdr (assq 'name (car others))))
                             (else (loop (cdr others)))))))
              (refuse-links-below (at lay 'root) f)
              (when clash (fail "packages " clash " and " name " both declare " f))
              (when (file-directory? target)
                (fail target " is a directory where package " name " places a file"))
              (when (path-present? target)
                (cond
                  ((not owner) (fail target
                                     " is not owned by any package; move it aside to"
                                     " install "
                                     name))
                  ((not (string=? (cdr owner) name)) (fail target
                                                           " belongs to package "
                                                           (cdr owner)
                                                           "; package "
                                                           name
                                                           " also declares it"))))))
          files)
        (let ((old (let loop ((pairs owned) (out '()))
                     (cond
                       ((null? pairs) (reverse out))
                       ((string=? (cdar pairs) name)
                         (loop (cdr pairs) (cons (caar pairs) out)))
                       (else (loop (cdr pairs) out))))))
          (list (cons 'name name)
                (cons 'meta meta)
                (cons 'files files)
                (cons 'old old)
                (cons 'source source)
                (cons 'tree tree)))))

    (define (stage-files lay plan)
      (let ((stage (path (at lay 'tmp) "stage" (cdr (assq 'name plan)))))
        (for-each
          (lambda (f)
            (let ((to (path stage f)))
              (make-directories (parent-path to))
              (write-text to (read-text (path (cdr (assq 'tree plan)) "lib" f)))))
          (cdr (assq 'files plan)))
        stage))

    (define (commit-plan lay plan stage verb)
      (let* ((name (cdr (assq 'name plan)))
             (meta (cdr (assq 'meta plan)))
             (files (cdr (assq 'files plan)))
             (old (cdr (assq 'old plan)))
             (source (cdr (assq 'source plan)))
             (state (at lay 'state))
             (root (at lay 'root))
             (pending (path state (string-append name ".pending"))))
        (make-directories state)
        (write-atomically pending
                          (record->text name
                                        (meta-ref meta 'version)
                                        (meta-ref meta 'license)
                                        source
                                        (remove-duplicates (append files old))))
        (for-each (lambda (f)
                    (let ((target (path root f)))
                      (make-directories (parent-path target))
                      (vsay "  place " target)
                      (replace-file (path stage f) target)))
                  files)
        (let ((dropped (let loop ((rest old) (out '()))
                         (cond
                           ((null? rest) (reverse out))
                           ((member (car rest) files) (loop (cdr rest) out))
                           (else (loop (cdr rest) (cons (car rest) out)))))))
          (for-each (lambda (f) (delete-owned-file lay f)) dropped)
          (write-atomically (path state (string-append name ".scm"))
                            (record->text name
                                          (meta-ref meta 'version)
                                          (meta-ref meta 'license)
                                          source
                                          files))
          (delete-file pending)
          (say
            verb
            " "
            name
            " "
            (meta-ref meta 'version)
            " -> "
            root
            "  ["
            (count-label (length files) "file" "files")
            (if (null? dropped)
                ""
                (string-append ", "
                               (count-label (length dropped) "file" "files")
                               " dropped"))
            ", "
            (if (eq? (car source) 'commit) "commit " "from ")
            (if (eq? (car source) 'commit) (short-commit (cadr source)) (cadr source))
            "]"))))

    ;; install and update share everything but which names they act on and whether
    ;; a package missing from the collection is fatal.
    (define (install-or-update lay emit-version from names verb)
      ;; The network prerequisites are checked before the lock, so a refusal for a
      ;; missing tool or a half-set override leaves no trace, not even a data directory.
      (unless (or from
                  (and (eq? verb 'update)
                       (null? names)
                       (null? (record-names (at lay 'state) ".scm"))))
        (override)
        (require-tools '("curl" "tar")))
      (with-lock
        lay
        (lambda ()
          (recover lay)
          (check-managed-directories lay)
          (let* ((records (installed-records (at lay 'state)))
                 (installed (map (lambda (r) (meta-ref r 'name)) records))
                 (names (if (and (eq? verb 'update) (null? names)) installed names)))
            (when (eq? verb 'update)
              (for-each
                (lambda (n)
                  (unless (member n installed) (fail "package " n " is not installed")))
                names))
            (if
              (null? names)
              (begin (say "update: no packages installed") 0)
              (begin
                (when (file-directory? (at lay 'tmp))
                  (delete-directory (at lay 'tmp) #t))
                (create-directory (at lay 'tmp))
                (let* ((fetched (if from
                                    (local-collection from)
                                    (fetch-collection (at lay 'tmp))))
                       (tree (car fetched))
                       (source (cdr fetched))
                       (available (collection-names tree))
                       (missing
                         (let loop ((rest names) (out '()))
                           (cond
                             ((null? rest) (reverse out))
                             ((member (car rest) available) (loop (cdr rest) out))
                             (else (loop (cdr rest) (cons (car rest) out))))))
                       (where (if (eq? (car source) 'commit)
                                  (string-append "at " (short-commit (cadr source)))
                                  (string-append "in " (cadr source)))))
                  (when (and (pair? missing) (eq? verb 'install))
                    (fail "package "
                          (join-strings missing ", ")
                          " is not in the collection "
                          where))
                  (for-each (lambda (n)
                              (complain "package "
                                        n
                                        " is no longer in the collection "
                                        where
                                        "; left installed"))
                            (if (eq? verb 'update) missing '()))
                  (let* ((owned (ownership records))
                         (plans (let loop ((rest names) (out '()))
                                  (cond
                                    ((null? rest) (reverse out))
                                    ((member (car rest) missing) (loop (cdr rest) out))
                                    (else (loop (cdr rest)
                                                (cons (plan-package lay
                                                                    tree
                                                                    source
                                                                    emit-version
                                                                    (car rest)
                                                                    owned
                                                                    out)
                                                      out))))))
                         (stages (map (lambda (plan) (stage-files lay plan)) plans)))
                    (for-each
                      (lambda (plan stage)
                        (commit-plan lay
                                     plan
                                     stage
                                     (if (member (cdr (assq 'name plan)) installed)
                                         "update"
                                         "install")))
                      plans
                      stages)
                    (if (null? missing) 0 1)))))))))

    ;; --------------------------------------------------------------- remove
    (define (remove-packages lay names)
      (with-lock
        lay
        (lambda ()
          (recover lay)
          (check-managed-directories lay)
          (let* ((records (installed-records (at lay 'state)))
                 (selected
                   (map (lambda (n)
                          (let loop ((rs records))
                            (cond
                              ((null? rs) (fail "package " n " is not installed"))
                              ((string=? (meta-ref (car rs) 'name) n) (car rs))
                              (else (loop (cdr rs))))))
                        names)))
            (for-each (lambda (record)
                        (for-each (lambda (f) (refuse-links-below (at lay 'root) f))
                                  (meta-ref record 'files)))
                      selected)
            (for-each (lambda (record)
                        (let* ((name (meta-ref record 'name))
                               (state (at lay 'state))
                               (files (meta-ref record 'files))
                               (pending (path state (string-append name ".pending"))))
                          (write-atomically pending
                                            (record->text name
                                                          (meta-ref record 'version)
                                                          (meta-ref record 'license)
                                                          (meta-ref record 'source)
                                                          files))
                          (for-each (lambda (f) (delete-owned-file lay f)) files)
                          (delete-file (path state (string-append name ".scm")))
                          (delete-file pending)
                          (say "remove "
                               name
                               " "
                               (meta-ref record 'version)
                               " <- "
                               (at lay 'root)
                               "  ["
                               (count-label (length files) "file" "files")
                               "]")))
                      selected)
            0))))

    ;; ------------------------------------------------------------ list, available
    (define (list-packages lay)
      (let ((state (at lay 'state)))
        (for-each (lambda (name)
                    (complain "package "
                              name
                              " has an interrupted operation; the next emit pkg"
                              " install, update, or remove recovers it"))
                  (record-names state ".pending"))
        (let ((pending (record-names state ".pending")))
          (for-each (lambda (record)
                      (unless (member (meta-ref record 'name) pending)
                        (display (meta-ref record 'name))
                        (display " ")
                        (display (meta-ref record 'version))
                        (display " ")
                        (display (source->text (meta-ref record 'source)))
                        (newline)))
                    (installed-records state)))
        0))

    (define (show-available emit-version from)
      (unless from (require-tools '("curl" "tar" "mktemp")))
      (let ((stage (and (not from)
                        (call-with-values
                          (lambda () (program-output "mktemp" '("-d")))
                          (lambda (status text)
                            (unless (= status 0)
                              (fail "cannot create a temporary directory"))
                            (trim text))))))
        (dynamic-wind
          (lambda () #f)
          (lambda ()
            (let* ((fetched (if from (local-collection from) (fetch-collection stage)))
                   (tree (car fetched)))
              (for-each (lambda (name)
                          (let ((meta (load-package tree name)))
                            (display name)
                            (display " ")
                            (display (meta-ref meta 'version))
                            (display " emit>=")
                            (display (or (meta-ref meta 'minimum) "any"))
                            (display " ")
                            (display (meta-ref meta 'summary))
                            (unless (compatible? emit-version meta)
                              (display "  [needs a newer Emit]"))
                            (newline)))
                        (collection-names tree))
              0))
          (lambda ()
            (when (and stage (file-directory? stage)) (delete-directory stage #t))))))

    ;; ---------------------------------------------------------------- the CLI
    (define subcommand-summary
      "subcommands: install NAME..., list, available, remove NAME..., update [NAME...]")

    ;; (driver --emit-version V [--data-dir D] -- user-args ...)
    (define (parse-host-arguments argv)
      (let loop ((rest (if (pair? argv) (cdr argv) '())) (version #f) (data #f))
        (cond
          ((null? rest) (fail "run this program through emit pkg"))
          ((string=? (car rest) "--")
            (unless version (fail "run this program through emit pkg"))
            (list version data (cdr rest)))
          ((and (string=? (car rest) "--emit-version") (pair? (cdr rest)))
            (loop (cddr rest) (cadr rest) data))
          ((and (string=? (car rest) "--data-dir") (pair? (cdr rest)))
            (loop (cddr rest) version (cadr rest)))
          (else (fail "run this program through emit pkg")))))

    ;; Split a subcommand's arguments into (from . names), rejecting unknown options.
    (define (parse-subcommand-arguments sub args allow-from?)
      (let loop ((rest args) (from #f) (names '()))
        (cond
          ((null? rest) (cons from (reverse names)))
          ((and allow-from? (string=? (car rest) "--from"))
            (unless (pair? (cdr rest)) (usage-fail "--from needs a directory"))
            (loop (cddr rest) (cadr rest) names))
          ((and (> (string-length (car rest)) 0) (char=? (string-ref (car rest) 0) #\-))
            (usage-fail "unknown option " (car rest) " for " sub))
          (else (loop (cdr rest) from (cons (car rest) names))))))

    (define (require-data data)
      (unless data
        (fail "no user library root: HOME is unset and XDG_DATA_HOME is not an absolute"
              " path; set one of them"))
      (layout data))

    (define (dispatch emit-version data args)
      (when (null? args) (usage-fail "missing subcommand; " subcommand-summary))
      (let ((sub (car args)) (rest (cdr args)))
        (cond
          ((string=? sub "install")
            (let ((parsed (parse-subcommand-arguments sub rest #t)))
              (when (null? (cdr parsed))
                (usage-fail "install needs at least one package name"))
              (install-or-update (require-data data)
                                 emit-version
                                 (car parsed)
                                 (remove-duplicates (cdr parsed))
                                 'install)))
          ((string=? sub "update")
            (let ((parsed (parse-subcommand-arguments sub rest #t)))
              (install-or-update (require-data data)
                                 emit-version
                                 (car parsed)
                                 (remove-duplicates (cdr parsed))
                                 'update)))
          ((string=? sub "remove")
            (let ((parsed (parse-subcommand-arguments sub rest #f)))
              (when (null? (cdr parsed))
                (usage-fail "remove needs at least one package name"))
              (remove-packages (require-data data) (remove-duplicates (cdr parsed)))))
          ((string=? sub "list")
            (let ((parsed (parse-subcommand-arguments sub rest #f)))
              (unless (null? (cdr parsed)) (usage-fail "list takes no package names"))
              (if data (list-packages (layout data)) 0)))
          ((string=? sub "available")
            (let ((parsed (parse-subcommand-arguments sub rest #t)))
              (unless (null? (cdr parsed))
                (usage-fail "available takes no package names"))
              (show-available emit-version (car parsed))))
          (else (usage-fail "unknown subcommand " sub "; " subcommand-summary)))))

    (define (report-error e)
      (let ((out (open-output-string)))
        (write-string (error-object-message e) out)
        (for-each (lambda (irritant) (write-string " " out) (write irritant out))
                  (error-object-irritants e))
        (complain (get-output-string out))))

    (define (pkg-main argv)
      (exit (guard (e ((pkg-failure? e) (complain (pkg-failure-message e))
                                        (pkg-failure-status e))
                      ((error-object? e) (report-error e) 1))
              (let ((host (parse-host-arguments argv)))
                (dispatch (car host) (cadr host) (list-ref host 2))))))))
