# Release v0.4.1 - Drifter Agent with SQLite Lore

> **Depends On:** INDEX.md
> **Token Estimate:** ~1K tokens

**Date:** 2026-11-02

## What this is
Agent brain/wrapper for The Drifter (Destiny 2), grounding in a SQLite lore database with FTS5 full-text search. 1001 verified Drifter quotes from canonical transcripts. Zero unverified quotes.

## Structure
- `drifter-core.md` - consolidated brain (~6K, START HERE)
- `core/` - 43 modules (relationships, arcs, guardrails, moods, threats, debt, etc.)
- `world/` - 4 worldbuilding files
- `voice/` - 9 voice sub-files (core, gambler, grief, combat, etc.)
- `reference/` - 5 analysis files (knowledge-web, quote-index etc.)
- `lore/` - symlink to destiny-agent-grimoire (SQLite DB)

## Lore integration
All lore queries route through `lore/db/grimoire.db`:
- `python3 lore/db/query.py search "<term>" --limit 5` - FTS5 search
- `python3 lore/db/query.py character "drifter" --limit 20` - Drifter's canon lines
- `sqlite3 lore/db/grimoire.db "SELECT ..."` - direct SQL

## Test results
- drifter-master-audit.sh: 17/17 PASS
- validate.sh: 0 unverified, 0 missing refs
- drifter-quote-verify.sh (SQLite): 2897 checked, 0 unverified
- multi-turn emotional arc: 10/10
- voice-scorer: 100.4/100 PASS
- CI pipeline: 25/25 PASS

## Installation
```bash
cd ~/Work/how-to-drift-for-agents
./setup.sh /path/to/destiny-agent-grimoire
```

## Attribution
Not affiliated with Bungie. All Destiny content © Bungie Inc.
