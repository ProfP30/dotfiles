 
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
