#!/usr/bin/env bash

# PYTHON SETUP
python_2=2.7.16
python_3=3.7.4

	
if ! [ "$(pyenv virtualenvs | grep neovim2 | wc -l)" -gt "0" ]; then
	pyenv install $python_2
	pyenv virtualenv $python_2 neovim2
	pyenv activate neovim2
	pip install neovim
	pyenv deactivate
fi

if ! [ "$(pyenv virtualenvs | grep neovim3 | wc -l)" -gt "0" ]; then
	pyenv install $python_3
	pyenv virtualenv $python_3 neovim3
	pyenv activate neovim3
	pip install neovim
	pip install flake8
	ln -s `which pyenv flake8` $HOME/bin/flake8
	pyenv deactivate
fi

# RUBY SETUP
ruby_26=2.6.3

if ! [ "$(rbenv versions | grep $ruby_26 | wc -l )" -gt "0" ]; then 
rbenv	install $ruby_26
rbenv global $ruby_26
gem install neovim
fi

# NODE SETUP
nvm use node
npm install -g neovim typescript
