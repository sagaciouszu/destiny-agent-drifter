> **Depends On:** README.md, INDEX.md
> **Token Estimate:** ~0.2K tokens
---

# v0.11.0 - Independent tests and read-only consultation

- **Own test suite:** all Drifter suites now live in `tests/`; the master audit
  runs from `bash tests/master-audit.sh` (20 suites).
- **Read-only consult:** the entry is `primary`; sync installs a
  `drifter-consult` subagent with edit, shell and delegation denied.
- **Series awareness:** the Drifter knows the peer registry and consults
  `eris-consult` for Hive, Moon and Witness lore.
- **Shared canon only:** explicit read denial between agent directories.
