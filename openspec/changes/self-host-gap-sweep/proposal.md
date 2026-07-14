## Why

The [[self-hosting-bootstrap]] gate check (task 1.2) was shallow — a static scan plus a few
spot compiles. It found G1/G2/G3, but closing G1 ([[internal-defines]]) and G2
([[emit-cstring-in-language]]) surfaced *more* gaps only visible at a real compile: G4
(`apply` over the binary `string-append` primitive) and G5 (`#x` reader literals), with likely
more of the same class (`andmap`, other R6RS list procs). Discovering these one at a time is
slow and keeps `self-hosting-bootstrap` blocked on an unknown count of unknowns. This change
does the sweep properly: assemble the whole core and actually compile it, enumerating every
remaining gap in one pass.

## What Changes

- Add a reusable **core assembly** step: a script that concatenates the compiler's own source
  into a single scheme-llvm program — de-`library` `match.sls`/`util.ss` into top-level
  `define-syntax`/`define`s, inline the `include`d passes (`parse`, `expand`, `recognize-let`,
  `convert-assignments`, `convert-closures`, `lower`, `emit`), and the pure `core.ss` helpers,
  switching `read-forms` to the in-language `read-all-from-string`.
- **Compile the assembled core with scheme-llvm** and iterate: fix-first-error / re-run, but
  instead of fixing, **record** each unsupported construct. Produce a definitive gap inventory.
- **Output: an updated gap list in `self-hosting-bootstrap`** (each gap sized and assigned a
  fix path: grow the language, grow the prelude, or rewrite the core site), so the remaining
  self-hosting work is a known, finite backlog rather than a discovery process.
- This change **records gaps; it does not fix them** (each real gap becomes its own small
  change, as G1/G2 were). It may land trivial, clearly-in-scope prelude additions (e.g. a
  variadic `string-append`) only if doing so is needed to reach the *next* error and keep the
  sweep moving — otherwise it stops at each gap and logs it.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
<!-- none — this is an investigative/tooling change; it adds no capability requirement. It
     produces the assembly scaffolding and the gap inventory that feed self-hosting-bootstrap. -->

## Impact

- **Code**: a `tools/`/`test/` assembly script (concatenate + de-library the core); no change
  to the compiler's behavior. The gap inventory lands in
  `openspec/changes/self-hosting-bootstrap/design.md`.
- **Depends on**: [[internal-defines]] (done), [[emit-cstring-in-language]] (done);
  complements [[self-host-io-strategy]] (G3). Unblocks planning the rest of
  [[self-hosting-bootstrap]].
- **Enables**: a complete, sized backlog of self-hosting gaps (G3–Gn), so task 2.1 of
  [[self-hosting-bootstrap]] starts from a compilable core.
