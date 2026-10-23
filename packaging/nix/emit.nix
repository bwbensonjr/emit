# Emit from a source tree or release archive (change: low-cost-distribution-channels, design D5).
# The flake instantiates this for the checkout (packages.candidate) and for the release named by
# packaging/release.json (packages.default).
{
  lib,
  stdenv,
  llvmPackages_22,
  boehmgc,
  bash,
  coreutils,
  gnused,
  gnugrep,
  makeWrapper,
  src,
  version,
}:

let
  llvm = llvmPackages_22;
  # The AOT link compiles runtime.c with -flto.  On Linux the clang must default to lld, since
  # GNU ld would need the LLVMgold plugin; macOS uses the SDK linker with clang's own libLTO.
  aotClang = if stdenv.hostPlatform.isLinux then llvm.clangUseLLVM else llvm.clang;
  # Every toolchain input is explicit: Nix keeps clang and llvm-config in different store paths,
  # and these values become the installed toolchain pin, keeping both in the runtime closure.
  toolchain = [
    "LLVM_CONFIG=${lib.getDev llvm.llvm}/bin/llvm-config"
    "EMIT_LLVM_BIN=${aotClang}/bin"
    "CC=${aotClang}/bin/clang"
    "CXX=${llvm.clang}/bin/clang++"
    "GC_INC=${lib.getDev boehmgc}/include"
    "GC_LIB=${lib.getLib boehmgc}/lib"
    "GC_DYLIB=${lib.getLib boehmgc}/lib/libgc${stdenv.hostPlatform.extensions.sharedLibrary}"
  ];
in
stdenv.mkDerivation {
  pname = "emit";
  inherit version src;

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ llvm.llvm boehmgc ];

  # The build runs tools/llvm-env.sh and tools/log.sh; they must find Nix's bash.
  postPatch = ''
    patchShebangs tools
  '';

  # A release archive must be the version its identity names; fetchurl already checked the digest.
  preBuild = ''
    if [ "$(head -n1 VERSION)" != "${version}" ]; then
      echo "emit.nix: source reports VERSION $(head -n1 VERSION), expected ${version}" >&2
      exit 1
    fi
  '';

  makeFlags = toolchain ++ [ "PREFIX=${placeholder "out"}" ];
  enableParallelBuilding = true;
  installFlags = [ "TOOLCHAIN_PIN=1" "WARM_STDLIB=0" ];

  # Installed tools/llvm-env.sh runs at `emit build` time; it needs only POSIX utilities and bash.
  postFixup = ''
    wrapProgram $out/bin/emit \
      --suffix PATH : ${lib.makeBinPath [ bash coreutils gnused gnugrep ]}
  '';

  meta = {
    description = "Scheme compiler with a JIT REPL and standalone native executables";
    homepage = "https://github.com/bwbensonjr/emit";
    license = lib.licenses.mit;
    platforms = [ "aarch64-darwin" "x86_64-linux" ];
    mainProgram = "emit";
  };
}
