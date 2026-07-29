# Changelog Setup Documentation

## Overview
Automated changelog generation from git commit history, grouped by commit date.

## Files Created/Modified

### 1. `CHANGELOG.md`
- Auto-generated from git log
- Groups commits by date (newest first)
- Format: `- [commit_hash] subject — author`
- Reminder at top: "Update this file on every commit"

### 2. `.git/hooks/post-commit` (Git Hook)
**Location:** `/mnt/worktop/home/Documents/src/nagios-config/.git/hooks/post-commit`

**Purpose:** Automatically regenerate and commit changelog after each commit

**Key Features:**
- Parses git log using unit separator (`\x1f`) as delimiter to avoid tab/whitespace issues
- Groups commits by date
- Prevents infinite loop by checking if last commit was a changelog auto-commit
- Uses `--no-verify` to skip hook recursion
- Runs silently on success, handles errors gracefully

**How to run manually:**
```bash
cd /mnt/worktop/home/Documents/src/nagios-config
./.git/hooks/post-commit
```

## Setup Steps (For Future Reference)

### Step 1: Generate initial changelog
```bash
cd /mnt/worktop/home/Documents/src/nagios-config
git log --date=short --pretty=format:'%ad%x1f%h%x1f%an%x1f%s' | \
  awk -F"\x1f" 'BEGIN{print "# Changelog\n\n> Reminder: update this file on every commit.\n\nThe entries below were populated from the repository commit history and grouped by commit date.\n\n"} {date=$1; hash=$2; author=$3; subject=$4; if (date!=prev){ if (prev!="") print ""; printf("## %s\n\n", date); prev=date } printf("- [%s] %s — %s\n", hash, subject, author)}' > CHANGELOG.md
```

### Step 2: Create post-commit hook
Create `.git/hooks/post-commit` with the regeneration logic (see template below)

### Step 3: Make hook executable
```bash
chmod +x .git/hooks/post-commit
```

### Step 4: Commit initial changelog
```bash
git add CHANGELOG.md
git commit -m "chore(changelog): update changelog" --no-verify
```

## Post-Commit Hook Template

```bash
#!/bin/bash
set -euo pipefail

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
git -C "$REPO_ROOT" add "$CHANGELOG" || true

# Prevent infinite loop
LAST_MSG=$(git -C "$REPO_ROOT" log -1 --pretty=%B || echo "")
AUTO_MSG="chore(changelog): update changelog"
if [[ "$LAST_MSG" == "$AUTO_MSG" ]]; then
  exit 0
fi

# Auto-commit
git -C "$REPO_ROOT" commit -m "$AUTO_MSG" --no-verify || true

exit 0
```

## How It Works

1. **On every commit:** Post-commit hook runs automatically
2. **Hook regenerates:** Runs `git log` and rebuilds CHANGELOG.md
3. **Check for recursion:** If last commit was auto-changelog, exit silently
4. **Auto-commit:** Creates a follow-up commit with message `chore(changelog): update changelog`
5. **No infinite loop:** Detected by checking commit message

## Notes

- Changelog is always up-to-date with latest commits
- Auto-commits are separate from user commits (clean history)
- If manual edit is needed, it will be overwritten on next commit
- To disable temporarily: rename or remove hook file temporarily

## Verification

After setup, verify it works:
```bash
echo "test" >> some_file.cfg
git add some_file.cfg
git commit -m "test commit"
# Should see CHANGELOG.md auto-updated in a follow-up commit
git log --oneline | head -5
```
