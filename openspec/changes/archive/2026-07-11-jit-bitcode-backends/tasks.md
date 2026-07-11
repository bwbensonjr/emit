## 1. Bitcode backend

- [x] 1.1 Add a step to emit `OUT.bc` from `OUT.ll` (`llvm-as`), reusing the existing `.ll` emission
- [x] 1.2 Confirm the `.bc` loads/inspects (`llvm-dis` round-trip or `opt -passes=verify`)

## 2. JIT backend (lli)

- [x] 2.1 Compile the runtime to bitcode once (`clang -emit-llvm -c runtime.c -o runtime.bc`)
- [x] 2.2 Link program + runtime bitcode (`llvm-link OUT.bc runtime.bc -o combined.bc`)
- [x] 2.3 Run via `lli` with `libgc` loaded (`lli -load <gc-lib>/libgc.* combined.bc`); capture stdout
- [x] 2.4 Confirm `GC_INIT`/`main` run correctly under `lli` and the program value is reported

## 3. Backend selector

- [x] 3.1 Add `--backend aot|jit|bitcode` to `src/compile.ss` (or a thin `src/run.ss`), default `aot`
- [x] 3.2 Confirm existing invocations (no flag) produce a native executable exactly as before
- [x] 3.3 Fail with a clear message if `lli`/`llvm-as`/`llvm-link` are missing or version-skewed

## 4. Equivalence harness

- [x] 4.1 Add `demos/run-backends.sh` running each demo through AOT, JIT, and bitcode
- [x] 4.2 Assert byte-identical stdout across the three backends per demo; fail on any divergence or error
- [x] 4.3 Include the allocation-heavy demos and the 10M `countdown` (GC + `musttail` under `lli`)

## 5. Verify and document

- [x] 5.1 Run the harness; confirm all demos agree across all three backends
- [x] 5.2 Confirm no changes to `src/emit.ss` or `src/runtime/runtime.c`
- [x] 5.3 Note the `lli`/`llvm-as`/`llvm-link` + `libgc`-load requirements in `src/TOOLCHAIN.md` and reconcile `LLVM.md`'s Backends section (JIT/bitcode now realized)

## 6. Spec sync

- [x] 6.1 Sync the new `backends` capability spec into `openspec/specs/`
