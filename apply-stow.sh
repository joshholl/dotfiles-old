#!/usr/bin/env bash

has_stow () {
	if [ ! -f "$(command -v stow)" ]; then
		echo ' You do not have gnu stow install '
		exit 1;
	else 
		return 0
	fi
}



has_stow
git submodule init
git submodule update
stow -R -t ~/ files
stow -R -t $(pyenv root)/plugins pyenv-plugins
stow -R -t $(rbenv root)/plugins rbenv-plugins
