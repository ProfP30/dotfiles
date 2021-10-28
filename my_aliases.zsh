#!/bin/bash
#list
alias ls='ls -lh --color=yes'
alias la='ls -ah --color=yes | more'
alias ll='ls -lah --color=yes | more'
alias l.="ls -A | egrep '^\.'"
alias dir='ls -lh --color=yes'
alias dirp='ls -lihsa --color=yes | more'

#grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias logoff='logout'
alias signout='logout'

#fix obvious typos
alias cls='clear'
alias cd..='cd ..'
#alias update='sudo pacman -Syy'
#alias upgrade='sudo pacman -Su'
#DISTRO=$(lsb_release -si)
if [ "$DISTRO"  = 'Debian' ] || [ "$DISTRO"  = 'Siduction' ] || [ "$DISTRO"  = 'Ubuntu' ]; then
    alias update='sudo apt update && sudo apt upgrade'
elif [ "$DISTRO"  = 'Arch' ] || [ "$DISTRO"  = 'EndeavourOS' ] || [ "$DISTRO"  = 'Manjaro' ]; then    
    # check if Pamac is installed (but suppress output of the check)   
    if which 'pamac' &> /dev/null; then
        alias update='pamac update'
    # check if Yay is installed (but suppress output of the check)   
    elif which 'yay' &> /dev/null; then
        alias update='yay -Syu'
    else
        alias update='sudo pacman -Syu'
    fi
fi

# check if Flatpak is installed (but suppress output of the check)   
if which 'flatpak' &> /dev/null; then
  alias update='flatpak update'
fi

#alias myip="curl http://ipecho.net/plain; echo"
alias myip="curl https://ifconfig.me; echo"
alias jctl="journalctl -p 3 -xb"

alias flatpak-list='flatpak list --columns=name,application,version,branch,size'
