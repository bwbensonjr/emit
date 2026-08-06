## ADDED Requirements

### Requirement: An installed binary carries its build-time toolchain as a last-resort default

The values the build resolved for the C toolchain — the C compiler and the Boehm libgc include and
library directories — SHALL be recorded in the binary at build time and consulted as the **lowest
precedence** source when a delivering door needs them. The full precedence ladder SHALL be:

1. explicit environment overrides (`CC`, `GC_INC`, `GC_LIB`, and the `EMIT_GC_*` mirrors);
2. discovery through the shared toolchain-discovery script;
3. the compiled-in build-time defaults.

Placing the compiled-in values last is required, not incidental: a recorded path is the stalest
information available, so a live discovery result SHALL always win over it. The compiled-in values
exist for the case where discovery finds nothing — notably an installation whose LLVM is present but
off `PATH`, where neither `clang` nor `llvm-config` is discoverable without knowing the keg's
location.

When a door falls through to the compiled-in defaults and they do not work, the resulting failure
SHALL name the compiled-in path and identify it as a build-time default, so the user learns that the
toolchain the binary was built against has moved rather than seeing only the compiler's own error.

The recorded values SHALL be set by the same build that resolves them, so they cannot disagree with
what the project actually built against, and SHALL follow the `PREFIX`/`DESTDIR` convention already
used for the compiled-in installation prefix: staging into a temporary root SHALL NOT change the
recorded toolchain.

#### Scenario: An installed door links with no toolchain in the environment

- **WHEN** `emit build` is invoked from an installed prefix with no `CC`, `GC_INC`, or `GC_LIB` set,
  on the machine the binary was built on
- **THEN** it resolves a toolchain and produces a working executable, falling through to the
  compiled-in defaults if discovery yields nothing

#### Scenario: Discovery still wins over the compiled-in defaults

- **WHEN** a door needs the toolchain, the compiled-in defaults are present, and the discovery
  script also resolves a toolchain
- **THEN** the discovered values are used, so a toolchain upgraded after Emit was installed is
  followed rather than ignored

#### Scenario: An explicit override still wins over both

- **WHEN** `CC`, `GC_INC`, and `GC_LIB` are set explicitly
- **THEN** those values are used without consulting discovery or the compiled-in defaults

#### Scenario: A stale compiled-in default fails legibly

- **WHEN** a door falls through to the compiled-in defaults and the recorded location no longer
  provides the required tools
- **THEN** the failure names the recorded path and identifies it as a build-time default, rather
  than surfacing only the underlying compiler error
