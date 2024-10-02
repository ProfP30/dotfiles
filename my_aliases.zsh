#!/bin/bash
#list
# alias ls='ls -lh --color=yes'
# alias la='ls -ah --color=yes | more'
# alias ll='ls -lah --color=yes | more'
# alias l.="ls -A | egrep '^\.'"

# Changing "ls" to "exa"
alias ls='exa -l --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias dir='\ls -lh --color=yes'
alias dirp='\ls -lihsa --color=yes | more'

#grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias shutdown='systemctl poweroff'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias restart-plasma='systemctl restart --user plasma-plasmashell'

#fix obvious typos
alias cls='clear'
alias cd..='cd ..'

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#alias myip="curl http://ipecho.net/plain; echo"
alias myip="curl https://ifconfig.me; echo"
alias jctl="journalctl -p 3 -xb"

alias github='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github'
alias gitlab='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/gitlab'
alias codeberg='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/codeberg'

if [[ -s $HOME/.local/bin/UpdateInTerminal ]]; then
	alias update='$HOME/.local/bin/UpdateInTerminal'
fi

if command -v 'vscodium' &> /dev/null; then
    alias code='vscodium'
fi

if command -v 'python3' &> /dev/null; then
    alias python='python3'
fi

