# Unicode Character Database 17.0.0

These files were downloaded from `https://www.unicode.org/Public/17.0.0/ucd/`
on 2026-08-25. `LICENSE.txt` came from `https://www.unicode.org/license.txt`.

Only the inputs needed by `(scheme char)` are vendored: core and whitespace
properties, decimal digits, simple/full case mappings, and case folding.
`tools/gen-unicode-tables.ss` deterministically generates
`lib/scheme/char-data.scm`. Verify all upstream bytes with:

    cd vendor/unicode/17.0.0 && shasum -a 256 -c CHECKSUMS.sha256

The Unicode Data Files and Software License in `LICENSE.txt` applies to these
upstream data files.
