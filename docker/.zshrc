#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
export P="/Users/adrian/Projects/"
export HISTFILE=/devcli/cache/.zsh_history

plugins=(git aws sudo docker colored-man-pages colorize vi-mode zsh-syntax-highlighting zsh-completions zsh-autosuggestions k)
source $ZSH/oh-my-zsh.sh
source $HOME/common-aliases.sh
. $ZSH/plugins/z/z.sh

# Set the home to the host home
export HOME=$HOST_HOME
cd ~

# TODO: put the following into confluence
# https httpserver
# cd /Users/adrian/Projects/customisations/drawio
# http-server /Users/adrian/Projects/customisations/drawio -c-1 --ssl