# zmodload zsh/zprof
#Bind keys
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "${terminfo[kdch1]}" delete-char

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="true"


# Fix Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export SHELL="/bin/zsh"
#export TERM="xterm"
export TERM="xterm-256color"
export ZSH_CACHE_DIR="${HOME}/.cache/zsh"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

if [[ $OSTYPE = (linux)* ]]; then
    export LS_OPTIONS='--color=auto'
fi

mkdir -p ${ZSH_CACHE_DIR} >> /dev/null

export UPDATE_ZSH_DAYS=7

# Map out Aliases
source "${HOME}/.aliases"

# Set some PL9k/10k values
# source "${HOME}/.powerlevel10k"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"


# User configuration

export PATH="${HOME}/.local/bin:${HOME}/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/sbin/"
export PATH="${PATH}:${HOME}/bin/"
export PATH="${PATH}:${HOME}.cargo/bin/"
export PATH="${PATH}:/usr/local/bin/"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
export EDITOR='nano'

#if [ hash npm 2>/dev/null  ]; then
#    mkdir -p ~/.npm-global
#    npm config set prefix '~/.npm-global'
#    export PATH=~/.npm-global/bin:$PATH
#fi

DIRPATH="/mnt/cache"
APPS="${DIRPATH}/${USER}/apps"
BROWSERS="${DIRPATH}/${USER}/browsers"

if [ -d "${DIRPATH}" ]; then
    if [ ! -d "${APPS}" ]; then
        rm -rf ${HOME}/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        rm -rf ${HOME}/.cache/{wal,shotwell,thumbnails,libgweather,thunderbird}
        rm -rf ${HOME}/.config/mpv/watch_later
        mkdir -p $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        mkdir -p $APPS/{shotwell,thumbnails,libgweather,thunderbird,mpv/watch_later}
        ln -s $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium} ${HOME}/.cache/
        ln -s $APPS/{shotwell,thumbnails,libgweather,thunderbird} ${HOME}/.cache/
        ln -s $APPS/mpv/watch_later ${HOME}/.config/mpv/watch_later
    fi
fi


# Adjust paths if specific programs are installed
if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "${HOME}/.cargo/bin" ]; then
    PATH="${PATH}:${HOME}/.cargo/bin"
fi

if [ -d "/opt/gitkraken" ]; then
    PATH="${PATH}:/opt/gitkraken"
fi

# Add support for etcher
if [ -d "/opt/etcher-cli" ]; then
    PATH="${PATH}:/opt/etcher-cli/"
fi
# Add support for composer
if [ -d "${HOME}/.config/composer/vendor/bin" ]; then
    PATH="${PATH}:${HOME}/.config/composer/vendor/bin"
fi

# Add support for qt4
if [ -d "/usr/lib64/qt4/bin" ]; then
    PATH="${PATH}:/usr/lib64/qt4/bin/"
fi

DEFAULT_USER=${USER}

export GPG_TTY=$(tty)

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# =============================================================================
#                                   Options
# =============================================================================

#zle -N self-insert url-quote-magic

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt extended_history         # Also record time and duration of commands.
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt ignore_eof
setopt inc_append_history
setopt interactive_comments
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt magic_equal_subst
setopt print_eight_bit
setopt prompt_subst
setopt pushd_ignore_dups
setopt rm_star_wait
setopt share_history            # Share history between multiple shells


# Zplugins

if [[ ${ZSH_VERSION} > 5.1.0 ]]; then
    # Newer Zsh version
    zplug romkatv/powerlevel10k, as:theme, depth:1
else
    # Should only be needed on CentOS7 and Debian > 10
    zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
fi

zplug "tamcore/autoupdate-oh-my-zsh-plugins", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
zplug "chrissicool/zsh-256color", from:github
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/gpg-agent", from:oh-my-zsh
zplug "plugins/zsh-autosuggestions", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "rummik/zsh-tailf"
zplug "zsh-users/zsh-history-substring-search"
zplug "lib/completion", from:oh-my-zsh
zplug "birdhackor/zsh-exa-ls-plugin"


if zplug check "zsh-users/zsh-syntax-highlighting"; then
    typeset -gA ZSH_HIGHLIGHT_STYLES ZSH_HIGHLIGHT_PATTERNS
    
    ZSH_HIGHLIGHT_STYLES[default]='none'
    ZSH_HIGHLIGHT_STYLES[cursor]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
    ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
    ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
    ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
    ZSH_HIGHLIGHT_STYLES[path]='fg=white,underline'
    ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey,underline'
    ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=white'
    ZSH_HIGHLIGHT_STYLES[path_approx]='fg=white'
    ZSH_HIGHLIGHT_STYLES[globbing]='none'
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
    ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
    ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
    ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
    ZSH_HIGHLIGHT_STYLES[assign]='none'
    
    ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
    
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor line)
fi


if zplug check "zsh-users/zsh-autosuggestions"; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=075'
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=162'
fi

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

export ZSH_PLUGINS_ALIAS_TIPS_TEXT='💡 '

#source ${ZSH}/oh-my-zsh.sh

settitle() {
    printf "\033k$1\033\\"
}

DISABLE_AUTO_TITLE=true
unset ZLE_RPROMPT_INDENT

#eval "$(starship init zsh)"

unsetopt nomatch

# For Enpass
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCREEN_SCALE_FACTORS=1

# Multiple Screen
# export "QT_SCREEN_SCALE_FACTORS=1;1"
# zprof # bottom of .zshrc


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh