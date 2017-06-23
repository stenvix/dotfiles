#!/bin/bash

# REPOS
VUNDLE_REPO='https://github.com/VundleVim/Vundle.vim.git'
POWERLINE_REPO='https://github.com/powerline/fonts.git'

# FILES
VIMRC_DEST=$HOME/".vimrc"
VUNDLE_FOLDER=$HOME/".vim/bundle/Vundle.vim"

# Clone vundle repo
if [[ ! -d $VUNDLE_FOLDER ]]; then
    git clone $VUNDLE_REPO $VUNDLE_FOLDER
fi

# Link vimrc
if [[ ! -f $VIMRC_DEST ]]; then
    ln -s `realpath vimrc` $VIMRC_DEST
fi

# Install vim plugins
vim +PluginInstall +qall

# Install gnome-terminal profile
wget -O xt  http://git.io/v3DB9 && chmod +x xt && ./xt && rm xt

# Install powerline fonts
if [[ -z `fc-list | grep -i "Powerline"` ]]; then
    TMP_DIR=`mktemp -d`
    git clone $POWERLINE_REPO $TMP_DIR
    cd $TMP_DIR
    ./install.sh
    fc-cache -fv
fi

# Set gnome-terminal profile

gconftool-2 --set --type string /apps/gnome-terminal/global/default_profile Smyck
gconftool-2 --set /apps/gnome-terminal/profiles/Smyck/use_system_font --type=boolean false
gconftool-2 --set /apps/gnome-terminal/profiles/Smyck/font --type string "Inconsolata for Powerline
Medium 12"
