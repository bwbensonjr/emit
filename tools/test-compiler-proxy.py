#!/usr/bin/env python3
"""Record one external tool invocation, then replace this process with it."""

import json
import os
from pathlib import Path
import sys
import time


def kind(tool, arguments):
    if tool == "make":
        return "make"
    queries = {"--version", "-dumpversion", "-dumpmachine", "-###", "--help", "-help"}
    if (any(argument in queries or argument.startswith(("-print-", "--print-"))
            for argument in arguments) or arguments == ["-v"]):
        return "query"
    # This counts external compiler work, including linking and preprocessing;
    # it does not count LLVM's in-process compilation or emitted Scheme units.
    return "compile"


def main():
    if len(sys.argv) < 2 or sys.argv[1] not in {"cc", "cxx", "make"}:
        print("compiler-proxy: expected cc, cxx, or make selector", file=sys.stderr)
        return 2
    tool = sys.argv[1]
    arguments = sys.argv[2:]
    try:
        mapping = json.loads(os.environ["EMIT_TEST_COMPILER_MAP"])
        program = mapping[tool]
        if not isinstance(program, str) or not Path(program).is_absolute():
            raise ValueError("real tool path must be absolute")
        log = os.environ["EMIT_TEST_TRACE_LOG"]
        record = {"schema": 1, "pid": os.getpid(), "cwd": os.getcwd(),
                  "tool": tool, "program": program, "argv": arguments,
                  "kind": kind(tool, arguments), "time_ns": time.time_ns()}
        payload = (json.dumps(record, ensure_ascii=True, separators=(",", ":")) + "\n").encode()
        descriptor = os.open(log, os.O_WRONLY | os.O_APPEND | os.O_CREAT, 0o600)
        try:
            if os.write(descriptor, payload) != len(payload):
                raise OSError("partial telemetry record write")
        finally:
            os.close(descriptor)
        # No subprocess: PID, exit status, and signal termination remain those
        # of the actual tool. No changes to argv quoting or compiler outputs.
        os.execv(program, [program, *arguments])
    except (OSError, KeyError, ValueError, TypeError) as error:
        print("compiler-proxy: " + str(error), file=sys.stderr)
        return 127 if isinstance(error, FileNotFoundError) else 126


if __name__ == "__main__":
    sys.exit(main())
