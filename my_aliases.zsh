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

alias shutdown='systemctl poweroff'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'

#fix obvious typos
alias cls='clear'
alias cd..='cd ..'

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#alias update='sudo pacman -Syy'
#alias upgrade='sudo pacman -Su'
#DISTRO=$(lsb_release -si)
if [ "$DISTRO"  = 'Debian' ] || [ "$DISTRO"  = 'Siduction' ] || [ "$DISTRO"  = 'Ubuntu' ]; then
    if which 'nala' &> /dev/null; then
      export UPD_CMD='sudo nala update && sudo nala upgrade'
    else
      export UPD_CMD='sudo apt update && sudo apt upgrade'
    fi
elif [ "$DISTRO"  = 'Arch' ] || [ "$DISTRO"  = 'EndeavourOS' ] || [ "$DISTRO"  = 'ManjaroLinux' ]; then
    export UPD_CMD='sudo pacman -Syy'
    # check if Pamac is installed (but suppress output of the check)
    if which 'pamac' &> /dev/null; then
        export UPD_CMD="sudo pamac update --no-confirm"
    # check if Yay is installed (but suppress output of the check)   
    elif which 'yay' &> /dev/null; then
        export UPD_CMD="$UPD_CMD && yay -Syu"
    fi
fi

# check if Flatpak is installed (but suppress output of the check)   
if command -v 'flatpak' &> /dev/null; then
    #UPD_CMD=$(alias update)
    alias update="$UPD_CMD && flatpak update"
else
	alias update="$UPD_CMD"
fi

#alias myip="curl http://ipecho.net/plain; echo"
alias myip="curl https://ifconfig.me; echo"
alias jctl="journalctl -p 3 -xb"

alias flatpak-list='flatpak list --columns=name,application,version,branch,size'
alias google='{read -r arr; browser "https://google.com/search?q=${arr}";} <<<'
alias search='{read -r arr; xdg-open "https://www.ecosia.org/search?q=${arr}";} <<<'

alias yt='_y(){ yt-dlp -g ytsearch1:"$1" | awk ''NR==2''| xargs mpv  ; }; _y'
