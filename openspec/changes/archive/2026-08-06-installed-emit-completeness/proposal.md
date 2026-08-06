## Why

`manifest-search-path` (#35) made an installed Emit self-sufficient **for the standard libraries**,
and the `distribution` spec says so in those words. Two doors were left outside that guarantee, and
both are reachable from one ordinary project directory. Measured against a real `make install`
prefix, in a project holding nothing but a program and the manifest that names it:

```
$ cat emit-libs.scm
((program hello (source "hello.scm") (output "hello")))

$ emit build hello
resolve manifest -> emit-libs.scm
build hello -> hello  [source hello.scm]
emit: toolchain discovery failed (need CC / GC_INC / GC_LIB, or a working tools/llvm-env.sh)   ← #36

$ emit run sq.scm                       # sq.scm: (import (scheme inexact)) (display (sqrt 2.0))
resolve manifest -> emit-libs.scm
emit: program imports a library not found in the manifest                                      ← #44
```

Neither is a crash and neither is a regression — `emit build` has never worked from an install
because until #35 there was no install. But together they say an installed Emit is not yet a
product. **Standalone executables are a first-class deliverable** (`CLAUDE.md`), and `emit build`
is the door that produces them; it is the one door that does not work when installed.

The second failure is the sharper one. Without a project manifest the installed manifest is found
and `(scheme inexact)` resolves. The moment a project has its own `emit-libs.scm` — which it must,
in order to declare its own program or libraries — the lookup takes the first candidate that exists
and the installed manifest is never consulted, so the project loses four of the six shipped
libraries. The only workaround is to re-name each one with an absolute path into the install
prefix, which under `homebrew-tap-distribution` is a Cellar directory that moves on every upgrade.
That is precisely what installing through a package manager is supposed to remove.

Now, because `homebrew-tap-distribution` is proposed and unstarted. Its task 3.2 already plans a
lowest-priority installed toolchain default, scoped to Homebrew's keg-only `llvm`; #36 asks for the
same mechanism generally, and says explicitly that the two "should be designed together rather than
twice."

## What Changes

- **Searched manifest candidates become a chain, not a first-match.** For a library name the first
  manifest does not resolve, resolution SHALL continue to the later searched candidates
  (`./emit-libs.scm`, then executable-relative, then the compiled-in prefix), so a project manifest
  *extends* the installed one instead of replacing it. The project's own entry wins for a name both
  define. **An explicit request stays a single file**: `--manifest FILE` and `EMIT_MANIFEST` name
  exactly one manifest and do not chain, so a hermetic build remains expressible.
- **`make install` ships the two support files the build door needs**, at their repo-relative
  subpaths under `<prefix>/share/emit/` — `tools/llvm-env.sh` (with `tools/log.sh`, which it
  sources) and `src/runtime/runtime.c`. The installed tree already mirrors the repo's `lib/` layout
  rather than flattening it; support files follow the same rule, so one lookup serves both layouts.
- **A support-file lookup mirroring the manifest lookup's shape.** `repo_root()` is replaced at its
  two call sites by a resolver that prefers the checkout layout and falls back to the installed
  one — the same "checkout first, install second" ordering #35 established — so the from-source
  developer workflow is untouched.
- **Toolchain discovery grows a compiled-in installed default at lowest precedence.** The values
  `make` resolved at build time are recorded in the binary and consulted only after explicit
  environment overrides and after `llvm-env.sh` discovery, closing the case where an installed
  `emit` can find no `llvm-config` (Homebrew's keg-only `llvm`, which is neither `clang` nor
  `llvm-config` on `PATH`). This is the mechanism `homebrew-tap-distribution` task 3.2 needs; that
  change consumes it rather than designing it again.
- **The `distribution` capability's self-sufficiency requirement broadens from "the standard
  libraries" to "every door"** — `emit build` from an install produces a working executable with no
  files beside it and no environment set.
- **Explicit non-goal: shipping a prebuilt `runtime.o` / `libemitrt.a`.** It would drop a C compile
  from every `emit build`, but the install contract deliberately excludes compiled artifacts
  (`Makefile`, install target: "that would put artifact staleness on the install surface"). The
  speed idea belongs in `docs/PERFORMANCE.md`, not here.
- **Explicit non-goal: a general library search path.** Open question 3 of
  `openspec/explorations/library-sources-and-artifacts.md` asks whether the manifest is the right
  long-term mechanism at all. Chaining the candidates already listed in the spec answers the
  reported defect without settling that question.

## Capabilities

### New Capabilities
<!-- None. Every affected capability already exists. -->

### Modified Capabilities

- `distribution`: "An installed Emit is self-sufficient for the standard libraries" broadens to
  cover every door, including `emit build`'s toolchain and C runtime source; the `make install`
  layout requirement gains the support files.
- `module-system`: "Locating the manifest" changes from first-match-wins to a chain over the
  searched candidates, with explicit requests still naming exactly one file.
- `toolchain-discovery`: the precedence ladder gains a compiled-in installed default below
  `llvm-env.sh` discovery.

## Impact

- `src/emit.cpp`: `repo_root()` (`:219`) replaced by a support-file resolver at its two consumers,
  `discover_toolchain()` (`:980`, the `llvm-env.sh` path) and the `runtime.c` path (`:1142`);
  `resolve_manifest()` (`:255`) returns an ordered list rather than one path, which touches every
  door that calls it and `say_manifest()`'s narration (`docs/OUTPUT.md` form — narrating a chain,
  not a file); `discover_toolchain()` gains the compiled-in fallback.
- `Makefile`: the `install` target installs two more files (three, counting `tools/log.sh`); the
  build records the resolved `CC`/`GC_INC`/`GC_LIB` as compiled-in defaults alongside the existing
  `EMIT_PREFIX` define.
- Library preload: `preload_libraries` / the manifest-relative path rule now span multiple
  manifests, and a relative `(source …)` continues to resolve against **its own** manifest's
  directory — the rule does not change, but it now has more than one manifest to apply to.
- `openspec/changes/homebrew-tap-distribution`: task 3.2 becomes a dependency on this change rather
  than its own design. That change is unstarted, so this is an edit to its tasks, not rework.
- Docs: `docs/PROJECTS.md` drops the #44 sharp edge; `docs/MODULES.md`'s manifest section describes
  the chain.
- `emit run` / `emit repl` behaviour in a checkout is unchanged — the checkout candidate is still
  first, and this repo's own `emit-libs.scm` resolves everything it names.
