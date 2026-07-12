## 1. Reader in the prelude

- [ ] 1.1 Add `read-from-string` to `src/prelude.scm`, with an internal `read-datum` returning `(datum . next-index)` and a functional position
- [ ] 1.2 Whitespace + `;` line-comment skipping between tokens (char classification via `char->integer` + `=`/`<`)
- [ ] 1.3 Integers: optional sign then digits → fixnum (`acc*10 + (d-48)`)
- [ ] 1.4 Symbols: run of non-delimiter chars → `substring` + `string->symbol` (interned)
- [ ] 1.5 Lists: `( … )` of datums → proper list (empty → `()`); reuse `reverse` for order
- [ ] 1.6 Booleans `#t`/`#f`, characters `#\x` (single codepoint via `string-ref`)
- [ ] 1.7 Strings `" … "` copied verbatim with `substring` (no escapes)
- [ ] 1.8 Quote sugar: `'x` → `(quote x)`

## 2. Demos and tests

- [ ] 2.1 Demos: read a nested list (`(a (b c) 42)`), read each atom type, `eq?` on a read symbol vs literal, quote-sugar + comment
- [ ] 2.2 Add them to `demos/run-tests.sh` with expected values

## 3. Verify

- [ ] 3.1 Build and run the demos; confirm parsed structure, atom types, interning, and comment/quote handling
- [ ] 3.2 Run `demos/run-backends.sh`: reader demos agree across AOT/JIT/bitcode
- [ ] 3.3 Confirm existing demos unaffected (reader is additive prelude Scheme)

## 4. Docs and spec sync

- [ ] 4.1 Update `LLVM.md` / `docs/PIPELINE.md`: the pipeline's `read` can now be the Scheme reader (host `read` still drives compilation; note the self-hosting milestone)
- [ ] 4.2 Sync the `core-language` (added) delta into `openspec/specs/`
