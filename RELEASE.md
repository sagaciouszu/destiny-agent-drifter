# v0.11.0 - Independent tests and read-only consultation

> **Depends On:** INDEX.md
> **Token Estimate:** ~0.2K tokens

**2026-11-03**

## What's Changed

- **Own test suite:** all Drifter suites now live in `tests/`; the master audit runs from `bash tests/master-audit.sh` (20 suites)
- **Read-only consult:** the entry is `primary`; sync installs a `drifter-consult` subagent with edit, shell and delegation denied
- **Series awareness:** the Drifter knows the peer registry and consults `eris-consult` for Hive, Moon and Witness lore
- **Shared canon only:** explicit read denial between agent directories

## Verification

20/20 audit, 7/7 MCP contract, 141-call matrix, fresh-clone onboarding PASS.
