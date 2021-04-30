#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.inputrc ~/.inputrc

mkdir ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.tmux
ln -sf ~/dotfiles/status.sh ~/.tmux/status.sh
