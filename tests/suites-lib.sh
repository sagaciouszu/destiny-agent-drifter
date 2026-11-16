#!/bin/bash
# Shared suite list for the Drifter audit entry points. Sourced (never executed)
# by tests/master-audit.sh and tests/drifter-ci.sh so the suite definitions live
# in exactly one place; add or change suites here only.
# Requires $HERE (tests dir), $LORE (grimoire checkout) and $WORKSPACE (agent repo).
# Each entry is "suite name|shell command"; exit contract is the caller's 0/1.
# tests/suites.json is the single suite registry. Suites load from it at
# runtime so there is exactly one list to maintain; do not add an inline
# SUITES block here. (Bash 3.2 compatible: no mapfile; count kept in a
# scalar because empty-array expansion trips set -u on old bash.)
SUITES=()
SUITE_COUNT=0
while IFS= read -r line; do
    if [ -n "$line" ]; then
        SUITES+=("$line")
        SUITE_COUNT=$((SUITE_COUNT + 1))
    fi
done < <(python3 - "$HERE/suites.json" <<'PY'
import json, sys
for s in json.load(open(sys.argv[1], encoding='utf-8'))['suites']:
    print(f"{s['name']}|{s['command']}")
PY
)
[ "$SUITE_COUNT" -gt 0 ] || { echo "FATAL: no suites loaded from tests/suites.json"; exit 1; }
