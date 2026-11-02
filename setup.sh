#!/bin/bash
# Setup script for the Drifter agent brain/wrapper.
# Handles lore archive acquisition and symlink creation.

set -e

WORKSPACE="$(cd "$(dirname "$0")" && pwd)"
LORE_URL="${LORE_URL:-https://github.com/sagaciouszu/destiny-agent-grimoire.git}"
LORE_PATH="${1:-}"

echo "=== Drifter Agent Setup ==="
echo "Workspace: $WORKSPACE"

# Lore archive
if [ -L "$WORKSPACE/lore" ]; then
    echo "lore symlink already exists -> $(readlink "$WORKSPACE/lore")"
elif [ -d "$WORKSPACE/lore" ]; then
    echo "lore/ directory already exists (not a symlink). Skipping."
else
    # Prefer an explicit local path over cloning
    if [ -n "$LORE_PATH" ] && [ -d "$LORE_PATH" ]; then
        ln -s "$LORE_PATH" "$WORKSPACE/lore"
        echo "Created lore symlink -> $LORE_PATH"
    elif [ -n "$LORE_URL" ]; then
        echo "Cloning lore archive from $LORE_URL ..."
        git clone "$LORE_URL" "$WORKSPACE/lore"
        echo "Lore archive cloned."
    else
        echo ""
        echo "The lore archive is required for full functionality."
        echo ""
        echo "Option 1: Clone from a remote repository:"
        echo "  LORE_URL=https://github.com/sagaciouszu/destiny-agent-grimoire.git ./setup.sh"
        echo ""
        echo "Option 2: Symlink to a local copy:"
        echo "  ./setup.sh /path/to/destiny-agent-grimoire"
        echo ""
        echo "Option 3: Create the symlink manually:"
        echo "  ln -s /path/to/destiny-agent-grimoire $WORKSPACE/lore"
        echo ""
        echo "Without the lore archive, the agent still functions in degraded mode"
        echo "(core voice, personality, and behavioral rules are self-contained)."
        exit 0
    fi
fi

# Verify
if [ -L "$WORKSPACE/lore" ] || [ -d "$WORKSPACE/lore" ]; then
    if [ -f "$WORKSPACE/lore/db/grimoire.db" ]; then
        STATS=$(python3 "$WORKSPACE/lore/db/query.py" stats 2>/dev/null | head -12)
        echo "Lore archive: OK (database present)"
        echo "$STATS"
    else
        echo "WARNING: Lore archive found but database missing. Check the path."
    fi
else
    echo "WARNING: Lore archive not available. Agent will work in degraded mode."
fi

echo ""
echo "Setup complete. Load INDEX.md first, then drifter-core.md."
