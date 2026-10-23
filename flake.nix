{
  description = "Emit: a Scheme compiler with a JIT REPL and standalone native executables";

  # Locked in flake.lock; promotion pull requests change packaging/release.json, and the lock
  # only when a dependency update is intended (change: low-cost-distribution-channels, D5).
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      # The advertised, CI-tested systems.
      systems = [ "aarch64-darwin" "x86_64-linux" ];
      releaseFile = ./packaging/release.json;
      release =
        if builtins.pathExists releaseFile then builtins.fromJSON (builtins.readFile releaseFile) else null;
      checkoutVersion = builtins.head (builtins.split "\n" (builtins.readFile ./VERSION));

      # Everything one system provides.  Exposed as lib.perSystem so a maintainer can instantiate
      # the same recipe for an unadvertised system when verifying it locally.
      perSystem =
        pkgs:
        let
          emitFor = src: version: pkgs.callPackage ./packaging/nix/emit.nix { inherit src version; };
          # The checkout itself: what packaging pull requests rehearse.
          candidate = emitFor self checkoutVersion;
          llvm = pkgs.llvmPackages_22;
          # The same AOT clang the package pins: lld by default on Linux (see packaging/nix/emit.nix).
          aotClang = if pkgs.stdenv.hostPlatform.isLinux then llvm.clangUseLLVM else llvm.clang;
          # The shells' stdenv compiler is that clang too, so mkShell's exported wrapper environment
          # matches the compiler Emit uses.  Hardening stays off in the shells: the exported pie and
          # stack-protector flags break emit build's -flto link ("cannot be used when making a
          # shared object"), and an installed package never runs under them.
          mkShell =
            args:
            (pkgs.mkShell.override { stdenv = pkgs.overrideCC pkgs.stdenv aotClang; }) (
              args // { hardeningDisable = [ "all" ]; }
            );
          native = [
            llvm.clang
            llvm.llvm
            (pkgs.lib.getDev llvm.llvm)
            pkgs.boehmgc
            pkgs.gnumake
            pkgs.pkg-config
            pkgs.python3
          ];
          # Point the build at LLVM 22 explicitly.  mkShell's stdenv exports CC=gcc and CXX=g++,
          # which tools/llvm-env.sh would honor as overrides, so both are replaced here.  Entering
          # a shell never regenerates anything.
          hook = ''
            export LLVM_CONFIG=${pkgs.lib.getDev llvm.llvm}/bin/llvm-config
            export EMIT_LLVM_BIN=${aotClang}/bin
            export CC=${aotClang}/bin/clang
            export CXX=${llvm.clang}/bin/clang++
          '';
        in
        {
          packages =
            { inherit candidate; }
            // pkgs.lib.optionalAttrs (release != null) {
              # The promoted release: its exact archive, by digest.
              default = emitFor (pkgs.fetchurl {
                url = release.archive_url;
                sha256 = release.sha256;
              }) release.version;
            };

          # Installed acceptance inside the build sandbox: no network, a read-only store payload,
          # and no checkout or development shell (tools/channel-accept.sh, design D3).
          checks.candidate-accept =
            pkgs.runCommand "emit-candidate-accept" { nativeBuildInputs = [ pkgs.bash pkgs.coreutils ]; } ''
              mkdir -p accept/test
              cp -R ${./tools} accept/tools
              cp -R ${./test/channel-accept} accept/test/channel-accept
              chmod -R u+w accept
              patchShebangs accept/tools
              export HOME=$TMPDIR
              bash accept/tools/channel-accept.sh --emit ${candidate}/bin/emit \
                --expect-version ${checkoutVersion} --report $out \
                --label "nix ${pkgs.stdenv.hostPlatform.system}"
            '';

          devShells = {
            # Native source builds and native checks: no Chez.
            default = mkShell {
              packages = native;
              shellHook = hook;
            };
            # Adds Chez for source units and independent-host verification.  nixpkgs installs it
            # as `scheme`; Emit's tools invoke `chez`.  Chez picks its boot file from argv[0], so
            # the wrapper execs the real name rather than being a renamed symlink.
            verify = mkShell {
              packages = native ++ [
                pkgs.chez
                (pkgs.writeShellScriptBin "chez" ''exec ${pkgs.chez}/bin/scheme "$@"'')
              ];
              shellHook = hook;
            };
          };
        };
      forAll =
        attribute:
        nixpkgs.lib.genAttrs systems (system: (perSystem nixpkgs.legacyPackages.${system}).${attribute});
    in
    {
      lib.perSystem = perSystem;
      packages = forAll "packages";
      checks = forAll "checks";
      devShells = forAll "devShells";
    };
}
