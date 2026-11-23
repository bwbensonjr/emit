# Proposal

## Why

Since 0.12.0, Emit resolves libraries from a user library root (`~/.local/share/emit/lib`). Getting a package from the emit-packages collection into that root still means cloning a repository and linking its `lib/` directory by hand. Emit users should be able to install, list, update and remove a collection package with one command, without managing a checkout.

## What Changes

- New `emit pkg` command with five subcommands:
  - `install NAME...`
  - `list` (offline)
  - `available` (network)
  - `remove NAME...` (offline)
  - `update [NAME...]`
- `emit pkg` places packages in the user library root and keeps an ownership record for each one beside that root.
- The source of packages is the `main` branch of `bwbensonjr/emit-packages`. `pkg` resolves `main` to one commit, downloads that commit's archive over HTTPS with `curl`, unpacks it with `tar`, and records the commit. There are no tags, release assets, checksum files or index.
- `install --from DIR` installs from a local emit-packages checkout, with no network. Testing overrides let a suite point the download at a `file://` archive and a fixed commit.
- `pkg` refuses a package whose `(emit (minimum ...))` is newer than the running Emit. It never writes through a symbolic link in any directory it manages. It refuses only those installs that would overwrite a file it does not own or that another package owns.
- Installs are all-or-nothing per invocation, with three safeguards:
  - every check runs before the first write;
  - files are placed by atomic rename;
  - a lock and a pending record let a later run recover an interrupted one.
- `emit pkg` is written in Scheme. A new shipped library `(emit pkg)` holds the logic, and the C++ `pkg` verb runs a small shipped driver program through the same in-process path as `emit run`.
- New ordinary library `(emit process)` with `run-program` and `program-output`. Both run a program with an argument list directly: no shell, a `PATH` search, and inherited standard streams.
- `(emit filesystem)` gains `create-directory` and a recursive `delete-directory`.
- New runtime primitives for spawning a process, reading its captured output, waiting on it, and creating and removing directories. This is a compiler-source edit, so it crosses the `make regen` barrier.
- Version 0.13.0 (minor: new features).

## Capabilities

### New Capabilities

- `package-manager`: the `emit pkg` command. Covers the package source and commit pinning, subcommand behavior, the installed-package record, compatibility, symbolic-link and ownership safety, atomicity and recovery, and offline and test sources.
- `process-execution`: the `(emit process)` library. Runs host programs with an argument vector, returning an exit status or the status plus captured standard output, with the same behavior under `emit run` and in standalone executables.

### Modified Capabilities

- `filesystem-access`: the export list grows from four to six, adding `create-directory` and recursive `delete-directory`.
- `emit-cli`: the single binary dispatches a sixth verb, `pkg`, and that verb answers `--help` like the others.
- `distribution`: the installed payload carries the `pkg` driver and `(emit pkg)`. The package-collection requirement names `emit pkg install` as a supported way to populate the user root.

## Impact

- **Compiler source (regen barrier):**
  - primitive tables in `src/emit.ss` and `src/parse.ss`;
  - new entry points in `src/runtime/runtime.c`;
  - regenerated `bootstrap/`.
- **Native host:** `src/emit.cpp` gets the `pkg` verb, usage text and top-level help.
- **Libraries:**
  - new `lib/emit/process.sld` and `lib/emit/pkg.sld`;
  - extended `lib/emit/filesystem.sld`;
  - `emit-libs.scm` entries.
- **Shipped files:** the new `pkg` driver program, added to the install support files and the `make uninstall` list. The shared cache precompiles `(emit pkg)` like any shipped library.
- **Runtime dependencies:** `emit pkg` needs `curl` and `tar` on `PATH`, but only for the network subcommands. `--from` needs `tar` only if it is given an archive; with a directory it needs neither.
- **Tests:**
  - new process, filesystem and package-manager suites;
  - registry and validation-coverage updates;
  - an installed-layout probe.
- **Docs:** README, `docs/MODULES.md`, `docs/DISTRIBUTION.md`, `docs/OUTPUT.md` conformance, a new `docs/PACKAGES.md`, and CHANGELOG.
- **External prerequisites (emit-packages, not tracked here):**
  - protect `main` with the "Package checks" status required;
  - add a Linux job to `checks.yml` before 0.13.0 ships, since `main` becomes what users install.
