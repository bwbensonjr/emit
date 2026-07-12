## Why

The compiler can only run a single self-contained program: there is nowhere for reusable
Scheme code to live. The next step of the self-hosting reader arc — `read.ss`, written in
Scheme — needs a home, and so does any standard library (`map`, `reverse`, …). This change
adds a **prelude**: a file of Scheme definitions prepended to every program, giving library
code (and later the reader) a place to live. It is step 2 of the arc
(strings/char-ops → **prelude** → `read.ss`).

## What Changes

- **Driver** — `compile.ss` reads a prelude file (`src/prelude.scm`) and prepends its
  top-level forms to the user program's forms before `collect-toplevel`, so prelude
  definitions are in scope for every program. A `--no-prelude` flag compiles without it.
- **User-wins shadowing** — if a user program defines a name the prelude also defines, the
  prelude's definition is dropped, so the prelude can never collide with or clobber user
  code (the existing demos define `list*`, `even?`, etc., and must stay correct).
- **Starter prelude** — a small, collision-free set of pure-Scheme library procedures
  (`not`, `list`, `length`, `reverse`, `append`, `map`, `memq`, `assq`) that exercise the
  mechanism and are broadly useful. (`memq`/`assq` use `eq?`, the only equality we have yet;
  `member`/`assoc` arrive with `equal?`.) It grows as consumers need more.

## Capabilities

### New Capabilities
<!-- None: extends program assembly and adds library procedures. -->

### Modified Capabilities
- `compiler-pipeline`: add that a program is assembled as the prelude's forms followed by
  the user program's forms (with user-wins shadowing and a `--no-prelude` escape hatch).
- `core-language`: add the starter library procedures provided by the prelude.

## Impact

- **Code:**
  - `src/compile.ss` — read + prepend the prelude, user-wins shadowing, `--no-prelude`.
  - `src/prelude.scm` (new) — the starter library procedures.
  - `demos/` — a demo using prelude procedures (`map`, `list`, `reverse`).
- **Verification:** the prelude demo across AOT/JIT/bitcode; **all existing demos unchanged**
  (their names do not collide with the starter prelude, and shadowing covers future ones).
- **Unaffected:** the runtime, the emitter, the calling convention, and the passes — this is
  purely a driver/source-assembly change plus a Scheme file.
- **Deferred (noted):** separate compilation of the prelude (compile-once, link) as a speed
  optimization; dead-code elimination of unused prelude procedures; a real module/namespace
  system. All future.
- **Enables (next):** arc step 3 — `read.ss` lives in the prelude.
