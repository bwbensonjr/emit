// Test-only inspector/mutator for disposable artifact fixtures.
#include "../src/explicit-artifact.h"
#include "../src/native-cache.h"
#include <fstream>
#include <iostream>
#include <iterator>
#include <map>

static std::string bytes(const std::string &path) {
  std::ifstream input(path, std::ios::binary);
  return std::string(std::istreambuf_iterator<char>(input), {});
}

int main(int argc, char **argv) {
  if (argc < 3) return 2;
  std::string action = argv[1], stem = argv[2];
  ExplicitArtifact artifact;
  if (!artifact_parse(bytes(stem + ".artifact"), artifact)) return 1;
  using A = ExplicitArtifact;
  auto &f = artifact.fields;
  if (action == "verify" && argc == 5) {
    const std::string executable = bytes(argv[3]);
    return !(f[A::Kind] == "full" && !executable.empty() &&
             f[A::Executable] == native_fnv1a_hex(executable) && f[A::Source] == argv[4] &&
             f[A::IrDigest] == native_fnv1a_hex(bytes(stem + ".ll")) &&
             f[A::ExportsDigest] == native_fnv1a_hex(bytes(stem + ".exports")) &&
             !f[A::RuntimeAbi].empty() && !f[A::Target].empty() &&
             !f[A::Sources].empty() && !f[A::Registration].empty());
  }
  if (action == "rehash") {
    f[A::IrDigest] = native_fnv1a_hex(bytes(stem + ".ll"));
    f[A::ExportsDigest] = native_fnv1a_hex(bytes(stem + ".exports"));
  } else if (action == "set" && argc == 5) {
    const std::map<std::string, A::Field> names = {
      {"kind", A::Kind}, {"executable", A::Executable}, {"abi", A::RuntimeAbi},
      {"target", A::Target}, {"source", A::Source}, {"dependencies", A::Dependencies},
      {"registration", A::Registration}
    };
    auto found = names.find(argv[3]);
    if (found == names.end()) return 2;
    f[found->second] = argv[4];
  } else return 2;
  std::ofstream output(stem + ".artifact", std::ios::binary | std::ios::trunc);
  output << artifact_text(artifact);
  return output.good() ? 0 : 1;
}
