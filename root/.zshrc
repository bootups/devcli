ZSH_THEME="agnoster"
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
#chroot --userspec=adrianb:adrianb /host

# Run docker terminal
export PATH=$PATH:/projects/devcli/bin
# MacOSX: access to some brew utilities
export PATH=$PATH:/usr/local/bin
# Access to neovim macros
export PATH=$PATH:/usr/share/nvim/runtime/macros
# Ubuntu: to stop problems working with non root files from host
export ZSH_DISABLE_COMPFIX=true

plugins=(git aws sudo docker colored-man-pages colorize vi-mode zsh-syntax-highlighting zsh-completions zsh-autosuggestions k)
source $ZSH/oh-my-zsh.sh
. $ZSH/plugins/z/z.sh

# Find directores matching the pattern
function fd() {
  find . -type d -iname $1
}

# Find files matching the whole path using case insensitive extended regular expressions.
function ff() {
  find -E . -iregex $1 -exec ls -lFh {} \;
}

# Cats the files matching file pattern with neovim pretty print
# $ catfiles *.sh 
function catfiles() {
  tail -n +1 $1 | less.sh
}

# Finds files across the file system >= 100M
alias lf="sudo find . -xdev -type f -size +100M"

# Prints the contents of the directories immediately below the current directory
alias fr1="find . -maxdepth 1 -type d -printf '\n%p: ' -exec ls -lAFh "{}" \;"

# Start up different Chrome instances
alias vdc='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/projects/vd/prod/visual-doco/config/chrome --kiosk http://localhost:9000/drawio/src/main/webapp'

alias un='for i in *.zip; do unzip "$i" -d "${i%%.zip}"; done'

# login to aws ecr
alias a='$(aws ecr get-login --region us-east-1 --no-include-email)'
# pretty directory listing
alias l="k -h -a"

# neovim aliases
alias vi='nvim'
alias vim='nvim'

# Perform regular expressions search on stdin, or directory recursively if -R used.
# e.g: agrep -R (HIST_|MASS_) .oh-my-zsh
alias agrep='grep --color -IEn --exclude-dir={.git} '

# ls, the common ones I use a lot shortened for rapid fire usage
alias lz='ls -lFh'  #size,show type,human readable
#alias l='ls -lAFh'  #long list,show almost all,show type,human readable
alias lr='ls -tRFh' #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh' #long list,sorted by date,show type,human readable
alias ll='ls -l'    #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# zcomp files collect, the following clears them out
rm ~/.zcompdump*
cd ~