# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DOWNLOADFROMGIT=true
GITDOWNLOADLOACTION="$HOME/.oh-my-zsh/custom/themes/powerlevel9k"
if [ $DOWNLOADFROMGIT ]; then
    if [ ! -d $GITDOWNLOADLOACTION ]; then
        # Only download / clone the repo if the folder does not exsist
        /usr/bin/git clone --depth 1 https://github.com/bhilburn/powerlevel9k.git $GITDOWNLOADLOACTION
    fi
    ZSH_THEME="powerlevel9k/powerlevel9k"
else
    # Setting the default theme
    ZSH_THEME="agnoster"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

plugins=(git battery colorize dnf git-prompt)

# User configuration

export PATH="/home/joe/.local/bin:/home/joe/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt


if [ hash npm 2>/dev/null  ]; then
    mkdir -p ~/.npm-global
    npm config set prefix '~/.npm-global'
    export PATH=~/.npm-global/bin:$PATH
fi

source "$HOME/.aliases"
DIRPATH="/mnt/ramdisk"
APPS="$DIRPATH/apps"
BROWSERS="$DIRPATH/browsers"


if [ -d "$DIRPATH" ]; then
    if [ ! -d "$APPS" ]; then
        rm -rf $HOME/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi,google-chrome-beta}
        mkdir -p $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta}
        mkdir -p $APPS/{shotwell,thumbnails,libgweather}
        ln -s $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta} $HOME/.cache/
        ln -s $APPS/{shotwell,thumbnails,libgweather} $HOME/.cache/
   fi
fi

DEFAULT_USER=$USER
