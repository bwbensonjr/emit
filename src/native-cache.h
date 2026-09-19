#ifndef EMIT_NATIVE_CACHE_H
#define EMIT_NATIVE_CACHE_H

#include <algorithm>
#include <cstdint>
#include <iomanip>
#include <sstream>
#include <string>
#include <vector>

static const int kNativeCacheVersion = 1;

static std::string native_fnv1a_hex(const std::string &bytes) {
  uint64_t hash = 14695981039346656037ULL;
  for (unsigned char byte : bytes) {
    hash ^= static_cast<uint64_t>(byte);
    hash *= 1099511628211ULL;
  }
  std::ostringstream output;
  output << std::hex << std::setw(16) << std::setfill('0') << hash;
  return output.str();
}

static std::string normalize_native_features(const std::string &features) {
  std::istringstream input(features);
  std::vector<std::string> items;
  std::string item;
  while (std::getline(input, item, ','))
    if (!item.empty()) items.push_back(item);
  std::sort(items.begin(), items.end());
  std::ostringstream output;
  for (size_t i = 0; i < items.size(); ++i) {
    if (i) output << ',';
    output << items[i];
  }
  return output.str();
}

struct NativeJitSignature {
  int format = kNativeCacheVersion;
  std::string executable;
  std::string llvm;
  std::string target_triple;
  std::string data_layout;
  std::string cpu;
  std::string features;
  std::string relocation_model;
  std::string code_model;
  std::string optimization_profile;

  std::string text() const {
    std::ostringstream output;
    output << "format=" << format << "\n"
           << "executable=" << executable << "\n"
           << "llvm=" << llvm << "\n"
           << "target_triple=" << target_triple << "\n"
           << "data_layout=" << data_layout << "\n"
           << "cpu=" << cpu << "\n"
           << "features=" << normalize_native_features(features) << "\n"
           << "relocation_model=" << relocation_model << "\n"
           << "code_model=" << code_model << "\n"
           << "optimization_profile=" << optimization_profile << "\n";
    return output.str();
  }

  std::string key() const { return native_fnv1a_hex(text()); }
};

#endif
