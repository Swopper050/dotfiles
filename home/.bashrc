#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -al'
PS1='[\u@\h \W]\$ '

# Often used
alias vim='nvim'
alias activate='source .env/bin/activate'

# Easy cd's
alias airgo='cd ~/acs/acs-ai/airgo'
alias nt='cd ~/acs/acs-ai/neural-twin'
alias cle='cd ~/acs/smarty/cle'

# Go stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
