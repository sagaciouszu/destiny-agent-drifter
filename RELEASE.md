# Release v0.5.0 - Platform-Agnostic Contract + Interface v2

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.4K tokens

**Date:** 2026-11-02

## Highlights

- **AGENTS.md rewritten** - platform-neutral operating contract: hard rules, canon/quoting policy, data access, load protocol, platform bindings, connection matrix
- **INDEX.md rewritten** - entry points for OpenCode and generic runtimes, connection matrix, module inventory, measured load tiers, topic map
- **Grimoire interface v2 wired in** - `verify` quote check, `list` discovery, `--json`, snippet-first search across AGENTS/INDEX/TOOLS/agent def/core/knowledge-web
- **Runtime memory is now gitignored** - `USER.md` and core memory files are templates seeded by `setup.sh`; personal conversation data can never be pushed
- **Agent-safe bootstrap** - setup offers prebuilt download or local build, honors `BOOTSTRAP=1|2`, never blocks (timeout + EOF-safe)
- **Voice integrity** - cross-character attribution check (exchanges, headings, reported speech, impressions handled); all other characters' lines removed from Drifter voice files
- **Measured tiers** - minimal ~6.2K, standard ~18.6K, deep ~124K (previously asserted, now measured)
- **Clone-mode parity** - tests accept `lore/` as a symlink or a clone and never scan inside it
- **Centralized tests** - agent suites live in the archive; one shared `tests/agent-audit.sh` runner and `tests/check-agent-structure.py`; both agents share the same setup flow and `.gitignore`

## Verification

| Suite | Result |
|-------|--------|
| `lore/drifter-master-audit.sh` | 18/18 |
| `grimoire-master-audit.sh` | 11/11 |
| `eris-master-audit.sh` | 13/13 |
| quote verification | 0 unverified |
| attribution | 0 non-Drifter quotes |
| fresh-clone onboarding | seeded memory + built database + 18/18 |

Fan-made. Not affiliated with or endorsed by Bungie.
