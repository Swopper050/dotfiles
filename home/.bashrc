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
alias ares='cd ~/acs/mijnbaopt/ares'
alias airgo='cd ~/acs/smartbase/software/core/airgo'
alias cle='cd ~/acs/smartbase/software/services/cle'
alias pm='cd ~/self/project-m'
alias wdn='cd ~/self/watdenktnederland'
alias api='cd ~/acs/mijnbaopt/api'
alias core='cd ~/acs/mijnbaopt/core'
alias ui='cd ~/acs/mijnbaopt/ui'
alias tasks='cd ~/acs/mijnbaopt/tasks'
alias zeus='cd ~/acs/mijnbaopt/zeus'
alias gaia='cd ~/acs/mijnbaopt/gaia'
alias gonnx='cd ~/self/gonnx'

# Go stuff
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

export PATH=$PATH:/opt/cuda/bin

# History control; commands starting with a space will not be stored.
export HISTCONTROL=ignorespace
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
