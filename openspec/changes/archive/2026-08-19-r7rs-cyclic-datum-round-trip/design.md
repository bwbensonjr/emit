## Context

The in-language reader in `src/prelude.scm` is shared by compiler, REPL, string, and port entry
points. Its recursive descent currently returns `(datum . next-index)` and threads a boolean `ci`
downward; `rd-skip-ws` returns only an index. Input ports retain a source buffer and cursor but no
reader mode. This is why a datum-scoped `#!fold-case` shortcut would be wrong: R7RS directives are
intertoken state applying to the remainder of the source or port.

Mutable pairs and cycle-labelled `write`/`display` are already present. The printer emits `#N=` and
`#N#`, but the reader's `#` dispatcher has no datum-label arm. `list?` is a recursive cdr walk in the
prelude. Contrary to issue #108's original location, `equal?` is the C runtime function
`rt_equal` in `src/runtime/runtime.c` (currently around line 1916); it recursively compares pairs
and vectors without a visited set.

`src/prelude.scm` is baked into the self-hosted compiler. All compiler-source edits must therefore
be complete before the single `make regen` barrier, followed by the prescribed suites.

## Goals / Non-Goals

**Goals:**

- Keep one reader implementation and identical behavior across compiler, REPL, string, and port
  routes.
- Make reader-state lifetimes visible: case mode belongs to the source/port, label bindings belong
  to one outermost datum.
- Preserve linear expected traversal for `equal?` and constant auxiliary space for `list?`.
- Keep reader failures in the existing `rd-fail`/`rd-report` read-error channel.

**Non-Goals:**

- Changing the specified behavior of `length`, `append`, or `list-copy` on circular input.
- Adding `write-shared` or `write-simple`; ordinary `write` continues to label cycles only.
- Reworking the reader into a streaming parser or changing the slurped input-port model.
- General graph serialization for records or other opaque runtime objects.

## Decisions

### D1: One mutable reader state carries persistent case mode

Replace the downward boolean `ci` parameter with a small reader-state value whose case-mode field is
consulted by atom and character-name tokenization. `rd-skip-ws` receives that state, recognizes
properly delimited `#!fold-case` and `#!no-fold-case` as intertoken space, updates the field, and
continues scanning. Because every recursive list/vector boundary already calls `rd-skip-ws`, a
directive takes effect at its exact lexical position and remains in force to the right.

Ordinary string entries create state with folding off; `read-all-from-string-ci` creates it with
folding on. Whole-source readers reuse the state for every top-level datum. An input port gains one
case-mode field, initialized off and copied into/out of the reader state on each `read`, so separate
calls observe earlier directives. The REPL completeness scanner must use the same directive-aware
whitespace path so completeness and actual reading do not diverge.

Only bare identifier tokens and named character tokens consult the mode. Bar-quoted identifiers,
strings, numeric tokens, and single-character character literals retain their present path.

Alternatives considered: treating a directive as a `#;`-like prefix for one datum would pass the
two vendored assertions but violate port persistence; returning `(index . mode)` from every
whitespace scan would spread pair allocation and unpacking across the reader's hot path. A small
mutable state makes the lifetime explicit without changing every result shape.

### D2: Datum labels use a per-outermost-datum environment and delayed fixup

Each outermost read creates a fresh label environment. The `#` dispatcher recognizes a decimal
digit run followed by `=` or `#` before the prefixed-number fallback. A definition installs a
pending entry before recursively reading its datum, which makes a reference inside that datum
representable; a completed definition records the parsed object. A reference to an already
completed entry returns that object directly, preserving sharing without copying.

A reference to a pending entry becomes an internal placeholder carrying the label identity. After
the outermost datum parses, one resolver walks pairs and vectors, replacing placeholders through
`set-car!`, `set-cdr!`, and `vector-set!`. The resolver tracks visited aggregate objects so a fixup
that has already closed a cycle does not recurse forever. An unforgeable per-read marker
distinguishes placeholders from user vectors. A pending definition whose entire value is its own
placeholder is rejected as the R7RS-invalid `#N=#N#` case.

The label environment is discarded before the next outermost datum, including the next `read` on
the same port. Datum comments parse their discarded datum with an isolated label environment so a
definition in commented text cannot leak into live data; the shared case-mode state remains lexical
state. Duplicate definitions, forward/unresolved references, malformed label tokens, and an absent
definition datum return new `rd-fail` reasons handled by `rd-report`.

Alternatives considered: constructing pairs and vectors incrementally would permit immediate
backpatching but would replace the reader's simple reverse-and-build list path. Exposing placeholder
objects to callers would make malformed or incomplete graphs observable. A final mutation pass is
localized and uses aggregate mutators the runtime now supports.

### D3: Constant lowering memoizes object identity and allocates before filling

The existing core-language contract makes constant lowering a necessary part of reader support:
`encode-const` currently descends into a pair before allocating it and re-descends into every vector
occurrence, so a cyclic literal would loop and a shared literal would be copied.

Give one outer constant encoding an `assq`-style identity memo from source objects to emitted SSA
operands. On first seeing a heap constant, reserve its operand in the memo before descending. Pairs
are created with unspecified fields and then filled with `rt_set_car` / `rt_set_cdr`; vectors keep
their allocate-then-fill path but publish the vector operand before visiting elements. Strings,
bytevectors, and other heap constants are memoized after their single allocation so later labelled
references reuse the operand. This preserves back-edges and acyclic sharing on every backend.

The identity memo deliberately uses `eq?`, not `equal?`: two equal but separately written objects
must not become shared merely because they have the same content. Start with the simplest
host-independent identity association that works under both Chez and the self-hosted compiler, and
measure large ordinary constants during implementation. If the lookup cost is material, replace the
association with a private bucketed identity map without changing the reader or emitted topology;
do not silently accept a self-compile regression.

Alternatives considered: keeping bottom-up pair construction cannot represent a back-edge; treating
datum labels as runtime-`read`-only would split the shared compiler/runtime reader and contradict the
existing constant contract; memoizing by `equal?` would incorrectly coalesce distinct constants.

### D4: `equal?` uses a call-local visited table keyed by object pairs

Keep `rt_equal` as the exported two-argument entry and move recursion into a worker receiving a
call-local open-addressed table of ordered `(left-object, right-object)` keys. For distinct pairs or
vectors, the worker first checks the key: a repeated key succeeds immediately; a new key is inserted
before descending. Length/content checks still happen before vector insertion, and strings,
bytevectors, flonums, immediates, and identity-only objects retain their existing comparisons.

The table starts small, grows geometrically, and is allocated only when a comparison reaches two
distinct recursive aggregates. This keeps expected traversal linear, prevents repeated shared
subgraphs from becoming exponential, and lets Boehm reclaim the scratch storage. The coinductive
"already comparing this object pair" rule matches the finite unfoldings of cyclic graphs and still
finds any reachable differing leaf or shape.

Alternatives considered: recording only C-stack ancestors terminates cycles but can revisit shared
subgraphs repeatedly; a linear association list turns equality of long acyclic lists quadratic;
mutating compared objects to mark them is unsafe and visible to the program.

### D5: `list?` uses a tortoise-and-hare cdr walk

Implement `list?` with slow and fast cursors. It returns true only on reaching `()`, false on an
improper tail, and false when the cursors become `eq?`, identifying a circular cdr chain. No pair is
mutated and no visited list is allocated.

Alternatives considered: an `eq?` visited list is simpler to describe but allocates and is
quadratic; delegating to `length` would pull an explicitly excluded procedure into scope and would
still require defining its circular behavior.

### D6: Verification proves topology, not merely printed spelling

Direct tests cover self and multi-node pair cycles, vector cycles, shared acyclic references,
mixed pair/vector graphs, label scope, directives across successive reads, and every malformed-label
class. Round-trip and compiled-constant assertions inspect `eq?` back-edges and sharing as well as
content on JIT and standalone paths; `equal?` tests run under a timeout and include both equal and
unequal cyclic graphs. Existing printer tests remain the authority for the exact `#N=`/`#N#`
spelling.

The four issue-75 and two issue-108 exclusions are deleted only after the direct tests pass. The
R7RS section run and stale-exclusion sweep then verify the vendored forms, including that the two
former timeout cases now finish.

## Risks / Trade-offs

- **[Reader state changes touch every recursive path]** → Update all signatures as one mechanical
  edit, and test directives before, inside, and after lists/vectors plus the REPL completeness path.
- **[A placeholder escapes or a fixup misses an edge]** → Resolve only after a successful outermost
  parse, traverse both pair fields and every vector slot, and assert graph identity directly.
- **[Visited-pair equality accepts a genuinely different cycle]** → Perform type, vector-length,
  and leaf comparisons before/coincident with insertion, and test equal-looking cycles with a late
  differing value and with differing aggregate shapes.
- **[Runtime scratch allocation regresses ordinary equality]** → Preserve the `a == b` and scalar
  fast paths and allocate the table lazily only for distinct pairs/vectors.
- **[Identity memo lookup slows ordinary constant-heavy compilation]** → Measure source-driver and
  self-compile cases before regeneration; retain the simple association only if the cost is
  immaterial, otherwise use a private bucketed identity map.
- **[Compiler and port readers drift]** → Keep parsing and resolution below all public entries;
  entry points differ only in initial/persistent case state and outermost-datum boundaries.

## Migration Plan

This is additive syntax plus termination fixes; no user-data migration is needed. Complete all
prelude, reader-partition, runtime, test, exclusion, and count/documentation edits first. Iterate
with the direct Chez/source tests, then cross the barrier once with `make regen`. Run
`./run-all-tests.sh` followed by `./run-dev-tests.sh` under the repository's prescribed workflow.
Rollback is a normal source/bootstrap revert; no persisted artifact format changes.
