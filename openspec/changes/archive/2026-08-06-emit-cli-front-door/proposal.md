## Why

Two things a new user meets in their first five minutes with `emit`, both currently wrong, and both
cheaper to fix before `homebrew-tap-distribution` tags 0.1.0 than after.

**Asking for help is treated as an error.** Measured against `build/emit`:

```
$ emit --help          → exit 2, "emit: unknown verb '--help'" then the usage block
$ emit -h              → exit 2, same
$ emit run --help      → exit 2, "emit run: unknown option --help", no usage at all
$ emit build --help    → exit 2, same
$ emit lib --help      → exit 2, same
$ emit repl --help     → exit 0, starts the REPL — the flag is silently ignored
```

The top-level case prints usage but calls it a failure. The three per-verb cases refuse without
telling the user what the verb accepts, so there is no way to ask. And `emit repl` has no option
validation at all — `emit repl --bogus-flag` starts a session and exits 0, so a typo'd flag is
silently ignored rather than reported. Usage goes to stderr in every case, including when it was
what the user asked for.

**Every delivered executable appends a line of noise.** The program entry prints the program's final
value on every backend, which is useful in `emit run` — you need no `display` to see a result — but
for any program whose last form is output it appends `#<unspecified>`:

```
$ printf '(display "hi")\n(newline)\n' > hello.scm
$ emit run hello.scm    → hi\n#<unspecified>\n
$ emit build hello && ./hello  → hi\n#<unspecified>\n
```

The REPL already solved this: `run_thunk` suppresses the unspecified result (`rt_is_unspec`,
`src/emit.cpp:708`) so side-effecting forms stay quiet, exactly as Chez's waiter and Racket's REPL
do. The program path does not, so **the two doors disagree about the same value**. A standalone
executable is a first-class deliverable (`CLAUDE.md`), and this makes every one of them need its
last line trimmed before use in a pipeline.

The current asymmetry is deliberate and defended in a comment at the suppression site — the program
print is "a batch report, matching what the AOT executable prints, so dev→ship fidelity is
preserved." That argument is about `emit run` and the AOT executable **agreeing**, and it survives
this change intact: both suppress, so both still agree. What changes is *what* they agree on.

Note the project already recognizes the underlying problem for its own binaries. The runtime has
`RT_FILTER_MAIN` (`src/runtime/runtime.c:1836-1846`), a compile-time mode that suppresses the
final-value print because for a text filter "printing the entry's value afterward would append
`()\n` and corrupt the output stream" — and the self-hosted `schemec` is built with it
(`Makefile:99`). Emit's own delivered compiler needs this; users have no way to ask for it.

## What Changes

- **`--help` / `-h` is a request, not an error.** At the top level it prints usage and exits 0. In
  each verb's option loop it prints that verb's usage line and its flags and exits 0. Because the
  output was asked for, it goes to **stdout**; usage printed as part of an *error* stays on stderr,
  where it is today.
- **`emit repl` validates its options.** Its loop gains the unknown-option rejection the other three
  verbs already have, so a mistyped flag is reported rather than ignored.
- **Per-verb usage exists at all.** Today only `emit lib` has a usage line of its own
  (`src/emit.cpp:1168`) and it is unreachable from `--help`. Each verb gets one, and the top-level
  usage block stays the summary it is now.
- **The program entry suppresses the unspecified value**, matching the REPL's rule exactly: nothing
  printed, not even a newline, when the final value is the unspecified value. Any other value —
  including `#f` and `()` — still prints, which is what makes the distinguished unspecified value
  worth having. This applies on every exit (`emit run`, the AOT executable, JIT, bitcode), so the
  doors continue to agree.
- **Explicit non-goal: a delivered executable that prints no final value at all.** #42 raises it
  and it is a reasonable end state, but it would break the observation channel a large part of the
  `core-language` spec is written against ("a program's value is a symbol → the executable prints
  `hello`") and it would make `emit run` and a built binary disagree, which is the one property the
  current design is protecting. If it is wanted later, `RT_FILTER_MAIN` is the existing landing
  site and the right shape is a per-program opt-in, not a global default.
- **Explicit non-goal: `--version`.** It belongs to `homebrew-tap-distribution`, which introduces
  the committed version artifact this would read.

## Capabilities

### New Capabilities
<!-- None. -->

### Modified Capabilities

- `emit-cli`: gains the requirement that every door answers `--help`/`-h` with its own usage and a
  success exit, and that every door rejects an unknown option — which `emit repl` currently does
  not.
- `core-language`: gains the requirement that a program's reported final value is suppressed when
  it is the unspecified value, on every exit — the program-level counterpart of the REPL's existing
  echo-suppression rule.

## Impact

- `src/emit.cpp`: `main`'s verb dispatch (`:1251-1268`) and `usage()` (`:1239`); the option loops of
  `emit_run` (`:569`), `emit_build` (`:1079`), `emit_lib` (`:1164`), and `emit_repl` — which needs an
  else-arm it does not have; a per-verb usage helper.
- `src/runtime/runtime.c`: `main`'s non-`RT_FILTER_MAIN` branch (`:1843-1845`) gains the
  `is_unspec` guard, so every AOT/JIT-linked executable inherits it.
- The in-process run path in `src/emit.cpp` gains the same guard, so `emit run` and a built
  executable stay byte-identical on stdout.
- **Test surface — smaller than #42 estimated.** Four expectations in two files, not "several
  suites": `demos/mandelbrot.expected` (one trailing line), and `test/io-primitives-tests.sh`
  (`:47`, `:50`, `:53`). Verified unaffected: `demos/run-tests.sh:184`, whose expected string's two
  `#<unspecified>` tokens come from explicit writes and whose final value is a list; and
  `test/repl-interactive-tests.sh:170`, which tests the REPL rule this change generalizes.
- No IR change — the guard is in the runtime's `main` and the host's run path, not in emitted code,
  so `test/module-scaffold-baseline.sha256` is untouched.
- Docs: `docs/PROJECTS.md` drops its explanation of the trailing `#<unspecified>`; `docs/OUTPUT.md`
  governs the stdout-vs-stderr split for help output.
