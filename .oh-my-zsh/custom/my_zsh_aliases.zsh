#list
alias la='ls -ah --color=yes | more'
alias ll='ls -lah --color=yes | more'
alias l.="ls -A | egrep '^\.'"
alias dir='ls -lh --color=yes'
alias dirp='ls -lihsa --color=yes | more'

#grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

logout()
{
    case $DESKTOP_SESSION in
       xfce) xfce4-session-logout --logout                     ;;
       mate) mate-session-save --logout-dialog                 ;;
       lxqt) lxqt-leave --logout                               ;;
       *plasma*) qdbus org.kde.ksmserver /KSMServer logout 0 3 3 ;;

       *) echo "Sorry, Desktop Environment is uknown (no xfce/mate/lxqt/plasma)!" ;;
    esac
}
alias logoff='logout'
alias signout='logout'

#fix obvious typos
alias cls='clear'
alias cd..='cd ..'
alias update='sudo pacman -Syy'
alias upgrade='sudo pacman -Su'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias myip="curl http://ipecho.net/plain; echo"
alias jctl="journalctl -p 3 -xb"

alias flatpak-list='flatpak list --columns=name,application,version,branch,size'
