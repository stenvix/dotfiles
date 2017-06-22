#!/bin/bash

#FILES

VIMRC_DEST=$HOME/".vimrc"

#Clone vundle repo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Link vimrc
if [[ -L $VIMRC ]]; then
    ln -s vimrc $VIMRC_DEST
fi

#Install vim plugins
vim +PluginInstall +qall