# package-manager Specification

## Purpose

Defines `emit pkg`, the command that installs, lists, updates, and removes packages from the emit-packages collection into the user library root, so that an Emit user can use a collection package without managing a repository checkout.

## Requirements

### Requirement: The pkg command offers five subcommands

`emit pkg` SHALL accept the subcommands `install NAME...`, `list`, `available`, `remove NAME...`, and `update [NAME...]`. A missing or unknown subcommand, a missing required name, or an unknown option SHALL be a usage error with status 2. A failed operation SHALL exit with status 1, and success with status 0.

#### Scenario: An unknown subcommand is a usage error

- **WHEN** the user runs `emit pkg frobnicate`
- **THEN** a diagnostic naming `emit pkg` and `frobnicate` is printed on standard error with the subcommand list, and the process exits with status 2

#### Scenario: Install without a name is a usage error

- **WHEN** the user runs `emit pkg install` with no package name
- **THEN** the process exits with status 2 and changes nothing on disk

### Requirement: Packages are installed into the user library root

`emit pkg` SHALL place a package's library files beneath the user library root, `<data>/emit/lib`, where `<data>` is the directory the user-root rule selects. Its state SHALL live beside that root under `<data>/emit`. When the user library root is unavailable, every subcommand that writes SHALL refuse with a diagnostic naming the missing `HOME` and `XDG_DATA_HOME`.

#### Scenario: An installed package resolves with no further setup

- **WHEN** `emit pkg install malt` succeeds with `XDG_DATA_HOME` set to an empty absolute directory
- **THEN** `$XDG_DATA_HOME/emit/lib/malt/learner.sld` exists, and a program importing `(malt learner)` run from an unrelated directory with no `-L`, `EMIT_LIBRARY_PATH`, or project `lib/` resolves it from the user root

#### Scenario: No user root means no install

- **WHEN** `emit pkg install malt` runs with `HOME` unset and `XDG_DATA_HOME` unset
- **THEN** it exits with status 1, names the missing variables, and writes nothing

### Requirement: The collection's main branch is the package source

A networked subcommand SHALL resolve the `main` branch of `bwbensonjr/emit-packages` to exactly one commit, then obtain that commit's archive over HTTPS. Every package that the invocation reads or installs SHALL come from that one commit. The commit SHALL be named in the narration and recorded with each package installed. Resolution SHALL use the collection's current tip without consulting an Emit-maintained collection revision; advancing the collection SHALL require no Emit update.

#### Scenario: Install records the commit it used

- **WHEN** `emit pkg install malt` succeeds
- **THEN** the narration names the 40-character commit that `main` resolved to, and `emit pkg list` reports that commit for `malt`

#### Scenario: A package absent from the collection is refused

- **WHEN** `emit pkg install no-such-package` runs
- **THEN** it reports that the package is not in the collection at the resolved commit, exits with status 1, and writes nothing

#### Scenario: The same Emit installs a later collection tip

- **WHEN** collection `main` advances from A to B and a user runs `emit pkg install` with the same Emit installation
- **THEN** installation uses B without an Emit source edit, pull request, rebuild, or release

#### Scenario: The same Emit updates to a later collection tip

- **WHEN** a package was installed from A, collection `main` advances to B, and `emit pkg update` runs with the same Emit installation
- **THEN** the package files and installed source record move to B, subject to the existing compatibility and preflight checks
- **AND** the next compilation uses B's sources

### Requirement: A package owns its declared library files

A package's installable file set SHALL be:

- the `.sld` file, at its conventional path under the collection's `lib/`, of each library that its `package.scm` lists in `libraries`;
- any additional `lib/`-relative paths that it lists in an optional `files` clause.

If any of those files is missing from the source, the install SHALL be refused.

#### Scenario: Every declared library is installed

- **WHEN** `malt` is installed from a source whose `package.scm` lists ten libraries
- **THEN** exactly those ten `.sld` files are placed under the user root, and the package's record lists those ten paths

#### Scenario: A declared file missing from the source refuses the install

- **WHEN** a package's `package.scm` declares a library whose `.sld` is absent from the source
- **THEN** the install reports the missing path, exits with status 1, and writes nothing

### Requirement: An install refuses a package that needs a newer Emit

When a package's `package.scm` contains `(emit (minimum "X.Y.Z"))` and the running Emit's version is lower than `X.Y.Z` under numeric component comparison, the install or update of that package SHALL be refused. The diagnostic SHALL name both versions.

#### Scenario: A too-new package is refused

- **WHEN** a package declares `(emit (minimum "99.0.0"))` and `emit pkg install` names it
- **THEN** the diagnostic names `99.0.0` and the running version, the process exits with status 1, and nothing is written

#### Scenario: Version components compare numerically

- **WHEN** the running Emit is 0.13.0 and a package declares minimum `0.9.0`
- **THEN** the package is accepted

### Requirement: The package manager never writes through a symbolic link

A writing subcommand SHALL refuse, before its first write, when any of the following is a symbolic link:

- `<data>/emit`;
- the user library root;
- the state directory;
- any existing directory or file on the path of a file that it would create, replace or delete.

The diagnostic SHALL name the link and explain that a user root linked to a checkout is managed by hand.

#### Scenario: A linked user root is left alone

- **WHEN** `<data>/emit/lib` is a symbolic link to an emit-packages checkout's `lib/` and `emit pkg install malt` runs
- **THEN** it names the link, explains that a linked root is managed by hand, exits with status 1, and the checkout is unchanged

#### Scenario: A linked subdirectory is refused

- **WHEN** `<data>/emit/lib/malt` is a symbolic link and an install would place files beneath it
- **THEN** the install is refused before any write

### Requirement: An install refuses only real collisions

An install or update SHALL refuse a package when a file that it would place already exists and either the user placed it or a different package's record lists it. Files under the user root that the package does not touch SHALL be left alone. A file that the same package's record already lists SHALL be replaced.

#### Scenario: The user's own libraries coexist

- **WHEN** the user root already contains a hand-written `acme/util.sld` and `emit pkg install malt` runs
- **THEN** malt installs and `acme/util.sld` is unchanged

#### Scenario: An unowned file in the way is refused

- **WHEN** the user root already contains a hand-placed `malt/learner.sld` and `emit pkg install malt` runs
- **THEN** the install names `malt/learner.sld` as unowned, exits with status 1, and leaves that file unchanged

### Requirement: Each invocation is all-or-nothing before its first write

A writing subcommand SHALL finish every check for every named package before writing to the user root:

- source availability;
- declared files;
- minimum version;
- symbolic links;
- collisions.

If any check fails, nothing under `<data>/emit` SHALL change apart from removing the invocation's own temporary files.

#### Scenario: One bad name refuses the whole install

- **WHEN** `emit pkg install malt no-such-package` runs
- **THEN** the process exits with status 1, and malt is not installed

### Requirement: Placement is atomic per file and recoverable

Each package file SHALL be placed by atomic rename from a staging directory on the same filesystem as the user root. A package's record SHALL be committed only after all of its files are in place. A later writing subcommand that finds an uncommitted pending record SHALL finish undoing it before doing its own work, and SHALL narrate the recovery.

#### Scenario: An interrupted install is recovered

- **WHEN** a pending record for malt is left behind, together with some of its files, and `emit pkg list` or another writing subcommand runs
- **THEN** writing subcommands remove the pending files and record and narrate the recovery, `list` reports the interrupted state without changing it, and no partially installed malt is ever reported as installed

### Requirement: Concurrent writers exclude each other

A writing subcommand SHALL hold an exclusive lock under `<data>/emit` for its duration. A second writer that finds the lock held SHALL exit with status 1 and name the lock path, so that the user can remove a stale lock left by a killed process.

#### Scenario: A held lock refuses a second writer

- **WHEN** the lock directory exists and `emit pkg install malt` runs
- **THEN** it names the lock path, exits with status 1, and writes nothing

### Requirement: List reports installed packages without the network

`emit pkg list` SHALL print one line on standard output for each installed package. Each line SHALL give the package name, its version, and its source: the commit, or the local directory for a `--from` install. Lines SHALL be sorted by name. The command SHALL never use the network, and with no packages installed it SHALL print nothing and succeed.

#### Scenario: List is offline data on standard output

- **WHEN** malt is installed and `emit pkg list` runs with no network access
- **THEN** standard output is one line naming `malt`, `0.1.0`, and the recorded commit, and the exit status is 0

### Requirement: Available lists the collection at the resolved commit

`emit pkg available` SHALL resolve `main` to a commit and print one line on standard output for each package in the collection at that commit. Each line SHALL give the name, the version, the minimum Emit, and the summary, sorted by name. Packages the running Emit cannot install SHALL be marked.

#### Scenario: Available names malt

- **WHEN** `emit pkg available` runs against the collection
- **THEN** standard output includes a line for `malt` with its version and summary

### Requirement: Remove deletes exactly the owned files

`emit pkg remove NAME...` SHALL delete every file that the named packages' records list, remove directories this leaves empty under the user root, and then delete the records. It SHALL never use the network. It SHALL leave unowned files and non-empty directories in place. Naming a package that is not installed SHALL be an error, and nothing SHALL be removed.

#### Scenario: Removing malt leaves the user's files

- **WHEN** malt and a hand-written `malt/extra.sld` are both present and `emit pkg remove malt` runs
- **THEN** malt's ten files and its record are gone, `malt/extra.sld` and its directory remain, and the exit status is 0

### Requirement: Update moves packages to one new commit

`emit pkg update` with no names SHALL update every installed package. With names, it SHALL update those packages. Each update SHALL take all packages from one newly resolved commit:

- files that the package's record lists are replaced even if they have been edited;
- files that the new version no longer declares are deleted;
- an installed package that the collection no longer contains is reported and left installed, and the update exits with status 1.

#### Scenario: Update replaces edited owned files

- **WHEN** an installed malt file has been edited by hand and `emit pkg update malt` runs
- **THEN** the file again holds the collection's content at the new commit, and the record names the new commit

#### Scenario: A file dropped by the package is deleted

- **WHEN** the new commit's malt no longer declares a library that the installed record lists
- **THEN** after `emit pkg update` that library's file is gone and the record no longer lists it

### Requirement: A local checkout can be the source

`emit pkg install --from DIR NAME...` and `emit pkg update --from DIR [NAME...]` SHALL read packages from an emit-packages tree at `DIR`, use no network, and require neither `curl` nor `tar`. The record SHALL give the source as the absolute directory, not as a commit.

#### Scenario: Install from a checkout works offline

- **WHEN** `emit pkg install --from ~/src/emit-packages malt` runs with no network access and no `curl` on `PATH`
- **THEN** malt installs, and `emit pkg list` reports the absolute checkout path as its source

### Requirement: Test overrides replace the download source

When `EMIT_PKG_ARCHIVE` and `EMIT_PKG_COMMIT` are both set, a networked subcommand SHALL skip branch resolution. It SHALL record `EMIT_PKG_COMMIT` as the commit and fetch `EMIT_PKG_ARCHIVE` with `curl`, which accepts `file://` URLs. Setting exactly one of the two SHALL be a usage error. These variables are for testing and are documented as such.

#### Scenario: A file URL archive exercises the download path

- **WHEN** both variables name a local `file://` archive and a fixed 40-character commit, and `emit pkg install malt` runs
- **THEN** malt installs from that archive and `emit pkg list` reports that commit

### Requirement: Network subcommands report missing tools and failures before writing

A subcommand that needs the network or an archive SHALL check for `curl` and `tar`, refusing with a diagnostic that names any missing tool. A failed commit resolution, download, or extraction SHALL be reported with the program's exit status. In each case it SHALL exit with status 1 and change nothing under the user root.

#### Scenario: A failed download changes nothing

- **WHEN** `EMIT_PKG_ARCHIVE` names a `file://` path that does not exist and `emit pkg install malt` runs
- **THEN** the diagnostic names the download and curl's exit status, the process exits with status 1, and the user root is unchanged

### Requirement: Installed sources are used on the next run

After `install`, `update` or `remove`, the next compilation that imports an affected library SHALL use the user root's current sources. The package manager SHALL take no action on the library cache.

#### Scenario: An updated library is recompiled

- **WHEN** a program importing a package library is run, the package is updated to a commit that changes that library, and the program is run again
- **THEN** the second run reflects the new source

### Requirement: Package operations narrate on standard error

`emit pkg` SHALL follow the project's output convention:

- at default verbosity, one line per principal action on standard error, naming the commit or source, each package and version, and file counts;
- at quiet, errors only;
- at verbose, per-file detail.

Data printed by `list` and `available` SHALL go to standard output at every verbosity.

#### Scenario: Quiet install prints nothing on success

- **WHEN** `EMIT_VERBOSITY=quiet emit pkg install --from DIR malt` succeeds
- **THEN** standard error and standard output are both empty

### Requirement: The collection owns published-tip compatibility

The package source contract SHALL assign emit-packages responsibility for keeping `main` compatible with the latest stable released Emit. Package manifests SHALL declare a minimum Emit when required. Older Emit installations SHALL use the existing minimum-version refusal rather than require Emit to carry a collection pin or select a historical compatible commit.

#### Scenario: A package requires a newer released Emit

- **WHEN** a collection update raises a package's declared minimum above the running Emit version
- **THEN** installation or update refuses before changing installed packages and names both versions
- **AND** the user can upgrade Emit or explicitly install an older local checkout with `--from`

#### Scenario: Collection compatibility policy is published

- **WHEN** maintainers consult the package-source documentation
- **THEN** it identifies emit-packages as owner of compatibility checks for its published tip against the latest stable Emit, with no paired Emit pin-update pull request
