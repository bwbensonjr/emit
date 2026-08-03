## ADDED Requirements

### Requirement: The public surface of (scheme base) is declared, not derived

The set of names `(scheme base)` exports SHALL be **declared** in a single artifact of the tree, and
SHALL NOT be a mechanical consequence of which definitions the prelude happens to contain. A prelude
definition that is not part of the declared surface SHALL remain in the library's **body** — the
exported procedures call it — while being absent from the `export` list, so it is neither in scope in
a program that imports `(scheme base)` nor part of the published surface.

Every derivation of the export list SHALL read that one declaration, so the Chez-hosted driver (which
resolves the committed `lib/scheme/base.sld`) and the Chez-free portable derivation (which builds
`(scheme base)` from the compiler's baked-in prelude source) SHALL produce **identical export lists
in identical order**. The order SHALL be the prelude's own definition order, so the declaration's
internal arrangement cannot affect emitted IR.

Adding a prelude definition SHALL force a visibility decision: a definition that is neither declared
private nor present in the committed export list SHALL fail a test that runs in the default suite
(one that does not require Chez), rather than defaulting to public. A declaration that has rotted —
a private name the prelude no longer defines, a private name that is a macro, or a duplicated
export — SHALL be reported as an error rather than silently producing a different surface.

The declared surface SHALL distinguish three tiers, so a name's status is legible: names R7RS-small
defines; **extensions**, which Emit adds with no R7RS home; and names exported only because some
consumer outside the library must resolve them, which carry no stability guarantee and SHALL each
record the reason they are exported.

#### Scenario: An internal helper is not in scope in a user program

- **WHEN** a program with no explicit import references a prelude-internal name such as `rd-atom`
  or `%map1`, and is compiled on any door
- **THEN** compilation fails with an unbound-variable error, while a program referencing a public
  name such as `map` in the same position still compiles and runs

#### Scenario: A new prelude definition cannot become public by accident

- **WHEN** a definition is added to the prelude and is neither listed as private nor reflected in the
  committed export list
- **THEN** the default (Chez-free) test suite fails, and the author's only ways forward are to
  declare the definition private or to commit the diff that publishes it

#### Scenario: A rotted declaration is an error, not a silent surface change

- **WHEN** the export list is generated while the declaration names a private binding the prelude
  does not define, names a `define-syntax`, or would yield a duplicate export
- **THEN** generation fails with a message naming the offending names

#### Scenario: The two derivations agree

- **WHEN** the same program is compiled by the Chez-hosted driver and by the Chez-free portable
  derivation
- **THEN** both resolve `(scheme base)` against the same export list in the same order, and the
  emitted program module is byte-identical between the two doors

#### Scenario: A private binding still serves the procedures that call it

- **WHEN** an exported procedure whose implementation calls a private helper (e.g. the reader's
  entry point over its lexeme helpers) is called from an importing program
- **THEN** it behaves exactly as before, because the helper is present in the library body and the
  library's intra-unit calls resolve internally

### Requirement: A name an exported macro template mentions is exported under that spelling

A macro a library exports (or that the compiler carries as `(scheme base)`'s compile-time half) is
instantiated in the **importer's** scope. Therefore every name its template mentions that is not a
core form, a primitive, or a binding the template itself introduces SHALL be exported by that library
under **exactly the spelling the template uses**; otherwise the expansion's reference is subject to
hygienic renaming in the importer and fails as an unbound variable at lowering.

It follows that `(rename internal external)` SHALL NOT be used to hide a name a template mentions:
the renamed export keys the importer's environment under the external name, leaving the internal
spelling in the template unresolvable. A name a template mentions that is not intended as public API
SHALL instead be recorded in the declared surface as exported-but-unstable, with its reason, or the
template SHALL be rewritten to mention only public names.

#### Scenario: A derived form whose template calls a helper works in an importing program

- **WHEN** a program with no explicit import uses a derived form whose expansion calls a prelude
  procedure (e.g. `guard`, whose template calls the handler installer, or `parameterize`)
- **THEN** the expansion compiles and runs, because that procedure is exported under the spelling
  the template uses

#### Scenario: Hiding a template's helper by renaming it away breaks the form

- **WHEN** a name a template mentions is exported only under a different external name via
  `(rename …)`
- **THEN** a program using that derived form fails to compile with an unbound variable, which is why
  the mechanism is prohibited for template names

## MODIFIED Requirements

### Requirement: Prelude split into (scheme base) runtime and macro halves

The compiler SHALL treat the standard prelude as the library `(scheme base)`, split into two
halves driven from one prelude source: a **runtime half** — the prelude's procedure
definitions, compiled as a `(define-library (scheme base) …)` unit that exports its **declared
public surface** (see "The public surface of (scheme base) is declared, not derived") and is linked
(AOT) / loaded (REPL) like any library — and a **compile-time half** — the
prelude's derived-form macros (`and`, `or`, `when`, `unless`, `let*`, `cond`, `case`,
`guard`, and their helpers), carried by the compiler as a macro set rather than emitted into
the artifact. The runtime half SHALL be compiled with the derived-form macros in scope,
because prelude procedures use them internally. Every prelude definition SHALL be present in the
unit's body whether or not it is exported, so a private helper is available to the procedures that
call it. The two halves SHALL stay consistent with the
single prelude source (no divergent hand-maintained copies).

#### Scenario: The runtime half is a linkable/loadable library exporting the prelude procedures

- **WHEN** `(scheme base)` is compiled
- **THEN** it produces `scheme.base.ll` + `scheme.base.exports` exporting the prelude's declared
  public procedures (e.g. `map`, `assq`, `append`) and not its internal helpers, with a guarded
  `@"scheme.base:__init"` and no `@scheme_entry`

#### Scenario: The runtime half compiles using the derived-form macros

- **WHEN** a prelude procedure whose body uses `cond`/`case` (e.g. `case` expands to `memv`)
  is compiled into the `(scheme base)` unit
- **THEN** the derived-form macros are in scope for that compilation and the unit compiles
  without an unbound-macro error

#### Scenario: Curating the surface does not change the library's emitted code

- **WHEN** names are removed from `(scheme base)`'s export list with no change to the prelude's
  definitions
- **THEN** the emitted library IR is byte-identical (library emission and code labels are derived
  from binding names, not export status), and only importing **program** modules change — each loses
  one external-global declaration per removed export
