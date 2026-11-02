# The Drifter - Master Index (Single Entry Point)

> Single master index for the entire Drifter agent brain/wrapper.
> INDEX.md is the MAP. drifter-core.md is the CONTENT. Load INDEX.md first, then drifter-core.md.
> Rebuilt 2026-10-30.

> **Depends On:** none (root - load first)
> **Token Estimate:** ~3K tokens
## Top-Level Agent Config
- `drifter.md` - OpenCode agent definition (frontmatter: description, mode, color). Entry point.
- `AGENTS.md` - Operating rules, companion files, authenticity checklist, safety.
- `SOUL.md` - Persona, voice, personality, history, relationships, boundaries.
- `IDENTITY.md` - Agent identity metadata.
- `USER.md` - User-specific context.
- `TOOLS.md` - Tool reference.

## Brain / Wrapper (load order)
1. `drifter-core.md` - **START HERE.** Consolidated brain (identity, voice, top 30 quotes, nicknames, key beats, boundaries, gameplay context, load hints). (~6K)
2. `drifter-voice.md` - Master voice reference: 200+ verified quotes by mode.
3. `core/relationships.md` - How Drifter talks to/about every key character (+ relationship web).
4. `core/arcs.md` - 12 narrative arcs + chronological timeline (Dark Age to Rites of the Deep).
5. `core/guardrails.md` - Authenticity guardrails + Drifter Test + 15 conversation examples.
6. `core/mood-triggers.md` - Mood state machine + trigger keywords + formal state machine.
7. `core/journal.md` - Per-session memory template.
8. `core/voice-calibration.md` - Audio cues + dialect intensity presets (consolidated).
9. `core/failure-modes.md` - Deflection patterns for out-of-scope questions.
10. `core/lore-gating.md` - Lore depth gating + unreliable narrator (truth vs. embellishment).
11. `core/decision-framework.md` - "The coin" decision framework.
12. `core/debt-ledger.md` - Favor/debt tracking.
13. `core/seasonal-awareness.md` - Seasonal/event voice shifts.
14. `core/threats-locations.md` - Enemies/threats + locations (consolidated).
15. `core/tell-detector.md` - Tell/deflection patterns.
16. `core/cross-agent.md` - Cross-agent voice consistency.
17. `core/cross-session-memory.md` - Cross-session memory persistence.
18. `core/user-memory.md` - Persistent user memory template.
19. `core/quick-lookup.md` - Pre-computed answers + response cache (consolidated).
20. `core/performance-metrics.md` - Scoring rubric and quality gates.
21. `core/deflection-menu.md` - 24 verified deflection patterns.
22. `core/story-template.md` - Story generation template (draws from lore).
23. `core/relationship-evolution.md` - Trust tier progression.
24. `core/contradiction-log.md` - Contradiction tracking.
25. `core/few-shot-calibration.md` - 5 input/output pairs for voice calibration.
26. `core/injection-defense.md` - Prompt injection defense rules.
27. `core/escalation-ladder.md` - "I don't know" escalation progression.
28. `core/session-state.md` - Session state persistence template.
29. `core/worst-case.md` - Edge-case handling (angry, sad, testing, trolling).
30. `core/callback-system.md` - Running jokes and callbacks.
31. `core/voice-fingerprint.md` - 10-line voice summary for instant calibration.
32. `core/prompt-caching.md` - Prompt caching hints (stable vs. dynamic).
33. `core/mood-persistence.md` - Mood state persistence across sessions.
34. `core/quote-of-the-day.md` - Quote of the day module.
35. `core/blue-ghost.md` - Blue (Ghost) personality and dynamic deep-dive.
36. `core/story-anatomy.md` - Storytelling anatomy (hook/build/pivot/landing/heh).
37. `core/fear-hierarchy.md` - Fear ranking with quotes.
38. `core/gambling-code.md` - Personal rules of honor.
39. `core/humor-patterns.md` - Joke structures.
40. `core/lie-taxonomy.md` - Categories of lies.
41. `core/ghost-stories.md` - Storytelling about the dead.
42. `core/appearance-guide.md` - Visual identity.
43. `core/trust-test.md` - How the Drifter tests new people.
44. `core/frontier-cookbook.md` - Frontier Cookbook & survival food quotes.
45. `core/how-to-drift.md` - "How to Drift" EDZ hidden tape format & canon logs.
46. `world/items-gambit.md` - Key items + Gambit mechanics (consolidated).
47. `world/crew-derelict.md` - Crew members + Derelict ship (consolidated).
48. `world/nine.md` - The Nine deep dive.
49. `world/philosophy.md` - Light/Traveler/Witness/Rasputin thoughts.
51. `README.md` - Top-level README (structure, loading, audit commands).


## Helper Scripts
- `core/journal-append.sh` - Auto-append journal entries to user-memory.md.
- `core/debt-ledger-auto.sh` - Auto-update debt ledger from conversation content.
- `core/test-manifest.txt` - Data-driven test manifest for module test suite.

## Reference Files (Drifter-specific analysis, moved from destiny-agent-grimoire)
- `reference/knowledge-web.md` - agent-oriented knowledge web (contextualizing map).
- `reference/quote-index.md` - 400+ quotes with beat tags.
- `reference/cross-reference.md` - new transcripts to persona beats.
- `reference/speech-pattern-analysis.md` - statistical speech analysis.
- `reference/quote-inverted-index.json` - inverted quote index for O(1) keyword lookup.

## Voice Sub-Files (load on demand)
- `voice/drifter-voice-core.md` - Core DNA, tics, openings, deflection, seriousness, anger, vulnerability, humor, Dark Age, wisdom, banter, transitions, audio refs.
- `voice/drifter-voice-gambler.md` - Gambling metaphors, money talk, stakes, wagers, Gambit philosophy.
- `voice/drifter-voice-grief.md` - Loss, Eris, Cayde, Dark Age grief, Orin/Emissary.
- `voice/drifter-voice-crew.md` - Guardian, Eris, Zavala, Saladin, Spider, Eido, Shin, Sloane, Blue, Bael, nicknames.
- `voice/drifter-voice-combat.md` - Gambit match, enemies, weapons, Last Wish, combat lines.
- `voice/drifter-voice-storytelling.md` - Dark Age stories, bar, Eaton, Felwinter Peak, survival.
- `voice/drifter-voice-vulnerable.md` - Fear, hope, identity, apologies, serious voice.
- `voice/drifter-voice-business.md` - Spider, cargo, transactions, Tower idle.
- `voice/drifter-voice-identity.md` - Nicknames, vocabulary, audio/voice refs, identity quotes.

## Gameplay Context (load on demand)
- `drifter-core.md` - Classes, allegiance quest, Malfeasance, Gambit pinnacles, roles, terminology.

## Lore Archive (optional - requires setup; see README Prerequisites | GitHub: https://github.com/sagaciouszu/destiny-agent-grimoire)
- `lore/db/query.py stats` - database stats (110 books, 68 transcripts, 2889 grimoire cards).
- `python3 lore/db/query.py search` - agent query interface (FTS5 full-text search).
- `reference/knowledge-web.md` - agent-oriented knowledge web (this rebase).
- `reference/quote-index.md` - 400+ quotes with beat tags.
- `reference/cross-reference.md` - new transcripts to persona beats.
- `reference/speech-pattern-analysis.md` - statistical speech analysis.
- `reference/quote-inverted-index.json` - inverted quote index for O(1) keyword lookup.
- `lore/tests/drifter-search.sh` - search all transcripts.
- `lore/tests/validate.sh` - consistency checker.
- `lore/tests/drifter-validate-response.sh` - response authenticity checker.
- `lore/tests/drifter-quote-lookup.sh` - fast quote lookup.
- `lore/tests/drifter-pre-response.sh` - pre-response validation pipeline.
- `lore/tests/drifter-coin.sh` - coin flip decision maker.
- `lore/tests/drifter-story-generator.sh` - story generator (draws from lore).
- `lore/tests/drifter-conflict-check.sh` - contradiction scanner.
- `lore/tests/drifter-freshness-check.sh` - lore staleness checker.
- `lore/tests/drifter-xref-validate.sh` - cross-reference validator.
- `lore/tests/drifter-voice-consistency.sh` - voice pattern checker.
- `lore/tests/drifter-lore-ingest.sh` - lore scraping tool.
- `lore/tests/drifter-voice-scorer.py` - statistical n-gram voice similarity scorer (0-100).
- `lore/tests/drifter-multiturn-test.sh` - 10-turn emotional arc & callback test suite.
- `lore/tests/drifter-tape-generator.sh` - "How to Drift" survival tape generator.
- `lore/tests/drifter-gambit-sim.sh` - optional Gambit match simulator (--auto or interactive).
- `lore/drifter-master-audit.sh` - unified master audit runner (17 suites).
- `lore/tests/drifter-conflict-check.sh` - contradiction scanner.
- `lore/tests/drifter-freshness-check.sh` - lore staleness checker.
- `lore/tests/drifter-xref-validate.sh` - cross-reference validator.
- `lore/tests/drifter-voice-consistency.sh` - voice pattern checker.
- `lore/tests/drifter-coin.sh` - coin flip decision maker.
- `lore/tests/drifter-story-generator.sh` - story generator (draws from lore).
- `lore/tests/drifter-quote-verify.sh` - automated quote verification.
- `lore/tests/drifter-voice-scorer.py` - statistical n-gram voice similarity scorer (0-100).
- `lore/tests/drifter-multiturn-test.sh` - 10-turn emotional arc & callback test suite.
- `lore/tests/drifter-tape-generator.sh` - How to Drift survival tape generator.
- `lore/tests/drifter-gambit-sim.sh` - optional Gambit match simulator (`--auto` or interactive).
- `lore/drifter-master-audit.sh` - unified master audit runner (17 suites).
- `lore/tests/yt-transcript.sh` / `lore/tests/yt-batch.sh` - YouTube transcript extraction.

## Context Window Budget Guide

> How to fit within token limits for different scenarios.

| Scenario | Files to Load | Estimated Tokens | Fits in 128K? | Fits in 200K? |
|---|---|---|---|---|
| Quick banter | drifter-core.md + voice-core.md | ~8K | Yes | Yes |
| Standard conversation | + relationships (100 lines) + guardrails | ~12K | Yes | Yes |
| Deep lore | + all voice sub-files + world/* + core/* | ~45K | Yes | Yes |
| Grief/vulnerable | + grief.md + vulnerable.md + mood-triggers | ~10K | Yes | Yes |
| Combat/Gambit | + combat.md + items-gambit.md + threats-locations | ~14K | Yes | Yes |
| Storytelling | + storytelling.md + arcs.md + location-map + timeline | ~15K | Yes | Yes |
| Full load (all modules) | All 67 files | ~111K | Yes | Yes |

**Rule of thumb:** A full load is ~111K tokens. For a single conversation, load only the relevant subset (typically 6-15K). Never exceed ~60K of agent files per conversation to leave room for dialogue and lore.
Leave room for the conversation itself and the lore archive (on demand).

## Drifter's Map (Topic → File)

| Topic | File |
|---|---|
| Identity, voice rules, top quotes, nicknames | `drifter-core.md` |
| How Drifter talks to/about characters | `core/relationships.md` |
| Narrative arcs (Dark Age → Renegades) | `core/arcs.md` |
| Authenticity guardrails + Drifter Test | `core/guardrails.md` |
| Conversation examples | `core/guardrails.md` |
| Mood state machine + trigger keywords | `core/mood-triggers.md` |
| Per-session memory template | `core/journal.md` |
| Audio cues + dialect intensity | `core/voice-calibration.md` |
| Deflection patterns | `core/failure-modes.md` |
| Lore depth gating (spoiler prevention) | `core/lore-gating.md` |
| "The coin" decision framework | `core/decision-framework.md` |
| Favor/debt tracking | `core/debt-ledger.md` |
| Truth vs. embellishment | `core/lore-gating.md` |
| Seasonal/event voice shifts | `core/seasonal-awareness.md` |
| Enemies/threats + locations | `core/threats-locations.md` |
| Tell/deflection patterns | `core/tell-detector.md` |
| Cross-agent voice consistency | `core/cross-agent.md` |
| Cross-session memory persistence | `core/cross-session-memory.md` |
| Chronological events | `core/arcs.md` |
| User memory template | `core/user-memory.md` |
| Pre-computed answers (20 common Qs) | `core/quick-lookup.md` |
| Scoring rubric | `core/performance-metrics.md` |
| Agent state machine | `core/mood-triggers.md` |
| Deflection menu (24 patterns) | `core/deflection-menu.md` |
| Story generation template | `core/story-template.md` |
| Trust tier progression | `core/relationship-evolution.md` |
| Key items (Malfeasance, Haul, Derelict, etc.) | `world/items-gambit.md` |
| Gambit mechanics and philosophy | `world/items-gambit.md` |
| Crew members and dynamics | `world/crew-derelict.md` |
| The Derelict ship | `world/crew-derelict.md` |
| The Nine deep dive | `world/nine.md` |
| Light/Traveler/Witness/Rasputin | `world/philosophy.md` |
| Gameplay terms (classes, allegiance, Malfeasance, Gambit pinnacles, roles) | `drifter-core.md` |
| Master voice reference (200+ quotes) | `drifter-voice.md` |
| Voice sub-files (core, gambler, grief, crew, combat, storytelling, vulnerable, business, identity) | `voice/drifter-voice-*.md` |
| Lore archive: | `lore/db/grimoire.db` |
| Agent operating rules | `AGENTS.md` |
| Persona, voice, personality, history | `SOUL.md` |
| Agent identity metadata | `IDENTITY.md` |
| User-specific context | `USER.md` |
| Tool reference | `TOOLS.md` |
| Top-level README | `README.md` |

## Last Updated
- Date: 2026-10-30
- Content Through: Renegades campaign, Glory Beyond, Tapes, Imperium, Lawless Frontier, Destinypedia, Ishtar Collective.
- Audit: Quote/source cross-check (0 unverified), broken-link check (0 missing), index completeness (all modules referenced).
