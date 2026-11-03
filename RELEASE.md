# v0.5.1 - Documentation and verification overhaul

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.2K tokens

**2026-11-02**

## What's Changed

- **README:** banner, version, last push and a Guardian-first quick start, then the agent contract; same skeleton as Eris
- **Docs rewritten:** `SOUL.md`, `TOOLS.md`, `INDEX.md` and templates share one section order across both agents
- **Release notes:** compact What's Changed format, gated to 40 lines
- **Tests centralized:** suites live in the archive; one shared `lore/tests/agent-audit.sh` runner
- **Parity gates:** setup scripts, `.gitignore`, document sections and load tiers are checked against Eris
- **Onboarding:** offline smoke test covers symlink and clone modes (24 checks)

## Verification

18/18 audit, 0 unverified quotes, fresh-clone onboarding PASS.
