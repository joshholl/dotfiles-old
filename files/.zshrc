#!/bin/zsh

unsetopt correct_all

source $HOME/.antigen/antigen.zsh


antigen use oh-my-zsh

if [[ "$(uname)" == "Darwin" ]]; then
	antigen bundle brew
	antigen bundle osx
fi
antigen bundle battery
antigen bundle colorize
antigen bundle command-not-found
antigen bundle git

command -v tmux > /dev/null 2>&1  && antigen bundle tmux


antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen theme romkatv/powerlevel10k

antigen apply

# If you come from bash you might have to change your $PATH.

# CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# SET NVIM AS DEFAULT 
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source "$HOME/.profile"

function attachOrSpawnTmux() {
	if [[ -z "$TMUX" ]]; then
		if tmux has-session 2>/dev/null; then 
			exec tmux attach
		else
			exec tmux
		fi
	fi
}

case $TERM_PROGRAM in 
	"Apple_Terminal")
		attachOrSpawnTmux
		;;
	"alacritty")
		attachOrSpawnTmux
		;;
	*)
		;;
esac
unset -f attachOrSpawnTmux

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
