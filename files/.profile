# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# source all of the stuff in .profile d
if [ -d "$HOME/.profile.d" ]; then
  if ! [ -f $HOME/.profile.d/optimized ]; then 
    cat $HOME/.profile.d/* > $HOME/.profile.d/optimized
  fi
  source $HOME/.profile.d/optimized
fi

#source all of the stuff in .private-profile.d
if [ -d "$HOME/.private-profile.d" ]; then
  if ! [ -f $HOME/.private-profile.d/optimized ]; then 
    cat $HOME/.private-profile.d/* > $HOME/.private-profile.d/optimized
  fi
  source $HOME/.private-profile.d/optimized
fi

