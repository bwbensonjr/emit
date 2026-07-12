## 1. Runtime: header-word scheme + string/char types

- [x] 1.1 Add tag 7 = extended heap object with a header word; define `HDR_STRING`/`HDR_CHAR` type codes
- [x] 1.2 `rt_make_string(const char *bytes, intptr_t len)` → a `{HDR_STRING, length, bytes}` object (copy bytes into GC storage)
- [x] 1.3 `rt_make_char(intptr_t codepoint)` → a `{HDR_CHAR, codepoint}` object (full Unicode scalar value)
- [x] 1.4 `rt_write`: print a string as `"…"` (emit stored UTF-8 bytes verbatim); print a character as `#\` + the codepoint UTF-8-encoded (1–4 bytes), with a minimal named-char set (`#\space`, `#\newline`)

## 2. Codegen: string and char constants

- [x] 2.1 Generalize the private string-constant emitter (from symbols) to emit byte-array literal globals for strings (`@.str.lit.N`, correct length + trailing `\00`, escaping)
- [x] 2.2 `encode-const`: a string constant → `call i64 @rt_make_string(ptr @.str.lit.N, i64 <byte-length>)`
- [x] 2.3 `encode-const`: a char constant → `call i64 @rt_make_char(i64 <codepoint>)`
- [x] 2.4 Strings/chars inside quoted structure compose via the existing `rt_cons` recursion
- [x] 2.5 Add `declare i64 @rt_make_string(ptr, i64)` and `declare i64 @rt_make_char(i64)`

## 3. Frontend: self-evaluating literals

- [x] 3.1 `parse-expr`: add `string?` and `char?` cases producing `(const d)`
- [x] 3.2 Confirm `rename` and the other passes leave string/char consts untouched (no new pass)

## 4. Demos and tests

- [x] 4.1 Demos: string literal prints (`"hello"`), char literal prints (`#\a`), quoted list with a string and char (`(a "b" #\c)`)
- [x] 4.2 Unicode demo: a non-ASCII string (e.g. `"héllo 日本語"`) and a non-ASCII char (`#\λ`) round-trip and print with UTF-8 intact
- [x] 4.3 Add them to `demos/run-tests.sh` with expected values

## 5. Verify

- [x] 5.1 Build and run the demos; confirm string/char printing, the Unicode round-trip, and quoted-structure composition
- [x] 5.2 Run `demos/run-backends.sh`: string/char and Unicode demos agree byte-for-byte across AOT/JIT/bitcode
- [x] 5.3 Confirm existing demos unaffected (only runtime + emit + two parse cases changed)

## 6. Docs and spec sync

- [x] 6.1 Update `LLVM.md` value-representation section (tag 7 = header-word extended objects; strings as UTF-8 byte sequences, chars as Unicode codepoints; tag budget now fully assigned)
- [x] 6.2 Sync `core-language` (added) and `aot-codegen` (modified) deltas into `openspec/specs/`
