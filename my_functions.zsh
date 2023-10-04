#!/bin/bash
 logout()
 {
    case $XDG_CURRENT_DESKTOP in
       xfce) xfce4-session-logout --logout                     ;;
       mate) mate-session-save --logout                        ;;
       MATE) mate-session-save --logout                        ;;
       LXQt) lxqt-leave --logout                               ;;
       *KDE*) qdbus org.kde.ksmserver /KSMServer logout 0 3 3  ;;

       *) echo "Sorry, Desktop Environment is uknown (no xfce/mate/lxqt/plasma)!" ;;
    esac
}
 
wmv2mp4() {
    ffmpeg -i "$1".wmv -c:v libx264 -crf 23 "$1".mp4
    # ffmpeg -i "$1".wmv -s wuxga "$1".mp4; }
}

wtfis() {
  curl "https://cheat.sh/$1"
}

clear_hist() {
for number in $(history | grep "$1" | sed 's/\|/ /'|awk '{print $1}' | sort -nr); do history -d "${number}"; done
}

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

# youtube-play
function ytp() { mpv --ytdl-format=bestaudio ytdl://ytsearch:"$*"; }

# youtube-get/grab (as mp3)
function ytg() { yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 "$1" }
