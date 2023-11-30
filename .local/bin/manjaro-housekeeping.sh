#!/bin/sh
# manjaro housekeeping bash script
VERSION="v2.0 - 2023-10-30"
clear
echo ""
echo ""
echo "This Script will REMOVE un-WANTED or un-USED Files on a Arch/Manjaro System"
echo "Version: $VERSION"
read -p "Press ENTER to continue or Ctrl+C to cancel."

# Vacuum journals
sudo journalctl --vacuum-size=500M && sudo journalctl --vacuum-time=7d

# Remove all uninstalled packages
sudo paccache -rvuk0

# Remove old installed packages, leave 3
sudo paccache -rvk3

# Clean yay cache (if yay is installed)
if command -v 'yay' &> /dev/null; then
    yay -Sc -a
fi

# Clean paru cache (if paru is installed)
if command -v 'paru' &> /dev/null; then
    paru -Sc -a
fi

# Pacman

# Entfernet alte Pakete aus dem Puffer sowie ungenutzte Repositories
sudo pacman -Sc
# keine Infos dazu
sudo pacman -Qdt

# clean pamac cache (if pamac is installed)
if command -v 'pamac' &> /dev/null; then
    # Clean pamac build cache
    pamac clean -bv
    #Remove orphaned libraries
    pamac remove --orphans
    #clean cache
    pamac clean --build-files
fi

# Clean temporary build files
rm -rf ~/{.cargo,.cmake,.electron,.electron-gyp,.npm,.nvm,.racket,.stack,.yarn,.kcache} || true
rm -rf ~/.cache/{electron,electron-builder,go-build,node-gyp,pip,yarn,paru,yay} || true
rm -rf ~/go || true

#Cache

# delete files in ~/.cache directory that are have not been accessed in 100 days
find ~/.cache -depth -type f -mtime +100 -delete
