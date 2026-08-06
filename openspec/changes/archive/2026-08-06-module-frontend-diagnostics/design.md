## Context

Modules v0 drew its boundaries deliberately and wrote them into the `module-system` spec: exports
are procedures, imports are whole-library, and four R7RS library declarations are out of scope.
What was never built is the part that *says no*. `parse-define-library` (`src/core.ss:356-369`) is
a four-armed `cond` — `export`, `import`, `begin`, and an `[else]` that conses the declaration onto
the body — and `collect-imports` treats each import spec as a library name. An unsupported form is
therefore not rejected; it is reclassified, and the error surfaces wherever the reclassification
first hurts.

Six measurements, one root (see the proposal's table). The most instructive pair: an import set in
a program reports a missing *manifest entry*, while the same import set inside a `define-library`
reports an *unresolved or cyclic import*. Same form, two doors, two unrelated stories — because
nothing in either path knows the form exists.

The precedent is close at hand. `validate-record-type-syntax` fixed exactly this shape for
`define-record-type` (a front end destructuring user syntax without validating it, reporting the
consequence rather than the cause), and `library-body-declarations` (#16) fixed the body half of
`parse-define-library` while explicitly recording the declaration half as out of scope — which is
what #18 item 3 asks for.

**No library in the tree uses a declaration this change would reject.** Every `.sld` under `lib/`
and `test/modules/` uses only `export`, `import`, and `begin` — verified — so the rejection cannot
break an existing build.

## Goals / Non-Goals

**Goals:**

- Every form the module front end does not handle is named in the diagnostic that reports it.
- A user's next action after a diagnostic is the right one — fix the form, not the manifest, not a
  definition that is already there.
- Recognized-but-unsupported and never-heard-of are distinguishable, because they call for
  different responses.
- The four doors agree: one form, one message, whichever door compiled it.

**Non-Goals:**

- Implementing import sets, `include`/`include-ci`/`include-library-declarations`, `cond-expand`,
  or macro export. Each stays separate, larger work (#45, #18, #48 second half).
- Deciding whether the REPL should accept a `define-library` (#49's product question). This change
  reports the current limit; it does not set it.
- Any change to how *body* forms are classified or lowered. `library-body-declarations` settled
  that; commands stay commands.
- Any IR change. Nothing here alters a program that compiles today.

## Decisions

### D1 — Reject at the front end, at the point of misclassification

Each guard goes exactly where the wrong assumption is made: the import-set check in the import
parser (before a spec is read as a library name), the declaration check in
`parse-define-library`'s `[else]` arm, the macro-export check in `compile-library*`'s export
validation, the position check where `single-define-library` fails.

The alternative — validating a `define-library` in a separate pre-pass — would duplicate the shape
knowledge that these sites already have and give two places to keep in step. The `[else]` arm
already sees the declaration it cannot name; it should say so rather than pass it on.

### D2 — Two messages: recognized-but-unsupported vs. not a declaration

`include`, `include-ci`, `include-library-declarations`, and `cond-expand` are R7RS declarations
Emit has not implemented. `(frobnicate 1 2 3)` is not a library declaration in any Scheme. Today
both produce `unbound variable <keyword>`; they deserve different answers, because the user's
situation differs — one is waiting on Emit, the other has made a mistake.

So: name the four explicitly as recognized R7RS declarations that are not yet supported, and
report anything else as not a library declaration, listing what is accepted. The first message
should not promise a schedule; #18 owns that.

### D3 — The macro-export check reads the `macro-env` that already exists

`compile-library*` calls `collect-define-syntax` (`src/core.ss:566`) and keeps the result as
`macro-env` before computing `defined-names` from the runtime body. The export check
(`:585-587`) then reports any export not in `defined-names`. The fix is to consult `macro-env`
first and report a macro export as a macro export — no new scan, no new traversal, one extra
lookup against a binding list the function is already holding.

This is why #48's first half is small enough to ride here while its second half (a phase-separated
compile-time interface) is a change of its own.

### D4 — `rename` is rejected only in import position

`rename` is legal in an `export` declaration — `(export (rename internal external))` — and is an
import-set transform in an `import` declaration. The guard must key on position, not on the
keyword. Missing this would break `test/modules/rename-lib.sld` and the `(rename …)` export
scenario the `module-system` spec already pins.

### D5 — One import-spec validator, consulted by both paths

The program path (`collect-imports`, `src/core.ss:221`) and the library path (the declared imports
taken from `parse-define-library`, `:261`) are the two places an import spec becomes a library
name, and today they fail differently. Both call one validator, so the message for
`(only (scheme inexact) sqrt)` cannot depend on where it was written.

That single message is also what makes the fix verifiable: the two doors' outputs for the same
input become comparable, which is how the tests are written.

### D6 — Recoverable compile-time errors, not aborts

Every guard raises through the same channel `compile-library`'s existing export error uses — the
recoverable error the REPL catches and reports before returning to the prompt. Verified: a bad
`define-library` at the prompt today leaves the session alive, and these guards must not regress
that. A mistyped declaration taking down a session would trade one defect for a worse one, and the
REPL-as-primary-development-loop goal is what makes that unacceptable rather than merely untidy.

Messages carry no door prefix of their own; each door adds its own, per `emit-cli`'s "a door's
diagnostics name that door" requirement.

### D7 — Say what is wrong and what is accepted, and nothing else

Each message names the offending form and states the rule it violates — "imports are
whole-library", "a define-library must be the only form in its source". No suggested rewrites, no
"did you mean", no promise that support is coming. `docs/OUTPUT.md` governs the form; the value
here is that the noun in the message is the noun the user typed.

## Risks / Trade-offs

- **A guard rejects something that works today.** → The measured inventory is the whole surface:
  every `.sld` in `lib/` and `test/modules/` uses only `export`/`import`/`begin`. The full suite
  plus the byte-identity guards are the check, and no IR moves, so `module-scaffold-baseline.sha256`
  is untouched — a change there would itself be the signal that something was reclassified.
- **`rename` position-sensitivity (D4)** is the one place a careless guard silently breaks a
  passing test. → It has an existing test library and an existing spec scenario; both must stay
  green.
- **Better diagnostics make the missing features more visible**, so this may raise interest in #18
  and #48 rather than satisfy it. → That is the honest outcome: a clear "not supported" is worth
  more than a confusing failure, and it is what makes the deferral defensible.
- **Six messages is a lot of new user-facing text.** → They collapse to four rules (import sets,
  unknown declarations, macro exports, library position); the count is high because the current
  failure modes are scattered, not because the rules are.

## Open Questions

1. Should the unrecognized-declaration message enumerate the accepted declarations (`export`,
   `import`, `begin`) or point at `docs/MODULES.md`? Enumerating is self-contained but goes stale
   as #18 lands.
2. `(rename …)` as an import set is the one import-set keyword with a plausible near-term
   implementation path, since export already has rename machinery. Worth saying "not yet" in a
   distinguishable way from `only`/`except`/`prefix`, or is one message for all four simpler?
   (Leaning: one message. #45 filed them as one group.)
