## ADDED Requirements

### Requirement: (scheme base) is library zero for the compiler's own build

The compiler binaries themselves — `schemec`, `embed` (the `scheme-run` runner), and `embed-repl`
(the REPL host) — SHALL consume `(scheme base)` as a linked library rather than carrying a
prepended copy of the prelude's procedures. Their source SHALL be compiled with `(scheme base)`
auto-imported (procedures resolving to `scheme.base:*` external globals, derived-form macros merged
compile-time), and each binary SHALL link the single committed `scheme.base.ll`, initializing it
once via its `@"scheme.base:__init"` guard. This makes `(scheme base)` library zero for the
compiler, the largest consumer of the module system, exactly as it is for user programs.

#### Scenario: A compiler binary references the prelude through (scheme base)

- **WHEN** a compiler binary's committed IR is inspected
- **THEN** the prelude procedures it uses appear as `scheme.base:*` external globals resolved
  against the linked `scheme.base.ll`, not as the binary's own inlined top-level definitions

#### Scenario: The compiler links (scheme base) exactly once

- **WHEN** any of the compiler binaries is built from committed IR
- **THEN** it links exactly one `scheme.base.ll` and runs its `__init` once, and the binary behaves
  identically to the prelude-prepended build it replaces
