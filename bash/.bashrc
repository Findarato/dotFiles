# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ${HOME}/.aliases ]; then
    . ${HOME}/.aliases
fi

GDK_CORE_DEVICE_EVENTS=1

#######Exports######

# Current running kernel on Fedora, CentOS 7/6 and Red Hat (RHEL) 7/6 ##
KERN_DIR=/usr/src/kernels/`uname -r`

## Export KERN_DIR ##
export KERN_DIR

export EDITOR=/usr/bin/nano

#if [[ $TERMINIX_ID ]]; then
#        source /etc/profile.d/vte.sh
#fi

if [ -d "${HOME}/.local/bin/" ]; then
    PATH="${HOME}/.local/bin/:${PATH}"
fi

if [ -d "${HOME}/.cargo/bin" ]; then
    PATH="${PATH}:${HOME}/.cargo/bin"
fi

export GPG_TTY=$(tty)


if (env | grep -Fq 'DISTROBOX'); then
echo "cool"
fi

eval "$(starship init bash)"