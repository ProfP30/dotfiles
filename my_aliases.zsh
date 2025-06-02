#!/bin/bash
#list
# alias ls='ls -lh --color=yes'
# alias la='ls -ah --color=yes | more'
# alias ll='ls -lah --color=yes | more'
# alias l.="ls -A | egrep '^\.'"

# Changing "ls" to "eza"
#alias ls='eza              --icons --color=always --group-directories-first' # my preferred listing
alias la='eza --all        --icons --color=always --group-directories-first --time-style "+%Y-%m-%d %H:%M:%S"' # all files and dirs
alias ll='eza --long       --icons --color=always --group-directories-first --time-style "+%Y-%m-%d %H:%M:%S"' # long format
alias lt='eza --all --tree --icons --color=always --group-directories-first --time-style "+%Y-%m-%d %H:%M:%S"' # tree listing
alias l.='eza --all | egrep "^\."'

#alias dir='ls -l --human-readable --color=auto --time-style=long-iso --group-directories-first'
#alias dirp='ls -lisah --color=auto | more'
alias dir='eza       --long --icons --color=always --group-directories-first --time-style "+%Y-%m-%d %H:%M:%S"' # my preferred listing
alias dira='eza --all --long --icons --color=always --group-directories-first --time-style "+%Y-%m-%d %H:%M:%S"' # my preferred listing
alias dirp='eza --all --icons --color=always --group-directories-first --time-style "+%Y-%m-%d %H:%M:%S"|less' # my preferred listing

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
