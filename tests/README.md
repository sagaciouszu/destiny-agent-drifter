# Tests

> **Depends On:** INDEX.md
> **Token Estimate:** ~1.1K tokens

Run the full gate first:

```bash
bash tests/master-audit.sh
```

`tests/suites.json` records the 25 suites the audit runs. The suite
definitions live in one place, `tests/suites-lib.sh`, which both
`master-audit.sh` and `drifter-ci.sh` source.

| Test | Purpose |
|---|---|
| `master-audit.sh` | every local suite plus the shared grimoire gates |
| `suites-lib.sh` | shared suite list (sourced by the two orchestrators, not run) |
| `drifter-ci.sh` | the same suite list plus CI-only gates (archive integrity, `lore/tests/ci-checks.py`, script syntax) |
| `run-suites.sh` | runs `suites.json` entries through `lore/tests/run-suite-manifest.py` |
| `validate.sh` | archive links, module dirs, unverified quotes |
| `drifter-xref-validate.sh` | every `Depends On:` reference resolves |
| `drifter-module-test.sh` | manifest, structure, hygiene and header checks (202 checks) |
| `drifter-test-suite.sh` | 19 single-turn voice scenarios |
| `drifter-validate-response.sh` | 8-point regex voice check for one response |
| `drifter-voice-scorer.py` | statistical voice score for one response |
| `drifter-voice-consistency.sh` | non-Drifter speech patterns and cross-character attribution |
| `drifter-multiturn-test.sh` | 10-turn emotional arc (10/10) |
| `drifter-scenario-simulator.sh` | scenario response (PASS/PARTIAL) |
| `drifter-tape-generator.sh` | lore-backed tape generation (PASS) |
| `drifter-gambit-sim.sh` | Gambit simulation (VICTORY) |
| `drifter-freshness-check.sh` | database freshness and row counts |
| `drifter-conflict-check.sh` | contradictory statements across agent files |
| `drifter-quote-verify.sh` | every quoted string is canon (0 unverified) |
| `conversation-test.sh` | SQLite conversation flow |
| `sample-conversation-test.py` | recorded sample conversation |
| `golden-voice-test.sh` | locked voice snapshots from `golden-voice.json` |
| `connection-test.sh` | grimoire database, query interface, lore/seal, MCP |
| `memory-test.py` | per-user memory isolation |
| `persona-freshness.py` | `persona.json` `canon_lines` still matches the database |
| `shared-helpers-test.sh` | shared helpers byte-identical to their `lore/tests/` copies |

## Running

```bash
bash tests/master-audit.sh   # full gate: 25 suites plus the shared grimoire gates
bash tests/drifter-ci.sh     # the same suite list plus CI-only gates
bash tests/run-suites.sh     # suites.json entries only (additive)
```

## Preconditions

- `lore/` symlink (or clone) pointing at the grimoire repo.
- `lore/db/grimoire.db` bootstrapped with `./setup.sh` (or
  `python3 lore/db/migrate.py`); `master-audit.sh` aborts with exit 1 without it.
- `WORKSPACE` resolving to this repo (derived by `lore/tests/resolve-workspace.sh`
  when unset).

## Exit codes

- Convention: 0 = pass, 1 = fail. `master-audit.sh`, `drifter-ci.sh` and the
  counter-based tests (`drifter-module-test.sh`, `connection-test.sh`,
  `golden-voice-test.sh`) return 1 when anything fails.
- Voice scorers exit 2 when the grimoire database is missing
  (`./drifter-voice-scorer.py` prints `database not found`); otherwise they exit
  0 at a score of 55 or above and 1 below it.
- Some tests report failure only through their summary line (for example
  `drifter-test-suite.sh` prints `Failed: N` but exits 0); their suites gate on
  that line with `grep -q 'Failed: 0'`.

## Voice scoring methodology

- **Corpus:** canonical speaker lines loaded from `lore/db/grimoire.db`
  (`transcript_lines` where the speaker matches Drifter and `is_stage_dir = 0`),
  with `lore/source/transcripts/*.md` as fallback when the database has no
  matching rows. The scorer prints `Corpus size: N canonical lines`.
- **Components:** vocabulary overlap (0-20), n-gram phrasing (0-20), signature
  marker density (0-25), sentence cadence (0-15), character n-gram overlap
  (0-10), signature phrase detection (0-15), plus brevity and consistency
  bonuses (0-5 each).
- **Verdict:** total score of 55 or more = PASS, 40 to 54 = PARTIAL, below 40 =
  FAIL; the process exits 0 only at 55 or above.
- **Golden snapshots:** each case in `golden-voice.json` pairs an agent, a tool
  (`scorer` or `validator`), sample text and an expected verdict. The test turns
  the tool's exit code into a verdict (0 = pass, non-zero = fail) and compares
  it with the expectation, so a verdict flip fails the suite even when both runs
  exit non-zero or both exit 0.
- **Forbidden and consistency checks:** `drifter-voice-consistency.sh` flags
  Drifter-attributed quotes that match another speaker in the database and
  out-of-voice patterns; `drifter-validate-response.sh` rejects responses that
  miss the voice markers.
