#ifndef EMIT_EXPLICIT_ARTIFACT_H
#define EMIT_EXPLICIT_ARTIFACT_H

#include <array>
#include <cctype>
#include <string>

// A deliberately small wire format, not a second Scheme reader. The outer
// datum has a fixed tag/version and exactly eleven string fields. Scheme
// registration/export datums are opaque strings parsed by the compiler core.
struct ExplicitArtifact {
  enum Field {
    Kind, Key, Executable, RuntimeAbi, Target, Source, Sources, Dependencies,
    IrDigest, ExportsDigest, Registration, Count
  };
  std::array<std::string, Count> fields;
};

static inline std::string artifact_identity_error(const ExplicitArtifact &artifact,
                                           const std::string &key,
                                           const std::string &executable,
                                           const std::string &runtime_abi,
                                           const std::string &target,
                                           const std::string &source) {
  using A = ExplicitArtifact;
  const auto &f = artifact.fields;
  if (f[A::Kind] != "full" || f[A::Key] != key) return "unit kind or library identity";
  if (executable.empty() || f[A::Executable] != executable)
    return "executable identity changed or unavailable";
  if (f[A::RuntimeAbi] != runtime_abi || f[A::Target] != target)
    return "runtime ABI or target changed";
  if (f[A::Source] != source) return "selected provider changed";
  return "";
}

static inline std::string artifact_quote(const std::string &value) {
  static const char hex[] = "0123456789abcdef";
  std::string out = "\"";
  for (unsigned char c : value) {
    switch (c) {
      case '\\': out += "\\\\"; break;
      case '"': out += "\\\""; break;
      case '\n': out += "\\n"; break;
      case '\r': out += "\\r"; break;
      case '\t': out += "\\t"; break;
      default:
        if (c < 32 || c == 127) {
          out += "\\x";
          out += hex[c >> 4]; out += hex[c & 15]; out += ';';
        } else out += static_cast<char>(c);
    }
  }
  return out + "\"";
}

static inline std::string artifact_text(const ExplicitArtifact &artifact) {
  std::string out = "(emit-artifact 1";
  for (const std::string &field : artifact.fields)
    out += "\n  " + artifact_quote(field);
  return out + ")\n";
}

static inline bool artifact_parse(const std::string &text, ExplicitArtifact &result) {
  size_t at = 0;
  auto whitespace = [&]() {
    while (at < text.size() && std::isspace(static_cast<unsigned char>(text[at]))) ++at;
  };
  whitespace();
  const std::string prefix = "(emit-artifact 1";
  if (text.compare(at, prefix.size(), prefix) != 0) return false;
  at += prefix.size();
  ExplicitArtifact parsed;
  for (std::string &field : parsed.fields) {
    if (at == text.size() || !std::isspace(static_cast<unsigned char>(text[at]))) return false;
    whitespace();
    if (at == text.size() || text[at++] != '"') return false;
    bool closed = false;
    while (at < text.size()) {
      unsigned char c = text[at++];
      if (c == '"') { closed = true; break; }
      if (c == '\\') {
        if (at == text.size()) return false;
        c = text[at++];
        switch (c) {
          case 'n': field += '\n'; break;
          case 'r': field += '\r'; break;
          case 't': field += '\t'; break;
          case '\\': field += '\\'; break;
          case '"': field += '"'; break;
          case 'x': {
            unsigned int value = 0;
            for (int i = 0; i < 2; ++i) {
              if (at == text.size()) return false;
              char digit = text[at++];
              if (digit >= '0' && digit <= '9') value = value * 16 + digit - '0';
              else if (digit >= 'a' && digit <= 'f') value = value * 16 + digit - 'a' + 10;
              else return false;
            }
            if (at == text.size() || text[at++] != ';') return false;
            field += static_cast<char>(value);
            break;
          }
          default: return false;
        }
      } else {
        if (c < 32 || c == 127) return false;
        field += static_cast<char>(c);
      }
    }
    if (!closed) return false;
  }
  whitespace();
  if (at == text.size() || text[at++] != ')') return false;
  whitespace();
  if (at != text.size()) return false;
  result = parsed;
  return true;
}

#endif
