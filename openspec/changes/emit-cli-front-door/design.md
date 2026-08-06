## Context

`emit` grew its CLI verb by verb (`emit-cli-unification`), and each verb wrote its own argument
loop. The loops agree on the flags they accept and diverge on everything else: three reject an
unknown option, one (`repl`) ignores it; none knows about `--help`; one (`lib`) has a usage line, and
it is unreachable. `main` dispatches on the verb and treats anything it does not recognize —
including `--help` — as an unknown verb.

The final-value print has a different history. It is the oldest observable behaviour in the project:
`core-language` scenarios are written as "a program's value is a symbol → the executable prints
`hello`", so the print is the *observation channel* for much of the language spec. The REPL later
grew a narrower rule — suppress the unspecified result, print everything else
(`interactive-repl`, "Read-eval-print loop prints results interactively") — and the program path did
not follow. The comment at `src/emit.cpp:706-707` records that as intentional: the program print is
"a batch report, matching what the AOT executable prints, so dev→ship fidelity is preserved."

That reasoning is about `emit run` and the AOT executable **agreeing with each other**, and this
change keeps them agreeing. It changes what they agree on, to what the REPL already does.

## Goals / Non-Goals

**Goals:**

- Asking a tool what it does succeeds, at the top level and per verb.
- Every door validates its options the same way.
- A delivered executable's stdout is the program's own output when the program ends in output.
- `emit run`, a built executable, JIT, and bitcode remain byte-identical on stdout.
- The REPL's rule and the program rule become one rule stated twice, not two policies.

**Non-Goals:**

- Suppressing the final value entirely in a delivered executable. It would break the
  `core-language` observation channel and would make `emit run` disagree with a built binary — the
  property the current design protects. `RT_FILTER_MAIN` is the existing mechanism if this is ever
  wanted; the right shape is a per-program opt-in.
- `--version` (owned by `homebrew-tap-distribution`).
- Restructuring argument parsing into a shared parser. Four small loops that agree beat one
  abstraction here; see D3.
- Any change to how values other than the unspecified value print.

## Decisions

### D1 — Help asked for goes to stdout; help shown after an error stays on stderr

`docs/OUTPUT.md` puts narration on stderr and data on stdout. When the user types `--help`, the
usage text *is* the requested data — it should be pipeable into `grep` and `less` without
redirection. When usage is printed because a command was malformed, it is narration accompanying a
diagnostic and belongs on stderr, which is where it is today.

So the same text has two destinations depending on why it was printed. That is not inconsistency;
it is the stdout/stderr rule applied correctly, and it is the difference between `emit --help | head`
working and not.

Exit status follows the same split: `0` when help was requested, unchanged (`1` no verb, `2` unknown
verb/option) when it accompanies an error.

### D2 — Each verb owns its usage text; the top-level block stays a summary

The top-level `usage()` (`src/emit.cpp:1239`) is a four-line summary plus the shared `--dump` flags,
and it should stay that — a user running `emit` bare wants the map, not the detail. `emit <verb>
--help` prints that verb's own line, its flags with descriptions, and the shared flags.

`emit lib` already has a per-verb usage line (`:1168`) written for its arity error; it becomes the
first of four rather than a special case.

### D3 — Add an else-arm to `emit_repl`, do not unify the four loops

`emit_repl`'s loop has no rejection arm, which is why `emit repl --bogus-flag` starts a session.
The fix is the arm the other three already have.

The tempting alternative is one shared option parser. Rejected: the loops differ in what they accept
positionally (a file, a name, a source path, nothing) and the shared surface is three flags. A
parser abstraction would be larger than the four loops it replaces, and this change's value is that
the doors *behave* alike, not that they share code.

### D4 — The program-entry suppression is the REPL's rule, stated for programs

Mirror `interactive-repl`'s existing requirement exactly: when the final value is the unspecified
value, print nothing — not the written representation, not a trailing newline — and any other value,
including `#f` and `()`, prints as before. Output the program itself produced is untouched.

Two consequences worth stating. It is a **reporting policy, not a property of the value**: an
explicit `(write (if #f #f))` still prints `#<unspecified>`, exactly as the REPL's guard lives in
`run_thunk` and not in `print_val`. And it is the reason the unspecified value must stay distinct
from `#f` and `()` — those are legitimate final values that must still print, which `core-language`
already requires.

### D5 — The guard goes in two places, because there are two `main`s

A delivered executable's value print is `main` in `src/runtime/runtime.c:1843-1845`; `emit run`'s is
the host's in-process run path in `src/emit.cpp`. Both need the guard, and the test that they agree
is that the same program's stdout is byte-identical through both doors — which is exactly what
`test/io-primitives-tests.sh` already checks, once its three expectations are updated.

`RT_FILTER_MAIN` stays as it is: a separate compile-time mode that suppresses *every* final value,
used by `schemec`. This change makes the default mode print less; it does not merge the two.

### D6 — Update the expectations, do not add a compatibility flag

Four expectations move (`demos/mandelbrot.expected`, `test/io-primitives-tests.sh:47,50,53`). No
flag to restore the old output: the trailing token was never a feature, and a compatibility switch
would make the doors disagree again on request, which is the defect.

Worth recording that the surface is this small. #42 expected "`demos/run-tests.sh` and several
`test/*-tests.sh`" to move, and that estimate is what kept this out of `baked-set-on-every-door`.
Measured: `demos/run-tests.sh:184` does **not** move — its two `#<unspecified>` tokens come from
explicit writes and its program's final value is a list — and `test/repl-interactive-tests.sh:170`
does not move either, since it tests the REPL rule being generalized.

## Risks / Trade-offs

- **A program whose final value is legitimately unspecified now prints nothing**, so a user reading
  stdout cannot distinguish "ran and returned nothing interesting" from "produced no output". →
  This is the trade the REPL already made and the reason `void` exists as an explicit generator; a
  program that wants to report completion can say so. Exit status is unchanged and remains the
  signal for success.
- **`emit run` becomes slightly less useful as a scratchpad** — `(vector-set! v 0 1)` as a last form
  now shows nothing. → It matches what the same input does at the REPL prompt, which is the door
  users learn first.
- **Two destinations for the same usage text (D1)** could look inconsistent in a transcript. →
  Scenario coverage pins both directions, and the rule ("requested → stdout, error → stderr") is one
  sentence.
- **`--help` in a position the loop reads as a value** — e.g. `emit build --manifest --help` — takes
  `--help` as the manifest path. → Existing behaviour for every flag that takes an argument; not
  worth special-casing, but the help text should make the arity obvious.

## Open Questions

1. Should `emit help <verb>` exist as an alias for `emit <verb> --help`? Cheap, and it is what a
   user who has not read anything tries first. Leaning yes if it costs one dispatch line.
2. Does the per-verb help list the shared `--dump` / `--dump-all` flags each time, or point at the
   top-level block? Repetition is friendlier; the top-level block already explains them once.
