# Why ZSH?

ZSH is an amazing shell that just makes everything a bit easier from auto suggestions, completing tasks you do regularly considerably faster.

# Dependencies

Packages needed before you start:

Package|Description
---|---
zsh|ZSH Shell
yay|AUR Helper (when on Arch-based Distro)

# Installation of ZSH

Step 0: Install ZSH (and recommended font "Hack") if not already installed
Via APT:

    sudo apt install zsh fonts-hack
    
Via Pacman:

    sudo pacman -S zsh ttf-hack

Step 1: Activate ZSH as Shell if not done already

    chsh --shell /usr/bin/zsh

Step 2: Install oh-my-zsh Extension for ZSH Shell

    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

Step 3: Install recommended plugins

- zsh-syntax-highlighting - syntax highlighting for ZSH in standard repos
- zsh-autosuggestions - Suggestions based on your history
- history-substring-search - type in any part of any command from history and then press chosen keys, such as the UP and DOWN arrows, to cycle through matches.
- autojump - jump to directories with j or jc for child or jo to open in file manager

On Arch/Manjaro/EndeavourOS/Arco:

    sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions && yay autojump

On Debian/Ubuntu/MX Linux/Siduction:

    sudo apt install zsh-syntax-highlighting zsh-autosuggestions autojump

On Fedora:

    sudo dnf install redhat-lsb-core zsh-syntax-highlighting zsh-autosuggestions autojump -y


# Installation of my dotfiles
    
    git clone https://github.com/ProfP30/dotfiles.git ~/.dotfiles

# Creating necessary Symlinks

## Config files

        rm ~/.zshrc && ln -s ~/.dotfiles/zshrc ~/.zshrc

        ln -s ~/.dotfiles/bashrc ~/.bashrc

        ln -s ~/.dotfiles/bash_profile ~/.bash_profile

## Aliases and functions

        ln -s ~/.dotfiles/my_aliases.zsh ~/.oh-my-zsh/custom/my_aliases.zsh

        ln -s ~/.dotfiles/my_functions.zsh ~/.oh-my-zsh/custom/my_functions.zsh

## Konsole

        ln -s ~/.dotfiles/.local/share/konsole/Bernstein.colorscheme ~/.local/share/konsole/Bernstein.colorscheme

        rm ~/.local/share/konsole/Profil\ 1.profile && ln -s ~/.dotfiles/.local/share/konsole/Profil\ 1.profile ~/.local/share/konsole/Profil\ 1.profile

## Micro Editor Keybindings

		rm ~/.config/micro/bindings.json && ln -s ~/.dotfiles/.config/micro/bindings.json ~/.config/micro/bindings.json

## Useful scripts

		rm ~/.local/bin/manjaro-housekeeping &>/dev/null; ln -s ~/.dotfiles/.local/bin/manjaro-housekeeping.sh ~/.local/bin/manjaro-housekeeping

		rm ~/.local/bin/UpdateInTerminal &>/dev/null; ln -s ~/.dotfiles/.local/bin/UpdateInTerminal.sh ~/.local/bin/UpdateInTerminal
