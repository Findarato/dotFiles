if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# Added by LM Studio CLI (lms)
export PATH="$PATH:/var/home/joe/.lmstudio/bin"
# End of LM Studio CLI section


# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"
