---
# Installation
    
    git clone https://github.com/ProfP30/dotfiles.git ~/.dotfiles

---

# Symlinks

## Config files
    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/bashrc ~/.bashrc
    ln -s ~/.dotfiles/bash_profile ~/.bash_profile

## Aliases
    ln -s ~/.dotfiles/.oh-my-zsh/custom/my_zsh_aliases.zsh ~/.oh-my-zsh/custom/my_zsh_aliases.zsh

## Konsole
    ln -s ~/.dotfiles/.local/share/konsole/Bernstein.colorscheme ~/.local/share/konsole/Bernstein.colorscheme
    ln -s ~/.dotfiles/.local/share/konsole/Profil\ 1.profile ~/.local/share/konsole/Profil\ 1.profile

## Micro Keybindings
    ln -s ~/.dotfiles/.config/micro/bindings.json ~/.config/micro/bindings.json

## Pacman
    sudo ln -s ~/.dotfiles/etc/pacman.conf /etc/pacman.conf

---
