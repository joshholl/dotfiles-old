#!/usr/bin/env bash

echo "Setting up neovim"
stow -R -t $HOME neovim
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "configuring zsh"
if [ -f $HOME/.zshrc ];
then
	mv $HOME/.zshrc $HOME/.zshrc_dotfiled
fi

stow -R -t ~/ zsh

echo "Setting up lxde"
stow -R -t $HOME lxde

echo "Changing shell"
chsh -s /bin/zsh


