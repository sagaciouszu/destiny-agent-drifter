#!/bin/bash
# Shared suite list for the Drifter audit entry points. Sourced (never executed)
# by tests/master-audit.sh and tests/drifter-ci.sh so the suite definitions live
# in exactly one place; add or change suites here only.
# Requires $HERE (tests dir), $LORE (grimoire checkout) and $WORKSPACE (agent repo).
# Each entry is "suite name|shell command"; exit contract is the caller's 0/1.
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
    "Sample Conversation|python3 $HERE/sample-conversation-test.py"
    "Golden Voice Snapshots|bash $HERE/golden-voice-test.sh | grep -q 'Failed: 0'"
    "Connection|bash $HERE/connection-test.sh | grep -q 'Failed: 0'"
    "Memory Isolation|python3 $HERE/memory-test.py | grep -q 'memory isolation'"
    "Depends On Coverage|python3 $LORE/tests/check-agent-structure.py deps $WORKSPACE"
    "Token Estimate Coverage|python3 $LORE/tests/check-agent-structure.py tokens $WORKSPACE"
    "No Em-Dashes|python3 $LORE/tests/check-agent-structure.py dashes $WORKSPACE"
    "INDEX Completeness|python3 $LORE/tests/check-agent-structure.py index $WORKSPACE"
    "No Personal Paths|python3 $LORE/tests/check-agent-structure.py paths $WORKSPACE"
)
