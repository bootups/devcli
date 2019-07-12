ZSH_THEME="agnoster"
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
#chroot --userspec=adrianb:adrianb /host

# Run docker terminal
export PATH=$PATH:/Users/adrian/Projects/devcli/bin
# MacOSX: access to some brew utilities
export PATH=$PATH:/usr/local/bin
# Access to neovim macros
export PATH=$PATH:/usr/share/nvim/runtime/macros
# Ubuntu: to stop problems working with non root files from host
export ZSH_DISABLE_COMPFIX=true

plugins=(git aws sudo docker colored-man-pages colorize vi-mode zsh-syntax-highlighting zsh-completions zsh-autosuggestions k)
source $ZSH/oh-my-zsh.sh
source $HOME/.common.sh
. $ZSH/plugins/z/z.sh

# zcomp files collect, the following clears them out
rm ~/.zcompdump*