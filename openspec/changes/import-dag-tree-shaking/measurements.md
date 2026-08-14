# Measurements

Recorded during implementation. Task 1.x is the before-side; later tasks fill in the after-side.

## 1.1 — Baseline, minimal program

Program: `(display (car (list 1 2)))`. Both ship doors, at `1b6771a`, `-O2 -flto`.

| | Chez driver | `emit build` |
|---|---|---|
| delivered binary | **110,472 B** | **110,472 B** |
| distinct `emit.internal:*` symbols in the binary | **161** | **161** |
| of those, `rd-*` reader bindings | **55** | **55** |
| distinct `scheme.base:*` symbols | **3** | **3** |
| value | `1` | `1` |

The two doors agree exactly, which is the `aot-codegen` cross-door requirement holding at baseline.

The three `scheme.base:*` symbols are `__inited`, `list`, `code:list`. So the delivered executable
carries **161 substrate symbols to support 1 standard-library binding.**

Unit IR, as built into `build/lib`:

| unit | committed size | linked into the minimal program |
|---|---|---|
| `scheme.base.ll` | 592,185 B | **7,331 B** — shaken, 1 export reached |
| `emit.internal.ll` | 348,536 B | **348,536 B** — not shaken |

**`docs/PERFORMANCE.md` P10's figures are stale, in the direction that strengthens the case.** The
entry records 338,670 B for `scheme.base.ll` and 170,716 B / 114 defines for `emit.internal.ll`; both
libraries have roughly doubled since it was written. The dead payload is ~348 KB of IR, not ~170 KB.

## 1.2 — What the shaken `(scheme base)` still reaches in the substrate

**Zero.**

```
refs of the form ptr @"emit.internal:..."
  full scheme.base.ll (unshaken)                9
  shaken scheme.base (1 export reached)         0
  the program's own IR                          0
```

So for this program the correct root set for `(emit internal)` is **empty**. The design's open
question — whether `%make-port` / `%port-rtd` survive via a kept binding — is answered: they do not.
The full unit reaches only 9 of the substrate's bindings to begin with, and a `(scheme base)` pruned
to `list` reaches none of them.

**The floor is set by `cmd-roots`, and it is low.** `compile-library*` always keeps a top-level
*command* (a body form that defines no name) and roots whatever it references. The substrate's
`(begin ...)` body has **88 top-level forms and none of them is a command** — every one is a
`define`, `define-syntax`, or `define-record-type`. So the source contributes no `cmd-roots`.

One thing to confirm at task 3.5 rather than assume: `cmd-roots` is computed **after** expansion, and
`define-record-type` may expand to a define plus a command that initializes the type cell
(`emit.internal:%port-rtd-cell` appears in the baseline symbol list). If so, the floor is the
record-type plumbing rather than literally nothing. Either way the expected result is a substrate
pruned to a small fraction of 348,536 B, which is what task 7.1 asserts.

## 1.3 — The D7 gate: shaking a library to its own exported interface

Each library compiled twice — whole, and with its candidate set (exports plus what its exported
macros' templates reach) passed as `keep-roots`.

| library | exports | roots | whole | interface-shaken | removed | defines kept |
|---|---|---|---|---|---|---|
| `(emit internal)` | 79 | 79 | 348,536 B | 348,551 B | **−15 B (0%)** | 174 / 174 |
| `(scheme read)` | 1 | 1 | 32,828 B | 32,828 B | **0 B (0%)** | 12 / 12 |
| `(scheme base)` | 157 | 163 | 592,185 B | 589,506 B | **2,679 B (0.45%)** | 487 / 491 |

**Verdict: far under the 10% threshold on all three.** This is exactly what issue #104 predicted —
*"a well-kept library may lose nothing at all"* — and these libraries are well-kept: every internal
helper exists because an export reaches it. `(scheme base)` gives up 4 defines out of 491; the other
two give up nothing.

**A second finding, and it is the one that matters for design D6.** `(emit internal)`
interface-shaken is **15 bytes larger** than whole, while keeping all 174 defines. So the pruned path
is not byte-identical to the unpruned path *even when it prunes nothing* — the difference is in the
emitted `__init`, not in the binding set. Had `emit lib` shaken by default, the `emit-cli`
byte-identity guarantee would have broken for every library, including the ones that lose nothing.
D6's opt-in design was the right call for a reason stronger than the one it was argued from.

## 1.4 — Decision: group 6 is dropped

Per the threshold stated in advance (under 10% on both named libraries), the `emit lib --shake` half
of this change **is not built**. The measurement above is the deliverable, the `emit-cli` delta is
withdrawn, and issue #104 is answered with these numbers rather than with an implementation.

What remains in scope is P10 — backward root propagation through the import DAG — which 1.1 and 1.2
show is worth ~348 KB of IR and 161 of 164 symbols in a minimal binary.

## 3.5 / 4.6 — After: both doors, same minimal program

| | before | after | |
|---|---|---|---|
| delivered binary | 110,472 B | **52,152 B** | **−52.8%** |
| `emit.internal:*` symbols | 161 | **1** | `__inited` only |
| `rd-*` reader bindings | 55 | **0** | |
| substrate IR linked | 348,536 B | **5,965 B** | −98.3% |
| `scheme.base:*` symbols | 3 | 3 | unchanged |
| value | `1` | `1` | unchanged |

**The two doors agree byte-for-byte** (52,152 B each), which is a stronger result than the
`aot-codegen` requirement asks for — it requires only "the same order of size".

The substrate's pruned unit contains **two defines: `__init` and nothing else.** The open question
from 1.2 is settled — `define-record-type` leaves no top-level command, so `cmd-roots` is empty
post-expansion as well as in source, and the floor is an empty initializer rather than the
record-type plumbing.

**The counterpart direction.** A program that reads (`read-all-from-string`) keeps **55** `rd-*`
bindings and shakes the substrate only 348,399 → 332,032 B (−4.7%). Both doors. That is the
assertion that fails if the shake is too aggressive, and it is why it is in the suite alongside the
absence check.

## Protocol cost (design risk: mode 17 carries more text)

Not measured precisely, and it does not need to be: the root text handed across the door for unit
*i* is the program's IR plus the pruned IR of the units after it, so the total copied across a build
is bounded by (program IR + all pruned units) × unit count. The shipped closure is 3 units and the
pruned units are single-digit KB, so for the minimal program this is ~20 KB per call. The
importer-only narrowing from design D1 stays available if a deep closure ever makes it matter.

## Regen

809s, converged at **fixed-point iteration 1** — CLAUDE.md predicts iteration 2 (~22 min) for a run
following a compiler-source edit. Only `bootstrap/embed-repl.ll` changed: the `src/core.ss` edit was
comments plus a local parameter rename and produced no IR delta, and `src/repl-core.ss` reaches only
the REPL embed. The other four committed artifacts are byte-identical.
