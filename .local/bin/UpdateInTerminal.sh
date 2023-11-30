#!/bin/bash

Main() {
    local update_cmd=""
    local DISTRO

    DISTRO="$(lsb_release -si)"

    if [ "$DISTRO" = 'Debian' ] || [ "$DISTRO" = 'Siduction' ] || [ "$DISTRO" = 'Ubuntu' ]; then
        # check if nala is installed (but suppress output of the check)
        if which 'nala' &> /dev/null; then
            update_cmd='sudo nala update && sudo nala upgrade --assume-yes --autoremove'
        else
            update_cmd='sudo apt update && sudo apt upgrade --yes --autoremove'
        fi
    elif [ "$DISTRO" = 'Arch' ] || [ "$DISTRO" = 'EndeavourOS' ] || [ "$DISTRO" = 'ManjaroLinux' ]; then
        update_cmd='sudo pacman -Syy'
        update_cmd_aur_helper=''
        # check if pamac is installed (suppress output of the check)
        if which 'pamac' &> /dev/null; then
            update_cmd="sudo pamac update --aur --no-confirm"
        fi
        # check if yay is installed (suppress output of the check)
        if which 'yay' &> /dev/null; then
            update_cmd_aur_helper="$update_cmd && yay -Syu"
        fi
        # check if paru is installed (suppress output of the check)
        if which 'paru' &> /dev/null; then
            update_cmd_aur_helper="$update_cmd && paru -Syu --noconfirm"
        fi
        update_cmd="$update_cmd_aur_helper"
    elif [ "$DISTRO" = 'Fedora' ]; then
        update_cmd="sudo dnf upgrade --assumeyes --best --allowerasing"
    fi

    # check if Flatpak is installed (but suppress output of the check)
    if command -v 'flatpak' &> /dev/null; then
        update_cmd="$update_cmd && flatpak update && flatpak remove --unused"
    fi

    # check if Pacstall is installed (but suppress output of the check)
    if command -v 'pacstall' &> /dev/null; then
        update_cmd="$update_cmd && pacstall -Up"
    fi

    # display and execute the command
    echo -e "- System update with: $update_cmd"
    eval "$update_cmd"
    echo ""

    if [ "$1" = "wait_for_exit" ]; then
        read -p "Press ENTER to close this window. . ."
    fi

    exit

}

Main "$@"
