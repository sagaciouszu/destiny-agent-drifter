# v0.14.6 - Truth and onboarding pass

> **Depends On:** INDEX.md
> **Token Estimate:** ~152 tokens
**2026-11-10**

## What's Changed

- `core/multi-user.md` is enabled again; it was disabled while documented as adopted.
- Multi-User Isolation and Persona Freshness are back in the audit, 25 to 27 suites.
- AGENTS states the caption caveat and points series counts at `series/agents.json`.
- Adopts the shared setup.sh and the stricter shared-helper guard.

## Verification

- `bash tests/master-audit.sh`: 27/27.
- `python3 tests/persona-freshness.py`: rc 0.
- `python3 lore/tests/conformance.py`: PASS.
