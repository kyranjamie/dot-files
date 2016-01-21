# ENV variables
export PATH="/usr/local/bin:/Users/kyran/Dropbox/tech/scripts:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin/arcanist/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.0.0/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"
export PATH="/usr/local/php5/bin:$PATH"
export PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
export GOPATH="$HOME/.go"
export IPLAYER_OUTDIR="Documents/iplayer/"

export USABILLA_PROJECTS="projects"
export UBJS="projects/usabilla.js/usabilla.js"

# Docker stuff
export DEVIP=$(docker-machine ip default)
export DOCKERINFRA="$HOME/projects/infrastructure"
eval `docker-machine env default`

# Sets to vim mode
export EDITOR="vim"
export BLOCKSIZE=1k

for file in ~/.{aliases,functions,bash_prompt}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Log cmd history
# https://twitter.com/michaelhoffman/status/639178145673932800
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_${HOSTNAME_SHORT}_$$"

# Autocomplete awscli
complete -C aws_completer aws


# Check for and run git autocompletion
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash

  # Add git completion to aliases
  __git_complete g __git_main
  __git_complete gco _git_checkout
  __git_complete gb _git_branch
  __git_complete gm _git_merge
  __git_complete gp _git_push
  __git_complete gpl _git_pull
fi

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.nvm/nvm.sh

# init z 
# https://github.com/rupa/z
# installed with brew
. `brew --prefix`/etc/profile.d/z.sh
