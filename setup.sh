#!/usr/bin/env bash

## Install the things
sudo apt-get install -y git neovim stow zsh curl

echo "Installing Powerline Fonts"
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts


echo "Setting up neovim"
stow -R -t $HOME neovim
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "configuring zsh"
if [ -f $HOME/.zshrc ];
then
	mv $HOME/.zshrc $HOME/.zshrc_dotfiled
fi

if [ -d $HOME/.oh-my-zsh ]
then 
	rm -rf $HOME/.oh-my-zsh
fi

git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
stow -R -t ~/ zsh

echo "Setting up lxde"
stow -R -t $HOME lxde

echo "Changing shell"
chsh -s /bin/zsh


