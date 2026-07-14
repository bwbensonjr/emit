## 1. Accept internal defines

- [x] 1.1 Factor `collect-toplevel`'s define-run→`letrec`/`let`+`set!` builder into a shared helper (e.g. `build-body`) in `src/parse.ss`; confirm top-level output is unchanged (byte-identical backend-equivalence suite). — `build-program` is the shared builder; added `build-body` for the internal prefix case; backend-equivalence suite green.
- [x] 1.2 Rewrite `parse-body` to peel a leading run of `(define …)` forms and, when present, build the body via the shared helper; no leading defines → unchanged behavior.
- [x] 1.3 Keep a non-head `define` (after a body expression) an error; keep top-level `define` handling intact. — non-leading define hits `parse-expr`'s error; leading-then-later define hits `build-body`'s "must precede" error.

## 2. Verification

- [x] 2.1 Demo/tests: internal `define` (value + procedure), mutual/forward reference within a body, nested bodies, and a body with no defines (regression). Confirm the "define not at head of body" error still fires. — `demos/internal-define.scm` => `(30 100 105)`; both error paths verified.
- [x] 2.2 Cross-check results against Chez for the same programs. — 30/100/42/101 identical under Chez.
- [x] 2.3 Re-run the [[self-hosting-bootstrap]] gate probe: the passes' internal defines now compile (G1 closed). Run `./run-all-tests.sh`; all suites pass. — gate probe compiles (=> 30); all 9 suites pass.
