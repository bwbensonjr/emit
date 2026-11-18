#!/usr/bin/env python3
"""Reconstruct isolated writer runtimes, fixtures, and code evidence."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shlex
import shutil
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parent.parent


def note(message):
    if os.environ.get("EMIT_VERBOSITY", "default") not in ("quiet", "q", "0"):
        print(message, file=sys.stderr, flush=True)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def command(args, output=None, env=None, merge_stderr=False):
    note("run " + shlex.join(map(str, args)) + " -> " + (str(output) if output else "completion"))
    started = time.monotonic()
    if output:
        with output.open("w") as stream:
            subprocess.run(list(map(str, args)), cwd=ROOT, env=env, stdout=stream,
                stderr=subprocess.STDOUT if merge_stderr else None, check=True)
    else:
        subprocess.run(list(map(str, args)), cwd=ROOT, env=env, check=True)
    product = output
    if not product and "-o" in args:
        product = Path(args[args.index("-o") + 1])
    size = f", {product.stat().st_size} bytes" if product and product.exists() else ""
    note(f"complete {args[0]} -> {product or 'completion'} [{time.monotonic() - started:.3f}s{size}]")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=Path("build/writer-performance"))
    parser.add_argument("--skip-scheme", action="store_true", help="build runtime harness evidence only")
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=True)
    code = out / "code"
    code.mkdir(exist_ok=True)
    discovery = subprocess.check_output(["bash", "tools/llvm-env.sh", "--print-env"], cwd=ROOT, text=True)
    env = dict(os.environ)
    env.update(line.split("=", 1) for line in discovery.splitlines() if "=" in line)
    for name in ("GC_INC", "GC_LIB", "GC_DYLIB"):
        env[name] = env["EMIT_" + name]
    cc = str(Path(env["EMIT_LLVM_BIN"]) / "clang")
    common = [cc, "-std=gnu11", "-O2", "-flto", "-I" + env["GC_INC"], "-L" + env["GC_LIB"]]
    toolchain = {
        "clang": subprocess.check_output([cc, "--version"], text=True).strip(),
        "gc_headers": env["GC_INC"], "gc_library": env["GC_DYLIB"],
        "gc_library_sha256": sha(Path(env["GC_DYLIB"])),
        "platform": platform.platform(), "machine": platform.machine(),
    }
    fixture = ROOT / "test/performance/writer-bench.c"
    compiler_inputs = subprocess.check_output(
        ["bash", "tools/compiler-inputs.sh", "--list"], cwd=ROOT, text=True).splitlines()
    input_names = set(compiler_inputs) | {"emit-libs.scm", "VERSION", "tools/llvm-env.sh"}
    for directory in ("src", "lib"):
        input_names.update(str(p.relative_to(ROOT)) for p in (ROOT / directory).rglob("*")
            if p.is_file() and p.suffix in (".ss", ".scm", ".sld"))
    input_names.update(str(p.relative_to(ROOT)) for p in (ROOT / "bootstrap").glob("*.ll"))
    source_patch = out / "source-inputs.patch"
    source_patch.write_bytes(subprocess.check_output(
        ["git", "diff", "HEAD", "--", "src", "lib", "emit-libs.scm", "VERSION"], cwd=ROOT))
    compilation_context = out / "source-inputs.json"
    compilation_context.write_text(json.dumps({
        "ordered_compiler_inputs": compiler_inputs,
        "input_sha256": {name: sha(ROOT / name) for name in sorted(input_names)},
        "dirty_input_patch_sha256": sha(source_patch),
        "fingerprint_status": json.loads(subprocess.check_output(
            [sys.executable, "tools/source-fingerprint.py", "--status"], cwd=ROOT, text=True)),
    }, indent=2) + "\n")
    sources = {}
    manifests = {}
    head = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    for label, revision in [("pre", "8c69a18^"), ("released", "8c69a18"), ("candidate", None)]:
        target = out / ("runtime-" + label + ".c")
        if revision:
            commit = subprocess.check_output(["git", "rev-parse", revision], cwd=ROOT, text=True).strip()
            content = subprocess.check_output(["git", "show", commit + ":src/runtime/runtime.c"], cwd=ROOT)
        else:
            commit = head
            content = (ROOT / "src/runtime/runtime.c").read_bytes()
        target.write_bytes(content)
        sources[label] = target
        manifests[label] = {
            "source_revision": commit,
            "dirty_inputs": [{"path": "src/runtime/runtime.c", "sha256": sha(target)}] if not revision else [],
            "runtime_source": str(target), "runtime_sha256": sha(target),
            "source_context_sha256": sha(compilation_context),
            "fixture_sha256": sha(fixture), "build_commands": [],
            "toolchain": toolchain, "compiler_options": ["-std=gnu11", "-O2"],
            "linker_options": ["-flto", "-lgc", "-lm"],
            "execution_path": "standalone runtime harness; C callback isolates runtime from Scheme adapter",
            "cache_state": "fresh process; eight in-process warmup renders before timed repeats",
        }
        note(f"snapshot {commit}:runtime -> {target} [{len(content)} bytes]")
    # This isolated experiment does not edit the production runtime.
    content = sources["candidate"].read_text()
    old = "  apply(td[2], object, port, rt_intern(mode), token);"
    new = ("  static val modes[4];\n"
           "  int index = display ? 0 : w->policy == PRINT_SIMPLE ? 1 : w->policy == PRINT_SHARED ? 2 : 3;\n"
           "  if (!modes[index]) modes[index] = rt_intern(mode);\n"
           "  apply(td[2], object, port, modes[index], token);")
    if content.count(old) != 1:
        raise RuntimeError("mode-cache experiment requires the documented uncached call")
    mode_source = out / "runtime-mode-cache.c"
    mode_source.write_text(content.replace(old, new))
    sources["mode-cache"] = mode_source
    manifests["mode-cache"] = dict(manifests["candidate"], runtime_source=str(mode_source),
        runtime_sha256=sha(mode_source), experiment="cache the four interned mode symbols", build_commands=[])
    # Preserve the runtime diff, so candidate inputs survive after the checkout changes.
    patch = subprocess.check_output(["git", "diff", "HEAD", "--", "src/runtime/runtime.c"], cwd=ROOT)
    (out / "candidate-runtime.patch").write_bytes(patch)
    for label, source in sources.items():
        for instrumented in (False, True):
            suffix = "-instrumented" if instrumented else ""
            binary = out / ("bench-" + label + suffix)
            extra = ["-DEMIT_PRE_WRITER"] if label == "pre" else []
            if instrumented:
                extra.append("-DEMIT_BENCH_INSTRUMENT")
                if label in ("candidate", "mode-cache"):
                    extra.append("-DEMIT_EXPECT_REUSE")
            build = common + extra + ["-DEMIT_RUNTIME_SOURCE=" + json.dumps(str(source)), str(fixture), "-lgc", "-lm", "-o", str(binary)]
            command(build)
            manifests[label]["build_commands"].append(build)
        command([cc, "-std=gnu11", "-O2", "-DRT_NO_MAIN", "-I" + env["GC_INC"], "-S", "-emit-llvm", source, "-o", code / (label + "-runtime.optimized.ll")])
        command([Path(env["EMIT_LLVM_BIN"]) / "llvm-objdump", "--disassemble", out / ("bench-" + label)], code / (label + "-harness.disassembly"))
    if not args.skip_scheme:
        if not shutil.which("chez"):
            raise RuntimeError("Chez is required to reconstruct emitted program/library IR; use --skip-scheme for harness-only work")
        for name, fixture_path in [("adapter", "test/performance/writer-adapter.scm"), ("scheme-repeat", "test/performance/writer-repeat.scm"), ("malt-core", "test/malt-core.scm"), ("malt-xor", "demos/malt-xor.scm")]:
            stem = out / (name + "-source")
            # Imports can shrink between invocations. Never link stale units
            # retained by a previous compilation under this builder-owned stem.
            for stale in out.glob(stem.name + ".*.pruned.ll"):
                note(f"remove prior generated unit -> {stale}")
                stale.unlink()
            compile_args = ["chez", "--libdirs", "src", "--script", "src/compile.ss", fixture_path,
                "--no-manifest-chain", "--manifest", "emit-libs.scm", "-L", "lib", "-o", str(stem)]
            if name == "adapter":
                compile_args.append("--dump")
            command(compile_args, code / (name + "-compile.log"), env, merge_stderr=True)
            units = [str(stem) + ".ll"] + sorted(str(p) for p in out.glob(stem.name + ".*.pruned.ll"))
            for label in ("released", "candidate"):
                build = common + [str(sources[label]), *units, "-lgc", "-lm", "-o", str(out / (name + "-" + label))]
                command(build)
                program_manifest = dict(manifests[label], build_commands=[compile_args, build],
                    execution_path="source-driver emitted units; AOT -O2 -flto; identical program/library IR across runtimes",
                    fixture=fixture_path, fixture_sha256=sha(ROOT / fixture_path),
                    unit_hashes={Path(p).name: sha(Path(p)) for p in units})
                (out / (name + "-" + label + "-metadata.json")).write_text(json.dumps(program_manifest, indent=2) + "\n")
            if name == "adapter":
                for label in ("released", "candidate"):
                    binary = out / (name + "-" + label)
                    command([Path(env["EMIT_LLVM_BIN"]) / "llvm-objdump", "--disassemble", binary], code / ("adapter-" + label + ".disassembly"))
                    command([Path(env["EMIT_LLVM_BIN"]) / "llvm-nm", binary], code / ("adapter-" + label + ".symbols"))
        plain = out / "plain.ll"
        with plain.open("w") as stream:
            note(f"emit atomic no-Malt control -> {plain}")
            subprocess.run(["build/emit", "run", "--emit", "--no-prelude"], cwd=ROOT, env=env,
                input=b'(display "plain-size-check")', stdout=stream, check=True)
        for label in ("released", "candidate"):
            command(common + [str(sources[label]), str(plain), "-lgc", "-lm", "-o", str(out / ("plain-" + label))])
    for label, manifest in manifests.items():
        path = out / (label + "-metadata.json")
        path.write_text(json.dumps(manifest, indent=2) + "\n")
        note(f"write provenance -> {path} [{path.stat().st_size} bytes]")
    print(json.dumps({"output": str(out), "runtimes": list(sources), "scheme_controls": not args.skip_scheme}))


if __name__ == "__main__":
    try:
        main()
    except (OSError, RuntimeError, subprocess.CalledProcessError) as exc:
        print("writer-performance-build: " + str(exc), file=sys.stderr)
        sys.exit(1)
