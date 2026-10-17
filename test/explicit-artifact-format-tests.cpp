#include "../src/explicit-artifact.h"
#include <iostream>

int main() {
  int pass = 0, fail = 0;
  auto check = [&](const char *name, bool result) {
    std::cout << (result ? "  [OK  ] " : "  [FAIL] ") << name << '\n';
    result ? ++pass : ++fail;
  };
  ExplicitArtifact original, parsed;
  for (size_t i = 0; i < original.fields.size(); ++i)
    original.fields[i] = "field-" + std::to_string(i);
  for (int i = 0; i < 256; ++i)
    original.fields[ExplicitArtifact::Registration] += static_cast<char>(i);
  const std::string text = artifact_text(original);
  check("all string bytes round-trip", artifact_parse(text, parsed) && parsed.fields == original.fields);
  check("unknown version rejected", !artifact_parse("(emit-artifact 2" + text.substr(16), parsed));
  check("truncated metadata rejected", !artifact_parse(text.substr(0, text.size() - 2), parsed));
  check("trailing datum rejected", !artifact_parse(text + "1", parsed));
  check("extra field rejected", !artifact_parse(text.substr(0, text.size() - 2) + " \"extra\")", parsed));
  check("missing fields rejected", !artifact_parse("(emit-artifact 1 \"full\")", parsed));
  check("bad string escape rejected", !artifact_parse("(emit-artifact 1 \"\\q\")", parsed));
  check("failed parse does not mutate result", parsed.fields == original.fields);
  using A = ExplicitArtifact;
  original.fields[A::Kind] = "full";
  auto identity = [&](const std::string &executable) {
    return artifact_identity_error(original, original.fields[A::Key], executable,
             original.fields[A::RuntimeAbi], original.fields[A::Target], original.fields[A::Source]);
  };
  check("same executable identity accepted", identity(original.fields[A::Executable]).empty());
  check("changed executable identity rejected", !identity("rebuilt").empty());
  check("unavailable executable identity rejected", !identity("").empty());
  original.fields[A::Kind] = "pruned";
  check("pruned units cannot masquerade as full units", !identity(original.fields[A::Executable]).empty());
  std::cout << "artifact format: " << pass << " passed, " << fail << " failed\n";
  return fail ? 1 : 0;
}
