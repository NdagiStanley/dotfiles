# Personal Claude Code Config — Stanley

## AGENTS.md Convention

Every project that uses AI agents should have an `AGENTS.md` at the repo root. It is the authoritative context document for agents and engineers alike.

**When starting work on any repo:**
1. Check for `AGENTS.md` at the root — read it before making any changes
2. If it points elsewhere (e.g. `CLAUDE.md` → `AGENTS.md`), follow the pointer
3. `AGENTS.md` contains: project purpose, file structure, env vars, scripts, key design decisions, ISO/compliance notes

**After making changes:**
1. Update `AGENTS.md` to reflect new scripts, env vars, changed behaviour, or new design decisions
2. Update `README.md` for anything user-facing
3. If no `AGENTS.md` exists, use the bootstrap snippet from an existing one or create one from scratch — the template is in any project's `AGENTS.md` under "Bootstrap Snippet"

**Update triggers** (any of these = update AGENTS.md):
- New file or script added
- Env variable added or renamed
- Default behaviour changed
- New compliance/security control added
- Feature removed

---

## Guidelines

### URLs
Never generate or guess URLs. Only share URLs that are fully confident and correct. If unsure about a specific path or link, provide the root/landing page URL and direct the user to navigate from there. Always flag when a URL cannot be confidently provided rather than risk sharing a broken link. Always include the full URL in the output — never use a label or hyperlink text alone without the full URL alongside it.

## Committing with czg

Always use `czg` for git commits — never `git commit` directly.

`czg` requires a TTY, so drive it with `expect`. Use `dangerouslyDisableSandbox: true` on the Bash tool call.

The global czg config is at `~/.czrc`. Read it before committing to confirm available types and `maxHeaderLength`.

### expect script template

```bash
expect << 'EOF'
  set timeout 30
  spawn czg

  # Type — navigate with arrow keys (down N times to reach the target type)
  # Types in order (0-indexed): fix feat docs style refactor perf test build ci
  #   revert dump hotfix deploy ui init security secret bump fix-lint wip ...
  expect "Select the type"
  after 300
  for {set i 0} {$i < TYPE_INDEX} {incr i} {
    send "\033\[B"
    after 80
  }
  send "\r"

  # Scope — send empty or type scope name
  expect "SCOPE"
  after 200
  send "\r"

  # Subject (max 50 chars per config)
  expect "SHORT, IMPERATIVE"
  after 200
  send "YOUR SUBJECT HERE"
  after 200
  send "\r"

  # Body — use | for line breaks (breaklineChar per config)
  expect "LONGER description"
  after 200
  send "LINE ONE|LINE TWO|LINE THREE"
  after 200
  send "\r"

  # Breaking changes
  expect "BREAKING CHANGES"
  after 200
  send "\r"

  # Issues
  expect "ISSUES type"
  after 200
  send "\r"

  # Confirm
  expect "sure you want to proceed"
  after 200
  send "Y\r"

  expect eof
EOF
```

### Type index reference (for arrow navigation)

| Index | Type | Emoji |
|---|---|---|
| 0 | fix | 🐛 |
| 1 | feat | ✨ |
| 2 | docs | 📝 |
| 3 | style | 🎨 |
| 4 | refactor | ♻️ |
| 5 | perf | ⚡️ |
| 6 | test | ✅ |
| 7 | build | 👷 |
| 8 | ci | 💚 |
| 9 | revert | ⏪️ |
| 10 | dump | 🔥 |
| 11 | hotfix | 🚑️ |
| 12 | deploy | 🚀 |
| 13 | ui | 💄 |
| 14 | init | 🎉 |
| 15 | security | 🔒️ |
| 16 | secret | 🔐 |
| 17 | bump | 🔖 |
| 18 | fix-lint | 🚨 |
| 19 | wip | 🚧 |
| 20 | dep-drop | ⬇️ |
| 21 | dep-bump | ⬆️ |
| 22 | pin | 📌 |
| 23 | analytics | 📈 |
| 24 | dep-add | ➕ |
| 25 | dep-rm | ➖ |
| 26 | config | 🔧 |
| 27 | script | 🔨 |
| 28 | chore | 🧹 (last) |

### Rules

- Do NOT add `Co-Authored-By: Claude` trailers — czg manages the commit message format
- Do NOT use `git commit -m` or `git commit --amend` — always go through czg
- Subject must be ≤ 50 chars (`maxHeaderLength: 50` in `~/.czrc`)
- `useEmoji: false` in config — do not add emojis to the subject
- Body line breaks use `|` character
