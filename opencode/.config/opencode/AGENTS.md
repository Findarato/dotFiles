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

## Secrets

- Never open, read, cat, grep, or print the contents of `.env` files or any
  `.env.*` / secrets file. Do not list their contents either.
- If a task appears to need a value from one, ask the user instead.

## Changelog

**Only generate changelog updates on the `main` (or `master`) branch.
Feature/separate branches must never modify `CHANGELOG.md` or commit changelog
entries** — regenerate after the work is merged to main. The post-commit hook
enforces this by skipping on any other branch.

When setting up a new repo that needs a changelog, copy the post-commit hook
from `~/dotfiles/.githooks/post-commit`. It auto-regenerates `CHANGELOG.md`
on every commit and amends the result — no manual step needed.

Key behaviours:
- Groups commits by ISO week (`## Week 2026-W30`)
- Format: `- [commit_hash] subject — author`
- Skips if the last commit already touched CHANGELOG.md
- Skips entirely unless on `main`/`master` (feature branches never change the changelog)
- Uses `OPENCODE_SKIP_CHANGELOG` env var to prevent recursion

## Commits and pull requests

All commit messages and PR titles must be semantic — Conventional Commits,
as enforced by the [semantic-prs](https://github.com/Ezard/semantic-prs) app
(spec: https://www.conventionalcommits.org/en/v1.0.0/).

- Format: `type(scope): subject` — the scope is optional.
- Allowed types (semantic-prs defaults): `feat`, `fix`, `docs`, `style`,
  `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`.
- Write the subject in the imperative mood, lowercase, no trailing period.
- Breaking changes: use `type(scope)!: subject` and a `BREAKING CHANGE:`
  footer in the body.
- Put details, rationale, and file lists in the body — not in the subject.
- Emoji go directly after the type prefix, on every commit:
  `fix: :bug: correct the pid guard`, `docs: :memo: record the pipeline
  failures`. The emoji never goes before the `type:` prefix (that breaks
  validation), and it is not optional.
- Example: `feat(cli): :sparkles: add --json output mode`

## Work items for every fix

Every fix, and every checklist item in a project's `TODO.md`, gets its own
GitLab work item, and that work item is linked to the merge request carrying
the change.

- Title the work item exactly like the commit subject: `type: :emoji: subject`.
- Link it to the merge request. Prefer the API; where the instance refuses the
  MR↔work-item mutations, list the work item `#<iid>` under a `## Work items`
  heading in the MR description and add a note on the MR that references it.
- Reference the work item from the project's progress log and close it only
  once the work is in the tree and verified.
- Log the time on it in the same turn (below), and say whether it is measured
  or estimated.

## Work-item time tracking

Always update how much time has been used on **each** GitLab work item you
touch. Creating it, starting work, adding a note, advancing it, verifying it or
closing it all count — log the time on that item in the same turn.

- Use the GraphQL mutation `timelogCreate` with the work item GID
  (`gid://gitlab/WorkItem/<id>`); the REST `time_entries` endpoint 404s on
  some GitLab versions. If `timelogCreate` is refused, fall back to
  `POST /projects/:id/issues/<iid>/add_spent_time?duration=30m`, which accepts
  `Task` work items on GitLab 19.5, and put the measured/estimated note on the
  item.
- Say whether the duration is measured or estimated. Estimates come from
  session activity and commit timestamps; never present one as a stopwatch
  reading.
- Log investigation and verification time too, not just code changes, and name
  what was verified in the summary.
- Log as the work happens, not in a batch at the end of the session.

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
- Keep communication direct and concise. Skip flattery, filler, and ceremonial
  openings. Emoji are welcome where they add tone or clarity (e.g. commit
  messages, summaries) — don't avoid them by default.

## Before editing

- State the plan or success criteria before editing. For non-trivial work,
  include the verification you expect to run.
- Read the files you will touch and the nearby callers, consumers, or docs that
  define their behavior.
- Match existing project patterns, naming, layout, and style even if a different
  approach would be appealing in a new project.
- Resolve ambiguity by reading code or running commands when practical; surface
  assumptions out loud when they affect the result.