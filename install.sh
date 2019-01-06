#!/bin/bash

# Bash setting
echo -e "\n--- Link to .bashrc ---"
ln -sfv ~/dotfiles/.bashrc ~/.bashrc

# Install vim-plug
echo -e "\n--- Install vim-plug ---"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim setting
echo -e "\n--- Link to Vim setting files ---"
mkdir -pv ~/.vim/ftplugin/
ln -sfv ~/dotfiles/filetype/*.vim ~/.vim/ftplugin/
ln -sfv ~/dotfiles/.vimrc ~/.vimrc

# Git setting
echo -e "\n--- Link to .gitconfig ---"
ln -sfv ~/dotfiles/.gitconfig ~/.gitconfig
