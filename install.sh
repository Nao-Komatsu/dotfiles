#!/bin/bash

# Bash setting
echo -e "\n--- Link to .bashrc ---"
if [ -f ~/.bashrc.bak ]; then
	echo ".bashrc.bak file found."
else
	cp -v ~/.bashrc ~/.bashrc.bak
fi
ln -sfv ~/dotfiles/.bashrc ~/.bashrc

echo -e "\n--- Create to .myconf ---"
cp -v ~/dotfiles/.myconf ~/.myconf

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
