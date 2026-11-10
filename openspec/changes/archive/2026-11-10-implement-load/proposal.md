# Proposal

## Why

Issue #177 requests the familiar Scheme `load` procedure while preserving Emit's shared compiler and small standalone executables. Pairing it with #176 lets the same host integration and output tests establish quiet program execution and quiet loaded-form evaluation.

## What Changes

- Add `(scheme load)` exporting a first-class `load` procedure for sequential source evaluation in an interaction environment, using the embedded compiler in `emit repl` and `emit run`.
- Preserve REPL definitions, macros, imports, and existing prospective redefinition semantics across loaded forms; suppress loaded expression result echoes.
- Document the initial implementation restriction: standalone executables report a catchable unsupported-host error rather than embedding LLVM or launching another process. General `eval`, environment construction, and the optional environment argument are deferred.
- Resolve #176: ordinary `emit run` execution emits no host narration by default; verbose execution retains observability and failures remain visible. Preserve existing program final-value reporting and explicit dump behavior.
- Share regression fixtures and one compiler regeneration/acceptance cycle for both issues.

## Capabilities

### New Capabilities

- `source-loading`: Procedure-based source loading, interaction scope, sequential evaluation, nested calls, errors, paths, and host availability.

### Modified Capabilities

- `tooling-observability`: Explicit command-specific exception for quiet ordinary `emit run` execution, retaining verbose narration.

## Impact

Likely changes include `src/emit.cpp`, `src/runtime/runtime.c`, primitive declarations/emission, `src/prelude.scm`, `src/prelude-surface.scm`, generated standard-library partitions, REPL compiler protocol, host tests, and module/output documentation. Implementation takes one minor version bump with a matching changelog section (currently 0.5.1; use 0.6.0 if still current). This proposal alone changes no shipped behavior and takes no bump.

The other open issues were reviewed: #49's diagnostic is already fixed and its remaining interactive library-definition/redefinition work is deferred; #111 disassembly needs independent LLVM symbol-size work; #56 needs macro binding/provenance analysis; #33 is a broad surface audit; #27 concerns numeric representation and `rationalize`. None is a prerequisite. Correct placement of `load` in `(scheme load)` supports #33 without claiming that audit is complete. Included issue links: https://github.com/bwbensonjr/emit/issues/177 and https://github.com/bwbensonjr/emit/issues/176.
