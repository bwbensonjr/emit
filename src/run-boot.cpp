// run-boot.cpp -- the BATCH bootstrap runner (change: run-door-user-libraries,
// decision X).  This is the original in-process runner: it A-links the batch
// embedded compiler (bootstrap/embed.ll) whose `scheme_entry` reads the program
// from stdin and returns emitted IR.  It exists ONLY so `tools/regen.sh` can drive
// the self-hosting fixed point with a minimal batch compiler (build/emit-boot);
// the SHIPPED runner is the mode-dispatched, module-aware run door -- `emit run`
// (build/emit, src/emit.cpp).  Keeping this batch runner separate leaves the proven
// bootstrap fixed point byte-for-byte unchanged.  (Originally change: path-a-embedding.)
//
// One process, no Chez and no clang/lli: the compiled compiler is linked into
// this binary (bootstrap/embed.ll -> its ccc `scheme_entry` reads the program
// source from stdin, prepends the baked-in prelude, and RETURNS the emitted IR
// as a scheme string).  This host calls that entry, reads the IR bytes back
// through the runtime's exported string accessors, JIT-compiles the IR with
// ORC/LLJIT, looks up the program's own `scheme_entry`, runs it, and prints the
// value -- exactly the value the standalone AOT executable would print.
//
// Usage:  build/emit-boot < program.scm
//         build/emit-boot --emit < program.scm > program.ll   (Chez-free AOT)
//
// With --emit (change: self-hosting-completion, design D7) the runner does NOT
// JIT: it writes the embedded compiler's emitted IR to stdout and exits.  Piped
// to clang with the runtime, this is a fully Chez-free source->native path
// (see `emit build`), honoring standalone executables as a first-class
// deliverable.  The IR is the SAME bytes the JIT path runs, so what you emit is
// what you'd run in-process -- dev->ship fidelity.

#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/ExecutionEngine/Orc/ExecutionUtils.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/Error.h"

#include <cstdint>
#include <csetjmp>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include <memory>

#include <gc/gc.h>

using namespace llvm;
using namespace llvm::orc;

extern "C" {
  // The embedded compiler's entry (defined by the linked-in bootstrap/embed.ll):
  // reads the program from stdin, returns the emitted IR as a scheme string.
  intptr_t scheme_entry(void);

  void rt_write(intptr_t v);                 // runtime value printer
  intptr_t rt_string_len(intptr_t v);        // bytes of a scheme string value
  const char *rt_string_bytes(intptr_t v);
  extern jmp_buf *rt_trap;                    // runtime trap escape hook
  extern char rt_trap_msg[];                  // last trap's message
  void rt_guard_reset(void);                  // clear guard frames after a trap
}

typedef intptr_t (*entry_t)(void);

int main(int argc, char **argv) {
  bool emit = false;
  bool no_prelude = false;
  int dump_level = 0;
  for (int i = 1; i < argc; i++) {
    std::string a(argv[i]);
    if (a == "--emit") emit = true;
    else if (a == "--no-prelude") no_prelude = true;
    else if (a == "--dump") dump_level = 2;
    else if (a == "--dump-all") dump_level = 3;
  }

  // Forward --no-prelude to the embedded entry (change: embedded-runner-rehome):
  // it reads EMIT_NO_PRELUDE via the %no-prelude? primitive to decide whether to
  // auto-import (scheme base).  Must be set before scheme_entry() runs below.
  if (no_prelude) setenv("EMIT_NO_PRELUDE", "1", 1);

  // Same channel for --dump (change: emit-dump-stages): worth having on the bootstrap
  // runner too, since a regen that miscompiles is exactly when the stages matter.  The
  // dump goes to stderr, so --emit's stdout IR -- what the fixed point compares -- is
  // untouched.
  if (dump_level) setenv("EMIT_DUMP_LEVEL", std::to_string(dump_level).c_str(), 1);

  GC_INIT();                                 // once, before the compiler allocates

  // 1) Compile the program in-process: the linked embedded compiler reads the
  //    source from stdin and returns the emitted IR as a scheme string.  Copy
  //    the bytes out immediately (the buffer is GC-managed).
  intptr_t ir_val = scheme_entry();
  std::string ir(rt_string_bytes(ir_val), (size_t)rt_string_len(ir_val));

  // --emit (design D7): write the emitted IR to stdout and stop -- no JIT.  This
  //    is the Chez-free AOT front half: `emit-boot --emit < prog.scm > prog.ll`,
  //    then clang links prog.ll with the runtime into a native executable.  The
  //    IR here is byte-for-byte what the JIT path below would run.
  if (emit) {
    std::fwrite(ir.data(), 1, ir.size(), stdout);
    std::fflush(stdout);
    return 0;
  }

  // 2) Stand up the JIT and resolve rt_* / GC symbols from this process (the
  //    runtime is linked in; -rdynamic exports the symbols the IR references).
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  InitializeNativeTargetAsmParser();

  auto jitOr = LLJITBuilder().create();
  if (!jitOr) {
    std::cerr << "emit-boot: fatal: failed to create LLJIT: " << toString(jitOr.takeError()) << "\n";
    return 1;
  }
  std::unique_ptr<LLJIT> JIT = std::move(*jitOr);

  auto gen = DynamicLibrarySearchGenerator::GetForCurrentProcess(
      JIT->getDataLayout().getGlobalPrefix());
  if (!gen) {
    std::cerr << "emit-boot: fatal: generator error: " << toString(gen.takeError()) << "\n";
    return 1;
  }
  JIT->getMainJITDylib().addGenerator(std::move(*gen));

  // 3) Parse the emitted IR and add it to the JIT.  The user program defines its
  //    own `scheme_entry`; it is served from the JITDylib, distinct from the
  //    linked compiler's entry (the process generator is only a fallback for the
  //    module's undefined references -- the rt_* runtime functions).
  //
  //    When the prelude is re-homed (change: embedded-runner-rehome) the embedded
  //    entry returns TWO modules -- the (scheme base) library and the program --
  //    joined by a boundary marker, because they cannot share one LLVM module
  //    (each emits a fixed @__apply0 and reset string globals that would collide).
  //    Add each as its own module to the same JITDylib; the program's `external`
  //    references to scheme.base:* resolve against the library module.  With
  //    --no-prelude (or a lone define-library) there is no marker: one module.
  auto addModule = [&](const std::string &text, const char *name) -> bool {
    auto ctx = std::make_unique<LLVMContext>();
    SMDiagnostic err;
    auto buf = MemoryBuffer::getMemBuffer(text, name);
    std::unique_ptr<Module> mod = parseIR(buf->getMemBufferRef(), err, *ctx);
    if (!mod) {
      std::string msg;
      raw_string_ostream os(msg);
      err.print(name, os);
      std::cerr << "emit-boot: parse error: " << os.str() << "\n";
      return false;
    }
    mod->setDataLayout(JIT->getDataLayout());
    if (Error e = JIT->addIRModule(ThreadSafeModule(std::move(mod), std::move(ctx)))) {
      std::cerr << "emit-boot: add error: " << toString(std::move(e)) << "\n";
      return false;
    }
    return true;
  };

  // Split on EVERY boundary, not just the first: the baked standard library is a
  // PARTITION, so the stream is one module per baked member in dependency order and then
  // the program (change: scheme-base-partition).  Add order is irrelevant -- the
  // program's @scheme_entry drives the __init calls in topological order -- but each
  // module must be parsed separately, since each emits a fixed @__apply0 and string
  // globals from a reset counter that would collide in one module.
  const std::string marker = "; ==EMIT-UNIT-BOUNDARY==\n";
  size_t start = 0;
  for (;;) {
    size_t bpos = ir.find(marker, start);
    if (bpos == std::string::npos) break;
    if (!addModule(ir.substr(start, bpos - start), "<unit>")) return 1;
    start = bpos + marker.size();
  }
  if (!addModule(ir.substr(start), "<program>")) return 1;

  Expected<ExecutorAddr> sym = JIT->lookup("scheme_entry");
  if (!sym) {
    std::cerr << "emit-boot: lookup error: " << toString(sym.takeError()) << "\n";
    return 1;
  }
  entry_t fn = sym->toPtr<entry_t>();

  // 4) Run the program.  A runtime trap longjmps back here (as in the REPL host)
  //    so we report it rather than crashing; conservative GC needs no unwinding.
  jmp_buf jb;
  rt_trap = &jb;
  if (setjmp(jb) == 0) {
    intptr_t r = fn();
    rt_write(r);
    std::printf("\n");
    std::fflush(stdout);
  } else {
    rt_guard_reset();   // a trap may have bypassed rt_run_guarded's frame pop
    std::cerr << "emit-boot: trap: " << rt_trap_msg << "\n";
    rt_trap = nullptr;
    return 1;
  }
  rt_trap = nullptr;
  return 0;
}
