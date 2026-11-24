# Design

## Context

See `proposal.md` for motivation. `lib/emit/pkg.sld` already resolves collection `main` at command time, downloads one commit archive, checks package minimum versions, and records installed provenance. No new resolver is needed.

The coupling is development policy: `tools/emit-packages-pin.sh` selects a collection commit; `tools/emit-packages.py` fetches it and runs package checks; `emit-packages-pinned` and `emit-packages-pinned-source` gate full and reference profiles. `test/srfi-27-install-tests.sh` independently imports that Python helper to fetch Malt for installed acceptance. Removing only the two suites would leave a collection dependency in the full profile.

The sibling collection already has `tools/run-checks.py`, `tools/test-packages.sh`, `tools/install-check.py`, and required macOS/Linux CI. Its execution-path runner covers run, REPL, and build; Emit's driver additionally proves published artifact reuse and Chez source-driver parity. At proposal time, collection CI used Homebrew on macOS and `nix build github:bwbensonjr/emit` on Linux without verifying a shared target version. The default flake package consumes the promoted release archive; its separate `candidate` package builds development sources. The completed `own-emit-compatibility` companion now resolves and verifies one latest stable release on both platforms and owns the transferred native/reference checks.

## Goals / Non-Goals

**Goals:** Make package publishing independent; keep package-contract regressions reproducible within Emit; assign every removed assertion a deliberate owner.

**Non-Goals:** Historical-version solving, a package registry service, package tags, a lockfile feature, automatic package updates, changes to command syntax or installed state, and new cross-repository release orchestration.

## Decisions

### 1. The published tip is collection main; compatibility targets released Emit

Interpret "works with Emit" as the latest stable released Emit, which users can install. emit-packages maintains `main` as its published tip and owns repairs, package metadata, and required pre-merge compatibility checks. A package requiring new Emit functionality waits for a released Emit and declares an appropriate minimum. Older Emit installations keep the existing version refusal and explicit `--from` escape hatch; no automatic search of collection history is added.

The collection must resolve the latest stable release once per CI invocation, provision that release on both supported platforms, and verify the running version matches the resolved release. If channel propagation lags, fail visibly or provision that exact release through the existing source-release path. Do not silently test an older Homebrew build or substitute Emit `main`. Keep scheduled and manual runs to detect new Emit releases without collection commits. A separate nonblocking Emit-development lane is optional and is not proof of release compatibility.

Alternative: a compatibility pointer or per-Emit version index in the collection. It adds another publication mechanism while `main` is already the supported source. Alternative: test floating collection tip in Emit gates. That makes Emit validation depend on unrelated commits and availability; it recreates coupling without a pin.

### 2. Preserve snapshot identity at operation time

Keep `emit pkg`'s single resolved commit per network invocation, archive download by commit, and installed source records. These ensure coherent files and explain installed code. No collection commit is stored in Emit's source or release metadata. Network `install`, `available`, and `update` continue to resolve fresh `main` even on an unchanged Emit binary. No package-manager production edit is expected.

Test this with a deterministic fake `curl` executable that serves successive branch-resolution responses and local archives. Existing `EMIT_PKG_ARCHIVE`/`EMIT_PKG_COMMIT` overrides skip branch resolution, so they alone cannot prove discovery of a changed tip. Exercise the real resolution path without adding another shipped override: assert two invocations observe A then B, each downloads its resolved archive, and update changes imported behavior. Fixture hashes are synthetic test data, never real collection revisions.

Alternative: remove all hashes. That loses provenance and snapshot coherence without improving independent maintenance.

### 3. Keep Emit integration checks small and local

In the installed acceptance suite, retain the negative check that Malt is absent from the payload. Replace positive Malt programs and the Python fetch with a small generic fixture collection containing a manifest and libraries. Check explicit environment-root resolution, a symlinked user root for hand-managed libraries, and `pkg install --from` into an empty user root using the installed binary from an unrelated directory. Retain the existing SRFI 27 source-closure checks.

Keep package semantics out of fixtures; one exported value and a changed revision are sufficient. Retain general run/REPL/build, artifact, and source-driver module checks in Emit's existing suites. No vendored Malt snapshot replaces the pin.

### 4. Transfer package coverage before retiring its Emit owners

The collection owns all package checks and execution paths. Transfer the missing artifact-publication/reuse assertions and optional explicit source-driver mode into its tools. Native checks run as required collection PR gates; source checks use a matching released Emit source tree and Chez in collection-owned scheduled/manual reference CI. Missing prerequisites in an explicitly requested reference run fail, rather than skip successfully. Installed-package checks also exercise update and the resulting imported behavior.

Record the transfer in Emit's validation documentation: `malt-core`, `malt-training`, `malt-xor`, their source counterparts, and the Malt semantics within `malt-installed` move to named collection tools/workflows. Emit retains generic installation/provider assertions and SRFI 27 ownership. Adjust suite counts and coverage guards with this explanation; do not relabel generic fixture checks as Malt semantic coverage. Historical archived OpenSpec changes remain historical records.

Delete Emit's pin, collection driver, wrapper, and two registry entries once the handoff has executable evidence. The optional `tools/writer-performance-build.py` also consumes the fetch helper: retain its explicit `EMIT_PACKAGES_DIR` local-checkout support, validate it before expensive work, and remove automatic fetching. Harness-only `--skip-scheme` remains independent of the collection. Remove obsolete live documentation and commands, including references in performance evidence documentation that currently describe the pin as the active replay mechanism. Historical measurement identities remain intact.

Alternative: silently drop the package checks. That would violate the retained-coverage policy. Alternative: leave an optional Emit-owned floating collection driver. This adds a second owner and protocol consumer; maintain collection tools instead, accepting an explicit Emit binary/source tree for local investigation.

## Risks / Trade-offs

- Emit changes can break an external package without failing Emit PR gates. Mitigation: retain compiler/library contract regressions in Emit and collection-owned release checks; a discovered compiler defect receives a minimal Emit regression and GitHub issue when not fixed immediately.
- A new Emit release can temporarily break collection tip before collection maintainers repair it. Mitigation: required collection PR checks, scheduled release checks, visible failures and prompt collection fixes. This design does not promise coordinated atomic releases.
- Minimum metadata is a refusal boundary, not proof that every intervening Emit release was tested. Mitigation: document the latest-stable test target and validate minimum changes deliberately in the collection.
- Removing the source-driver suite can hide a cross-host coverage loss. Mitigation: complete and record the collection reference handoff before removal.

## Migration Plan

1. Complete the external handoff in an independently reviewed emit-packages change: update its pin-oriented contributor instructions, align release targets, add missing path checks, and capture passing native/reference evidence. This proposal does not write outside Emit's planning root or create that change now.
2. Replace Emit's installed positive checks with fixtures and add fresh-tip discovery regression coverage. Verify these checks before removing the old driver.
3. Retire the pin and suites, update coverage ownership and live docs, and run the targeted validation listed in `tasks.md`.
4. Finish the implemented Emit change through `emit-finish-change`. No version bump is needed for the planned test/CI/documentation-only diff. Reclassify and version appropriately if implementation changes shipped behavior or payload.

There is no installed-data migration. Rollback of Emit's validation changes can restore the prior test arrangement; package updates and collection maintenance remain independently controlled.
