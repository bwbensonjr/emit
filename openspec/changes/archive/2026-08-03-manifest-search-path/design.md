## Context

The manifest is the only way a non-baked-in library is found, and today it is a bare relative
string. Four host sites duplicate the same expression —

```cpp
manifest = mp ? std::string(mp) : std::string("emit-libs.scm");   // :409 run, :579 build, :867 repl, :956 lib
```

— and the Chez driver has a fifth (`src/compile.ss:362`, env-or-default, no flag). Library sources
named by the manifest are then opened verbatim (`read_file(it->second)`, `src/emit.cpp:265`), i.e.
against the process's CWD. So `(scheme base)` works anywhere because it is baked into the binary,
while `(scheme inexact)` — deliberately an *ordinary* manifest library — works only where
`./emit-libs.scm` and `./lib/` happen to be visible.

Two constraints shape the design:

- **Door parity is load-bearing.** `test/self-emit-equiv.sh`, `test/dump-parity-tests.sh`, and
  `test/prelude-base-run-tests.sh` pin that the Chez driver and the three Chez-free doors emit
  byte-identical IR for the same manifest. Any resolution rule must land on both sides or the
  guards break.
- **The core performs no I/O by design.** Modes 5/9/10 hand the host manifest *text* and get back
  paths as written. Path joining is therefore a driver concern on both sides, and the core is
  untouched by this change.

Current-state detail worth recording: the two sides already disagree about a missing manifest. The
host returns early and says nothing (`preload_user_libraries`, `src/emit.cpp:230-235`); the Chez
driver raises (`read-manifest`, `src/compile.ss:369-370`). The lookup order is where that
divergence becomes visible, so it is settled here.

## Goals / Non-Goals

**Goals:**

- An installed `emit` resolves every library it ships, from any working directory.
- One rule for relative paths inside a manifest, identical across all five resolution sites.
- The in-repo developer workflow is bit-for-bit unchanged: same manifest, same sources, same IR.
- `make install` exists and produces a layout the binary's own lookup finds, so the fix is
  demonstrated end-to-end rather than asserted.

**Non-Goals:**

- Shipping precompiled `.ll`/`.exports` (an artifact-staleness contract on the install surface;
  the lazy compile-on-demand stays).
- A library *search path* — multiple manifests merged, or a `EMIT_LIBRARY_PATH` (exploration open
  question 3). One manifest is found; that manifest is the whole world.
- Import sets, `include`, baking more libraries, or the `(scheme base)` partition (#18, #31, #33).
- Making a missing manifest fatal.

## Decisions

### D1 — One resolution helper, five call sites collapse into it

Add a single `resolve_manifest(const std::string &flag)` in `src/emit.cpp` returning the found path
(or empty), replacing the four duplicated ternaries. The doors differ only in whether they have a
`--manifest` flag to pass in. Rationale: the four sites are already identical and drifted once
(the spec text records a different precedence than the code); collapsing them makes a future
divergence impossible rather than merely unlikely.

*Alternative rejected:* resolve once in `main()` and stash it globally. The doors parse their own
argv, so the flag is not known until the door is well underway; a global would have to be
back-patched, which is how `EMIT_MANIFEST` already gets set at `:659` and is exactly the pattern
worth not extending.

### D2 — Explicit request vs. search: candidates 1–2 fail loudly, 3–5 fall through

`--manifest` and `EMIT_MANIFEST` name a specific file; if it is absent that is a user error and
falling through to an installed manifest would silently run against different libraries than asked
for. Candidates 3–5 are a search, so absence is ordinary. This also fixes the "no manifest" silence
asymmetry noted above: an explicitly named missing manifest now errors on **both** sides.

### D3 — Paths inside a manifest resolve against the manifest's directory (**BREAKING**)

The rule is one sentence — *a relative path in a manifest is relative to that manifest* — and it is
the only rule under which an installed `share/emit/emit-libs.scm` can name `lib/scheme/base.sld`
and find it. It applies to a library's `(source …)`, a program entry's `(source …)`, and a program
entry's `(output …)`. Absolute paths are untouched.

Applying it to `(output …)` as well is deliberate: two rules inside one file ("inputs are
manifest-relative, outputs are CWD-relative") is the kind of distinction nobody remembers, and the
practical cost is nil — an installed manifest is read-only and is never a `emit build` target, and
`emit build -o DIR` overrides the output anyway.

*Alternatives rejected (both offered and declined during proposal):*

- *Manifest-relative only for a manifest found via candidates 4–5.* Non-breaking, but the rule then
  depends on **how** the manifest was found rather than on what it says — the same file behaves
  differently depending on whether it was reached by `--manifest` or by the prefix fallback.
- *CWD first, manifest-relative as fallback.* Non-breaking, but order-dependent: a stray
  `./lib/scheme/base.sld` in any directory silently shadows the installed standard library. Silent
  shadowing of the standard library is a worse failure than a one-time fixture rewrite.

### D4 — The Chez driver gets the path rule, not the installed-location lookup

`src/compile.ss` implements candidates 1–3 (it has no `--manifest` flag today, so: `EMIT_MANIFEST`,
then `./emit-libs.scm`) **and** D3's relative-path rule. It does *not* implement candidates 4–5.

Rationale: the Chez driver is a bootstrap-only path — it runs from a checkout under `chez --script`
and is never installed, so "next to the executable" has no meaning for it. What parity *requires*
is that both sides resolve the same manifest to the same source bytes, and that is D3. Recording
this asymmetry deliberately is better than implementing a dead `argv[0]` lookup on the Chez side to
look symmetric.

### D5 — The install prefix is a build-time define, defaulting to `/usr/local`

Candidate 5 needs a prefix compiled into the binary: `-DEMIT_PREFIX="$(PREFIX)"` on
`build/emit.o`. A plain in-repo `make` therefore bakes `/usr/local`, which is harmless — candidate
3 (`./emit-libs.scm`) wins in the repo, and candidate 4 (`build/../share/emit/…`) does not exist.

Candidate 4 exists in addition to candidate 5 because a relocatable install (Homebrew's keg, an
unpacked tarball, a `DESTDIR` staging root exercised in place) is not at the prefix it was built
for. `argv[0]` is resolved through `realpath()` — the machinery `repo_root()` (`src/emit.cpp:180`)
already uses — so Homebrew's `/opt/homebrew/bin/emit` symlink lands in the keg's real directory.

### D6 — Narration names the resolved manifest

One stderr line per door in `docs/OUTPUT.md` form, e.g.
`resolve manifest -> /opt/homebrew/.../share/emit/emit-libs.scm  [2 libraries]`, absent at
`EMIT_VERBOSITY=quiet`. This is the difference between "which `emit-libs.scm` am I getting?" being
a one-line answer and being an strace session. Stdout is untouched, so the byte-identity guards are
unaffected.

### D7 — `$TMP` test manifests migrate to absolute paths

Four suites write a manifest into `$TMP` while naming repo-relative sources
(`test/emit-build-tests.sh:30,41`, `test/fixnum-overflow-tests.sh:138`,
`test/dump-stages-tests.sh:117`, `test/library-body-declarations-tests.sh:139`). Under D3 those
break. The migration is to write **absolute** source paths (`$PWD/lib/scheme/base.sld`) rather than
relative-to-`$TMP` ones: absolute paths are exempt from D3, the intent ("this fixture points at the
repo's real library") stays legible, and the fixture stops depending on the rule at all. The four
committed fixtures under `test/modules/` instead get genuinely manifest-relative paths
(`"mylib.sld"`, `"../../lib/scheme/base.sld"`), because those *are* the case the rule is for and
they should exercise it.

## Risks / Trade-offs

- **A manifest silently resolving to an unexpected file.** → D2 makes explicit requests fail loudly,
  D6 narrates the winner, and candidate 3 is searched before 4–5 so the repo always wins in the
  repo (spec scenario: "The repo manifest wins over an installed one").
- **D3 breaks an out-of-tree manifest a user already wrote.** → Real but tiny: there are no releases
  and no tags, so the only manifests in existence are this repo's. It is called out as BREAKING in
  the proposal, `docs/MODULES.md` gains the rule, and this is precisely the moment to change it —
  before `0.1.0` and before `homebrew-tap-distribution` ships a manifest to anyone.
- **Door parity regression if only one side lands D3.** → The parity guards fail loudly rather than
  silently, and the task order lands host and driver together before the fixtures are rewritten, so
  a half-applied rule cannot pass.
- **New narration perturbing a test that captures stderr.** → Most suites redirect stderr to
  `/dev/null`; `EMIT_VERBOSITY=quiet` is honored, and the full suite is the check. Stdout is
  untouched by construction, so nothing in the byte-identity family can be affected.
- **`make install` on a Chez-free tree.** → It installs *built* products plus committed sources; it
  must depend on the `emit` target and nothing regenerated, so a release tarball can install
  without Chez.

## Migration Plan

1. Host + Chez driver land D1–D5 together (both sides of parity in one step).
2. Committed `test/modules/emit-libs*.scm` fixtures rewritten to manifest-relative paths;
   `$TMP`-written manifests rewritten to absolute (D7). Full suite green.
3. `make install` + the installed-layout test, which is the first thing that actually exercises
   candidates 4–5.
4. Docs: `docs/MODULES.md` resolution order and the relative-path rule; `README.md` install.

Rollback is per-step: steps 3–4 are additive, and steps 1–2 revert together as one commit pair.

## Open Questions

1. Is one found manifest the right long-term model, or should there eventually be a library *path*
   with the manifest as one entry (exploration open question 3)? Not blocking: the lookup order
   designed here is a strict improvement under either answer.
2. **Not a question — a second, independent gap, scoped out but named.** `emit build` and `emit lib`
   locate two more files through `repo_root()` (`src/emit.cpp:180`), which assumes the binary sits
   at `<checkout>/build/emit`: `tools/llvm-env.sh` for toolchain discovery (`:772`) and
   `src/runtime/runtime.c` to compile the runtime (`:925`). Neither is installed by the
   `make install` designed here, so an installed `emit build` stays broken even after this change —
   `emit run` and `emit repl` are what become fully installable. This is the same
   "installed Emit is not self-sufficient" family but a *toolchain/runtime* instance rather than a
   *library-resolution* one, and it overlaps `homebrew-tap-distribution`'s task group 3 (keg-only
   toolchain wiring). Kept out of scope deliberately; task 5.3 confirms the current behaviour and
   files a GitHub issue so it is tracked rather than discovered by the first `brew` user.
3. Should `make install` also install a manifest entry point for *user* libraries, or is
   `$PREFIX/share/emit/emit-libs.scm` Emit-owned and not user-editable? Deferred with Q1 — both
   want the library-path question settled first.
