# Dotfiles Cleanup TODO

All items completed. Summary of changes:

## 🔴 Fixes

- **dunstrc merge conflict** — removed stray `<<<<<<< HEAD` marker
- **`updateDotfiles.sh` path** — `dotFiles/` → `dotfiles/`
- **Stale username 36 refs** — `jharry` → `joe` in bashrc, aliases, justfile, systemd services, sway configs, restore scripts, mount scripts, config files
- **`linkup.sh`** — uncommented `zsh`, added `alacritty` and `kitty` packages; reordered alphabetically

## 🟡 Readability

- **`scripts/bin/` reorganized** into `system/`, `dev/`, `monitor/`, `work/`, `fun/`, `misc/` + 4 externally-referenced scripts left at root
- **README.md** — replaced with current stow-based documentation
- **`.gitignore`** — added `*.log`, `*.swp`, `*~`, `.DS_Store`, `*.old`
- **`test.sh`** — simplified to `find -name '*.sh' ... | xargs shellcheck`

## 🟢 Polish

- **`diskChesck.sh`** → `diskCheck.sh`
- **herdr logs** — removed from tracking, added to `.gitignore`
- **nested htop dir** — removed `htop/.config/htop/htop/` double-nesting
- **`gbtconfig.sh`** — merged into `.bashrc`; standalone file deleted
- **Stale backups** — deleted `dunstrc.bak`, `config.backup`, `.tmux.conf.old`
- **`package.json`** — deleted (empty)
- **`alacritty/test/`** — deleted (duplicate variants)
- **tmux upstream** — already documented at top of `.tmux.conf`
