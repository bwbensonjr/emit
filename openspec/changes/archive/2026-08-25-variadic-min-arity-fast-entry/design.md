## Context

See `proposal.md` for motivation. Today every `(code label self fixed rest body)` has one uniform
LLVM entry. Its closure points at that entry; the entry checks `argc >= fixed`, spills all `K`
positional operands, and calls `rt_build_rest`, even when `argc = fixed` and the result must be
`()`.

P9 now lets an importer call that label directly, but the direct call still pays the same prologue.
The lowerer knows both the callee shape and the syntactic argument count at every `self-app`, local
`known-app`, and imported `known-app`. The uniform function prototype already carries everything a
second entry needs, and passing the original closure as `self` preserves captured environments.

The compiler sources involved are inside the regeneration barrier. The prototype must therefore be
measured through the Chez source driver before any `make regen`; regeneration is warranted only if
the production form will be retained.

## Goals / Non-Goals

**Goals:**

- Measure the best realistic result of bypassing the empty-rest prologue before expanding the
  separate-compilation interface.
- Preserve one closure representation and one uniform call prototype while allowing two code
  labels for an eligible variadic body.
- Make exact-minimum selection work for self, intra-unit known, and cross-unit known calls after the
  gate passes.
- Keep the ordinary entry authoritative for dynamic calls and for every call that needs a non-empty
  rest list.
- Record both runtime benefit and emitted-size cost before accepting the final form.

**Non-Goals:**

- Specializing every accepted arity of a variadic procedure.
- Optimizing `apply`, flow-sensitive procedure values, or known-invalid calls.
- Changing the closure layout, the `argc + positional slots + overflow` ABI, or Scheme arity/error
  behavior.
- Removing `rt_build_rest` from ordinary variadic entries.
- Treating a benchmark miss as unfinished implementation work; a measured no-go is a complete
  outcome for this change.

## Decisions

### D1 — Establish the gate with alternating preserved executables

Before compiler edits, rebuild the checked-in P9 manifest with the current compiler, preserve the
executable and program IR, verify its result is `19888890`, and record at least ten warm samples.
After the prototype, run at least ten alternating before/after pairs on an otherwise idle machine,
discarding one explicit warm-up of each executable rather than choosing outliers after the fact.

The gate passes when the after median is at least 5% lower than the before median at the timer's
0.01-second resolution and both executables print the same result. Raw samples, medians, bests,
artifact sizes, and the exact commands go in `measurements.md`. Ten pairs make the decision less
sensitive than P9's six-pair null result; 5% is 0.02 s at the current 0.40 s baseline, large enough
to resolve with the existing timing method while still well below the historical 0.07 s gap.

Alternative considered: accept any positive median. Rejected because P9 already demonstrated
hundredth-of-a-second run-to-run movement with no real effect.

### D2 — The prototype duplicates one body under a minimum-arity label

For each variadic L-code definition, have the emitter produce an experimental second definition
under a deterministic label derived injectively from the ordinary label. The production encoding is
`min-entry:$` followed by the ordinary label with `$` encoded as `$d` and `:` encoded as `$c`.
Every library ordinary label contains a colon and every program ordinary label uses the generated
`code_N` form, while encoded minimum labels have the fixed `min-entry:$` prefix and no further
colons; the namespaces therefore cannot overlap even when a Scheme binding is named `foo.min`.
The entry uses the same `fastcc` prototype,
maps required parameters to the same positional operands, maps the rest parameter directly to the
`()` immediate, and emits the same body without an arity check, spill, or `rt_build_rest` call. The
ordinary definition and closure remain unchanged.

Duplicating the body is intentionally the prototype: it measures the speed ceiling without adding a
shared-body call that could replace the prologue cost with another call. It also exposes the
worst-case IR-size cost. If the speed gate passes but duplication is too expensive, the production
follow-up may factor a body entry shared by the two wrappers, but the finalized representation must
be re-benchmarked and still pass the same speed gate.

Alternative considered: branch inside the ordinary entry when `argc = fixed`. This is simpler and
also helps dynamic calls, but it does not test the full proposed win because it retains a runtime
branch and cannot remove the arity check on non-LTO doors. It remains a fallback worth measuring if
body duplication is the only unacceptable cost.

### D3 — Fast entries preserve the uniform ABI and original `self`

The fast label takes exactly the ordinary Scheme prototype. Known callers pass the actual closure as
`self`, the minimum `argc`, the normal padded positional operands, and `ptr null` when there is no
overflow. Consequently tail-position calls remain eligible for the same `musttail` emission, and a
capturing variadic procedure reads the same environment whichever entry was selected.

Only compiler-proven exact-minimum calls can name the fast label, so omitting its arity check is the
same static-proof optimization already used for direct self calls. The closure's code pointer never
changes and always names the checked ordinary entry, which keeps first-class and `apply` calls safe.

Alternative considered: a narrower fixed-arity prototype. Rejected because it would split the call
convention and forfeit straightforward `musttail` compatibility.

### D4 — Carry callee shape through known-call metadata

Extend lowerer's known-closure and self descriptors from a bare label to the label plus exact/minimum
arity shape. A pure, reversible, collision-free label-derivation helper names the fast definition.
An exact-minimum call to a
variadic descriptor selects that label; a call above the minimum keeps the ordinary label. Fixed
procedures and invalid counts retain their current decisions and emitted bytes where possible.

Imported descriptors get the fast label from the export table rather than deriving it blindly. This
distinction is required for reading an older library artifact whose variadic row exists but whose IR
does not define a fast entry.

### D5 — Append an optional fast label only to new variadic call rows

After the gate passes, write an eligible variadic row as
`(external ordinary-label minimum-arity rest fast-label)`. Existing three-field fixed rows remain
byte-identical, and a new reader accepts both the existing four-field variadic row and the new
five-field row. A four-field row has no fast entry and continues to direct every valid static count
to its ordinary label.

The existing assignment filter remains the single authority: an assigned export publishes no call
row at all, so neither label can be frozen incorrectly. Compiler-keyed caches invalidate when the
compiler changes; manually supplied old artifacts remain usable through the four-field fallback.
Forward consumption of the new row by an older compiler is not promised—the current parser already
rejects unfamiliar row shapes instead of silently guessing.

Alternative considered: derive the fast label from every imported ordinary label without changing
the table. Rejected because a new compiler would then emit an undefined reference when consuming an
old four-field artifact.

### D6 — Keep tree-shaking rooted through the closure/label pair

A cross-unit fast call continues to evaluate the imported global and pass it as `self`. The root
scanner must recognize the fast label beside that global exactly as it recognizes the ordinary
label today. A pruned library recompilation emits the fast definition whenever it retains the
corresponding variadic binding; no independent binding or initializer is introduced.

This keeps the closure, captured environment, and reachable body together. It also avoids adding a
second user-visible export or changing unit initialization.

### D7 — The gate controls the regeneration barrier and production follow-up

All prototype edits and focused checks use `chez --libdirs src --script src/compile.ss`. If the gate
fails, restore every compiler-source and generated-test expectation touched by the prototype, keep
only the OpenSpec measurement and P9 documentation outcome, and do not run `make regen`.

If it passes, finish metadata compatibility, all call-site classes, tree-shaking, documentation, and
focused tests before running `make regen` once. No compiler-source edit may follow that point until
`run-all-tests.sh` and `run-dev-tests.sh` complete. The finalized compiler is remeasured; falling
below the 5% gate returns the change to the no-go branch rather than accepting a result that only the
throwaway form achieved.

## Risks / Trade-offs

- [Duplicating variadic bodies grows library IR and delivered binaries] → Record the P9 executable
  and 80-demo scaffold deltas; if the speed gate passes but size is disproportionate, try the shared
  body or in-entry branch and require the final form to pass the same speed gate.
- [A fast call reaches a body with a non-minimum `argc`] → Select the label only from a descriptor
  whose minimum equals the syntactic argument count, and pin exact/above/below cases in lowering and
  runtime tests.
- [An old artifact advertises a variadic ordinary label but defines no fast label] → Require the
  explicit fifth field before selecting the fast entry; four-field rows retain ordinary calls.
- [Captured variables are lost by bypassing the closure entry] → Continue loading and passing the
  original closure as `self`, with a capturing fixture on both ordinary and fast paths.
- [Tail calls lose `musttail`] → Keep the identical prototype and assert `musttail` in a recursive
  exact-minimum fixture that runs in bounded stack.
- [Tree shaking drops one half of the call/closure pair] → Extend the existing external-label/root
  assertions and test a program whose sole use is the fast call.
- [A suffix-derived fast label aliases an ordinary entry such as `foo.min`] → Encode the complete
  ordinary label into the disjoint `min-entry:$…` namespace and compile/link a library containing
  both `foo` and `foo.min`.
- [Host evaluation order changes temporary numbering] → Sequence every emitting operation with
  `let*`/ordered helpers and require source-host/self-host byte parity after regeneration.
- [A noisy machine makes the branch decision unstable] → Use preserved binaries, explicit warm-ups,
  alternating order, raw samples, and the 5% threshold; rerun the complete set rather than selecting
  favorable samples.

## Migration Plan

There is no source-language migration. On a passing gate, rebuilding a library adds the optional
fast label to its variadic call rows and defines the corresponding code; compiler-keyed cached
artifacts invalidate naturally. Existing fixed and four-field variadic artifacts remain readable
and use the ordinary entry.

Rollback is to stop emitting and selecting the optional label. Closures and ordinary entries are
unchanged throughout, so old behavior remains available without an ABI or data migration. On a
failed gate, rollback happens before regeneration and is the planned terminal state.
