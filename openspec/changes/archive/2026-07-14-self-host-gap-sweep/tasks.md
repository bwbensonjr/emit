## 1. Core assembly

- [x] 1.1 Write a script that produces a single-file `build/core-self.scm`: de-`library` `match.sls`/`util.ss` into top-level `define-syntax`/`define`s, inline the passes (`parse`, `expand`, `recognize-let`, `convert-assignments`, `convert-closures`, `lower`, `emit`) and `core.ss`'s pure helpers, and redefine `read-forms`/`read-forms-from-string` over `read-all-from-string`.
- [x] 1.2 Sanity-check the assembled file under Chez (it should behave like the current core) before compiling it with scheme-llvm.

## 2. Sweep

- [x] 2.1 Compile `build/core-self.scm` with scheme-llvm; on each unsupported construct, record the construct, location, class, and cheapest fix path. Apply only the minimum shim (in the assembly script, not the core) to reach the next error, unless a trivial destined-to-land prelude add is cleaner.
- [x] 2.2 Repeat until the core compiles or the remaining gaps are fully enumerated. Note any deep gap (records, tail-call depth, closure limits) that could reshape the path-C-vs-A plan.

## 3. Inventory

- [x] 3.1 Update the gap table in `openspec/changes/self-hosting-bootstrap/design.md` with the complete list (G3–Gn), each sized and assigned a fix path (grow language / grow prelude / rewrite core site).
- [x] 3.2 Check in the assembly script (reused by [[self-hosting-bootstrap]] task 2.1). Run `./run-all-tests.sh`; all suites still pass (this change alters no compiler behavior).
