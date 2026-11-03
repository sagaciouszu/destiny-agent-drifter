#!/bin/bash
# Setup script for the Drifter agent brain/wrapper.
# Handles lore archive acquisition and symlink creation.

set -e

WORKSPACE="$(cd "$(dirname "$0")" && pwd)"
LORE_URL="${LORE_URL:-https://github.com/sagaciouszu/destiny-agent-grimoire.git}"
RELEASE_DB_URL="${RELEASE_DB_URL:-https://github.com/sagaciouszu/destiny-agent-grimoire/releases/latest/download/grimoire.db}"
LORE_PATH="${1:-}"

echo "=== Drifter Agent Setup ==="
echo "Workspace: $WORKSPACE"

# Seed runtime memory files from templates (memory is gitignored: never committed)
for t in USER.template.md core/user-memory.template.md core/journal.template.md core/session-state.template.md core/cross-session-memory.template.md; do
    live="${t%.template.md}.md"
    if [ -f "$WORKSPACE/$t" ] && [ ! -f "$WORKSPACE/$live" ]; then
        cp "$WORKSPACE/$t" "$WORKSPACE/$live"
        echo "Seeded $live"
    fi
done

# Lore archive
# A committed/stale symlink can arrive dangling on another machine
if [ -L "$WORKSPACE/lore" ] && [ ! -e "$WORKSPACE/lore" ]; then
    echo "Removing dangling lore symlink -> $(readlink "$WORKSPACE/lore")"
    rm -f "$WORKSPACE/lore"
fi

if [ -L "$WORKSPACE/lore" ]; then
    echo "lore symlink already exists -> $(readlink "$WORKSPACE/lore")"
elif [ -d "$WORKSPACE/lore" ]; then
    echo "lore/ directory already exists (not a symlink). Skipping."
else
    # Prefer an explicit local path over cloning
    if [ -n "$LORE_PATH" ] && [ -d "$LORE_PATH" ]; then
        ln -s "$(cd "$LORE_PATH" && pwd)" "$WORKSPACE/lore"
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
    elif [ -f "$WORKSPACE/lore/db/migrate.py" ]; then
        # Database is a build artifact (not shipped in git): bootstrap it now.
        # Agent-safe: BOOTSTRAP=1|2 env preselects (no prompt); interactive
        # terminals get a choice but auto-continue to build after 15s; EOF or
        # timeout falls through to a build (never blocks, never aborts).
        if [ -z "${BOOTSTRAP:-}" ] && [ -t 0 ]; then
            echo ""
            echo "Database not built. Bootstrap options:"
            echo "  [1] Download prebuilt (release asset, ~seconds)"
            echo "  [2] Build from your checkout (~2 minutes, matches this commit)"
            read -t 15 -rp "Choice [1/2] (default 2, auto-continues): " BOOTSTRAP || BOOTSTRAP=""
        fi
        BOOTSTRAP="${BOOTSTRAP:-2}"
        if [ "$BOOTSTRAP" = "1" ] && ! command -v curl >/dev/null 2>&1; then
            echo "curl unavailable; building instead."
            BOOTSTRAP=2
        fi
        echo "Database bootstrap: choice ${BOOTSTRAP}."
        if [ "$BOOTSTRAP" = "1" ] && command -v curl >/dev/null 2>&1; then
            echo "Downloading prebuilt database..."
            if curl -fsSL "$RELEASE_DB_URL" -o "$WORKSPACE/lore/db/grimoire.db"; then
                echo "Database downloaded."
            else
                echo "Download failed; building from checkout instead."
                rm -f "$WORKSPACE/lore/db/grimoire.db"
                python3 "$WORKSPACE/lore/db/migrate.py"
                echo "Database built."
            fi
        else
            python3 "$WORKSPACE/lore/db/migrate.py"
            echo "Database built."
        fi
    else
        echo "WARNING: Lore archive found but database missing. Check the path."
    fi
else
    echo "WARNING: Lore archive not available. Agent will work in degraded mode."
fi

# Optional MCP adapter (official SDK, isolated venv, needs network for pip)
if [ "${WITH_MCP:-0}" = "1" ] && [ -x "$WORKSPACE/lore/mcp-server/install.sh" ]; then
    bash "$WORKSPACE/lore/mcp-server/install.sh"
fi

if [ "${WITH_MCP:-0}" != "1" ] && [ -x "$WORKSPACE/lore/mcp-server/install.sh" ]; then
    echo "Optional: typed MCP tools -> WITH_MCP=1 ./setup.sh"
fi

echo ""
echo "Setup complete. Load INDEX.md first, then drifter-core.md."
