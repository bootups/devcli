#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

# to stop problems working with non root files from host
export ZSH_DISABLE_COMPFIX=true

plugins=(git aws sudo docker colored-man-pages colorize vi-mode zsh-syntax-highlighting zsh-completions zsh-autosuggestions k)
source $ZSH/oh-my-zsh.sh
source $HOME/.common.sh
. $ZSH/plugins/z/z.sh

# Changes to the standard project path (for devcli)
cd /project

# Access to neovim macros
export PATH=$PATH:/usr/share/nvim/runtime/macros