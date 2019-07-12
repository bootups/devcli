# Advanced Aliases.
# Use with caution
#
alias pr='cd /home/adrian/Projects'

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

# Start up different Chrome instances
alias vdc='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=/Users/adrian/Projects/doco/visual-doco/config/chrome'

alias un='for i in *.zip; do unzip "$i" -d "${i%%.zip}"; done'

# Prints the contents of the directories immediately below the current directory
alias fr1="find . -maxdepth 1 -type d -printf '\n%p: ' -exec ls -lAFh "{}" \;"

# login to aws ecr
alias a='$(aws ecr get-login --region us-east-1 --no-include-email)'
# pretty directory listing
alias l="k -h"

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

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
# Use the --excludes
# alias duh='du -h --exclude=".git" . | sort -h'
alias duh='du -h . | sort -h'
alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
  fi

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
  fi

  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done

  #read documents
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
