# Dotfiles Conventions

## Shebangs
All shell scripts must use `#!/usr/bin/env bash` — no exceptions. Not `#!/bin/bash`, not `#!/bin/sh`, not missing.

## Structure
- Each app/tool gets its own Stow package (top-level directory)
- Package mirrors `$HOME` path (e.g. `alacritty/.config/alacritty/alacritty.toml`)
- `scripts/bin/` is organized into subdirectories: `system/`, `dev/`, `monitor/`, `work/`, `fun/`, `misc/`
- Scripts referenced by systemd services stay at `scripts/bin/` root
- Shared configs (aliases, functions) go in `misc/` package

## Deployment
- `linkup.sh` runs `stow <package>` for each package
- `linkup.sh` lists packages alphabetically

## Standards
- Update `README.md` when adding/removing packages
- Keep `TODO.md` current when doing cleanup work
- `.gitignore` covers `*.bak`, `*.log`, `*.swp`, `*~`, `.DS_Store`, `*.old`

## Commits

- All commits **must** be signed. The repo is configured with `commit.gpgsign=true` and a signing key, so commits sign automatically. Verify with `git log -1 --format='%G?'` (`G` = good signature).

## Code Style

- **NO TABS** - All `.cfg` files must use spaces only. Never use tab characters in any configuration file.
- Use 4 spaces for indentation within host/service/contact definitions.
- All directive values must be aligned to column 28 (0-indexed). This means `4 spaces + directive name + padding to col 28 + value`.
- Always verify formatting after making changes. Run the formatter if needed:
  ```
  python3 format_configs.py
  ```
## Changelog

After every commit, the changelog must be updated. Run the post-commit hook manually if it doesn't trigger:

```bash
cd /var/mnt/worktop/home/Documents/src/nagios-config
./.git/hooks/post-commit
```

If the hook fails, regenerate manually:

```bash
REPO_ROOT="$(git rev-parse --show-toplevel)"
CHANGELOG="$REPO_ROOT/CHANGELOG.md"
tmpfile=$(mktemp)

cat > "$tmpfile" <<'EOF'
# Changelog

> Reminder: update this file on every commit.

The entries below were populated from the repository commit history and grouped by commit date.

EOF

git -C "$REPO_ROOT" log --date=short --pretty=format:'%ad%x1f%h%x1f%an%x1f%s' | \
  awk -F"\x1f" '{date=$1; hash=$2; author=$3; subject=$4; if (date!=prev){ if (prev!="") print ""; printf("## %s\n\n", date); prev=date } printf("- [%s] %s — %s\n", hash, subject, author)}' >> "$tmpfile"

mv "$tmpfile" "$CHANGELOG"
git add "$CHANGELOG"
git commit -s -m "chore(changelog): update changelog" --no-verify
```

- Changelog groups commits by date (newest first)
- Format: `- [commit_hash] subject — author`
- The changelog commit uses `--no-verify` to prevent hook recursion