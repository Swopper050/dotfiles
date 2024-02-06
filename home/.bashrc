#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color ssh

alias ls='ls --color=auto -al'
PS1='[\u@\h \W]\$ '

# Often used
alias vim='pyenv shell $(pyenv local); nvim'
alias activate='source .env/bin/activate'
alias makeenv='python -m venv .env && activate && pip install pyright'
alias fs='flameshot gui'

# Easy cd's
alias ares='cd ~/acs/climatics/climatics/python/ares'
alias aule='cd ~/acs/smartbase/software/services/cle'
alias api='cd ~/acs/climatics/climatics/python/api'
alias core='cd ~/acs/climatics/climatics/python/core'
<<<<<<< Updated upstream
alias ui='cd ~/acs/climatics/climatics/ui/main/'
=======
alias ui='cd ~/acs/climatics/climatics/ui/main'
>>>>>>> Stashed changes
alias tasks='cd ~/acs/climatics/climatics/python/tasks'
alias zeus='cd ~/acs/climatics/climatics/python/zeus'
alias gaia='cd ~/acs/climatics/climatics/python/gaia'
alias gonnx='cd ~/self/gonnx'

# Go stuff
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

# Dotnet stuff
export PATH=$PATH:$HOME/.dotnet/tools


export PATH=$PATH:/opt/cuda/bin

# History control; commands starting with a space will not be stored.
export HISTCONTROL=ignorespace
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source /usr/share/nvm/init-nvm.sh
