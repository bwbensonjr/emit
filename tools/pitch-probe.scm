;;; pitch-probe.scm -- the layout probe that pins the formatter (task 1.6).
;;;
;;; tools/format.sh formats this file and requires the result to equal
;;; tools/pitch-probe.expected byte for byte.  `pitch --version` cannot serve
;;; as the pin on its own: it has reported "0.1.0" across two layout changes
;;; and a 6x cost change (scheme-pitch #19), so the version string is a floor
;;; and this file is the identity.
;;;
;;; The two forms below are exactly the features that separate the pitch builds
;;; this project has been measured against:
;;;
;;;   * a quoted data list that overflows the page width, which staircased one
;;;     element per line before scheme-pitch #13 (ebc01cd) and fills after it;
;;;   * two trailing comments sharing a column, which collapsed to a single
;;;     space before #14 (343fa25) and share a re-derived column after it.
;;;
;;; A probe fails when layout moves and stays quiet when a teammate's binary
;;; merely differs, which is why it is a probe and not a hash of the binary.
;;; Regenerate the expectation in the same commit that moves the pin:
;;;   pitch --config pitch.scm --dialect common --stdout tools/pitch-probe.scm \
;;;     > tools/pitch-probe.expected
;;;
;;; Not in the covered set: the covered locations take tools/*.ss, not
;;; tools/*.scm, so `make format` never rewrites this file.

(define probe-quoted-table
  '(alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron pi rho sigma tau upsilon))

(define probe-fold-limit 1073741823)         ; 2^30 - 1
(define probe-byte-limit 255)                ; a byte
