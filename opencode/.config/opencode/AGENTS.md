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

After every commit, the changelog must be updated. Regenerate manually:

```bash
REPO_ROOT="$(git rev-parse --show-toplevel)"
CHANGELOG="$REPO_ROOT/CHANGELOG.md"
tmpfile=$(mktemp)

cat > "$tmpfile" <<'EOF'
# Changelog

> Reminder: update this file on every commit.

The entries below were populated from the repository commit history and grouped by commit date.

EOF

git -C "$REPO_ROOT" log --date=format:'%Y-%m-%d|%Y-W%V' --pretty=format:'%ad%x1f%h%x1f%an%x1f%s' | \
  awk -F"\x1f" '{split($1, d, "|"); date=d[1]; week=d[2]; hash=$2; author=$3; subject=$4; if (week!=prev){ if (prev!="") print ""; printf("## Week %s\n\n", week); prev=week } printf("- [%s] %s — %s\n", hash, subject, author)}' >> "$tmpfile"

mv "$tmpfile" "$CHANGELOG"
git add "$CHANGELOG"
git commit -s -m "chore(changelog): update changelog" --no-verify
```

- Changelog groups commits by date (newest first)
- Format: `- [commit_hash] subject — author`
- The changelog commit uses `--no-verify` to prevent hook recursion
