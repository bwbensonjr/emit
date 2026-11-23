# Packages: `emit pkg`

`emit pkg` installs packages from the
[emit-packages](https://github.com/bwbensonjr/emit-packages) collection into your
user library root, where every Emit command finds them with no further setup.

```
emit pkg install malt        # place (malt learner) and its libraries
emit pkg list                # what is installed, at which commit
emit pkg available           # what the collection offers
emit pkg update              # move everything to the collection's current commit
emit pkg remove malt         # delete exactly malt's files
```

After `emit pkg install malt`, any program can `(import (malt learner))`, whether it
runs under `emit run`, `emit repl`, or `emit build`.

## Where packages come from

The collection's `main` branch is the release. Each command that uses the network
does three things:

1. Resolves `main` to one commit.
2. Downloads that commit's archive over HTTPS.
3. Installs every package it handles from that one commit.

It records the commit beside each package, so `emit pkg list` shows exactly which
code you have. There are no package tags, checksum files, or index to maintain.

Network commands need `curl` and `tar` on `PATH`. Only `install`, `update`, and
`available` use the network. `list` and `remove` never do.

### A local checkout

`--from DIR` reads an emit-packages tree at `DIR` instead of the network. It needs
neither `curl` nor `tar`, and the record names the directory as the source.

```
emit pkg install --from ~/src/emit-packages malt
emit pkg list
# malt 0.1.0 /Users/you/src/emit-packages
```

This is also how to install from a branch or an older commit: check it out, then
use `--from`.

### Compatibility

A package can declare `(emit (minimum "X.Y.Z"))` in its `package.scm`. `emit pkg`
refuses to install or update a package that needs a newer Emit than the one
running. `available` marks such packages.

## Where files go

| Path | What it is |
|---|---|
| `$XDG_DATA_HOME/emit/lib` (else `~/.local/share/emit/lib`) | the user library root; package files are placed here |
| `.../emit/packages/NAME.scm` | the record of package NAME: version, source, and the files it owns |
| `.../emit/packages/NAME.pending` | present only while an operation on NAME is in flight |
| `.../emit/.pkg-lock/` | held while one `emit pkg` command writes |
| `.../emit/.pkg-tmp/` | staging for one command; removed when it ends |

A package owns:

- the `.sld` file of every library its `package.scm` lists;
- any extra paths it lists in an optional `(files ...)` clause.

Package tests, docs, and license files are not installed. The record keeps the
license name.

## Safety rules

- **Your own files are left alone.** Libraries you put in the user root yourself
  coexist with installed packages. An install refuses only when a file it would
  place already exists and is not that package's own: either you put it there or
  another package owns it. It names the file and changes nothing.
- **An update overwrites the package's own files.** If you edited an installed
  file, `update` replaces it with the collection's version. Keep local changes in
  your own libraries instead.
- **No symbolic links are followed.** If the user root, the `emit` data directory,
  `packages/`, or any directory on the way to a file is a symbolic link, the
  command refuses. A user root linked to a collection checkout is managed by hand:
  pull the checkout to update. To switch to `emit pkg`, remove the link and run
  `emit pkg install`.
- **All or nothing.** Every check runs, for every named package, before anything is
  written. One bad name refuses the whole command.
- **Atomic placement.** Each file is staged on the same filesystem and moved into
  place with one rename. The package's record is committed only after all its files
  are in place.

## Recovery

If a command is killed partway, it can leave two things behind:

- **A pending record** (`packages/NAME.pending`). The next `install`, `update`, or
  `remove` finishes undoing it: it deletes the half-placed files and the record,
  says so, and asks you to install that package again. Until then, `list` reports
  the package as interrupted rather than installed.
- **A stale lock** (`.pkg-lock`). The next command refuses and names the lock path.
  If no `emit pkg` is running, remove that directory and retry.

The library cache needs no attention. Cache entries are checked against their
sources' contents, so the next run recompiles whatever changed.

## Output

Narration goes to standard error and follows `EMIT_VERBOSITY` ([OUTPUT.md](OUTPUT.md)):

- `quiet` prints errors only;
- the default prints one line per principal action;
- `verbose` adds a line per file.

`list` and `available` print their data on standard output, one line per package:

```
list:       NAME VERSION SOURCE              (SOURCE is a commit or a directory)
available:  NAME VERSION emit>=MINIMUM SUMMARY
```

Exit status is 0 on success, 1 on a failure, and 2 on a usage error.

## Testing overrides

These two variables exist so test suites can exercise the download path offline.
They are not a supported way to choose a package source.

| Variable | Effect |
|---|---|
| `EMIT_PKG_ARCHIVE` | URL of the archive to fetch instead of the GitHub one; `file://` is accepted |
| `EMIT_PKG_COMMIT` | 40-character commit to record instead of resolving `main` |

Set both or neither. Setting only one is a usage error.
