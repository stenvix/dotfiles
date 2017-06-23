#!/bin/bash

#FILES

VIMRC_DEST=$HOME/".vimrc"
VUNDLE_FOLDER=$HOME/".vim/bundle/Vundle.vim"
#Clone vundle repo
if [[ ! -d $VUNDLE_FOLDER ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_FOLDER 
fi

#Link vimrc
if [[ ! -f $VIMRC_DEST ]]; then
    ln -s `realpath vimrc` $VIMRC_DEST
fi

#Install vim plugins
vim +PluginInstall +qall
