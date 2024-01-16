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
#export LANG="en_US.UTF-8"
#export LC_ALL="en_US.UTF-8"
#export SHELL="/bin/zsh"
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

# export PATH="${HOME}/.local/bin:${HOME}/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/sbin/"
export PATH="${PATH}:${HOME}/bin/"
export PATH="${PATH}:${HOME}.cargo/bin/"
export PATH="${PATH}:/usr/local/bin/"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
export EDITOR='nano'

# Add custom bins to my path if they are needed

# Adjust paths if specific programs are installed
if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "${HOME}/.cargo/bin" ]; then
    PATH="${PATH}:${HOME}/.cargo/bin"
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

#[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
#source ~/.zplug/init.zsh

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



settitle() {
    printf "\033k$1\033\\"
}

DISABLE_AUTO_TITLE=true
unset ZLE_RPROMPT_INDENT

unsetopt nomatch

eval "$(starship init zsh)"
