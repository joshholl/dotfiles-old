#!/usr/bin/env bash

has_stow () {
	if [ ! -f "$(command -v stow)" ]; then
		echo ' You do not have gnu stow install '
		exit 1;
	else 
		return 0
	fi
}

rename_old_profile () {
	[ -f $HOME/.profile ] && ! [ -L $HOME/.profile ]  && mv $HOME/.profile $HOME/.profile_pre_stow
}


make_required_dirs () {
	mkdir -p $(pyenv root)/plugins
	mkdir -p $(rbenv root)/plugins
}

has_stow
rename_old_profile
make_required_dirs


git submodule init
git submodule update
stow -R -t ~/ files
stow -R -t $(pyenv root)/plugins pyenv-plugins
stow -R -t $(rbenv root)/plugins rbenv-plugins
