export PATH=/usr/local/bin:/Volumes/Personal/Dropbox/tech/scripts:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export IPLAYER_OUTDIR="Documents/iplayer/"

# Sets to vim mode
set -o vi
export EDITOR='vim'
export BLOCKSIZE=1k

# Jump to directories
alias proj="cd ~/Projects/"
alias dropbox="cd /Volumes/Personal/Dropbox/"
alias portfolio="cd ~/Documents/web/001_portfolio" 

# Open profile
alias profile="vim ~/.bash_profile"

# Sensible defaults
alias grep="grep -i"
alias less="less -N"
alias py="python3.4"

# HTTP headers
alias icurl="curl -I"

# Open with...
alias s='open -a "Sublime Text"'

# Chrome Canary, no web security
alias chromex="open -a /Applications/Google\ Chrome\ Canary.app --args --disable-web-security"

# todo.sh
alias t="todo.sh -t"

# Shortcut commands
alias ..="cd .."
alias ...="cd ../.."
colorflag="-G"
alias ls="command ls ${colorflag}"
alias la="ls -a ${colorflag}" # all files, in long format
alias ll="ls -la ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories
alias cls="clear"
alias tree1="tree -L 1"
alias tree2="tree -L 2"
alias tree3="tree -L 3"

# Show / hide hidden files
alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO"

# System actions
alias shutdown="sudo shutdown -h now"
alias restart="sudo shutdown -h now"


# Overides
# ------------------------------------------------------------

# Confirm remove

# Syntax highlighted cat
# Pygments first - "sudo easy_install Pygments"
alias cat='pygmentize -O style=monokai -f console256 -g'

# Info
alias http='sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'

## Copy global IP to pasteboard
alias ip="curl ifconfig.me | pbcopy"
alias localip="ipconfig getifaddr en1 | pbcopy"
alias checkport="sudo lsof -i"

## Display available wifi ports
alias wifi="airport -s"

alias btcauth="curl http://bitcoin-otc.com/otps/DA2EEEBE15ABADED | gpg -d | pbcopy"

alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushdns='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias en0='ipconfig getpacket en0'                  # ipInfo0:      Get info on connections for en0
alias en1='ipconfig getpacket en1'                  # ipInfo1:      Get info on connections for en1
alias openports='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

# httpDebug:  Download a web page and show info on what took time
httpdebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

# Make and cd into dir
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# shorthand find 
function f() {
  find . -name "$1"
}

# Override rm (move it to trash)
# It will save me one day
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="`expr "$dst" : '\(.*\)\.[^.]*'` `date +%H-%M-%S`.`expr "$dst" : '.*\.\([^.]*\)'`"
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

# Google Translate API
# https://github.com/soimort/google-translate-cli
fr () {
  X=`trs {=fr} "$1"`;
  echo "$X" | pbcopy;
  echo "$X";
}

# Convert screen recordings to gif image
# https://gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# Git
alias g="git"
alias commits="git shortlog -sn"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias ghash="git rev-parse HEAD && git rev-parse HEAD | pbcopy"

# Git branch details
function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

## Prompt Colors 
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    BLACK=$(tput setaf 190)
    MAGENTA=$(tput setaf 6)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 221)
    PURPLE=$(tput setaf 139)
    WHITE=$(tput setaf 0)
  else
    BLACK=$(tput setaf 190)
    MAGENTA=$(tput setaf 15)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  BLACK="\033[01;30m"
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Prompt symbol
symbol="$ "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Show the current directory's name in the tab 
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

# init z 
# https://github.com/rupa/z
# installed with brew
. /usr/local/Cellar/z/1.8/etc/profile.d/z.sh

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
