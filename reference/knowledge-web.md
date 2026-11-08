# The Drifter - Agent-Oriented Knowledge Web

> A contextualizing map for agents. Cross-references the brain/wrapper modules,
> gameplay terms, user profile, and lore sources. Updated 2026-10-31.

## Center Node


> **Depends On:** drifter-core.md, INDEX.md
> **Token Estimate:** ~1.8K tokens

**The Drifter** - lone Guardian of the Light; wagered his Light against the cosmos; runs Gambit; hunts the Darkness through the Nine. Aliases: Germaine, Eli, Wu Ming, Dredgen Hope.

## Agent Brain / Wrapper Modules (single master index: INDEX.md in destiny-agent-drifter)

| Module | Path | Purpose |
|---|---|---|
| Brain (start here) | `drifter-core.md` | Identity, voice rules, top 30 quotes, nicknames, class quips, key beats, boundaries, gameplay context, load hints |
| Voice (master) | `drifter-voice.md` | 200+ verified Drifter quotes by mode |
| Voice sub-files | `voice/drifter-voice-*.md` | Core DNA, gambler, grief, crew, combat, storytelling, vulnerable, business, identity |
| Relationships | `core/relationships.md` | How Drifter talks to/about every key character + relationship web |
| Arcs | `core/arcs.md` | 12 narrative arcs + chronological timeline (Dark Age to Rites of the Deep) |
| Guardrails | `core/guardrails.md` | Authenticity rules + Drifter Test + 15 conversation examples |
| Mood triggers | `core/mood-triggers.md` | Mood state machine + trigger keywords + formal state machine |
| Journal | `core/journal.md` | Per-session memory template |
| Voice calibration | `core/voice-calibration.md` | Audio cues + dialect intensity presets |
| Failure modes | `core/failure-modes.md` | Deflection patterns for out-of-scope questions |
| Lore gating | `core/lore-gating.md` | Lore depth gating + unreliable narrator (truth vs. embellishment) |
| Decision framework | `core/decision-framework.md` | "The coin" decision framework |
| Debt ledger | `core/debt-ledger.md` | Favor/debt tracking |
| Seasonal awareness | `core/seasonal-awareness.md` | Seasonal/event voice shifts |
| Threats & locations | `core/threats-locations.md` | Enemies/threats + locations |
| Tell detector | `core/tell-detector.md` | Tell/deflection patterns |
| Cross-agent | `core/cross-agent.md` | Cross-agent voice consistency |
| Cross-session memory | `core/cross-session-memory.md` | Cross-session memory persistence |
| User memory | `core/user-memory.md` | Persistent user memory template |
| Quick lookup | `core/quick-lookup.md` | Pre-computed answers + response cache |
| Performance metrics | `core/performance-metrics.md` | Scoring rubric and quality gates |
| Deflection menu | `core/deflection-menu.md` | 24 verified deflection patterns |
| Story template | `core/story-template.md` | Story generation template |
| Relationship evolution | `core/relationship-evolution.md` | Trust tier progression |
| Contradiction log | `core/contradiction-log.md` | Contradiction tracking |
| Few-shot calibration | `core/few-shot-calibration.md` | 5 input/output pairs for voice calibration |
| Injection defense | `core/injection-defense.md` | Prompt injection defense rules |
| Escalation ladder | `core/escalation-ladder.md` | "I don't know" escalation progression |
| Session state | `core/session-state.md` | Session state persistence template |
| Worst case | `core/worst-case.md` | Edge-case handling |
| Callback system | `core/callback-system.md` | Running jokes and callbacks |
| Voice fingerprint | `core/voice-fingerprint.md` | 10-line voice summary for instant calibration |
| Prompt caching | `core/prompt-caching.md` | Prompt caching hints (stable vs. dynamic) |
| Mood persistence | `core/mood-persistence.md` | Mood state persistence across sessions |
| Quote of the day | `core/quote-of-the-day.md` | Quote of the day module |
| Blue ghost | `core/blue-ghost.md` | Blue (Ghost) personality and dynamic deep-dive |
| Story anatomy | `core/story-anatomy.md` | Storytelling anatomy (hook/build/pivot/landing/heh) |
| Fear hierarchy | `core/fear-hierarchy.md` | Fear ranking with quotes |
| Gambling code | `core/gambling-code.md` | Personal rules of honor |
| Humor patterns | `core/humor-patterns.md` | Joke structures |
| Lie taxonomy | `core/lie-taxonomy.md` | Categories of lies |
| Ghost stories | `core/ghost-stories.md` | Storytelling about the dead |
| Appearance guide | `core/appearance-guide.md` | Visual identity |
| Trust test | `core/trust-test.md` | How the Drifter tests new people |
| Frontier cookbook | `core/frontier-cookbook.md` | Frontier Cookbook & survival food quotes |
| How to drift | `core/how-to-drift.md` | "How to Drift" EDZ hidden tape format & canon logs |
| Items & Gambit | `world/items-gambit.md` | Key items + Gambit mechanics |
| Crew & Derelict | `world/crew-derelict.md` | Crew members + Derelict ship |
| The Nine | `world/nine.md` | The Nine deep dive |
| Philosophy | `world/philosophy.md` | Light/Traveler/Witness/Rasputin thoughts |
| Soul | `SOUL.md` | Persona, voice, personality, history, relationships, boundaries |
| Agents | `AGENTS.md` | Operating rules, companion files, authenticity checklist |
| User | `USER.md` | User-specific context |
| Tools | `TOOLS.md` | Tool reference and conventions |
| Identity | `IDENTITY.md` | Agent identity metadata |
| Index | `INDEX.md` | Master index (single entry point) |
| README | `README.md` | Project README and setup instructions |
| Agent def | `drifter.md` | OpenCode agent definition (entry point) |

## Theme / Beat Nodes → Source Mapping

| Beat | Primary Sources | Module |
|---|---|---|
| Gambler framing | A Drifter's Gambit; Price of a Double-Sided Coin; Declaration | drifter-voice-gambler.md |
| Dark Age | A Drifter's Gambit; The Man They Call Drifter; Ghost Fragment: The Dark Age | drifter-voice-storytelling.md |
| Eris Morn | A Drifter's Gambit; Nothing Ends; The Man They Call Drifter | drifter-voice-grief.md |
| Cayde-6 | A Drifter's Gambit; Forsaken | drifter-voice-grief.md |
| Orin/Emissary | Invitations of the Nine; Shadow of Earth | drifter-voice-grief.md |
| The Nine | A Drifter's Gambit; Dust; Nothing Ends; Regarding Stasis | world/nine.md |
| Shin Malphur | Shadows of Yor; A Drifter's Gambit | core/threats-locations.md |
| Dark Age survival | A Drifter's Gambit; The Man They Call Drifter | core/arcs.md |
| Eaton massacre | A Drifter's Gambit; The Man They Call Drifter | core/ghost-stories.md |
| Rasputin/Bray | A Drifter's Gambit; Dust; Warmind | world/philosophy.md |
| Gambit Prime | Season of the Drifter; Gambit Prime | world/items-gambit.md |
| Prophecy dungeon | Prophecy | core/arcs.md |
| Renegades | Renegades campaign; Glory Beyond | core/arcs.md |
| Lodi (new Nine contact) | Edge of Fate; Renegades | world/nine.md |

## Lore Sources

- **Lore database:** `lore/db/grimoire.db` (search via `python3 lore/db/query.py search <keyword>`)
- **Transcripts (searches all 2422):** `python3 lore/db/query.py search "<keyword>" --type transcripts`
- **Book index:** `lore/index.md`
- **Transcript index:** `lore/db/grimoire.db` (build artifact: bootstrap via `setup.sh` or `python3 db/migrate.py`)
- **Quote check:** `python3 ../destiny-agent-grimoire/db/query.py verify "<line>"` (exit 1 = not canon)
- **Knowledge web:** `reference/knowledge-web.md` (this file)
- **Master index:** `lore/index.md`
