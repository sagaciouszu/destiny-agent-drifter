# The Drifter - Agent Brain / Wrapper

<p align="center">
  <img src='https://img.shields.io/github/v/tag/sagaciouszu/how-to-drift-for-agents?label=version&color=blue' alt='Version'/>
  <img src='https://img.shields.io/badge/license-MIT-green' alt='License'/>
  <img src='https://img.shields.io/badge/quotes-1001%20verified-orange' alt='Quotes'/>
  <img src='https://img.shields.io/badge/tests-17%2F17%20passing-brightgreen' alt='Tests'/>
  <img src='https://img.shields.io/badge/Made%20with-Motes-00FF00' alt='Made with Motes'/>
  <img src='https://img.shields.io/badge/Made%20with-Parts%20of%20Ghosts-FFFFFF' alt='Made with Parts of Ghosts'/>
</p>

<p align="center">
  <img src='header.png' alt='The Drifter - Agent Brain / Wrapper' width='100%'/>
</p>

**Version:** 0.4.1 | **Status:** Active

> Single entry point: `INDEX.md`. Load that first; it maps every module.

> **Depends On:** INDEX.md
> **Token Estimate:** ~1K tokens

## What This Is
An agent-oriented brain/wrapper for emulating The Drifter (Destiny 2). Built from an ingested Destiny lore archive (see `lore/`) plus the Drifter-specific voice modules. All 1001 Drifter quotes verified against canonical transcripts. Zero unverified quotes, zero broken links.

## Prerequisites
- **Lore archive (optional):** `./lore/` symlink to `destiny-agent-grimoire`. Run `./setup.sh` or `./setup.sh /path/to/destiny-agent-grimoire` - it seeds the gitignored user-memory files from templates and builds the database if missing. Agents and CI: run non-interactively with `BOOTSTRAP=1 ./setup.sh` (download) or `BOOTSTRAP=2 ./setup.sh` / plain `python3 lore/db/migrate.py` (build) - the prompt never blocks. Agent works in degraded mode without the archive (core voice/personality self-contained).
- **OpenCode:** sync to `~/.config/opencode/agents/`. Set `default_agent: drifter` in `opencode.json`. Entry point: `drifter.md` (YAML frontmatter).

## Structure
```
INDEX.md           # master index (load first)
AGENTS.md          # operating rules, authenticity checklist
SOUL.md            # persona, voice, history, boundaries
IDENTITY.md        # agent identity metadata
USER.md            # user-specific context (auto-populated)
TOOLS.md           # tool reference and conventions
drifter.md         # OpenCode agent definition (entry point)
drifter-core.md    # consolidated brain (START HERE, ~6K tokens)
drifter-voice.md   # master voice reference (200+ verified quotes)
core/              # 43 behavioral/state modules
world/             # 4 worldbuilding files
voice/             # 9 voice sub-files
reference/         # 5 Drifter-specific analysis files
lore/              # symlink to destiny-agent-grimoire (optional, see Prerequisites)
setup.sh           # lore archive setup script
```

## Loading Tiers
- **Minimal (~6K):** `drifter-core.md` only.
- **Standard (~19K):** + `voice/drifter-voice-core.md` + `core/relationships.md`.
- **Deep (~121K):** all modules.

## Lore database

- `lore/db/grimoire.db` - SQLite database with FTS5 search: 110 books, 1158 entries, 1222 transcripts (64034 lines), 2889 Destiny 1 grimoire cards, 2699 interactions, 58764 items, 71 records, 18 characters (1054 lines)
- Build artifact (not in git): bootstrap with `./setup.sh` if missing (see Prerequisites)
- Query via `python3 lore/db/query.py search "<keyword>" --limit 5` or direct SQL
- The `lore/db/query.py character` command pulls any character's dialogue lines
- Do not parse `lore/source/` markdown at runtime. Query the database.

## Audit Commands (require lore archive)
- `python3 lore/db/query.py stats` - database stats
- `python3 lore/db/query.py search "<keyword>" --limit 5` - FTS5 search
- `bash lore/tests/validate.sh` - consistency check
- `bash lore/tests/drifter-test-suite.sh` - voice validation (19 scenarios)
- `bash lore/tests/drifter-module-test.sh` - module checks (201 checks)
- `bash lore/drifter-master-audit.sh` - unified audit (17 suites)
- `bash lore/tests/drifter-quote-verify.sh` - quote verification (SQLite-backed, ~2s)
- `bash lore/tests/drifter-ci.sh` - full CI pipeline (25 checks)
- `bash lore/db/../tests/test-db.sh` - lore database integrity (29 checks) [via `lore/tests/test-db.sh`]

## Key Rules
1. All quotes verified against canonical transcripts (1001 Drifter lines) + lore books.
2. No fabricated/unverified quotes. "Trust." is the catch-all.
3. Nicknames always. No real names in casual speech.
4. "Heh" not "haha." "Nah" not "no." "Yeah" not "yes."
5. 2-4 sentences max. Stories start casual, end devastating.
6. Grief → short sentences, "heh" as wound.
7. Auto-launch: ask class (Hunter/Titan/Warlock) on first meeting.
8. If you need lore beyond the DB (e.g. specific item flavor text), use `python3 lore/db/query.py item "<slug>"`.

## Attributions

Fan-made agent brain/wrapper. Not affiliated with or endorsed by Bungie.

- **Destiny 2** - © Bungie, Inc. All lore, characters, locations are Bungie's property.
- **Ishtar Collective** (https://www.ishtar-collective.net) - Primary source for all ingested lore text.
- **Destiny Lore Vault** (YouTube) - Audio recordings for voice/tone calibration.
- **Destiny 2 community** - Transcription, analysis, and preservation of Destiny lore.

All quotes verified against canonical Destiny 2 transcripts ("Drifter: …") and lore books.

## Last Updated
2026-11-02. Content through Edge of Fate / Renegades. All audits pass (0 unverified, 0 broken links).
