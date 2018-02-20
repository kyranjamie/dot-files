export EDITOR="nvim"
export VISUAL="nvim"
export TASKRC="${HOME}/Dropbox/life/todo/.todorc"
export GOPATH="${HOME}/.go"
export IPLAYER_OUTDIR="Documents/iplayer/"
export ACK_OPTIONS="--ignore-case --literal"
export HOMEBREW_BREWFILE="${HOME}/dev/dot-files/Brewfile"
export PRIMARY_VAGRANT_PATH="${HOME}/dev/gr/chewbacca"
export TRANSLATION_LAYER_ENV="mock"
export NVM_DIR="${HOME}/.nvm"
export NODE_VERSION="v8.6.0"
export DOCKER_ID_USER="kyranjamie"
export HOMEBREW_GITHUB_API_TOKEN="a15c0185aaaa7d095cf40a3655d62c726bdb859b"
export CONTROL_PANEL_API_URL="http://demo.pm-api.com"

export PATH="/usr/local/bin:${PATH}"
export PATH="${HOME}/Dropbox/tech/scripts:${PATH}"
export PATH="${HOME}/.gem/ruby/2.0.0/bin:${PATH}"
export PATH="${HOME}/Library/Python/2.7/lib/python/site-packages:${PATH}"
export PATH="${NVM_DIR}/versions/node/${NODE_VERSION}/bin:${PATH}:"
export PATH="${HOME}/.yarn/bin:${PATH}:"
export PATH="${HOME}/.config/yarn/global/node_modules/.bin:${PATH}:"
export PATH="$HOME/.cargo/bin:${PATH}:"

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

# so annoying
setopt NO_BEEP
# Case insensitive globbing
setopt NO_CASE_GLOB

#
# Source configs
for file in ~/dev/dot-files/zsh/.{aliases,functions,prompt}.zsh; do
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

# init nvm 
# https://github.com/creationix/nvm/issues/860#issuecomment-242157535
. "$NVM_DIR/nvm.sh" --no-use

# init z 
# https://github.com/rupa/z
# installed with brew
. `brew --prefix`/etc/profile.d/z.sh

# Enable auto-complete for ZSH
# https://github.com/zsh-users/zsh-autosuggestions
. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"

#
# https://github.com/supercrabtree/k
. ~/.nvm/k/k.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/kyran/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/kyran/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/kyran/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/kyran/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
