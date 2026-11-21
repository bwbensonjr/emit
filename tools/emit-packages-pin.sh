#!/usr/bin/env bash
# emit-packages-pin.sh -- the pinned commit of the emit-packages collection.
#
# The emit-packages-pinned suites (tools/emit-packages.py) validate exactly this
# commit of bwbensonjr/emit-packages against the Emit under test, so a commit to
# the collection cannot change Emit's validation until this pin moves. Moving it
# is a reviewed edit: change the commit, run
#   bash tools/test.sh --suite emit-packages-pinned
# and commit the pin together with any Emit change it needs. Values are read by
# both shell (source this file) and Python, so keep the KEY="value" form.
EMIT_PACKAGES_PIN_COMMIT="9f12c09e897123b162a452fbbb9acb4432452535"
EMIT_PACKAGES_PIN_ORIGIN="https://github.com/bwbensonjr/emit-packages.git"
