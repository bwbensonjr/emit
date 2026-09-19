#include "../src/native-cache.h"

#include <iostream>
#include <string>
#include <vector>

static NativeJitSignature fixture() {
  NativeJitSignature signature;
  signature.executable = "emit-digest";
  signature.llvm = "LLVM 22.1.4";
  signature.target_triple = "arm64-apple-darwin";
  signature.data_layout = "e-m:o-i64:64-i128:128-n32:64-S128";
  signature.cpu = "apple-m1";
  signature.features = "+aes,+crc,-foo";
  signature.relocation_model = "pic";
  signature.code_model = "small";
  signature.optimization_profile = "-O1";
  return signature;
}

int main() {
  NativeJitSignature baseline = fixture();
  if (baseline.key() != fixture().key()) {
    std::cerr << "identical signatures produced different keys\n";
    return 1;
  }
  NativeJitSignature reordered = fixture();
  reordered.features = "-foo,+crc,+aes";
  if (baseline.key() != reordered.key()) {
    std::cerr << "feature ordering changed the canonical key\n";
    return 1;
  }

  std::vector<NativeJitSignature> changed;
  NativeJitSignature value = fixture(); value.format++; changed.push_back(value);
  value = fixture(); value.executable += "-new"; changed.push_back(value);
  value = fixture(); value.llvm += "-new"; changed.push_back(value);
  value = fixture(); value.target_triple += "-new"; changed.push_back(value);
  value = fixture(); value.data_layout += "-new"; changed.push_back(value);
  value = fixture(); value.cpu += "-new"; changed.push_back(value);
  value = fixture(); value.features += ",+new"; changed.push_back(value);
  value = fixture(); value.relocation_model += "-new"; changed.push_back(value);
  value = fixture(); value.code_model += "-new"; changed.push_back(value);
  value = fixture(); value.optimization_profile = "-O2"; changed.push_back(value);

  for (size_t i = 0; i < changed.size(); ++i) {
    if (baseline.key() == changed[i].key()) {
      std::cerr << "modeled signature input " << i << " did not change the key\n";
      return 1;
    }
  }
  std::cout << "native JIT signature is stable and covers 10 modeled inputs\n";
  return 0;
}
