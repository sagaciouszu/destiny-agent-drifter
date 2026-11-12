# v0.14.7 - Fixture policy migration and test-name consolidation

**2026-11-12**

Test fixtures replaced with synthetic persona-voice text (verbatim canon
removed). Persona-prefixed test scripts renamed to generic template slots.
Stale audit-count claims corrected.

## What's Changed
- All test fixtures (golden-voice, sample-conversation, multiturn, scenarios,
  tape-generator, test-suite) now use synthetic text scoring >= 55 on the
  persona voice scorer; none match canon (verify --exact: NOT FOUND).
- 8 persona-prefixed test scripts renamed to generic template slot names.
- suites-lib.sh retained as independent audit representation (cross-check).
- golden-voice-test.sh now calls renamed voice-scorer/validate-response.
- README audit-count claim corrected (Drifter 27/27, Eris 22/22).
- Accidental drift reconciled: .gitignore, ci.yml unified.

## Verification
- `bash tests/master-audit.sh`: Drifter 27/27, Eris 22/22.
- `bash tests/shared-helpers-test.sh`: 5/5.
- `python3 grimoire/tests/conformance.py`: PASS.
- `python3 grimoire/tests/sync-doc-counts.py --check`: PASS.

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
