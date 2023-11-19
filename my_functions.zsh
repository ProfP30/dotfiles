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
# --audio-quality   # 0=best 10=worst default=5
function yte() { yt-dlp --extract-audio --audio-format mp3 --default-search ytsearch "$1" }

function top-history() {
	about 'print the name and count of the most commonly run tools'

	# - Make sure formatting doesn't interfer with our parsing
	# - Use awk to count how many times the first command on each line has been called
	# - Truncate to 10 lines
	# - Print in column format
	HISTTIMEFORMAT='' history \
		| awk '{
				a[$2]++
			}END{
				for(i in a)
				printf("%s\t%s\n", a[i], i)
			}' \
		| sort --reverse --numeric-sort \
		| head \
		| column \
			--table \
			--table-columns 'Command Count,Command Name' \
			--output-separator ' | '
}

# shorten xdg-open to open and suppress console outputs
function open() {
	xdg-open $1 &>/dev/null
}
