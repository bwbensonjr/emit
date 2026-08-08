;;; include-reader.ss -- the Chez-FREE source reader for the include family
;;; (change: library-include-declarations, issue #18).
;;;
;;; `src/core.ss` performs no I/O.  Where a library declaration names another file --
;;; `include`, `include-ci`, `include-library-declarations` -- the core calls a reader a
;;; DOOR installed (core.ss's `*include-reader*` side-channel, design D2).  This file is
;;; the reader the shipped binary installs; `src/compile.ss` defines an independent one
;;; over Chez ports.
;;;
;;; NOT in `compile.ss`'s (include ...) block, for the reason src/dump.ss is not: it calls
;;; `%read-file`, a primcall head when COMPILED here and an unbound identifier when Chez
;;; EVALUATES its include block.  It rides $CORE_FLAT in tools/regen.sh and
;;; test/self-host-fixpoint.sh only.  Two independent implementations of one rule is also
;;; what lets the cross-host equivalence suites measure them against each other.
;;;
;;; The protocol, from core.ss:  (reader WHO FILENAME BASE) -> (TOKEN . FORMS).  BASE is
;;; the token (resolved path) of the file the declaration appeared in, or #f for the
;;; source the door itself submitted -- which is what the source home below records.

;; --- the door's source home (design D4) ------------------------------------
;; The core is handed source TEXT, never a path, so a door must say where that text came
;; from before submitting it (repl-core.ss's set-source-home mode).  "" means "no path"
;; -- source read from standard input -- and resolves against the current directory,
;; which is the ONLY case in which the working directory is consulted.
(define *source-home* "")
(define (set-source-home! path) (set! *source-home* path))
(define (source-home) *source-home*)

;; --- path resolution, mirroring manifest_relative() (design D5) -------------
;; A relative filename is relative to the FILE that named it, not to the invocation --
;; the rule the manifest already applies to a library's (source ...), so a library
;; directory can be copied or installed elsewhere and still find its own pieces.

;; The directory part of a path ("" when it has none).  Kept byte-identical in behaviour
;; to src/compile.ss's `dir-of` and to emit.cpp's manifest_relative: no trailing slash.
(define (ir-dir-of path)
  (let loop ([i (- (string-length path) 1)])
    (cond
      [(< i 0) ""]
      [(char=? (string-ref path i) #\/) (substring path 0 i)]
      [else (loop (- i 1))])))

(define (ir-resolve base filename)
  (let ([d (ir-dir-of base)])
    (if (or (string=? filename "")
            (char=? (string-ref filename 0) #\/)
            (string=? d ""))
        filename
        (string-append d "/" filename))))

;; --- the reader ------------------------------------------------------------
;; `%read-file` answers #f -- not "" -- for a file it cannot open (runtime.c makes that
;; distinction deliberately), so a missing file is reported as one, naming the declaration
;; that asked for it, the filename as written, and the path it resolved to.  An EMPTY file
;; is legal and contributes no forms.
;; WHO is `include-ci` exactly when the forms are to be read case-insensitively, so the
;; door already has everything it needs to fold at READ time (change: reader-token-path,
;; issue #61) -- the protocol did not have to change to carry a fold flag.  Folding here
;; rather than over the returned forms is what leaves a bar-quoted `|MixedCase|` alone:
;; after reading it is the same interned symbol as `MixedCase`, and no walk can tell them
;; apart.  The Chez driver's own door (src/compile.ss) reads under `case-sensitive`, which
;; draws the same distinction; the two agree on ASCII and diverge above it, a limit
;; recorded in docs/MODULES.md rather than closed with Unicode case tables.
(define (emit-include-reader who filename base)
  (let* ([path (ir-resolve (if base base (source-home)) filename)]
         [text (%read-file path)])
    (if text
        (cons path (if (eq? who 'include-ci)
                       (read-all-from-string-ci text)
                       (read-forms-from-string text)))
        (error who
               (string-append "cannot read " (render-datum filename)
                              " (resolved to " path ")")))))

(set-include-reader! emit-include-reader)
