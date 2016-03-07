export PATH="/usr/local/bin:/Users/kyran/Dropbox/tech/scripts:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin/arcanist/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH

export EDITOR="vim"

export GOPATH="$HOME/.go"
export IPLAYER_OUTDIR="Documents/iplayer/"
export USABILLA_PROJECTS="projects"
export UBJS="projects/usabilla.js/usabilla.js"


# Docker stuff
export DEVIP=$(docker-machine ip default)
export DOCKERINFRA="$HOME/projects/infrastructure"
eval `docker-machine env default`

setopt prompt_subst

#
# Configure antigen
source ~/dev/dot-files/antigen/antigen.zsh
antigen bundle git
antigen apply

#
# Load and configure escaped colour globals
autoload -U colors && colors
reset="%{${reset_color}%}"
white="%{$fg[white]%}"
gray="%{$fg[black]%}"
green="%{$fg[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"
magenta="%{$fg[magenta]%}"

#
# Source configs
for file in ~/dev/dot-files/zsh/{aliases,functions,prompt}.zsh; do
  [ -r "$file" ] && source "$file"
done
unset file

bindkey -e
bindkey "^[C" forward-word
bindkey "^[D" backward-word

# delete key broken ? wtf
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char

# so annoying
setopt NO_BEEP

# Case insensitive globbing
setopt NO_CASE_GLOB

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'



# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn



# init nvm
source ~/.nvm/nvm.sh

# init z 
# https://github.com/rupa/z
# installed with brew
. `brew --prefix`/etc/profile.d/z.sh
