#!/bin/bash
# Drifter CI pipeline: the shared master-audit suite list (tests/suites-lib.sh)
# plus the CI-only gates (archive integrity, lore/tests/ci-checks.py, script syntax).
# Input: none (ARCHIVE/WORKSPACE env override the derived lore root and workspace).
# Output: one PASS/FAIL line per check (with up to 3 failing output lines), then a
# "CI RESULTS: P/T PASSED (F failed)" scorecard and a FAILURES list.
# Usage: ./drifter-ci.sh
# Exit code: 0 if all pass, 1 if any fail.

HERE="$(cd "$(dirname "$0")" && pwd)"
ARCHIVE="${ARCHIVE:-$(cd "$HERE/../lore" && pwd)}"
LORE="$ARCHIVE"
WORKSPACE="${WORKSPACE:-$(bash "$HERE/../lore/tests/resolve-workspace.sh" "$0")}"

# Single source of suite definitions, shared with master-audit.sh.
source "$HERE/suites-lib.sh"

PASS=0; FAIL=0; TOTAL=0
FAILURES=""

run_check() {
    local name="$1"
    local cmd="$2"
    TOTAL=$((TOTAL+1))
    if eval "$cmd" > /tmp/ci_out.txt 2>&1; then
        echo "  ✓ $name"
        PASS=$((PASS+1))
    else
        echo "  ✗ $name"
        FAIL=$((FAIL+1))
        FAILURES="$FAILURES\n  - $name"
        cat /tmp/ci_out.txt | tail -3 | sed 's/^/    /'
    fi
}

echo "============================================================"
echo "  DRIFTER CI PIPELINE"
echo "============================================================"
echo "Archive: $ARCHIVE"
echo "Workspace: $WORKSPACE"
echo ""

echo "--- 1. Master audit suites (shared with master-audit.sh) ---"
for entry in "${SUITES[@]}"; do
    run_check "${entry%%|*}" "${entry#*|}"
done

echo ""
echo "--- 2. Archive Integrity ---"
run_check "Books exist (110+)" "[ $(ls $ARCHIVE/source/books/*.md 2>/dev/null | wc -l) -ge 110 ]"
run_check "Transcripts exist (60+)" "[ $(ls $ARCHIVE/source/transcripts/*.md 2>/dev/null | grep -v index | wc -l) -ge 60 ]"
run_check "Index exists" "[ -f $ARCHIVE/index.md ]"

echo ""
echo "--- 3. Grimoire conformance (lore/tests/ci-checks.py) ---"
run_check "No stale file references" "python3 $ARCHIVE/tests/ci-checks.py stale $WORKSPACE"
run_check "No circular dependencies" "python3 $ARCHIVE/tests/ci-checks.py circular $WORKSPACE"
run_check "No self-dependencies" "python3 $ARCHIVE/tests/ci-checks.py selfdeps $WORKSPACE"
run_check "No em-dashes in agent files" "python3 $ARCHIVE/tests/ci-checks.py emdashes $WORKSPACE"
run_check "No personal paths" "python3 $ARCHIVE/tests/ci-checks.py personal $WORKSPACE"
run_check "No gitignored refs in instructions" "python3 $ARCHIVE/tests/ci-checks.py gitignored $WORKSPACE"
run_check "All headers present" "python3 $ARCHIVE/tests/ci-checks.py headers $WORKSPACE"

echo ""
echo "--- 4. Script Integrity ---"
run_check "All .sh syntax valid" "(for f in $ARCHIVE/*.sh; do bash -n \$f || exit 1; done)"
run_check "All scripts executable" "(for f in $ARCHIVE/*.sh; do [ -x \$f ] || exit 1; done)"

echo ""
echo "============================================================"
echo "  CI RESULTS: $PASS / $TOTAL PASSED ($FAIL failed)"
if [ -n "$FAILURES" ]; then
    echo ""
    echo "  FAILURES:"
    echo -e "$FAILURES"
fi
echo "============================================================"
[ "$FAIL" -eq 0 ]
