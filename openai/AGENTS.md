# Global OpenAI Codex Config — Stanley

## AGENTS.md Convention

Every project that uses AI agents should have an `AGENTS.md` at the repo root. It is the authoritative context document for agents and engineers alike.

**When starting work on any repo:**
1. Check for `AGENTS.md` at the root — read it before making any changes
2. If it points elsewhere (e.g. `CLAUDE.md` → `AGENTS.md`), follow the pointer
3. `AGENTS.md` contains: project purpose, file structure, env vars, scripts, key design decisions, ISO/compliance notes

**After making changes:**
1. Update `AGENTS.md` to reflect new scripts, env vars, changed behaviour, or new design decisions
2. Update `README.md` for anything user-facing
3. If no `AGENTS.md` exists, use the bootstrap snippet from an existing one — the template lives under "Bootstrap Snippet" in any project's `AGENTS.md`

**Update triggers** (any of these = update AGENTS.md):
- New file or script added
- Env variable added or renamed
- Default behaviour changed
- New compliance/security control added
- Feature removed

---

## Committing with czg

Always use `czg` for git commits — never `git commit` directly. The global czg config is at `~/.czrc`.

`czg` is an interactive TTY tool. Drive it with `expect`:

```bash
expect << 'EOF'
  set timeout 30
  spawn czg

  expect "Select the type"
  after 300
  for {set i 0} {$i < TYPE_INDEX} {incr i} {
    send "\033\[B"
    after 80
  }
  send "\r"

  expect "SCOPE"
  after 200
  send "\r"

  expect "SHORT, IMPERATIVE"
  after 200
  send "YOUR SUBJECT HERE"
  after 200
  send "\r"

  expect "LONGER description"
  after 200
  send "LINE ONE|LINE TWO"
  after 200
  send "\r"

  expect "BREAKING CHANGES"
  after 200
  send "\r"

  expect "ISSUES type"
  after 200
  send "\r"

  expect "sure you want to proceed"
  after 200
  send "Y\r"

  expect eof
EOF
```

### Type index (arrow navigation)

| Index | Type | | Index | Type |
|---|---|---|---|---|
| 0 | fix | | 10 | dump |
| 1 | feat | | 11 | hotfix |
| 2 | docs | | 12 | deploy |
| 3 | style | | 13 | ui |
| 4 | refactor | | 14 | init |
| 5 | perf | | 15 | security |
| 6 | test | | 16 | secret |
| 7 | build | | 17 | bump |
| 8 | ci | | 26 | config |
| 9 | revert | | 28 | chore |

### Rules
- Do NOT add `Co-Authored-By` trailers — czg manages the commit format
- Subject ≤ 50 chars (`maxHeaderLength: 50`)
- `useEmoji: false` — no emojis in subject
- Body line breaks use `|`
