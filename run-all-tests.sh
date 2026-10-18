#!/usr/bin/env bash
# Compatibility entry point; selection and reporting live in tools/test.sh.
set -eu
exec bash "$(dirname "$0")/tools/test.sh" full "$@"
