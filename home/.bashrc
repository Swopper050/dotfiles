#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color ssh

alias ls='ls --color=auto -al'
PS1='[\u@\h \W]\$ '

# Often used
alias vim='nvim'
alias activate='source .env/bin/activate'
alias makeenv='python -m venv .env && activate && pip install pyright'
alias fs='flameshot gui'

# Easy cd's
alias wiseflix='cd ~/applyai/wiseflix'
alias ktg='cd ~/applyai/vemc/ktg-demo'
alias panel='cd ~/applyai/csg/sgog-panel'
alias v3='cd ~/applyai/vemc/stakeholder-journey-v3'
alias solid='cd ~/self/solid-flask-web-app-template'
alias gonnx='cd ~/self/gonnx'

# Go stuff
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

# Dotnet stuff
export PATH=$PATH:$HOME/.dotnet/tools


export PATH=$PATH:/opt/cuda/bin

# History control; commands starting with a space will not be stored.
export HISTCONTROL=ignorespace

source /usr/share/nvm/init-nvm.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
