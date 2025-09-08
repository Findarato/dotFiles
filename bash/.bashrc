# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#alias cinnamon-restart=’cinnamon –replace -d :0.0 > /dev/null 2>&1 &’


function run() {
    number=$1
    shift
    for n in $(seq $number); do
        $@
        printf "\n"
    done
}

#if [[ -n "$STY" ]] && [[ -n "$TMUX" ]]; #we are in a screen or tmux session
#then

#export TERM='xterm-256color'

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

GDK_CORE_DEVICE_EVENTS=1

#######Exports######

# Current running kernel on Fedora, CentOS 7/6 and Red Hat (RHEL) 7/6 ##
KERN_DIR=/usr/src/kernels/`uname -r`

## Export KERN_DIR ##
export KERN_DIR

export EDITOR=/usr/bin/nano
#export DISPLAY=:0.0
export VAGRANT_DEFAULT_PROVIDER=virtualbox

#if [[ $TERMINIX_ID ]]; then
#        source /etc/profile.d/vte.sh
#fi
export PATH=${PATH}:/opt/GitKraken

if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "${HOME}/.cargo/bin" ]; then
    PATH="${PATH}:${HOME}/.cargo/bin"
fi

export GPG_TTY=$(tty)

eval "$(starship init bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/var/home/jharry/Downloads/2025/google-cloud-sdk/path.bash.inc' ]; then . '/var/home/jharry/Downloads/2025/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/var/home/jharry/Downloads/2025/google-cloud-sdk/completion.bash.inc' ]; then . '/var/home/jharry/Downloads/2025/google-cloud-sdk/completion.bash.inc'; fi
