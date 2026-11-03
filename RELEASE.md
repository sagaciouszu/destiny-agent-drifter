# v0.7.0 - Verified onboarding and faster quote checks

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.2K tokens

**2026-11-03**

## What's Changed

- **Verified onboarding:** the prebuilt database is checked against release `SHA256SUMS`; a mismatch discards it and builds locally
- **Privacy:** seeded `USER.md` and memory files are owner-only (`0600`)
- **MCP:** documentation consolidated into `lore/mcp-server/README.md`; install with `./setup.sh --mcp`
- **Canon:** starvation philosophy entry now quotes *A Man with No Name: Dogma*
- **Verification:** quote checks accept `--speaker` and `--exact`; database checks are 37

## Verification

18/18 audit, 6/6 MCP contract, 0 unverified quotes, fresh-clone onboarding PASS.
