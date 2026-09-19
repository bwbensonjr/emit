// orc-native-object-probe.cpp -- prove the native cache's LLVM integration seam.
//
// LLVM 19 through 22 expose the same APIs used here: ObjectCache,
// LLJITBuilder::setCompileFunctionCreator, ConcurrentIRCompiler(ObjectCache *), and
// LLJIT::addObjectFile. Keeping their use in one adapter is sufficient; no
// version-conditioned wrapper is required for the supported range today.

#include "llvm/AsmParser/Parser.h"
#include "llvm/ExecutionEngine/ObjectCache.h"
#include "llvm/ExecutionEngine/Orc/CompileUtils.h"
#include "llvm/ExecutionEngine/Orc/ExecutionUtils.h"
#include "llvm/ExecutionEngine/Orc/LLJIT.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

#include <cstdint>
#include <map>
#include <memory>
#include <string>

using namespace llvm;
using namespace llvm::orc;

extern "C" int64_t probe_host_add(int64_t a, int64_t b) { return a + b; }

class CapturingObjectCache final : public ObjectCache {
public:
  void notifyObjectCompiled(const Module *module, MemoryBufferRef object) override {
    objects[module->getModuleIdentifier()] = object.getBuffer().str();
  }

  std::unique_ptr<MemoryBuffer> getObject(const Module *) override { return nullptr; }

  std::map<std::string, std::string> objects;
};

static Expected<std::unique_ptr<LLJIT>> make_jit(ObjectCache *cache) {
  LLJITBuilder builder;
  if (cache) {
    builder.setCompileFunctionCreator(
        [cache](JITTargetMachineBuilder target)
            -> Expected<std::unique_ptr<IRCompileLayer::IRCompiler>> {
          return std::make_unique<ConcurrentIRCompiler>(std::move(target), cache);
        });
  }
  auto jit = builder.create();
  if (!jit) return jit.takeError();
  auto generator = DynamicLibrarySearchGenerator::GetForCurrentProcess(
      (*jit)->getDataLayout().getGlobalPrefix());
  if (!generator) return generator.takeError();
  (*jit)->getMainJITDylib().addGenerator(std::move(*generator));
  return jit;
}

static Expected<ThreadSafeModule> parse_module(LLJIT &jit, StringRef identifier,
                                                StringRef source) {
  auto context = std::make_unique<LLVMContext>();
  SMDiagnostic diagnostic;
  auto module = parseAssemblyString(source, diagnostic, *context);
  if (!module) {
    std::string message;
    raw_string_ostream output(message);
    diagnostic.print("orc-native-object-probe", output);
    return createStringError(inconvertibleErrorCode(), output.str());
  }
  module->setModuleIdentifier(identifier);
  module->setDataLayout(jit.getDataLayout());
  return ThreadSafeModule(std::move(module), std::move(context));
}

static Error add_ir(LLJIT &jit, StringRef identifier, StringRef source) {
  auto module = parse_module(jit, identifier, source);
  if (!module) return module.takeError();
  return jit.addIRModule(std::move(*module));
}

static Error run_probe() {
  CapturingObjectCache cache;
  auto cold = make_jit(&cache);
  if (!cold) return cold.takeError();

  constexpr StringLiteral helper_ir = R"(
    declare i64 @probe_host_add(i64, i64)
    define i64 @probe_double(i64 %x) {
      %sum = call i64 @probe_host_add(i64 %x, i64 %x)
      ret i64 %sum
    }
  )";
  constexpr StringLiteral entry_ir = R"(
    declare i64 @probe_double(i64)
    define i64 @probe_entry() {
      %answer = call i64 @probe_double(i64 21)
      ret i64 %answer
    }
  )";

  if (Error error = add_ir(**cold, "probe-helper", helper_ir)) return error;
  if (Error error = add_ir(**cold, "probe-entry", entry_ir)) return error;
  auto cold_entry = (*cold)->lookup("probe_entry");
  if (!cold_entry) return cold_entry.takeError();
  using Entry = int64_t (*)();
  if (cold_entry->toPtr<Entry>()() != 42)
    return createStringError(inconvertibleErrorCode(), "cold IR returned the wrong value");
  if (cache.objects.size() != 2)
    return createStringError(inconvertibleErrorCode(), "expected two captured objects, got %zu",
                             cache.objects.size());

  auto warm = make_jit(nullptr);
  if (!warm) return warm.takeError();
  for (const auto &item : cache.objects) {
    auto object = MemoryBuffer::getMemBufferCopy(item.second, item.first);
    if (Error error = (*warm)->addObjectFile(std::move(object))) return error;
  }
  auto warm_entry = (*warm)->lookup("probe_entry");
  if (!warm_entry) return warm_entry.takeError();
  if (warm_entry->toPtr<Entry>()() != 42)
    return createStringError(inconvertibleErrorCode(), "cached objects returned the wrong value");

  outs() << "captured 2 objects; cached cross-object and host symbol resolution returned 42\n";
  return Error::success();
}

int main() {
  InitializeNativeTarget();
  InitializeNativeTargetAsmPrinter();
  InitializeNativeTargetAsmParser();
  if (Error error = run_probe()) {
    errs() << "orc-native-object-probe: " << toString(std::move(error)) << "\n";
    return 1;
  }
  return 0;
}
