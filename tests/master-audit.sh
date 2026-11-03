#!/bin/bash
# Drifter master audit: every Drifter-specific suite plus the shared gates.
# Agent-local tests live here; shared gates live in the grimoire at lore/tests.
# Usage: bash tests/master-audit.sh
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

SUITES=(
    "Archive & Link Validation|bash $HERE/validate.sh | grep -q 'unverified quotes: 0' && bash $HERE/validate.sh | grep -q 'missing: 0'"
    "Cross-Reference Validator|bash $HERE/drifter-xref-validate.sh | grep -q 'Broken references: 0'"
    "Module Completeness (202 checks)|bash $HERE/drifter-module-test.sh | grep -q 'Failed: 0'"
    "Single-Turn Voice (19 scenarios)|bash $HERE/drifter-test-suite.sh | grep -q 'Failed: 0'"
    "N-Gram Voice Scorer|python3 $HERE/drifter-voice-scorer.py 'Hey, hero. Bank those Motes! Heh. Trust.' | grep -q 'PASS'"
    "10-Turn Emotional Arc|bash $HERE/drifter-multiturn-test.sh | grep -q '10/10'"
    "Scenario Simulator|bash $HERE/drifter-scenario-simulator.sh 'Tell me about Malfeasance' | grep -qE 'PASS|PARTIAL'"
    "Tape Generator|bash $HERE/drifter-tape-generator.sh 'ghosts' | grep -q 'PASS'"
    "Gambit Sim (auto)|bash $HERE/drifter-gambit-sim.sh --auto | grep -q 'VICTORY'"
    "Lore Freshness|bash $HERE/drifter-freshness-check.sh | grep -q 'OK: Database is fresh'"
    "Conflict Check|bash $HERE/drifter-conflict-check.sh 2>&1 | grep -q 'CONFLICT CHECK COMPLETE'"
    "Voice Consistency|bash $HERE/drifter-voice-consistency.sh | grep -q 'VOICE CONSISTENCY CHECK COMPLETE'"
    "Quote Cross-Check (0 unverified)|bash $HERE/drifter-quote-verify.sh | grep -q 'PASS'"
    "Conversation (SQLite)|bash $HERE/conversation-test.sh"
    "Golden Voice Snapshots|bash $HERE/golden-voice-test.sh | grep -q 'Failed: 0'"
    "Depends On Coverage|python3 $LORE/tests/check-agent-structure.py deps $WORKSPACE"
    "Token Estimate Coverage|python3 $LORE/tests/check-agent-structure.py tokens $WORKSPACE"
    "No Em-Dashes|python3 $LORE/tests/check-agent-structure.py dashes $WORKSPACE"
    "INDEX Completeness|python3 $LORE/tests/check-agent-structure.py index $WORKSPACE"
    "No Personal Paths|python3 $LORE/tests/check-agent-structure.py paths $WORKSPACE"
)

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
