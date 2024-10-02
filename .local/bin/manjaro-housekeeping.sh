#!/bin/env bash
# housekeeping bash script
# VERSION="v2.0 - 2023-10-30"
VERSION="v3.0 - 2024-07-08"

clear
echo ""
echo ""
echo "This Script will REMOVE un-WANTED or un-USED files and packages on Arch- and Debian-based systems."
echo "Version: $VERSION"
echo ""
read -s -n 1 -p "Press any key to continue . . ."
echo ""
echo ""

DISTRO="$(lsb_release -si)"

if [ "$DISTRO" = 'Arch' ] || [ "$DISTRO" = 'EndeavourOS' ] || [ "$DISTRO" = 'ManjaroLinux' ]; then
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
elif [ "$DISTRO" = 'Debian' ] || [ "$DISTRO" = 'Siduction' ] || [ "$DISTRO" = 'Ubuntu' ]; then
    # NALA: Purge any packages that are no longer needed
    if command -v 'nala' &> /dev/null; then
        sudo nala autopurge
    fi
    # APT: Purge any packages that are no longer needed
    sudo apt autopurge
    # APT: clears out the local repository of retrieved package files
    sudo apt autoclean
fi

# check if Flatpak is installed (but suppress output of the check)
if command -v 'flatpak' &> /dev/null; then
    # Remove unused Flatpak Runtimes
    flatpak uninstall --unused
fi

# Vacuum journals
sudo journalctl --vacuum-size=500M && sudo journalctl --vacuum-time=7d

# Clean temporary build files
rm -rf ~/{.cargo,.cmake,.electron,.electron-gyp,.npm,.nvm,.racket,.stack,.yarn,.kcache} || true
rm -rf ~/.cache/{electron,electron-builder,go-build,node-gyp,pip,yarn,paru,yay} || true
rm -rf ~/go || true

#Cache

# delete files in ~/.cache directory that are have not been accessed in 100 days
find ~/.cache -depth -type f -mtime +100 -delete

echo ""
echo "Done."
echo ""
