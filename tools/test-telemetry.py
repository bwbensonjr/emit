#!/usr/bin/env python3
"""Optional external CC/CXX/make invocation telemetry, not compiler profiling."""

import argparse
import json
import os
from pathlib import Path
import shlex
import shutil
import signal
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parent.parent
TOOLS = ("cc", "cxx", "make")


def narrate(message):
    if os.environ.get("EMIT_VERBOSITY", "default") not in {"quiet", "q", "0"}:
        print("test: " + message, file=sys.stderr)


def real_program(value, environment):
    found = shutil.which(value, path=environment.get("PATH", os.defpath))
    if not found:
        raise ValueError("telemetry tool unavailable: " + value)
    # Keep the selected filename: clang++ and multi-call tools may use argv[0]
    # even when their executable bytes are shared through symlinks.
    return os.path.abspath(found)


def selected_programs(environment):
    selected = {"cc": environment.get("CC", ""), "cxx": environment.get("CXX", "")}
    if not all(selected.values()):
        result = subprocess.run(
            ["bash", "-c", ". tools/llvm-env.sh >/dev/null || exit 1; printf '%s\\0' \"$CC\" \"$CXX\""],
            cwd=ROOT, env=environment, capture_output=True, check=True)
        values = result.stdout.decode().split("\0")
        for tool, value in zip(("cc", "cxx"), values):
            if not selected[tool]:
                selected[tool] = value
    # Nesting telemetry setup should delegate to the underlying tools instead
    # of double-counting the old wrapper or recursing back into itself.
    old_directory = environment.get("EMIT_TEST_WRAPPER_DIRECTORY")
    old_map = json.loads(environment.get("EMIT_TEST_COMPILER_MAP", "{}"))
    for tool in ("cc", "cxx"):
        if old_directory and os.path.abspath(selected[tool]) == str(Path(old_directory) / tool):
            selected[tool] = old_map[tool]
    selected = {tool: real_program(value, environment) for tool, value in selected.items()}
    make = shutil.which("make", path=environment.get("PATH", os.defpath))
    if old_directory and make == str(Path(old_directory) / "make"):
        make = old_map["make"]
    selected["make"] = real_program(make or "make", environment)
    return selected


def setup(directory, env):
    """Create private wrappers and return a copied command environment."""
    environment = dict(env)
    mapping = selected_programs(environment)
    directory = Path(directory).absolute()
    directory.mkdir(parents=True, exist_ok=True)
    if any(directory.iterdir()):
        raise ValueError("telemetry wrapper directory must be empty")
    proxy = ROOT / "tools/test-compiler-proxy.py"
    for tool in TOOLS:
        path = directory / tool
        path.write_text("#!/bin/sh\nexec " + shlex.quote(sys.executable) + " " +
                        shlex.quote(str(proxy)) + " " + shlex.quote(tool) + " \"$@\"\n")
        path.chmod(0o700)
    log = Path(environment.get("EMIT_TEST_TRACE_LOG", str(directory / "trace.jsonl"))).absolute()
    log.parent.mkdir(parents=True, exist_ok=True)
    environment.update({
        "CC": str(directory / "cc"), "CXX": str(directory / "cxx"),
        "PATH": str(directory) + os.pathsep + environment.get("PATH", os.defpath),
        "MAKE": shlex.quote(str(directory / "make")),
        "EMIT_TEST_COMPILER_MAP": json.dumps(mapping, sort_keys=True),
        "EMIT_TEST_WRAPPER_DIRECTORY": str(directory), "EMIT_TEST_TRACE_LOG": str(log),
    })
    return environment


def summarize(log):
    """Count observed proxied tool calls; missing log means no observed calls."""
    tools = {tool: {"invocations": 0, "compile": 0, "query": 0, "make": 0} for tool in TOOLS}
    path = Path(log)
    if path.exists():
        with path.open() as source:
            for number, line in enumerate(source, 1):
                try:
                    record = json.loads(line)
                    tool, action = record["tool"], record["kind"]
                    expected = {"make"} if tool == "make" else {"compile", "query"}
                    if record.get("schema") != 1 or tool not in tools or action not in expected:
                        raise ValueError("unsupported invocation record")
                    tools[tool]["invocations"] += 1
                    tools[tool][action] += 1
                except (ValueError, KeyError, TypeError) as error:
                    raise ValueError(f"invalid telemetry record {path}:{number}: {error}") from error
    return {"schema": 1, "scope": "observed-external-tool-invocations-only", "tools": tools,
            "total_invocations": sum(value["invocations"] for value in tools.values()),
            "compiler_invocations": tools["cc"]["invocations"] + tools["cxx"]["invocations"],
            "compiler_work_invocations": tools["cc"]["compile"] + tools["cxx"]["compile"],
            "compiler_query_invocations": tools["cc"]["query"] + tools["cxx"]["query"],
            "make_invocations": tools["make"]["invocations"],
            "compile_kind": "external compiler work, including linking/preprocessing; not in-process LLVM/Scheme compilations"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--log", required=True, type=Path)
    parser.add_argument("command", nargs=argparse.REMAINDER)
    args = parser.parse_args()
    command = args.command[1:] if args.command[:1] == ["--"] else args.command
    if not command:
        parser.error("a command is required after --")
    try:
        with tempfile.TemporaryDirectory(prefix="emit-tool-trace-") as directory:
            environment = setup(directory, {**os.environ, "EMIT_TEST_TRACE_LOG": str(args.log.absolute())})
            narrate("trace CC/CXX/make -> " + str(args.log) + " [external calls only]")
            result = subprocess.run(command, env=environment)
            counts = summarize(args.log)
            narrate(f"trace {args.log} -> {counts['compiler_invocations']} CC/CXX, "
                    f"{counts['make_invocations']} make invocations")
        if result.returncode < 0:
            number = -result.returncode
            if number not in (signal.SIGKILL, signal.SIGSTOP):
                signal.signal(number, signal.SIG_DFL)
            os.kill(os.getpid(), number)
        return result.returncode
    except (OSError, ValueError, KeyError, subprocess.SubprocessError) as error:
        print("test: compiler telemetry failed: " + str(error), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
