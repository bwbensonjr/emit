# Design

## Context

See proposal.md for motivation. Two places in the current code block a shebang script.

- **Argument loop.** `emit_run` in `src/emit.cpp` treats every non-option token as FILE, rejects a
  second one with `multiple source files`, and forwards program arguments only after `--`. This
  grammar came from `support-pitch-r7rs-prerequisites` (archived 2026-08-25, design D5), which made
  the separator mandatory "so tool flags remain strict and unambiguous." This change keeps that
  strictness before FILE and gives it up after FILE. Shebang invocation needs exactly that, since
  the kernel always puts the script path before the user's arguments.
- **Interpreter line.** The program reader in `src/prelude.scm` (`rd-skip-ws`) recognizes only the
  `#!fold-case` and `#!no-fold-case` directives, so `#!/usr/bin/env ...` is `unrecognized syntax`.
  `compile_program` in `src/emit.cpp` is the one front half shared by `emit run`, `emit run --emit`,
  and `emit build`. Every program source passes through it as a host string before the embedded
  compiler sees it.

`src/emit.cpp` is native host code: it reaches binaries through plain `make`, and changing it needs
no `make regen`.

## Goals / Non-Goals

**Goals:**

- `#!/usr/bin/env -S emit run` works, with arguments, on macOS and current Linux.
- A script gets the same `(command-line)` tail as its `emit build` executable for the same arguments.
- No change to compiler inputs, so no regeneration barrier.

**Non-Goals:**

- Accepting an interpreter line in libraries (`emit lib`, `.sld` files, `include`d files) or in
  REPL input. Only a program can be executed as a script.
- Changing what the Scheme `read` procedure accepts from a port. `#!/...` in data stays a read error.
- A dedicated launcher (such as `emit-run`) for systems whose `env` lacks `-S`. Issue #166 mentions
  it as optional; it can be added later without changing anything here.
- Guile-style multi-line `#! ... !#` headers.

## Decisions

### D1. Strip the interpreter line in the host, not the reader

`compile_program` replaces the first line with nothing but its newline when the source starts with
`#!/` or `#! `. It runs before `seed_session` (the import scan) and `compile_unit`, so both see the
same text.

Keeping the newline keeps every later line on its original line number, so any future
line-numbered diagnostic stays correct without knowing about the stripped line.

Alternative considered: teach `rd-skip-ws` (or `rd-all`) to skip the line at offset 0. Every caller
of `read-all-from-string` would be affected, including library, include, and REPL paths that should
stay strict (see Non-Goals). The change would be in `src/prelude.scm`, a compiler input, which costs
a `make regen` (5 self-compiles) plus the full source and reference validation. The host change
reaches exactly the inputs that can be scripts.

### D2. Recognize `#!/` and `#! ` only

This rule is borrowed from Chez Scheme's `compile-file`, which checks for `#!` followed by a space
or `/` at the start of a file (`s/compile.ss:2152` in the Chez tree). It can never match a reader
directive: `#!fold-case` and `#!no-fold-case` continue with a letter, so a source that opens with a
directive keeps its meaning. No list of known directives is needed, so a directive added later
cannot collide with the rule.

Alternative considered: skip any `#!` first line that is not a known directive. That ties the host
to the reader's directive list and silently swallows a misspelled directive such as `#!fold-cse`,
which today is a read error.

### D3. Stop option parsing at FILE; `--` before FILE ends options

The loop keeps its current per-option branches. The first positional token (or `-`) becomes FILE,
and every remaining `argv` entry is appended to `program_args` unchanged. A `--` seen before FILE
ends option parsing: the next token is FILE, and the rest are program arguments. `emit run --`
with nothing after it means stdin with no arguments.

This is the grammar of `sh`, `python3`, and `chez --script`. The choice between it, a compatible
"swallow one `--` after FILE" rule, and an opt-in `--script` flag was made with the requester on
2026-10-26. The swallow rule breaks fidelity for `./s.scm -- -x`, and the opt-in flag keeps two
grammars, so the requester chose this one despite its incompatibility.

The old loop also kept parsing Emit options after FILE (`emit run app.scm --manifest m`), and
callers in this repo rely on it. Under this grammar those options reach the program. This was found
during implementation, and on 2026-10-26 the requester confirmed keeping the grammar rather than
switching to a script-only mode keyed on the interpreter line. That mode would have been compatible,
but it gives one command line two meanings depending on the file's first line. In-repo callers move
their options before FILE, and the changelog migration says so.

`--resolve-program [NAME]` keeps consuming its optional NAME as it does now. A positional token after
it becomes FILE, which turns into the existing "program arguments require execution" error only if
further tokens follow. Resolve mode with FILE and no arguments behaves as before.

### D4. Ship it as a minor bump with an explicit migration note

The change is incompatible and silent for `emit run FILE -- ARG` callers, which now receive an extra
`--`. Pre-1.0 policy (`docs/RELEASES.md`) puts an incompatible change at a minor bump. The
`CHANGELOG.md` entry leads with the migration (`emit run f.scm a`, `emit run - a`).

Alternative considered: warn on stderr when `--` immediately follows FILE. That warning would also
fire for a legitimate `./s.scm -- x`, the case this change exists to make faithful, so it would be
permanent noise.

## Risks / Trade-offs

- [Outside callers of `emit run FILE -- ARG` change behavior without an error] → Changelog migration
  note; the 0.4.0 minor bump signals an incompatible change. In-repo callers are updated in the same
  change.
- [Existing `emit run FILE --manifest M` (or `-L`, `-O2`, ...) invocations stop applying the option]
  → Usually loud: an unloaded manifest or library root surfaces as `unresolved import`. The
  changelog migration says to move options before FILE, and in-repo callers are updated.
- [A typo'd Emit option after FILE (`emit run f.scm -O2`) now reaches the program instead of being
  rejected] → Accepted: this is the standard interpreter grammar. Usage text states that options go
  before FILE.
- [Stripping in the host means `emit run --emit` IR for a script equals the IR without the line] →
  Intended: D1's newline-preserving strip makes the two sources compile to identical IR, and the
  "same program" requirement is checked by comparing `--emit` output.
- [CRLF sources] → The strip removes up to but not including `\n`, so a trailing `\r` goes too, as
  part of the line. Nothing else changes.

## Migration Plan

Land as one pull request with the `VERSION` bump. Merging it to `main` releases 0.4.0 through the
normal pipeline. To roll back, revert the pull request; there is no data or artifact format to
migrate.
