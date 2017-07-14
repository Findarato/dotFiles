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

  export TERM=screen-256color; 
  #eval `dircolors ~/Documents/src/dircolors-solarized/dircolors.256dark`;
#else
  #eval `dircolors ~/Documents/src/dircolors-solarized/dircolors.256dark`;
#fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*al$

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

GDK_CORE_DEVICE_EVENTS=1

#######Exports######

# Current running kernel on Fedora, CentOS 7/6 and Red Hat (RHEL) 7/6 ##
KERN_DIR=/usr/src/kernels/`uname -r`

## Export KERN_DIR ##
export KERN_DIR

export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
export EDITOR=/usr/bin/nano
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
#export DISPLAY=:0.0
export VAGRANT_DEFAULT_PROVIDER=virtualbox

#if [[ $TERMINIX_ID ]]; then
#        source /etc/profile.d/vte.sh
#fi
export PATH=$PATH:/opt/GitKraken
