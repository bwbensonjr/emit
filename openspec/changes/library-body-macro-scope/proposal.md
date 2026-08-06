## Why

A library body cannot use a derived-form macro. `(when (> x 1) 42)` inside a `.sld` reports
`unbound variable when` — with an explicit `(import (scheme base))` present, whose *procedures*
resolve fine. `cond`, `case`, `let*`, `unless`, `guard`, `parameterize` behave the same way, and so
do **`and` and `or`**, which the issue did not originally record and which most Scheme authors read
as core syntax. The one derived form that does work is named `let`, and only because it is
hand-written in `expand.ss` rather than being a prelude macro. So the honest rule for a library body
today is: core forms plus named `let`, and nothing else (issue #55).

That is a wall in front of the project's own stated primary unit. "A module is the shared unit of
compilation" and R7RS-small is the module surface — but the ordinary act of writing `cond` in a
library procedure, which is far more common than exporting syntax, does not work. `library-macro-export`
(#48) fixed the export direction; this is the same two-tier split seen from the other side, and it is
now the larger half, because every library author hits it on their first `cond` while only some
export a macro.

Now, because the mechanism to fix it properly exists. `library-macro-export` built a library's
compile-time interface and `compile-library*` already merges `import-tables->macro-env` into its
`macro-env`. Distributing the derived forms *by import* — instead of through the privileged
`prelude-macro-forms` side channel — is no longer a new mechanism, only a new user of one.

## What Changes

- **A library body can use the derived forms it imports.** A library that imports `(scheme base)`
  gets `cond`, `case`, `when`, `unless`, `let*`, `and`, `or`, `guard`, and `parameterize` in its
  body, exactly as a program does. This holds on all three doors — the Chez batch driver, the REPL,
  and the Chez-free embedded run door — per dev→ship fidelity.
- **The derived-form macros are homed in `(emit internal)` and re-exported by `(scheme base)`.**
  `(emit internal)` is the bottom of the partition's dependency graph: it imports nothing, so it
  cannot receive macros from `(scheme base)` and must own them. Every other member imports it
  directly or transitively, so one home reaches all five.
- **A library can re-export a macro it imports.** This does not work today and is a hard
  prerequisite, not an incidental nicety: `(export twice)` in a library whose `twice` arrives by
  import is rejected with `compile-library: export of a name the library does not define: twice`.
  `(scheme base)` re-exporting `(emit internal)`'s transformers is exactly that shape. The relaxation
  is general — any library may re-export an imported macro — because a special case for one library
  name would rebuild the privilege this change exists to remove.
- **`library-body-forms` stops copying every transformer into every partition member.** That copy is
  a workaround the comment at `src/core.ss:163-166` names as such ("a member whose procedures use
  `cond`/`case` internally (the reader does) can compile at all"), available only to libraries the
  compiler generates. Once the macros arrive by import it is dead, and its removal is a binary-size
  win against a stated design goal.
- **The diagnostic stops saying a *variable* is unbound.** A derived form used where its macro is not
  in scope should report a macro that is not in scope, and name the import that would bring it in.
  Today's message sends the author looking for an import they already wrote.
- **Non-goals.** `prelude-macro-forms`' program-path merge is not removed in this change — the
  auto-import means a program needs the baked set with no import to name, and retiring that channel
  is entangled with #31 (baking `lib/scheme/base.sld` instead of `src/prelude.scm`). `let-syntax`,
  `letrec-syntax`, inner `define-syntax`, and `syntax-case` stay out of scope, as do the import-set
  transforms. This change does not widen `(scheme base)`'s *procedure* surface (#33).

## Capabilities

### New Capabilities
<!-- None. This closes the import-side half of an existing capability's macro surface. -->

### Modified Capabilities

- `module-system`: a library body's scope gains the macros its imports export, so the requirement
  that a library's `macro-env` is built from its own body plus its imports' exported transformers
  extends to the baked `(scheme base)`; the export surface gains re-export of an imported macro;
  and the partition's derived-form distribution changes from body-injection to an ordinary import,
  which is a requirement about how `(scheme base)` is *assembled*, not only about what it exports.
**Not** `macro-system`. The derived forms arriving in a library pre-resolved is exactly the case its
"Hygiene for macro-introduced identifiers" requirement already covers — "a transformer that arrives
from an **imported library** carries template identifiers already resolved in the library that
defined it … SHALL count as known bindings … and SHALL NOT be renamed as introduced." The baked set
becomes an ordinary instance of that rule rather than an exception to it, which needs no new
requirement. The statement that *does* change — that a library importer does not receive the baked
set — lives in `module-system`'s "A macro that leaves its library is resolved in the library that
defines it", and is modified there.

## Impact

- `src/prelude-surface.scm`: the partition declaration — the derived-form macros need a declared home
  in `(emit internal)` and a re-export from `(scheme base)`, which the surface declaration currently
  has no vocabulary for (it partitions `define` names; `define-name` returns `#f` for a
  `define-syntax`). This is the largest single piece of design in the change.
- `src/core.ss`: `library-export-names` and `library-body-forms` (`:159-172`) — the export list must
  admit macro names and the body copy must go; `compile-library*` (`:773`) — the export check that
  rejects a name the library does not define, and the compile-time half it emits must carry
  re-exported transformers; `partition-library-form`; `prelude-macro-forms` (`:230`) stays for the
  program path.
- `tools/gen-scheme-base.ss`: writes the committed `lib/scheme/*.sld`, and must produce the same
  homing and re-export the portable derivation does — the dual-derivation hazard #31 describes, which
  this change makes load-bearing in a new place and must therefore keep pinned.
- `src/repl-core.ss`: the REPL's library path and `repl-library-exports-text`.
- **Emitted IR is the risk to prove, not assume.** A pre-resolved template spells its free
  identifiers as the exporter's mangled symbols; the program path resolves the same names in the
  importer. If those two disagree for any derived form, program IR moves — which means `bootstrap/`
  regen, a `test/module-scaffold-baseline.sha256` update, and a `trust-check` diff. The change should
  demonstrate byte-identity for programs that compile today, or state exactly which forms move and
  why.
- Tests: `test/modules-tests.sh`, `test/modules-run-tests.sh`, `test/modules-repl-tests.sh` (a
  fixture library using `cond`/`when`/`and` in its body, on all three doors; a re-export fixture),
  `test/scheme-base-gen-check.sh` and `test/scheme-base-surface-check.sh` (the generated surface now
  includes macro exports), and `test/aot-tree-shaking-tests.sh`.
- Docs: `docs/MODULES.md` (the "Scope & limits" bullet this closes, the export surface, and the
  importer-vs-exporter resolution note at `:342-345`), `docs/PROJECTS.md` (the limits list),
  `docs/PIPELINE.md` (the macro-env sources).
- Closes #55. Unblocks the `library-body-forms` copy removal that #38's sibling concern — silent IR
  growth — makes worth measuring. Adjacent to #31 and #56; supersedes neither.
