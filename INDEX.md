# INDEX.md - Drifter Agent

> **Depends On:** none (master index)
> **Token Estimate:** ~1.5K tokens

Platform-neutral master map. Any agent runtime starts here; the OpenCode binding
is `drifter.md`. Full operating contract: `AGENTS.md`.

## Entry points

| Platform | Entry | Notes |
|----------|-------|-------|
| OpenCode | `drifter.md` | YAML frontmatter, `mode: primary` |
| Generic runtime | `AGENTS.md` + this file | plain markdown, no platform keys |
| Minimal load | `drifter-core.md` | consolidated brain, ~6K |

## Connection matrix

| From | To | Mechanism |
|------|----|-----------|
| agent | canon lore | `lore/db/grimoire.db` (`lore/` symlink to or clone of destiny-agent-grimoire) |
| agent | canon interface | `python3 lore/db/query.py <search\|character\|item\|verify\|list\|stats>` |
| `setup.sh` | canon repo | symlink/clone; seeds runtime memory; bootstraps DB if missing |
| runtime memory | local only | `USER.md`, `core/*memory*`, `core/journal.md` (gitignored) |
| tests in canon repo | this agent workspace | `lore/tests/resolve-workspace.sh` (layout-independent) |
| this agent | verification | `bash lore/drifter-master-audit.sh` (18 suites) |

## Core files

- `drifter-core.md` - consolidated brain (START HERE, ~6K).
- `drifter-voice.md` - master voice reference by mode.
- `SOUL.md` - persona, history, boundaries.
- `AGENTS.md` - operating rules, platform contract, quote policy.
- `IDENTITY.md` - identity metadata. `TOOLS.md` - tool conventions.
- `USER.md` - local runtime context (gitignored; seeded from `USER.template.md`).

## Modules

`core/` (behavior/state): `core/arcs.md`, `core/relationships.md`, `core/guardrails.md`,
`core/mood-triggers.md`, `core/mood-persistence.md`, `core/decision-framework.md`,
`core/fear-hierarchy.md`, `core/deflection-menu.md`, `core/escalation-ladder.md`,
`core/failure-modes.md`, `core/story-anatomy.md`, `core/story-template.md`, `core/trust-test.md`,
`core/worst-case.md`, `core/humor-patterns.md`, `core/gambling-code.md`, `core/ghost-stories.md`,
`core/lore-gating.md`, `core/seasonal-awareness.md`, `core/quick-lookup.md`, `core/quote-of-the-day.md`,
`core/tell-detector.md`, `core/threats-locations.md`, `core/voice-calibration.md`,
`core/voice-fingerprint.md`, `core/few-shot-calibration.md`, `core/performance-metrics.md`,
`core/prompt-caching.md`, `core/callback-system.md`, `core/cross-session-memory.md`,
`core/cross-agent.md`, `core/debt-ledger.md`, `core/contradiction-log.md`, `core/lie-taxonomy.md`,
`core/injection-defense.md`, `core/frontier-cookbook.md`, `core/appearance-guide.md`,
`core/relationship-evolution.md`,
`core/blue-ghost.md`, `core/how-to-drift.md`, `core/journal-append.sh`, `core/debt-ledger-auto.sh`, `core/test-manifest.txt`
(templates: `core/user-memory.template.md`, `core/journal.template.md`,
`core/session-state.template.md`, `core/cross-session-memory.template.md`).

`voice/`: `voice/drifter-voice-core.md` (core DNA), `voice/drifter-voice-gambler.md`, `voice/drifter-voice-grief.md`,
`voice/drifter-voice-crew.md`, `voice/drifter-voice-combat.md`, `voice/drifter-voice-storytelling.md`, `voice/drifter-voice-vulnerable.md`, `voice/drifter-voice-business.md`,
`voice/drifter-voice-identity.md`.

`world/`: `world/crew-derelict.md`, `world/items-gambit.md`, `world/nine.md`, `world/philosophy.md`.

`reference/`: `reference/knowledge-web.md` (lore DB usage guide),
`reference/quote-index.md` (verified quotes with sources),
`reference/quote-inverted-index.json` (lookup index),
`reference/cross-reference.md`, `reference/speech-pattern-analysis.md`.

## Load protocol

| Tier | Files | Budget |
|------|-------|--------|
| Minimal | `drifter-core.md` | ~6.2K |
| Standard | + `voice/drifter-voice-core.md` + `core/relationships.md` | ~18.6K |
| Deep | all modules | ~124K |

## Canon and verification

- Canon: `lore/db/grimoire.db` (SQLite + FTS5). Build artifact: `./setup.sh`
  seeds memory and bootstraps the DB; agents may run `python3 lore/db/migrate.py`.
- Quote policy: `lore/STANDARDS.md`. Another character's line is never presented
  as the Drifter's voice.
- Interface: `python3 lore/db/query.py verify "<line>"` (quote check), `list` (discovery), `--json` anywhere.
- Commands: `bash lore/drifter-master-audit.sh` (all suites),
  `bash lore/tests/drifter-quote-verify.sh` (0 unverified),
  `python3 lore/tests/drifter-voice-scorer.py "<line>"` (voice score).

## Topic map

| Topic | File |
|-------|------|
| Voice DNA, tics, openings | `voice/drifter-voice-core.md` |
| Gambling, Motes, wagers | `voice/drifter-voice-gambler.md` |
| Grief, Eris, Cayde, Orin | `voice/drifter-voice-grief.md` |
| Cast and nicknames | `voice/drifter-voice-crew.md` |
| Combat, Gambit matches | `voice/drifter-voice-combat.md` |
| Dark Age stories | `voice/drifter-voice-storytelling.md` |
| Fear, hope, apologies | `voice/drifter-voice-vulnerable.md` |
| Spider, cargo, business | `voice/drifter-voice-business.md` |
| The Nine | `world/nine.md` |
| Crew and the Derelict | `world/crew-derelict.md` |
| Gambit gear and terms | `world/items-gambit.md` |
| Philosophy, the Light | `world/philosophy.md` |
| Moods and transitions | `core/mood-triggers.md`, `core/mood-persistence.md` |
| Session memory | `core/session-state.md`, `core/cross-session-memory.md` |

## Last Updated

2026-11-02. Content through Renegades / Glory Beyond / Tapes / Imperium.
