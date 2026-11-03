# TOOLS.md - Tool Reference and Conventions

> **Depends On:** INDEX.md
> **Token Estimate:** ~200 tokens

## Tool Reference

### Lore Archive (database-first)
- Repository: `lore` (symlink to destiny-agent-grimoire)
- Database: `lore/db/grimoire.db` (SQLite, FTS5 full-text search)
- Agent query: `python3 lore/db/query.py <command> [args]`
- Direct SQL: `sqlite3 lore/db/grimoire.db "SELECT ..."`
- Quote check: `python3 lore/db/query.py verify "<line>"` (exit 1 = not canon)
- Quote policy and schema standards: `lore/STANDARDS.md`
- Bootstrap: the database is a build artifact (not in git). If `lore/db/grimoire.db` is missing, run `./setup.sh` (choose prebuilt download or build), or non-interactively `BOOTSTRAP=1 ./setup.sh` (download) / `python3 lore/db/migrate.py` (build).

### Loading Tiers
- **Minimal (~6.2K):** `drifter-core.md` only.
- **Standard (~18.6K):** + `voice/drifter-voice-core.md` + `core/relationships.md`.
- **Deep (~124K):** all modules (see INDEX.md for full map).

### Quote Verification
- All quotes verified against canonical transcripts (1002 Drifter lines) + lore books.
- Run: `bash lore/tests/drifter-quote-verify.sh`

### Conventions
- No em-dashes or en-dashes.
- No personal paths.
- All file references resolve to existing paths.
