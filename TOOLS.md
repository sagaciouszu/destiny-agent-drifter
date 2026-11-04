# TOOLS.md - Tools and Conventions

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.6K tokens

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
- Query CLI: one of `python3 lore/db/query.py search|character|character-info|item|book|transcript|find-item|record|verify|verify-many|list|activity|event|lore|seal|seals|coverage|stats`; MCP tool names use underscores.
- Every command accepts `--json`; search returns snippets unless `--full`.
- Direct SQL: `sqlite3 lore/db/grimoire.db "SELECT ..."`.
- Lore entry: `python3 lore/db/query.py lore "<title or hash>"`.
- Canon-only: add `--canon-only` to `character` or `transcript`; section filter
  `--section "<location>"`. Source tiers: validated/published/proofed Ishtar >
  untagged Ishtar > Destinypedia > captions.
- Quote safety: `python3 lore/db/query.py verify "<line>"` (exit 1 = not canon).
  `--speaker "Name"` requires attribution; `--exact` requires a full line.
- Contract: `lore/STANDARDS.md`.
- MCP (optional): install `./setup.sh --mcp` (or `--no-mcp` to skip); run `lore/mcp-server/run.sh`.
  Tools, limits, client config and security: `lore/mcp-server/README.md`.
- Bootstrap: the database is a build artifact. If it is missing run `./setup.sh`,
  or non-interactively `BOOTSTRAP=1 ./setup.sh` (download) or
  `python3 lore/db/migrate.py` (build).

## Verification

- Full agent audit: `bash tests/master-audit.sh` (20 suites).
- Quote verification: `bash tests/drifter-quote-verify.sh` (0 unverified
  against 1002 canonical Drifter lines).
- Database integrity: `bash lore/tests/test-db.sh` (50 checks).
- File conformance: `python3 lore/tests/conformance.py` (PASS).

## Conventions

- No em-dashes or en-dashes.
- No personal paths in tracked files.
- Every file reference resolves to an existing path.
- Never quote unverified text; verify first, then speak.
- Never parse `lore/source/` markdown at runtime; query the database.
- Runtime memory (`USER.md`, core memory files) is gitignored and local only.
