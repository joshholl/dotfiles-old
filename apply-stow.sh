git submodule init
git submodule update
stow -R -t ~/ files
stow -R -t $(pyenv root)/plugins pyenv-plugins
stow -R -t $(rbenv root)/plugins rbenv-plugins
