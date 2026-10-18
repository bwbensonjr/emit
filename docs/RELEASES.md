# Releases

## Version and compatibility policy

The committed [`VERSION`](../VERSION) file is the release version source of truth. It uses
Semantic Versioning and is embedded in each native `emit` build. Release tags use the form
`v<VERSION>`; the changelog contains a matching version section. Builds from source archives
therefore retain their identity without Git metadata.

The compatibility surface is Emit's accepted Scheme language and public command-line interface.
While the major version is zero, an incompatible change advances the minor version, and a
compatible fix advances the patch version. The first release is `0.1.0`. The `1.0.0` milestone
will establish the compatibility promise for the language and CLI.

Internal compatibility identifiers remain independent of the release version. In particular,
bootstrap IR, compiler artifacts, cache metadata, and compile-time library interfaces retain
their own compatibility stamps and rules. Changing `VERSION` rebuilds the native host and does
not regenerate bootstrap IR.

The top-level command reports the version embedded at build time with `emit --version`. The LLVM
version in that output is also the LLVM used to build the binary; runtime tool discovery does not
change that identity.
