export EDITOR="nvim"
export VISUAL="nvim"
export HOMEBREW_BREWFILE="${HOME}/dev/dot-files/Brewfile"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/cask-apps"
export NODE_VERSION="v13.11.0"
export DOCKER_ID_USER="kyranjamie"
export GPG_TTY=$(tty)
export NVM_DIR="$HOME/.nvm"

export PATH="/usr/local/bin:${PATH}"
export PATH="${HOME}/Dropbox/tech/scripts:${PATH}"
export PATH="${HOME}/.yarn/bin:${PATH}:"
export PATH="${HOME}/.config/yarn/global/node_modules/.bin:${PATH}:"
export PATH="${HOME}/.cargo/bin:${PATH}:"
export PATH=$(brew --prefix openvpn)/sbin:$PATH


[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

# 
# History
# ------------------------------------------------------------
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL="ignoredups"
HISTORY_IGNORE="(ls *|ll *|gs)"

setopt prompt_subst
setopt hist_ignore_all_dups
setopt APPEND_HISTORY
setopt histignorespace
unsetopt INC_APPEND_HISTORY
unsetopt share_history

# So annoying
setopt NO_BEEP
# Case insensitive globbing
setopt NO_CASE_GLOB

#
# Source configs
for file in ~/dev/dot-files/zsh/.{aliases,functions,prompt,keys}.zsh; do
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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'
zstyle '*' single-ignored complete
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# Show tab complete menu immediately
zstyle ':completion:*' menu yes select

# init z 
# https://github.com/rupa/z
# installed with brew
. `brew --prefix`/etc/profile.d/z.sh

# Enable auto-complete for ZSH
# https://github.com/zsh-users/zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
