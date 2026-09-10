;; pitch.scm -- the project's formatter configuration (see openspec change
;; pitch-source-formatting, decision D4).
;;
;; Pitch does not search for this file: tools/format.sh names it with --config.
;; One inert versioned datum; it cannot disable a safety check or execute code.
;;
;; Two entries, and deliberately no more.  `match` is src/match.scm's macro and
;; the shape of every compiler pass; without an entry it falls to the generic
;; shape, which aligns clauses at the operator column under `match e`.  The
;; `dc*` terminal types each clause head as data, so a pattern like
;; (let ,binds ,body) can never be laid out as a `let` form.
;; `define-library` restores the 2-space body indent the authored .sld files
;; use; the r7rs table's own rule de-indents those bodies to column 0.
(pitch-config 1
  (width 88)
  (dialect common)
  (styles common
    ((match) (_ e . dc*)))
  (styles r7rs
    ((define-library) (_ d . body))))
