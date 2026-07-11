## 1. Skeleton and harness

- [x] 1.1 Create `src/` layout and decide `match`/`util` placement (design Open Q):
      copy `match.sls` + `util.ss` into `src/` for a self-contained production tree
- [x] 1.2 Confirm clang/LLVM 22 and `libgc` are installed (per `LLVM.md` install notes);
      record versions in a short `docs/` or `src/` note
- [x] 1.3 Add an end-to-end test harness (mirroring `spike/nanopass/run.ss`): compile a
      demo, run it, compare output to expected
- [x] 1.4 Add three demo programs: recursive `fact`, a `cons`/list traversal, a `set!`
      counter

## 2. Front end: read to core IL

- [x] 2.1 Read source with host Chez `read`; parse into the core IL (design D2 subset)
- [x] 2.2 Define the named intermediate languages (documented, one per stage) as the
      s-expr shapes each pass consumes/produces
- [x] 2.3 Alpha-rename to globally-unique variables (the promoted passes assume this)
- [x] 2.4 Wire the stage-dump debug flag (design D7): print IL after each pass

## 3. Front end: the pass pipeline

- [x] 3.1 Promote `recognize-let` from spike into `src/` (production)
- [x] 3.2 Promote `convert-assignments` (fix box representation per design Open Q)
- [x] 3.3 Promote `convert-closures`
- [x] 3.4 Implement `lambda-lift`: hoist closed code to top-level definitions
- [x] 3.5 Implement closure/allocation lowering: closures become heap objects
      `{ code_ptr, env... }`; calls become indirect through `code_ptr`

## 4. Runtime (C + Boehm GC)

- [x] 4.1 Define the tagged-value representation in C (immediates + header-tagged heap
      objects), matching `LLVM.md`
- [x] 4.2 Implement primitives: `+ - * = <`, `cons car cdr`, `null? pair? eq?`
- [x] 4.3 Allocation through `libgc`; box object for assignment-converted variables
- [x] 4.4 Tag-walking value printer (for observing/testing results)
- [x] 4.5 C-convention `main` entry that invokes the compiled program, prints its value
      via the tag-walking printer to stdout, and exits 0 on success / nonzero on error
      (design R1)

## 5. LLVM IR emitter

- [x] 5.1 Emit textual `.ll` (opaque `ptr`, LLVM 22) for the lowered IL
- [x] 5.2 Emit the single internal calling convention; mark tail calls `musttail`
- [x] 5.3 Emit indirect closure calls and heap-object access (GEP/load/store with
      element types carried explicitly)
- [x] 5.4 Bridge to C-convention runtime primitives

## 6. Driver and end-to-end

- [x] 6.1 Driver: compile source → `.ll`, invoke `clang` to link IR + runtime + `libgc`
- [x] 6.2 Run all three demos end to end; confirm results via the harness
- [x] 6.3 Verify the deep tail-recursion demo runs in bounded stack (`musttail` works)

## 7. Documentation

- [x] 7.1 Update `docs/PIPELINE.md` with the realized pass list and IL shapes
- [x] 7.2 Short `src/README.md`: how to build and run a program, and the stage-dump flag
