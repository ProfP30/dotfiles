---
# Installation
    
    git clone https://github.com/ProfP30/dotfiles.git ~/.dotfiles

---

# Symlinks

## config files
    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/bashrc ~/.bashrc
    ln -s ~/.dotfiles/bash_profile ~/.bash_profile

## oh-my-zsh 
	ln -s ~/.dotfiles/.oh-my-zsh/oh-my-zsh.sh ~/.oh-my-zsh/oh-my-zsh.sh
	ln -s ~/.dotfiles/.oh-my-zsh/custom/my_zsh_aliases.sh ~/.oh-my-zsh/custom/my_zsh_aliases.sh	

## Konsole
	ln -s ~/.dotfiles/.local/share/konsole/Bernstein.colorscheme ~/.local/share/konsole/Bernstein.colorscheme
	ln -s ~/.dotfiles/.local/share/konsole/Profil\ 1.profile ~/.local/share/konsole/Profil\ 1.profile

## Pacman
	sudo ln -s ~/.dotfiles/etc/pacman.conf /etc/pacman.conf
---
