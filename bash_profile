#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# PATH=$PATH:$HOME/bin export PATH
# Done in "sddm-config-editor"
# PATH=$HOME/.local/bin:$PATH export PATH
export EDITOR=/usr/bin/micro
export VISUAL=/usr/bin/micro
export SUDO_EDITOR=/usr/bin/micro
# export TERM=/usr/bin/qterminal

# User specific environment and startup programs
export PATH=$HOME/.local/bin:$PATH

# Use less command as a pager
export PAGER=less
