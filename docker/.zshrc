#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export P="/host/Users/adrian/Projects/"

plugins=(git aws sudo docker colored-man-pages colorize vi-mode)
source $ZSH/oh-my-zsh.sh
source $HOME/common-aliases.sh

alias k="k -h -a"
alias vi='nvim'
alias vim='nvim'

# TODO: put the following into confluence
# https httpserver
# cd /Users/adrian/Projects/customisations/drawio
# http-server /Users/adrian/Projects/customisations/drawio -c-1 --ssl


#plugins=(git osx aws sudo docker colored-man-pages colorize vi-mode zsh-syntax-highlighting zsh-completions zsh-autosuggestions k)
#source $ZSH/oh-my-zsh.sh
#. $ZSH/plugins/z/z.sh