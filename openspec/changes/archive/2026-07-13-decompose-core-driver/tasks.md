## 1. Extract the pure core

- [x] 1.1 Identify all effectful sites in `src/compile.ss` (target-header `process`, file reads/writes, `system`/clang, CLI parsing, port use).
- [x] 1.2 Extract a pure `compile-source-string : string -> ir-text` (and/or `compile-forms`) covering reader → expander → passes → emit, with no I/O.
- [x] 1.3 Move the host target header out of the core; the driver prepends it to the core's output.

## 2. Reduce the driver to effects

- [x] 2.1 Rewrite the driver to: read source → call the core → prepend header → write `.ll` / invoke clang / JIT / bitcode, preserving all flags.
- [x] 2.2 Route `--repl` through the same core entry point where it already overlaps.

## 3. Core text-filter mode

- [x] 3.1 Add a driver mode: read all of stdin as source, write IR text to stdout (header/toolchain left to the driver/host).

## 4. Verification

- [x] 4.1 Run `./run-all-tests.sh`; confirm all suites pass and emitted IR is byte-identical to before (pure restructuring).
- [x] 4.2 Assert core purity: compile a program via the core with no file/subprocess access and confirm it still yields correct IR.
