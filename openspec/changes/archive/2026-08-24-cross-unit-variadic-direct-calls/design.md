## Context

The cross-unit call interface currently publishes `(external-name code-label arity)` only for a
fixed-arity top-level lambda. `lower` therefore has no label for a variadic import, even though the
emitted closure ABI already sends every direct call the callee closure, actual argument count,
positional slots, and overflow pointer. A variadic code definition already validates `argc >= f`
and calls `rt_build_rest` in its prologue; variadic self-calls already take this direct ABI path.

The AOT tree-shaker discovers imported roots by finding the closure global load paired with a direct
code-label call. That pairing, and the closure's captured environment, require a cross-unit direct
call to continue evaluating and passing the imported closure as `self`.

## Goals / Non-Goals

**Goals:**

- Describe fixed and variadic call arity without changing existing fixed-row bytes.
- Use the existing direct ABI for every statically valid call to an immutable variadic export.
- Keep emitted behavior and direct-call eligibility identical across AOT, run, and REPL doors.
- Preserve compatibility with existing fixed-arity export tables and with the tree-shaker's root
  rule.

**Non-Goals:**

- Direct `apply` calls or flow-sensitive discovery of procedures held in local values.
- New fixed-arity wrapper entry points, caller-built rest lists, or a calling-convention change.
- Direct calls to a library binding whose slot the defining unit assigns.
- JIT cross-module inlining; the open-world JIT benefits only from the shorter known-call sequence.

## Decisions

### D1 — Extend call rows with an optional variadic marker

Keep a fixed call row as `(external-name code-label exact-arity)`. Emit a variadic row as
`(external-name code-label minimum-arity rest)`, where the explicit `rest` marker distinguishes it
from a fixed procedure of the same arity.

This keeps all existing fixed interfaces byte-identical. A new reader accepts both shapes. An old
reader ignores the fourth field because it already reads only the label and third field; it may
direct-call the minimum-arity case as though fixed, which remains sound because the variadic callee
accepts that count and builds an empty rest list. Calls with additional arguments remain indirect
under that older compiler.

Alternatives rejected: replacing the arity field with a new nested descriptor would rewrite every
artifact and reject older readers; encoding variadicity in the sign of the arity is compact but
opaque and gives zero required arguments no natural negative representation.

### D2 — Record every immutable top-level lambda, including rest lambdas

The lowerer already assigns every library top-level lambda a stable, name-derived code label but
currently adds it to the unit call interface only when `param-rest` is false. Record the label,
fixed-parameter count, and whether a rest parameter exists for both shapes. Keep the existing
post-lowering filter that removes every binding assigned by its defining unit.

This uses emitted facts rather than re-deriving source shape in the export writer, preserving the
current guarantee that a table cannot advertise a label the unit did not define.

### D3 — Match a static call count against exact-or-minimum arity

Decode each imported call row to a descriptor containing label, arity, and variadicity. A call with
`n` syntactic arguments becomes `known-app` when `n = arity` for a fixed descriptor or `n >= arity`
for a variadic descriptor. Too-few calls remain `app`, preserving the current error path and IR
boundary rather than optimizing known-invalid source.

The descriptor is unit-local compiler state exactly like the current fixed call alist; no source or
unit IR is needed at the importer.

### D4 — Reuse the callee's rest-building prologue

Do not build a rest list at the caller and do not add a second entry point. `emit-known-app` already
uses the same ABI as `emit-app`: it supplies `self`, constant `argc`, the module's positional slots,
and an overflow pointer for arguments beyond those slots. The existing variadic prologue owns the
single semantic operation of turning those operands into the rest list.

This also covers calls whose argument count exceeds the shared slot count and tail calls, because
both cases already work for direct variadic self-calls. Reusing that path minimizes emitted code and
keeps rest-list order and allocation behavior defined in one place.

### D5 — Preserve the closure load and tree-shaking root pair

A cross-unit `known-app` continues to lower its operator to `(global-ref ...)`, evaluate that load,
and pass the closure as `self`; only the code-pointer load from inside the closure is skipped. This
is required for captured environments and keeps every external code-label reference paired with the
global reference `program-root-internals` searches.

The fixed-entry alternative mentioned in P9 could omit the closure load for capture-free functions,
but would require a new root representation and two entry conventions for no additional benefit.

### D6 — Measure code shape and end-to-end cost

Tests will pin direct calls at the minimum, above the minimum, and above the shared positional-slot
count; too-few calls, `apply`, value-position use, and assigned exports remain indirect. The existing
AOT pairing assertion must continue to pass.

Re-run P9's 3,000,000-iteration `number->string` workload with interleaved samples from otherwise
equivalent before/after compilers, record both call shape and timing, and update the backlog with the
observed result even if it differs from the predicted recovery.

## Risks / Trade-offs

- [A malformed four-field call row could be treated as valid metadata] → accept only the explicit
  `rest` marker and retain the existing artifact parse/error behavior for other shapes.
- [Calls beyond the module's positional slot count could reverse or lose rest arguments] → include a
  direct variadic call that exercises the overflow pointer and compare its value with `apply`.
- [Publishing a label for an assigned binding would freeze stale code] → keep the single existing
  `unit-procs` assignment filter and extend its tests to a variadic initializer.
- [Compiler-source changes can diverge across hosts] → exercise the Chez source driver before the
  regeneration barrier, then require fixed-point regeneration, byte-parity checks, and both test
  suites.

## Migration Plan

No user migration is required. Existing fixed call rows remain unchanged and readable. Rebuilding a
library with the new compiler adds the variadic marker only for eligible exports; compiler-keyed
caches naturally invalidate when the executable changes. Rollback consists of withholding variadic
rows again; the indirect ABI remains present and behaviorally equivalent throughout.
