#!/bin/sh

# Bash setting.
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc

# vim-plug install.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim setting.
mkdir -p ~/.vim/ftplugin/
ln -sf ~/dotfiles/python.vim ~/.vim/ftplugin/python.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
