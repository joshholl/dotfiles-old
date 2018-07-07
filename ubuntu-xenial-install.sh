#!/usr/bin/env bash
sudo apt-get install -qy software-properties-common \
	git \
	curl \
	apt-transport-https \
	ca-certificates \

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

sudo add-apt-repository ppa:gophers/archive
sudo apt-add-repository ppa:neovim-ppa/stable
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo add-apt-repository \
    "deb http://repository.spotify.com stable non-free"

sudo apt-get update -qy 

sudo apt-get install -qy docker-ce \
	golang-1.10-go \
	spotify-client \
	neovim \
	python-dev \
	python-pip \
	python3-dev \
	python3-pip \
	zsh \
	fonts-powerline


# setup ruby 
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io -o rvm.sh
cat rvm.sh | bash -s stable
source $HOME/.rvm/scripts/rvm
echo '[ -s "$HOME/.rvm/scripts/rvm" ] && \. "$HOME/.rvm/scripts/rvm"'  >> ~/.bashrc


rvm install ruby --default

#setup node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install node --latest-npm --reinstall-packages-from=node
npm install -g neovim

# setup neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
pip3 install --user --upgrade neovim
gem install neovim

# Setup docker group
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# shell config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
