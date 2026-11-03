# v0.8.0 - MCP reading tools and pagination

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.2K tokens

**2026-11-03**

## What's Changed

- **MCP reading tools:** `book`, `transcript`, `find_item`, `record`, plus `offset` on search, character and listings
- **Resources:** books, characters, records and stats are exposed as read-only resources
- **CLI parity:** the same reading commands and pagination are available through `lore/db/query.py`
- **Tests:** MCP matrix now covers 138 calls across ten tools and four resources

## Verification

18/18 audit, 6/6 MCP contract, 0 unverified quotes, fresh-clone onboarding PASS.
