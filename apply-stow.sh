#!/usr/bin/env bash
set -e

# These variables should be what $(pyenv root) and $(rbenv root) resolve to but
# given this runs before those things are even installed, we might not have them
# available yet
pyenv_root=$HOME/.pyenv
rbenv_root=$HOME/.rbenv


has_stow () {
	echo 'Checking for stow....'
	if [ ! -f "$(command -v stow)" ]; then
		echo ' You do not have gnu stow install '
		exit 1
	else 
		return 0
	fi
}

rename_old_profile () {
	echo 'backing up old .profile...'
	if [ -f $HOME/.profile ] && ! [ -L $HOME/.profile ]; then
		mv $HOME/.profile $HOME/.profile_pre_stow
	fi
}

make_required_dirs () {
	echo 'Making plugin dirs for rbenv and pyenv...'
	mkdir -p $pyenv_root/plugins
	mkdir -p $rbenv_root/plugins
}

rehydrate_sub_modules () {
	echo 'Rehydrating submodules...'
	git submodule init
	git submodule update
}
apply () {
	echo 'applying base stow'
	stow -R -t ~/ files
	echo 'applying pyenv stow'
	stow -R -t $pyenv_root/plugins pyenv-plugins
	echo 'applying rbenv stow'
	stow -R -t $rbenv_root/plugins rbenv-plugins
}

execute_post_stow () {
	'executing post install...'
	find ./scripts -maxdepth 1 -type f -name '*.sh' -exec {} \; > results.out
}

has_stow
rename_old_profile
make_required_dirs
rehydrate_sub_modules
apply
execute_post_stow

