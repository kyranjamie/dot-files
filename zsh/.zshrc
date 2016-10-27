export PATH="/usr/local/bin:$PATH"
export PATH="/Users/kyran/Dropbox/tech/scripts:$PATH"
export PATH="$HOME/Library/Python/2.7/lib/python/site-packages:$PATH"
export EDITOR="vim"
export VISUAL="vim"
export TASKRC="$HOME/Dropbox/life/todo/.todorc"
export GOPATH="$HOME/.go"
export IPLAYER_OUTDIR="Documents/iplayer/"
export ACK_OPTIONS="--ignore-case --literal"


# Docker stuff
# export DEVIP=$(docker-machine ip default)
# export DOCKERINFRA="$HOME/projects/infrastructure"
# eval `docker-machine env default`

setopt prompt_subst
setopt APPEND_HISTORY
unsetopt share_history
unsetopt INC_APPEND_HISTORY

# so annoying
setopt NO_BEEP

# Case insensitive globbing
setopt NO_CASE_GLOB

#
# Configure antigen
# source ~/dev/dot-files/antigen/antigen.zsh

# antigen use oh-my-zsh


# antigen plugins
# antigen bundle gitfast
# antigen bundle aws
# antigen bundle brew
# antigen bundle compleat
# antigen bundle docker
# antigen bundle npm
# antigen bundle node
# antigen bundle gem
# antigen bundle zsh-users/zsh-syntax-highlighting


# enable antigen
# antigen apply

#
# Source configs
for file in ~/dev/dot-files/zsh/{aliases,functions,prompt}.zsh; do
  [ -r "$file" ] && source "$file"
done
unset file

bindkey -e
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# delete key broken ? wtf
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char


# 
# Autocomplete settings
# ------------------------------------------------------------

# Required for completion
autoload -Uz compinit && compinit

# Ensures completion on first tab
# Otherwise first tab results in just presenting the options
setopt menu_complete

# Set shift-tab to go in reverse of autocomplete options 
# bindkey -M menuselect '^[[Z' reverse-menu-complete

# To annotate what this stuff does
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle '*' single-ignored complete
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'


# Show tab complete menu immediately
# zstyle ':completion:*' menu yes select

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' enable git svn

# init nvm 
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# init z 
# https://github.com/rupa/z
# installed with brew
. `brew --prefix`/etc/profile.d/z.sh
