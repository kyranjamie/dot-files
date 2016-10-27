# 
# Navigation
# ----------------------------------------------------------------------

alias proj="cd ~/Projects/"
alias dropbox="cd ~/Dropbox/"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


#
# Directory information
# ----------------------------------------------------------------------

colorflag="-G"
alias ls="command ls ${colorflag}"
alias la="ls -a ${colorflag}"
alias ll="ls -lah ${colorflag}"
alias lsd='ls -lF ${colorflag} | grep "^d"'
alias cls="clear"
alias tree1="tree -L 1"
alias tree2="tree -L 2"
alias tree3="tree -L 3"


#
# Software
# ----------------------------------------------------------------------

alias s='open -a "Sublime Text"'
alias photoshop='open -a "Adobe Photoshop CC 2015"'
alias illustrator='open -a "Adobe Illustrator CS6"'
alias imageotim='open -a "ImageOptim"'
alias sketch='open -a "Sketch"'
alias chromex='open -a "Google Chrome Canary" --args --disable-web-security'
alias t='task'
# Defaults
alias grep='grep -i'
alias less='less -N'
alias py='python3.4'
alias sudo="sudo "
alias sz='source ~/.zshrc'


#
# Development
# ----------------------------------------------------------------------

# Vagrant
alias vssh="cd ~/dev/chewbacca && vagrant ssh"
alias vagup="cd ~/dev/chewbacca && vagrant up && cd -"

# Docker
alias dk="docker"
alias dkstart="docker-machine start default"

#
# System config
# ----------------------------------------------------------------------

alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO"

alias shutdown="sudo shutdown -h now"
alias restart="sudo shutdown -h now"

# Pygments first - "sudo easy_install Pygments"
alias ccat='pygmentize -O style=monokai -f console256 -g'


#
# System Info
# ----------------------------------------------------------------------

alias ip="curl ifconfig.me | pbcopy"
alias localip="ipconfig getifaddr en1 | pbcopy"

# alias http='sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"'
alias checkport="sudo lsof -i"
alias wifi="airport -s"

alias btcauth="curl http://bitcoin-otc.com/otps/DA2EEEBE15ABADED | gpg -d | pbcopy"

# Show all open TCP/IP sockets
alias netCons='lsof -i' 

# Flush out the DNS Cache
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;' 

# Display open sockets
alias lsock='sudo /usr/sbin/lsof -i -P'             

# Display only open UDP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   

# Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   

# Get info on connections for en0
alias en0='ipconfig getpacket en0'                  

# Get info on connections for en1
alias en1='ipconfig getpacket en1'                  

# All listening connections
alias openports='sudo lsof -i | grep LISTEN'        

# All ipfw rules inc/ blocked IPs
alias showBlocked='sudo ipfw list'                  

# Fetch IP info
alias ipinfo="curl ipinfo.io"


#
# Git
# ----------------------------------------------------------------------

alias g="git"
alias gl="git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gs="git status"
alias gsp="git stash pop"
alias gsh="git stash"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gb="git branch"
alias gco="git checkout"
alias gm="git merge"
alias gf="git fetch"
alias gp="git push"
alias gpoh="git push origin HEAD"
alias gpl="git pull"
alias gcp="git cherry-pick"
alias gd="git diff --color | diff-so-fancy"
alias ghash="git rev-parse HEAD && git rev-parse HEAD | pbcopy"
alias conflicts="git diff --name-only | uniq"
alias commits="git shortlog -sn"
