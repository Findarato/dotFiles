# Global Agent Instructions

These instructions apply to all projects unless overridden.

## User info
- Name: Joe (Joseph Harry)
- Email: findarato@gmail.com
- Shell: bash
- Dotfiles: ~/dotfiles (Stow-managed)

## Global conventions
- All shell scripts must use `#!/usr/bin/env bash`
- Use 4-space indentation in config files
- No tabs anywhere

## Changelog

When setting up a new repo that needs a changelog, copy the post-commit hook
from `~/dotfiles/.githooks/post-commit`. It auto-regenerates `CHANGELOG.md`
on every commit and amends the result — no manual step needed.

Key behaviours:
- Groups commits by ISO week (`## Week 2026-W30`)
- Format: `- [commit_hash] subject — author`
- Skips if the last commit already touched CHANGELOG.md
- Uses `OPENCODE_SKIP_CHANGELOG` env var to prevent recursion
