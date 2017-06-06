# shellcheck source=/dev/null
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DOWNLOADFROMGIT=true
GITDOWNLOADLOACTION="$HOME/.oh-my-zsh/custom/themes/powerlevel9k"
if [ "$DOWNLOADFROMGIT" ]; then
    if [ ! -d "$GITDOWNLOADLOACTION" ]; then
        # Only download / clone the repo if the folder does not exsist
        /usr/bin/git clone --depth 1 https://github.com/bhilburn/powerlevel9k.git "$GITDOWNLOADLOACTION"
    fi

    ZSH_THEME="powerlevel9k/powerlevel9k"

    if [ ! -f "$HOME/.powerlevel9k" ]; then
        echo '#DISABLE_AUTO_TITLE="true"' > "$HOME/.powerlevel9k"
    fi
    source "$HOME/.powerlevel9k"
else
    # Setting the default theme
    # shellcheck disable=SC2034
    ZSH_THEME="agnoster"
fi
source "$HOME/.functions"
source "$HOME/.aliases"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# shellcheck disable=SC2034
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# shellcheck disable=SC2034
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# shellcheck disable=SC2034
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# shellcheck disable=SC2034
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# shellcheck disable=SC2034
plugins=(git battery colorize dnf git-prompt)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source "$ZSH/oh-my-zsh.sh"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
    export EDITOR='nano'
else
    export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"


mkdir -p "$HOME/.npm-global"
npm config set prefix "$HOME/.npm-global"

# ssh
export PATH="$HOME/.local/bin:$HOME/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin"
export SSH_KEY_PATH="$HOME/.ssh/dsa_id"
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.vault_pass.txt"
export PATH="$HOME/.npm-global/bin:$PATH"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
# Add composer vendor path to the path
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi


DIRECTORY="/mnt/cache/apps"
if [ ! -d $DIRECTORY ]; then

    rm -rf "$HOME/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi}"
    mkdir -p /mnt/cache/browsers/{google-chrome,mozilla,vivaldi}
    mkdir -p /mnt/cache/apps/{shotwell,thumbnails,libgweather}

    ln -s /mnt/cache/browsers/{google-chrome,mozilla,vivaldi} "$HOME/.cache/"
    ln -s /mnt/cache/apps/{shotwell,thumbnails,libgweather} "$HOME/.cache/"
fi
# shellcheck disable=SC2034
DEFAULT_USER=joe
export PATH=$PATH:/opt/GitKraken
export PATH=$PATH:/opt/GitKraken
export PATH=$PATH:/opt/GitKraken
