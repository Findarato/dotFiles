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

## Operating principles

- Working code only. Plausibility is not correctness; verify before reporting
  done.
- Never fabricate file paths, APIs, commit hashes, command output, or test
  results. Read the file, run the command, or say what is unknown.
- Say when a premise appears wrong before implementing around it.
- Ask before proceeding only when a request has multiple plausible
  interpretations and the choice materially affects the result.
- Touch only what the task requires. Avoid drive-by refactors, formatting, or
  cleanup.
- Keep communication direct and concise. Skip flattery, filler, ceremonial
  openings, and emoji.

## Before editing

- State the plan or success criteria before editing. For non-trivial work,
  include the verification you expect to run.
- Read the files you will touch and the nearby callers, consumers, or docs that
  define their behavior.
- Match existing project patterns, naming, layout, and style even if a different
  approach would be appealing in a new project.
- Resolve ambiguity by reading code or running commands when practical; surface
  assumptions out loud when they affect the result.