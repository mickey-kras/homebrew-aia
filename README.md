# homebrew-aia

Homebrew tap for [**aia — Agents In Accord**](https://aiaccord.dev), the
humane handover protocol for Claude Code sessions.

## Install

```bash
brew install mickey-kras/aia/aia
aia setup
```

`brew install` places the `aia` binary on your PATH. `aia setup` wires the
Claude Code integration — it copies the `/handover` skill into
`~/.claude/skills/`, the session-start hook into `~/.claude/hooks/`, and
merges a `SessionStart` entry into `~/.claude/settings.json`.

Re-run `aia setup` any time you want to re-sync the integration. Run
`aia setup --uninstall` to remove it (your `~/.aia/sessions/` history is
left alone).

## What you're installing

- `bin/aia` — the CLI (pure bash, no deps beyond macOS defaults + python3
  for the `settings.json` merge).
- `lib/*.sh` — command implementations, loaded on demand.
- `skills/handover/` — the `/handover` Claude Code slash command.
- `hooks/session-start.sh` — the `SessionStart` hook that briefs incoming
  agents and reminds outgoing agents that `/handover` exists.
- `templates/` — default templates for `ACCORD.md`, session handovers, and
  onboarding prompts.

## Docs

- **Read first:**
  [Code of Conduct](https://github.com/mickey-kras/aia/blob/main/CODE_OF_CONDUCT.md)
  — the mutual promise between humans and agents.
- **Main repo:** https://github.com/mickey-kras/aia
- **Landing page:** https://aiaccord.dev
- **Case study:**
  [four agents, 23 commits, one day](https://github.com/mickey-kras/aia/blob/main/docs/case-study-clipanvil.md)

## Head-only install (for hacking on aia itself)

```bash
brew install --HEAD mickey-kras/aia/aia
```

This builds from the tip of `main`. Use the stable formula above for
everything else.
