# TOOLS.md - Tools and Conventions

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.44K tokens

## Runtime tools

| Tool | Used for |
|---|---|
| `python3` 3.8+ | query CLI, migration, tests (standard library only) |
| `bash` 4+ | setup, audits, verification suites |
| `sqlite3` | optional raw SQL against the database |
| `git` | lore archive clone or update |
| `curl` | optional prebuilt database download |

## Data access

- Repository: `lore` (a symlink to or clone of `destiny-agent-grimoire`).
- Database: `lore/db/grimoire.db` (SQLite with FTS5).
- Query CLI: `python3 lore/db/query.py search|character|item|verify|list|stats`.
- Every command accepts `--json`; search returns snippets unless `--full`.
- Direct SQL: `sqlite3 lore/db/grimoire.db "SELECT ..."`.
- Quote safety: `python3 lore/db/query.py verify "<line>"` (exit 1 = not canon).
  `--speaker "Name"` requires attribution; `--exact` requires a full line.
- Contract: `lore/STANDARDS.md`.
- MCP (optional): `lore/mcp-server/run.sh` exposes `search`, `character`, `item`,
  `verify`, `list_records`, `stats` as typed tools over stdio for clients
  without a shell. It ships with the archive, so one install serves both agents.
  Install with `./setup.sh --mcp` or `bash lore/mcp-server/install.sh`; register
  the printed path. Read-only, no SQL tool, limits clamp to 1-100. Details:
  `lore/mcp-server/README.md`.
- Bootstrap: the database is a build artifact. If it is missing run `./setup.sh`,
  or non-interactively `BOOTSTRAP=1 ./setup.sh` (download) or
  `python3 lore/db/migrate.py` (build).

## Verification

- Full agent audit: `bash lore/drifter-master-audit.sh` (18 suites).
- Quote verification: `bash lore/tests/drifter-quote-verify.sh` (0 unverified
  against 1002 canonical Drifter lines).
- Database integrity: `bash lore/tests/test-db.sh` (36 checks).
- File conformance: `python3 lore/tests/conformance.py` (PASS).

## Conventions

- No em-dashes or en-dashes.
- No personal paths in tracked files.
- Every file reference resolves to an existing path.
- Never quote unverified text; verify first, then speak.
- Never parse `lore/source/` markdown at runtime; query the database.
- Runtime memory (`USER.md`, core memory files) is gitignored and local only.
