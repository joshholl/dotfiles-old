#!/usr/bin/env bash

## Install the things
sudo apt-get install -y git neovim stow zsh curl tmux

if test -n "$(find $HOME/.local/share/fonts/ -maxdepth 1 -name '*Powerline*' -print -quit)"
then
	echo "Powerline Fonts Installed...skipping"
else
	echo "Installing Powerline Fonts"
	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.sh
	cd ..
	rm -rf fonts
fi

if [ -d $HOME/.oh-my-zsh ]
then
	echo "Deleting old oh-my-zsh"
	rm -rf $HOME/.oh-my-zsh
fi
echo "Installing oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

## Setup source directory
mkdir $HOME/Source

git clone https://github.com/joshholl/dotfiles $HOME/Source/dotfiles
