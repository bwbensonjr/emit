## 1. Top-level help (#43)

- [ ] 1.1 Accept `--help` / `-h` in `main`'s verb dispatch (`src/emit.cpp:1251-1268`) before the
      unknown-verb branch: print the usage summary and exit 0
- [ ] 1.2 Give `usage()` (`src/emit.cpp:1239`) a destination argument so the same text goes to
      stdout when requested and stderr when it accompanies an error (design D1)
- [ ] 1.3 Leave the error paths as they are: no verb exits 1, unknown verb exits 2, both narrating
      on stderr

## 2. Per-verb help and option validation (#43)

- [ ] 2.1 Write a usage line per verb — argument form, its own options, the shared `--dump` /
      `--dump-all` — with `emit lib`'s existing line (`src/emit.cpp:1168`) as the first of four
      rather than a special case (design D2)
- [ ] 2.2 Accept `--help` / `-h` in the option loops of `emit_run` (`:569`), `emit_build` (`:1079`),
      and `emit_lib` (`:1164`): print that verb's usage on stdout, exit 0
- [ ] 2.3 Add the missing unknown-option rejection to `emit_repl`'s loop, and accept `--help` there
      too — `emit repl --bogus-flag` currently starts a session and exits 0 (design D3)
- [ ] 2.4 Verify all four verbs by hand: `--help` exits 0 and writes to stdout; an unknown option
      exits non-zero and writes to stderr naming the door
- [ ] 2.5 Verify `emit --help | head` works without redirection — the point of D1

## 3. Suppress the unspecified final value (#42)

- [ ] 3.1 Add the `is_unspec` guard to the runtime's value print
      (`src/runtime/runtime.c:1843-1845`, the non-`RT_FILTER_MAIN` branch of `main`), suppressing
      the written form **and** the newline
- [ ] 3.2 Add the same guard to the host's in-process run path in `src/emit.cpp`, so `emit run` and
      a delivered executable stay byte-identical on stdout (design D5)
- [ ] 3.3 Confirm the guard is in the report, not the printer: `(write (if #f #f))` and
      `(display (if #f #f))` still render `#<unspecified>` — the same separation the REPL keeps
      between `run_thunk` and `print_val`
- [ ] 3.4 Confirm `#f` and `()` still print as final values
- [ ] 3.5 Leave `RT_FILTER_MAIN` untouched — it remains the separate compile-time mode that
      suppresses *every* final value, and `schemec` still builds with it (`Makefile:99`)

## 4. Move the pinned expectations

- [ ] 4.1 `demos/mandelbrot.expected`: drop the trailing `#<unspecified>` line
- [ ] 4.2 `test/io-primitives-tests.sh`: update the three expectations at `:47`, `:50`, `:53`
      (`'hi#<unspecified>'` → `'hi'`, and the two `read-all-stdin` round-trips), and update the
      header comment at `:8-11`, which explains the trailing token as expected behaviour
- [ ] 4.3 Confirm `demos/run-tests.sh:184` does **not** move — its two `#<unspecified>` tokens come
      from explicit writes and the program's final value is a list (verified before this change)
- [ ] 4.4 Confirm `test/repl-interactive-tests.sh:170` does **not** move — it pins the REPL rule
      this change generalizes

## 5. Tests

- [ ] 5.1 Add help cases to a CLI suite: top-level `--help` and `-h` exit 0 on stdout; each verb's
      `--help` exits 0 on stdout; no-verb and unknown-verb still exit 1 / 2 on stderr
- [ ] 5.2 Add the unknown-option case for all four verbs, `emit repl` included — the one that
      regresses silently today
- [ ] 5.3 Add a door-agreement case: a program ending in output, run through `emit run` and through
      a delivered executable, with byte-identical stdout asserted
- [ ] 5.4 Add the negative cases for D4: `#f` and `()` as final values still print; an explicit
      write of the unspecified value still renders
- [ ] 5.5 Run `./run-all-tests.sh` and `./run-dev-tests.sh`; confirm
      `test/module-scaffold-baseline.sha256` is **unchanged** — the guard is in `main` and the host
      run path, not in emitted IR, so any diff there means the change reached codegen

## 6. Docs and issues

- [ ] 6.1 `docs/PROJECTS.md`: remove the explanation of the trailing `#<unspecified>`, which the
      document only carries because the behaviour needed explaining
- [ ] 6.2 `docs/OUTPUT.md`: record the requested-vs-error destination rule for usage text, since it
      is a new instance of the stdout/stderr split
- [ ] 6.3 Reference the issues from the implementing commits (`Fixes #42`, `Fixes #43`)
- [ ] 6.4 Note on #42 that the "delivered executable prints no final value at all" half was
      considered and deliberately not taken, with the reason (the `core-language` observation
      channel, and door agreement) and the landing site if it is ever wanted (`RT_FILTER_MAIN`,
      per-program opt-in)
