export TERM='xterm-256color'
export ZSH=${HOME}/.oh-my-zsh

mkdir -p "${HOME}/.oh-my-zsh/custom/themes/"
DOWNLOADFROMGIT=false
GITDOWNLOADLOACTION="$HOME/.oh-my-zsh/custom/themes/powerlevel9k"
if [ $DOWNLOADFROMGIT ]; then
    if [ ! -d $GITDOWNLOADLOACTION ]; then
        # Only download / clone the repo if the folder does not exsist
        /usr/bin/git clone --depth 1 https://github.com/bhilburn/powerlevel9k.git $GITDOWNLOADLOACTION
    fi
    ZSH_THEME="powerlevel9k/powerlevel9k"
    source "${HOME}/.powerlevel9k"
else
    # Setting the default theme
    ZSH_THEME="pygmalion"
fi

export UPDATE_ZSH_DAYS=13
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_THEME="pygmalion"

plugins=(
    colorize
    dnf
    docker
    git
    git-flow
    git-prompt
    zsh-autosuggestions
    zsh-syntax-highligting
)

# User configuration

export PATH="/home/$USER/.local/bin:/home/$USER/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/sbin/"

source ${ZSH}/oh-my-zsh.sh
# Map out Aliases
source "${HOME}/.aliases"


if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='nano'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt

if [ hash npm 2>/dev/null  ]; then
    mkdir -p ~/.npm-global
    npm config set prefix '~/.npm-global'
    export PATH=~/.npm-global/bin:$PATH
fi

DIRPATH="/mnt/cache"
APPS="${DIRPATH}/apps"
BROWSERS="${DIRPATH}/browsers"

#if [ -d "${HOME}/.wallpapers/" ]; then
#     . "${HOME}/.wallpapers/wp_init.sh" >/dev/null 2>&1
#fi

if [ -d "${DIRPATH}" ]; then
    if [ ! -d "${APPS}" ]; then
        rm -rf ${HOME}/.cache/{google-chrome,libgweather,mozilla,shotwell,thumbnails,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        rm -rf ${HOME}/.cache/{shotwell,thumbnails,libgweather} ${HOME}/.cache/
        mkdir -p $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium}
        mkdir -p $APPS/{shotwell,thumbnails,libgweather}
        ln -s $BROWSERS/{google-chrome,mozilla,vivaldi,google-chrome-beta,google-chrome-unstable,chromium} ${HOME}/.cache/
        ln -s $APPS/{shotwell,thumbnails,libgweather} ${HOME}/.cache/
    fi
fi

if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "/opt/gitkraken" ]; then
    PATH="${PATH}:/opt/gitkraken"
fi

# Add support for etcher
if [ -d "/opt/etcher-cli" ]; then
    PATH="${PATH}:/opt/etcher-cli/"
fi

if [ ]; then
    
fi

DEFAULT_USER=$USER
ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt

export GPG_TTY=$(tty)

