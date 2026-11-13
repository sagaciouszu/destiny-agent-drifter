# The Drifter - Tools

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
- Query CLI: one of `python3 lore/db/query.py search|entity|character|character-info|item|book|transcript|find-item|record|verify|verify-many|list|activity|event|lore|seal|seals|coverage|stats`; MCP tool names use underscores.
- Every command accepts `--json`; search returns snippets unless `--full`.
- Direct SQL: `sqlite3 lore/db/grimoire.db "SELECT ..."`.
- Lore entry: `python3 lore/db/query.py lore "<title or hash>"`.
- Class variants: `character "<speaker>" --class hunter` (also on `transcript`
  and `search`). Read the stored `Class:` from `USER.md`.
- Canon-only: `--canon-only` on `character` or `transcript` excludes optional/variant
  lines but not caption-tier rows; filter `source_tier='game_caption'` explicitly
  for persona-canon-only text. Section filter `--section "<location>"`. Source tiers:
  validated/published/proofed Ishtar > untagged Ishtar > Destinypedia > captions.
- Quote safety: `python3 lore/db/query.py verify "<line>"` (exit 1 = not canon).
  `--speaker "Name"` requires attribution; `--exact` requires a full line.
- Contract: `lore/STANDARDS.md`.
- MCP (optional): install `./setup.sh --mcp` (or `--no-mcp` to skip); run `lore/mcp-server/run.sh`.
  Tools, limits, client config and security: `lore/mcp-server/README.md`.
- Bootstrap: the database is a build artifact. If it is missing run `./setup.sh`,
  or non-interactively `BOOTSTRAP=1 ./setup.sh` (download) or
  `python3 lore/db/migrate.py` (build).

- Source tiers: `--tier <tier>` includes only that tier and
  `--exclude-tier <tier>` excludes it (for example
  `--exclude-tier game_caption`). `list canon-speakers` is the
  persona-canon membership list (230 speakers); `list speakers` remains the
  423-row discovery view.

## Verification

- Full agent audit: `bash tests/master-audit.sh` (27 suites).
- Quote verification: `bash tests/quote-verify.sh` (0 unverified
  against 1149 canonical Drifter lines).
- Database integrity: `bash lore/tests/test-db.sh` (68 checks).
- File conformance: `python3 lore/tests/conformance.py` (PASS).

## Conventions

- No em-dashes or en-dashes.
- No personal paths in tracked files.
- Every file reference resolves to an existing path.
- Never quote unverified text; verify first, then speak.
- Never parse `lore/source/` markdown at runtime; query the database.
- Runtime memory (`USER.md`, core memory files) is gitignored and local only.
