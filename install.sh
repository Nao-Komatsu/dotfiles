#!/bin/sh

# Bash setting
ln -sf ~/dotfiles/.bashrc ~/.bashrc

# vim-plug install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Vim setting
mkdir -p ~/.vim/ftplugin/
ln -sf ~/dotfiles/filetype/python.vim ~/.vim/ftplugin/python.vim
ln -sf ~/dotfiles/filetype/markdown.vim ~/.vim/ftplugin/markdown.vim
ln -sf ~/dotfiles/filetype/restructuredtext.vim ~/.vim/ftplugin/restructuredtext.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
