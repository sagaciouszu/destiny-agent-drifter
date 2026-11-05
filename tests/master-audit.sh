#!/bin/bash
# Drifter master audit: every Drifter-specific suite plus the shared gates.
# Agent-local tests live here; shared gates live in the grimoire at lore/tests.
# Suite definitions are shared with drifter-ci.sh via tests/suites-lib.sh.
# Usage: bash tests/master-audit.sh
# Output: one PASS/FAIL line per suite plus a scorecard; exit 0 if all pass, 1 otherwise.
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="$(dirname "$HERE")"
LORE="${LORE:-$REPO/lore}"
WORKSPACE="${WORKSPACE:-$REPO}"
export WORKSPACE

if [ ! -f "$LORE/db/grimoire.db" ]; then
    echo "FATAL: grimoire database missing at $LORE/db/grimoire.db"
    echo "       bootstrap: ./setup.sh (or python3 lore/db/migrate.py)"
    exit 1
fi

PASS=0; FAIL=0; TOTAL=0
run() {
    TOTAL=$((TOTAL+1))
    if eval "$2" > /dev/null 2>&1; then
        echo "  ✓ [$1] PASS"; PASS=$((PASS+1))
    else
        echo "  ✗ [$1] FAIL"; FAIL=$((FAIL+1))
    fi
}

source "$HERE/suites-lib.sh"

echo "============================================================"
echo "  THE DRIFTER - MASTER AUDIT (ALL CHECKS)"
echo "============================================================"
echo ""
for entry in "${SUITES[@]}"; do
    run "${entry%%|*}" "${entry#*|}"
done

echo ""
echo "============================================================"
echo "  SCORECARD: $PASS / $TOTAL SUITES PASSED ($FAIL failed)"
echo "============================================================"
[ "$FAIL" -eq 0 ]
