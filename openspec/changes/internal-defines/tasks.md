## 1. Accept internal defines

- [ ] 1.1 Factor `collect-toplevel`'s define-run→`letrec`/`let`+`set!` builder into a shared helper (e.g. `build-body forms`) in `src/parse.ss`; confirm top-level output is unchanged (byte-identical backend-equivalence suite).
- [ ] 1.2 Rewrite `parse-body` to peel a leading run of `(define …)` forms and, when present, build the body via the shared helper; no leading defines → unchanged behavior.
- [ ] 1.3 Keep a non-head `define` (after a body expression) an error; keep top-level `define` handling intact.

## 2. Verification

- [ ] 2.1 Demo/tests: internal `define` (value + procedure), mutual/forward reference within a body, nested bodies, and a body with no defines (regression). Confirm the "define not at head of body" error still fires.
- [ ] 2.2 Cross-check results against Chez for the same programs.
- [ ] 2.3 Re-run the [[self-hosting-bootstrap]] gate probe: the passes' internal defines now compile (G1 closed). Run `./run-all-tests.sh`; all suites pass.
