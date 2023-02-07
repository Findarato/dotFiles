# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
    . "$HOME/.zshrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Add composer vendor path to the path
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# Clean out old cache
if [ -f "$HOME/bin/cleanCache.sh" ] ; then
    . "$HOME/bin/cleanCache.sh"
fi



#touch /dev/shm/looking-glass
#chown $USER:kvm /dev/shm/looking-glass
#chmod 660 /dev/shm/looking-glass

export PATH="$HOME/.cargo/bin:$PATH"

pokemon-colorscripts -r --no-title
# New environment setting added by SD5 on Mon Nov 21 13:43:36 CST 2022 1.
# The unmodified version of this file is saved in /home/joe/.zprofile1020715113.
# Do NOT modify these lines; they are used to uninstall.
PATH="${PATH}:/opt/Supermicro/SuperDoctor5"
export PATH
# End comments by InstallAnywhere on Mon Nov 21 13:43:36 CST 2022 1.

# New environment setting added by SD5 on Mon Nov 21 13:43:37 CST 2022 4.
# The unmodified version of this file is saved in /home/joe/.zprofile1020715113.
# Do NOT modify these lines; they are used to uninstall.
SD5_HOME=/opt/Supermicro/SuperDoctor5/
export SD5_HOME
# End comments by InstallAnywhere on Mon Nov 21 13:43:37 CST 2022 4.
